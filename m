Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059429CA
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 15:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45464C340E0;
	Tue, 25 Jan 2022 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1643124683;
	bh=0UjXRKdXyTtf41xXIMf9KKJbO2bVQW2523Gyb6apcDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qD4yHd5sYsCOZnYiIwPu8RctAg6IBH42c4GwmZpWXE8iKvgkj2khOmPQ3o+qfGdEM
	 eiIZqCc78qBwJmuneZjgYh19jCyYbnKZyxG1ciTBlv4BIzXOfkticWP7GEVL9CffWC
	 6Z+PQdTG3C1INbg0z+CW3r2yA5J1V2LmchqnJ/B0=
Date: Tue, 25 Jan 2022 16:30:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/4] staging: mt7621-dts: fix formatting
Message-ID: <YfAXqoXlTseOJA6x@kroah.com>
References: <20220124130147.8043-1-arinc.unal@arinc9.com>
 <20220124130147.8043-2-arinc.unal@arinc9.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124130147.8043-2-arinc.unal@arinc9.com>

On Mon, Jan 24, 2022 at 04:01:44PM +0300, Arınç ÜNAL wrote:
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
> index 644a65d1a6a1..d120e5872165 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -44,9 +44,9 @@ mmc_fixed_3v3: fixedregulator@0 {
>  		regulator-max-microvolt = <3300000>;
>  		enable-active-high;
>  		regulator-always-on;
> -	  };
> +	};
>  
> -	  mmc_fixed_1v8_io: fixedregulator@1 {
> +	mmc_fixed_1v8_io: fixedregulator@1 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "mmc_io";
>  		regulator-min-microvolt = <1800000>;
> @@ -325,17 +325,18 @@ ethernet: ethernet@1e100000 {
>  
>  		mediatek,ethsys = <&sysc>;
>  
> -
>  		gmac0: mac@0 {
>  			compatible = "mediatek,eth-mac";
>  			reg = <0>;
>  			phy-mode = "rgmii";
> +
>  			fixed-link {
>  				speed = <1000>;
>  				full-duplex;
>  				pause;
>  			};
>  		};
> +
>  		gmac1: mac@1 {
>  			compatible = "mediatek,eth-mac";
>  			reg = <1>;
> @@ -343,6 +344,7 @@ gmac1: mac@1 {
>  			phy-mode = "rgmii-rxid";
>  			phy-handle = <&phy_external>;
>  		};
> +
>  		mdio-bus {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> @@ -373,36 +375,43 @@ ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  					reg = <0>;
> +
>  					port@0 {
>  						status = "off";
>  						reg = <0>;
>  						label = "lan0";
>  					};
> +
>  					port@1 {
>  						status = "off";
>  						reg = <1>;
>  						label = "lan1";
>  					};
> +
>  					port@2 {
>  						status = "off";
>  						reg = <2>;
>  						label = "lan2";
>  					};
> +
>  					port@3 {
>  						status = "off";
>  						reg = <3>;
>  						label = "lan3";
>  					};
> +
>  					port@4 {
>  						status = "off";
>  						reg = <4>;
>  						label = "lan4";
>  					};
> +
>  					port@6 {
>  						reg = <6>;
>  						label = "cpu";
>  						ethernet = <&gmac0>;
>  						phy-mode = "trgmii";
> +
>  						fixed-link {
>  							speed = <1000>;
>  							full-duplex;
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
