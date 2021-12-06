// https://www.codewars.com/kata/52761ee4cffbc69732000738/csharp

using System;
using System.Linq;

public class Kata
{
    private const string GoodWins = "Good triumphs over Evil";
    private const string EvilWinds = "Evil eradicates all trace of Good";
    private const string NoOneWins = "No victor on this battle field";

    private enum MiddleEarthRaces
    {
        //good
        Hobbits = 1,
        Elves = 3,
        Dwarves = 3,
        Eagles = 4,

        //evil
        Orcs = 1,
        Wargs = 2,
        Goblins = 2,
        UrukHai = 3,
        Trolls = 5,

        //good or evil
        Men = 2,
        Wizards = 10,
    }

    private static readonly MiddleEarthRaces[] SideOfGoodOrder =
        new MiddleEarthRaces[] {
            MiddleEarthRaces.Hobbits,
            MiddleEarthRaces.Men,
            MiddleEarthRaces.Elves,
            MiddleEarthRaces.Dwarves,
            MiddleEarthRaces.Eagles,
            MiddleEarthRaces.Wizards,
        };

    private static readonly MiddleEarthRaces[] SideOfEvilOrder =
        new MiddleEarthRaces[] {
            MiddleEarthRaces.Orcs,
            MiddleEarthRaces.Men,
            MiddleEarthRaces.Wargs,
            MiddleEarthRaces.Goblins,
            MiddleEarthRaces.UrukHai,
            MiddleEarthRaces.Trolls,
            MiddleEarthRaces.Wizards,
        };

    public static string GoodVsEvil(string good, string evil)
    {
        var goodWorth = CalculateWorth(good, SideOfGoodOrder);
        var evilWorth = CalculateWorth(evil, SideOfEvilOrder);

        var message = (goodWorth > evilWorth)
            ? GoodWins
            : (evilWorth > goodWorth)
            ? EvilWinds
            : NoOneWins;

        return $"Battle Result: {message}";
    }

    private static int CalculateWorth(string racesCount, MiddleEarthRaces[] order) =>
        racesCount.Split(' ')
            .Select((value, index) => new { value, index })
            .Aggregate(0,
            (acc, pair) => acc + (int.Parse(pair.value) * (int)order[pair.index]));
}
