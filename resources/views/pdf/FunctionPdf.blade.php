<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PDF</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            font-family: sans-serif;
            font-size: 12px;

        }

        td {
            border: 1px solid red;
            color: red;
            padding: 5px;
            /* Adds gap around each table */
        }

        .inner-table {
            width: 100%;
            border-spacing: 0px;
            /* Adds gap between cells inside each table */
        }
    </style>
</head>

<body>

    <table style="width: 100%;">
        <tr>
            <td colspan="2" style="border-bottom: none;"><strong>|| Jay Jinedra ||</strong></td>
        </tr>
        <tr>
            <td style="width: 50%;border-top: none;border-bottom: none;border-right: none;"><strong>Rakesh Shah</strong>
            </td>
            <td
                style="width: 50%;border-top: none;border-bottom: none;border-left: none;font-size: 32px;
            font-weight: 600;
            text-align: right;">
                <strong>CITY CATERERS</strong>
            </td>
        </tr>
        <tr>
            <td rowspan="2" style="width: 50%;border-top: none;border-bottom: none;border-right: none;"><strong>Mobile
                    Number :- </strong>
                9327327029 <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                9999999999</td>
            <td rowspan="2"
                style="width: 50%;border-top: none;border-bottom: none;border-left: none;text-align: right;">
                <strong>8, Hirabag Sociery Dev.1,
                    Beside C.P. Nagar,<br> Ghatlodiya, Narayanpura
                    Ahemedabad</strong>
            </td>
        </tr>


    </table>

    <table style="width: 100%;">
        <tr>
            <td colspan="4"><strong>Party Name</strong>: {{ $Customers->strCustomerName }}</td>
        </tr>
        <tr>
            <td colspan="4"><strong>Address:</strong> {{ $Customers->strAddress }}</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 33%;"><strong>Phone No. (Home):</strong>
                {{ isset($Customers->iMobileHouse) && $Customers->iMobileHouse > 0 ? $Customers->iMobileHouse : '' }}
            </td>
            <td style="width: 33%;"><strong>(Office):</strong>
                {{ isset($Customers->iMobileOffice) && $Customers->iMobileOffice > 0 ? $Customers->iMobileOffice : '' }}
            </td>
            <td style="width: 34%;"><strong>(Mobile):</strong> {{ $Customers->iMobileNo }}</td>
        </tr>
        <tr>
            <td style="width: 25%;"><strong>Occation:</strong> {{ $Customers->strFunctionName }}</td>
            <td style="width: 25%;"><strong>Date:</strong>
                {{ isset($Customers->strFunctionDate) && $Customers->strFunctionDate != '' ? date('d-m-Y', strtotime($Customers->strFunctionDate)) : '' }}
            </td>
            <td style="width: 25%;"><strong>Morning Time:</strong> {{ $Customers->strFunctionMorningTime }}</td>
            <td style="width: 25%;"><strong>Evening Time:</strong> {{ $Customers->strFunctionEveningTime }}</td>
        </tr>
        <tr>
            <td colspan="4"><strong>Ocation Venue:</strong> {{ $Customers->strFunctionVanue }}</td>
        </tr>

    </table>
    <?php $jCounter = 1; ?>
    @foreach ($FunctionMasters as $FunctionMaster)
        <table>
            <tr>
                <td colspan="4"
                    style="border-bottom: none;background:red;text-align:center;color:white;font-weight: bold;">
                    <strong>Occation : {{ $jCounter }} : {{ $FunctionMaster->strFunction }} </strong>
                </td>
            </tr>
            <?php $jCounter++; ?>
            <tr>
                <td style="width: 25%;border-bottom: none;"><strong>Date:</strong>
                    {{ isset($FunctionMaster->strDate) && $FunctionMaster->strDate != '' ? date('d-m-Y', strtotime($FunctionMaster->strDate)) : '' }}
                </td>
                <td style="width: 25%;border-bottom: none;"><strong>Person:</strong> {{ $FunctionMaster->iNoOfPerosn }}
                </td>
                <td style="width: 25%;border-bottom: none;"><strong>Price: </strong>
                    {{ $FunctionMaster->iRatePerPerson }}</td>
                <td style="width: 25%;border-bottom: none;"><strong>Total Price: </strong>
                    {{ $FunctionMaster->iTotalAmount }} </td>

            </tr>
            <tr>
                <td style="width: 20%;border-bottom: none;" colspan="4"> <strong>Location: </strong>
                    {{ $FunctionMaster->strLocation ?? 'N/A' }}</td>
            </tr>
        </table>

        <?php $iCounter = 0; ?>
        <?php
        $FunctionDetails = \App\Models\FunctionDetails::join('product', 'product.productId', '=', 'functiondetails.iProductId')
            ->select('product.productname')
            ->where(['product.iStatus' => 1, 'product.isDelete' => 0, 'functiondetails.iStatus' => 1, 'functiondetails.isDelete' => 0, 'iFunctionId' => $FunctionMaster->iFunctionId])
            ->get();
        ?>
        <table>
            @foreach ($FunctionDetails as $FunctionDetail)
                @if ($iCounter % 3 == 0)
                    <tr>
                @endif
                <td style="width: 33.33%;"> <strong>{{ $iCounter + 1 }})</strong>
                    {{ $FunctionDetail->productname ?? '' }}</td>
                @if (($iCounter + 1) % 3 == 0)
                    </tr>
                @endif
                <?php $iCounter++; ?>
            @endforeach
            @if (count($FunctionDetails) % 3 != 0)
                @for ($i = 0; $i < 3 - (count($FunctionDetails) % 3); $i++)
                    <td style="width: 33.33%;">
                    </td>
                @endfor
                </tr>
            @endif
        </table>
    @endforeach
    <table>
        <tr>
            <td>Note:- {{ $Customers->strRemarks }}</td>
        </tr>
    </table>



</body>

</html>
