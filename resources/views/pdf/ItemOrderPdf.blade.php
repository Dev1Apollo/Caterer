<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pdf</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 6px !important;
            font-family: sans-serif;

        }

        table tr td {
            border: 1px solid red;
            color: red;
            text-align: center;
            border-collapse: collapse;
            border-radius: 6px !important;
        }
    </style>
</head>

<body>

    <table style="background: #ffc0c078;">
        <tr>
            <td rowspan="2" style="width: 5%;">No.</td>
            <td rowspan="2" style="width: 40%;">Items</td>
            <td colspan="4" style="width: 55%;">Orders</td>
        </tr>
        <tr>
            <td style="width: 13.75%;">Previous Day</td>
            <td style="width: 13.75%;">Morning</td>
            <td style="width: 13.75%;">Noon</td>
            <td style="width: 13.75%;">Night</td>
        </tr>
    </table>
    
    <table>

        <?php $i = 1; ?>
        @foreach ($ItemOrder as $orders)
            <tr>
                <td rowspan="1" style="width: 5%;">{{ $i }}</td>
                <td rowspan="1" style="width: 40%;">{{ $orders->strItemMasterName }}</td>
                <td style="width: 13.75%;">{{ $orders->strPreviousDays }}</td>
                <td style="width: 13.75%;">{{ $orders->strMoring }}</td>
                <td style="width: 13.75%;">{{ $orders->strAfternoon }}</td>
                <td style="width: 13.75%;">{{ $orders->strEvening }}</td>
            </tr>
            <?php $i++; ?>
        @endforeach


    </table>



</body>

</html>
