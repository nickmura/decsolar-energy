<script lang="ts">
      import { page } from '$app/stores'
    //@ts-ignore
    import Navbar from '$lib/reusable/Navbar.svelte'

    interface Pages {
		name: string,
		url: string,
	}

    let menu:Pages[] = [
		{ name: 'Hospital of Baranquilla', url: '/projectdesc' },
		
	];
</script>
            <Navbar/>
            
            
            
            
                        <div class="relative bg-gray-100" style="width: 1607px; height: 1040px;">
                            <div class="inline-flex space-x-96 items-center justify-start transform -rotate-180 h-9 absolute right-0 top-0">
                                <p class="text-lg text-green-700"></p>
                             
                                
                            </div>
                           
                            <p class="absolute text-4xl font-bold text-gray-800" style="left: 394px; top: 44px;">Projects</p>
                            <p class="absolute text-xl font-bold text-gray-500" style="left: 394px; top: 129px;">All</p>
                            <p class="absolute text-xl font-bold text-green-700" style="left: 561px; top: 129px;">Available</p>
                            <p class="absolute text-xl font-bold text-gray-500" style="left: 790px; top: 129px;">Completed</p>
                            <div class="absolute" style="width: 569px; height: 381px; left: 394px; top: 218px;">
                                
                                <div class="inline-flex flex-col space-y-6 items-end justify-center pl-0.5 pb-3 bg-white shadow rounded-2xl" style="width: 569px; height: 381px;">
                                    
                                    <img class="rounded-2xl" style="width: 568px; height: 183px;" src="../../../../img/solarBaranquilla.jpg" alt=""/>
                                    <div class="relative" style="width: 521px; height: 150px;">
                                        
                                        <button on:click={() => window.location.href = './projectdesc' }><span class="absolute left-0 top-0 text-lg font-bold text-gray-800">Hospital Of Baranquilla</span></button>
                                        
                                        <p class="w-28 h-16 absolute right-0 top-0  text-md font-bold text-gray-500">Baranquilla, Colombia</p>
                                        <div class="inline-flex flex-col space-y-0.5 items-center justify-mid w-24 h-16 relative left-14 -bottom-20">
                                            <div class="text-md font-bold  text-gray-500">Project Cost:</div> 
                                            <p class="w-full text-base font-bold text-green-700">      $ 400,000 800,000 </p>
                                            <span class="inline-flex flex-col space-y-9 items-center justify-end w-20 h-16 relative left-20 bottom-16">
                                                <p class="text-md font-bold  text-gray-500">APR:</p>
                                                
                                                <p class="text-md font-bold text-green-700">15.2%</p>
                                            </span>
                                            
                                        </div>
                                       
                                        <div class="inline-flex flex-col space-y-8  items-center justify-end w-30 h-14 absolute left-60 -bottom-3">

                                                <p class="text-md font-bold  text-gray-500">Date:</p>
                                                
                                                <p class="text-md font-bold text-green-700">06/15/23</p>
                                         
                                        </div>
                                        <div class="inline-flex flex-col space-y-10  items-center justify-end w-30 h-14 absolute right-20 -bottom-3">

                                            <p class="text-md font-bold  text-gray-500">%Completed</p>
                                            
                                            <p class="text-md font-bold text-green-700">30.2%</p>
                                     
                                    </div>
                               
                                    </div>
                                </div>
                            </div>
                            <div class="absolute" style="width: 569px; height: 381px; left: 394px; top: 619px;">
                                <div class="inline-flex flex-col space-y-6 items-end justify-end pl-0.5 pb-3 bg-white shadow rounded-2xl" style="width: 569px; height: 381px;">
                                    <img class="rounded-2xl" style="width: 568px; height: 183px;" src="../../../../img/solarCapeTown.jpg" alt=""/>
                                    <div class="relative" style="width: 526px; height: 160px;">
                                        <button on:click={() => window.location.href = './projectdesc2' } class="absolute left-0 top-0 text-2xl font-bold text-gray-800">University of Cape Town</button>
                                        <p class=" w-28 h-16 absolute right-0 top-0  text-md font-bold text-gray-500">Cape Town, South Africa</p>
                                        <div class="inline-flex flex-col space-y-3 items-center justify-end w-24 h-22 relative left-14 -bottom-20">
                                            <div class="text-md font-bold  text-gray-500">Project Cost:</div> 
                                            <p class="opacity-80 text-base font-bold text-green-700">$500,000 1,000,000</p>
                                            <span class="inline-flex flex-col space-y-10 items-center justify-end w-20 h-16 relative left-20 -top-20">
                                                <p class="text-md font-bold  text-gray-500">APR:</p>
                                                
                                                <p class="text-md font-bold text-green-700">12.2%</p>
                                            </span>
                                        </div>
                                        
                                        <div class="inline-flex flex-col space-y-11  items-center justify-end w-30 h-14 absolute left-60 -bottom-3">

                                            <p class="text-md font-bold  text-gray-500">Date:</p>
                                            
                                            <p class="text-md font-bold text-green-700">09/23/23</p>
                                     
                                    </div>
                                    <div class="inline-flex flex-col space-y-10  items-center justify-end w-30 h-14 absolute right-20 -bottom-3">

                                        <p class="text-md font-bold  text-gray-500">%Completed</p>
                                        
                                        <p class="text-md font-bold text-green-700">14.7%</p>
                                 
                                </div>
                                        </div>
                             
                                </div>
                            </div>
                            <div class="absolute" style="width: 569px; height: 381px; left: 983px; top: 218px;">
                                
                              
                                    <div class="inline-flex flex-col space-y-6 items-end justify-end pl-0.5 pb-3 bg-white shadow rounded-2xl" style="width: 569px; height: 381px;">
                                        <img class="rounded-2xl" style="width: 568px; height: 183px;" src="../../../../img/solarBTCTexas.jpg" alt=""/>
                                       
                                        <div class="relative" style="width: 534px; height: 160px;">
                                        <button on:click={() => window.location.href = './projectdesc3' } class="absolute left-0 top-0 text-2xl font-bold text-gray-800">BTC Mining Texas</button>
                                        <p class=" w-20 h-16 absolute right-4 top-0  text-md font-bold text-gray-500">Houston, USA</p>
                                        <div class="inline-flex flex-col space-y-3 items-center  w-24  h-20 absolute relative left-14 -bottom-20">
                                            <div class="text-md font-bold  text-gray-500">Project Cost:</div> 
                                            <p class="opacity-80 text-base font-bold text-green-700">$820,000 1,640,000</p>
                                            <span class="inline-flex flex-col space-y-10 items-center justify-end w-20 h-16 relative left-20 -top-20">
                                                <p class="text-md font-bold  text-gray-500">APR:</p>
                                                
                                                <p class="text-md font-bold text-green-700">13.2%</p>
                                            </span>
                                        </div>
                                      
                                        <div class="inline-flex flex-col space-y-10  items-center justify-end w-30 h-14 absolute left-60 -bottom-3">

                                            <p class="text-md font-bold  text-gray-500">Date:</p>
                                            
                                            <p class="text-md font-bold text-green-700">08/19/23</p>
                                     
                                    </div>
                                    <div class="inline-flex flex-col space-y-10  items-center justify-end w-30 h-14 absolute right-20 -bottom-3">

                                        <p class="text-md font-bold  text-gray-500">%Completed</p>
                                        
                                        <p class="text-md font-bold text-green-700">20.5%</p>
                                 
                                </div>
                                        
                                    
                                    </div>
                                </div>
                            </div>
                            <div class="absolute" style="width: 569px; height: 381px; left: 983px; top: 619px;">
                                <div class="inline-flex flex-col space-y-6 items-end justify-end pl-0.5 pb-3 bg-white shadow rounded-2xl" style="width: 569px; height: 381px;">
                                    <img class="rounded-2xl" style="width: 568px; height: 183px;" src="../../../../img/solarSchoolPembrokePines.jpg" alt=""/>
                                    <div class="relative" style="width: 534px; height: 160px;">
                                        <p class="absolute left-0 top-0 text-lg font-bold text-gray-800">Silver Trail Middle School</p>
                                        <p class=" w-28 h-16 absolute right-0 top-0 text-md font-bold  text-gray-500">Pembroke Pines, USA</p>
                                        <div class="inline-flex flex-col space-y-3 items-center justify-end w-24 h-20 absolute relative left-14 -bottom-20">
                                        <div class="text-md font-bold  text-gray-500">Project Cost:</div> 
                                            <p class="text-base font-bold text-green-700" >$558,000 1,116,000 </p>
                                            <span class="inline-flex flex-col space-y-10 items-center justify-end w-20 h-16 relative left-20 -top-20">
                                                <p class="text-md font-bold  text-gray-500">APR:</p>
                                                
                                                <p class="text-md font-bold text-green-700">13.2%</p>
                                            </span>
                                        </div>

                                        <div class="inline-flex flex-col space-y-10  items-center justify-end w-30 h-14 absolute left-60 -bottom-3">

                                            <p class="text-md font-bold  text-gray-500">Date:</p>
                                            
                                            <p class="text-md font-bold text-green-700">02/15/23</p>
                                     
                                    </div>

                                    <div class="inline-flex flex-col space-y-10  items-center justify-end w-30 h-14 absolute right-20 -bottom-3">

                                        <p class="text-md font-bold  text-gray-500">%Completed</p>
                                        
                                        <p class="text-md font-bold text-green-700">60.5%</p>
                                 
                                </div>
                   
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                                <img alt='placeholder' class="w-5 h-5 absolute" style="left: 465px; top: 568px;"  src="../../../img/p2pcoin.png" />
                                <img alt='placeholder' class="w-5 h-5 absolute" style="left: 465px; top: 976px;" src="../../../../img/p2pcoin.png"/>
                                <img alt='placeholder' class="w-5 h-5 absolute" style="left: 1040px; top: 976px;" src="../../../../img/p2pcoin.png"/>
                                <img alt='placeholder' class="w-5 h-5 absolute" style="left: 1040px; top: 568px;" src="../../../../img/p2pcoin.png"/>


                        </div>
                       
            
                <style>
                    .div {
                        position: absolute;
                        width: 569px;
                        height: 381px;
                        left: 394px;
                        top: 218px;
                        background: #FFFFFF;
                        box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
                        border-radius: 15px;
                    }
                    .property{position: sticky;
                    width: 276px;
                    height: 34px;
                    left: 420px;
                    top: 427px;
                    
                    font-family: 'Manrope';
                    font-style: normal;
                    font-weight: 700;
                    font-size: 25px;
                    line-height: 34px;
                    
                    color: #333333;}
            
                    .location{position: sticky;
                    width: 179px;
            height: 25px;
            left: 749px;
            top: 431px;
            
            font-family: 'Manrope';
            font-style: normal;
            font-weight: 400;
            font-size: 18px;
            line-height: 25px;
            /* identical to box height */
            color: #666666;
            }
            
                    
                </style>
            
            

