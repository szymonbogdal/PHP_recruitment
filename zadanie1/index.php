<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generator kalendarza</title>
    <link rel="stylesheet" href="styles.css"/>
</head>
<body>
    <div class="container">
        <h1>Generator kalendarza</h1>
        <form method="post">
            <label for="month">Miesiąc:</label>
            <select id="month" name="month" required>
            <?php
                $months = [
                    1 => 'Styczeń', 2 => 'Luty', 3 => 'Marzec', 4 => 'Kwiecień',
                    5 => 'Maj', 6 => 'Czerwiec', 7 => 'Lipiec', 8 => 'Sierpień',
                    9 => 'Wrzesień', 10 => 'Październik', 11 => 'Listopad', 12 => 'Grudzień'
                ];

                foreach ($months as $num => $name) {
                    echo "<option value=\"$num\">$name</option>";
                }
                ?>
            </select>
            <label for="year">Rok:</label>
            <input type="number" id="year" name="year" required min="1900" max="2100">
            <input type="submit" value="Generuj">
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $year = intval($_POST["year"]);
            $month = intval($_POST["month"]);

            $firstDay = mktime(0, 0, 0, $month, 1, $year);
            $daysInMonth = date("t", $firstDay);
            $dayOfWeek = date("N", $firstDay);

            $monthName = $months[$month];
            echo "<div class='header'>
                    <h2 class='header-month'>$monthName</h2>
                    <h2>$year</h2>
                </div>";
            echo "<table>";
            echo "<tr>
                    <th>Pn</th><th>Wt</th><th>Śr</th><th>Cz</th><th>Pt</th><th>So</th>
                    <th class='sunday'>N</th>
                </tr>";

            echo "<tr>";

            //empty cells at the start of calendar
            for ($i = 1; $i < $dayOfWeek; $i++) {
                echo "<td></td>";
            }

            //create rows with day
            for ($day = 1; $day <= $daysInMonth; $day++) {
                if ($dayOfWeek > 7) {
                    echo "</tr><tr>";
                    $dayOfWeek = 1;
                }
                $class = ($dayOfWeek == 7) ? " class='sunday'" : "";
                echo "<td$class>$day</td>";
                $dayOfWeek++;
            }

            //empty cells at the end of calendar
            while ($dayOfWeek <= 7) {
                $class = ($dayOfWeek == 7) ? " class='sunday'" : "";
                echo "<td$class></td>";
                $dayOfWeek++;
            }

            echo "</tr>";
            echo "</table>";
        }
        ?>
    </div>
</body>
</html>