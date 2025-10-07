<style>
    table {
        width: 100%;
        border-collapse: collapse;
        font-family: sans-serif;
    }

    td {
        border: 1px solid red !important;
        color: red;
        padding: 10px;
        /* Adds gap around each table */
    }

    .inner-table {
        width: 100%;
        border-spacing: 5px;
        /* Adds gap between cells inside each table */
        min-height: 200px;
        /* Ensures all inner tables have the same height */
    }

    .inner-table td {
        vertical-align: top;
        /* Ensures content starts at the top */
    }
</style>

<body>
    <table>
        <tr>
            <td style="width: 50%;">Party Name: {{ $Customers->strCustomerName }}</td>
            <td style="width: 25%;">Phone Number: {{ $Customers->iMobileNo }}</td>
            <td style="width: 25%;">Sign:</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 75%;">Delivery Location: {{ $Customers->strAddress }}</td>
            <td style="width: 25%;">Date: {{ date('d-m-Y', strtoTime($Customers->strFunctionDate)) }}</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 75%;">&nbsp;</td>
            <td style="width: 25%;">
                Time:{{ $Customers->strFunctionMorningTime ? $Customers->strFunctionMorningTime : $Customers->strFunctionEveningTime }}
            </td>
        </tr>
    </table>

    <table>
        @php
            $categoryCount = 0;
            $totalCategories = $OrderMaster->groupBy('iItemSubCategoryId')->count();
        @endphp
        <tr>
            @foreach ($OrderMaster->groupBy('iItemSubCategoryId') as $categoryId => $items)
                <td style="width: 33.33%; border: 1px solid red !important;">
                    <table class="inner-table">
                        <tr>
                            <td>Subject</td>
                            @if ($categoryId == 1 || $categoryId == 4)
                                <td>Kg</td>
                                <td>Grm</td>
                            @else
                                <td colspan="2">Qty</td>
                            @endif
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center; font-weight: 700; text-transform: uppercase;">
                                {{ $items->first()->strItemSubCategoryName }}</td>
                        </tr>
                        @foreach ($items as $order)
                            <tr>
                                <td>{{ $order->strItemMasterName }}</td>
                                @if ($categoryId == 1 || $categoryId == 4)
                                    <td>{{ $order->strKG }}</td>
                                    <td>{{ $order->strGram }}</td>
                                @else
                                    <td colspan="2">{{ $order->strCount }}</td>
                                @endif
                            </tr>
                        @endforeach
                    </table>
                </td>
                @php
                    $categoryCount++;
                @endphp

                <!-- Close the row and start a new one after every 3 categories -->
                @if ($categoryCount % 3 == 0)
        </tr>
        <tr>
            @endif
            @endforeach

            <!-- Add empty cells for missing columns in the last row -->
            @if ($categoryCount % 3 != 0)
                @for ($i = 0; $i < 3 - ($categoryCount % 3); $i++)
                    <td style="width: 33.33%; border: 1px solid red !important;">&nbsp;</td>
                @endfor
            @endif
        </tr>
    </table>

    <p style="text-align: center;color: red;font-family: sans-serif;font-weight: 600;">Hot Masala Bring By Maharaj</p>

    <table style="background: #ffc0c078;">
        <tr>
            <td rowspan="2"
                style="width: 33.33%;text-align: center;color: red;font-size: 32px;font-weight: 600;text-transform: uppercase;">
                SWITY
                CITY Caterers</td>
            <td  style="width: 33.33%;" rowspan="2">
                <div
                    style="text-align: center;
                background: white;
                padding: 25px;
                border: 1px solid red !important;
                border-radius: 32px;">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Consequatur,
                    perferendis.</div>
            </td>
            <td style="width: 33.33%;color: red;">Mo: 9327327029, 9228419123</td>
        </tr>
        <tr>
            <td  style="color: red;">1, Rajkamal Complex Near Swaminaryan Mandir, Rambag Maningar
                Ahemedabad
            </td>
        </tr>
    </table>
</body>
