<!-- ========== App Menu ========== -->
<div class="app-menu navbar-menu">


    <div id="scrollbar">
        <div class="container-fluid">

            <div id="two-column-menu"></div>
            <ul class="navbar-nav" id="navbar-nav">
                <li class="menu-title"><span data-key="t-menu"></span></li>

                <li class="nav-item">
                    <a class="nav-link menu-link @if (request()->routeIs('home')) {{ 'active' }} @endif"
                        href="{{ route('home') }}">
                        <i class="mdi mdi-speedometer"></i>
                        <span data-key="t-dashboards">Dashboards</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link @if (request()->routeIs('subcategory.*')) {{ 'active' }} @endif || @if (request()->routeIs('itemmaster.*')) {{ 'active' }} @endif || @if (request()->routeIs('category.*')) {{ 'active' }} @endif"
                        href="#sidebarApps" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarApps">
                        <i class="fa-regular fa-rectangle-list"></i>
                        <span data-key="t-apps">Master Entry</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebarApps">
                        <ul class="nav nav-sm flex-column">
                            <li class="nav-item">
                                <a href="{{ route('category.index') }}" class="nav-link" data-key="t-chat"> Category</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('subcategory.index') }}" class="nav-link" data-key="t-chat"> Sub Category</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('itemmaster.index') }}" class="nav-link" data-key="t-calendar"> Item Master
                                </a>
                            </li>
                
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link @if (request()->routeIs('product.*')) {{ 'active' }} @endif"
                        href="{{ route('product.index') }}">
                        <i class="fa-solid fa-box-open"></i>
                        <span data-key="t-dashboards">Product</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link @if (request()->routeIs('customer.*')) {{ 'active' }} @endif"
                        href="{{ route('customer.index') }}">
                        <i class="fa-solid fa-user"></i>
                        <span data-key="t-dashboards">Customer Entry</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link @if (request()->routeIs('ImageCategory.*')) {{ 'active' }} @endif || @if (request()->routeIs('itemmaster.*')) {{ 'active' }} @endif || @if (request()->routeIs('category.*')) {{ 'active' }} @endif"
                        href="#sidebarApps" data-bs-toggle="collapse" role="button" aria-expanded="false"
                        aria-controls="sidebarApps">
                        <i class="fa fa-image"></i>
                        <span data-key="t-apps">Image</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebarApps">
                        <ul class="nav nav-sm flex-column">
                            <li class="nav-item">
                                <a class="nav-link menu-link @if (request()->routeIs('ImageCategory.*')) {{ 'active' }} @endif"
                                    href="{{ route('ImageCategory.index') }}">
                                    <span data-key="t-dashboards">Image Category</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('ImageCategory.AddImageindex') }}" class="nav-link"
                                    data-key="t-chat">
                                    Add Image</a>
                            </li>
                             <li class="nav-item">
                                <a href="{{ route('ImageCategory.Mydata') }}" class="nav-link"
                                    data-key="t-chat">
                                    My Data</a>
                            </li>

                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <!-- Sidebar -->
    </div>

    <div class="sidebar-background"></div>
</div>
<!-- Left Sidebar End -->
<!-- Vertical Overlay-->
<div class="vertical-overlay"></div>
