Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F52C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:48:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E09C60F48;
	Mon, 18 Oct 2021 15:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634572084;
	bh=fVM7VYh6GwhcCvUTr9ZTX10z+M+c+eH/Hr0nK1garIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ml9uJg1SLCZqNyqFeB7KezXmrUlnpADxrJzN7v/Y2XPUfb0jYRitsaxCcJ5fsH6bQ
	 j9Sc5VpKRxCr9Jpg3BzUbfGI6Df+LHa6CXbqr4DpLngt+RvbLLVNwo4NGDFeHhJZ6t
	 tPBRS58PzR/QC0eppknYvDWLc/tfs4DXKllyjiWI=
Date: Mon, 18 Oct 2021 17:48:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, neil@brown.name
Subject: Re: [PATCH] staging: mt7621-dts: get rid of nodes with no in-tree
 driver
Message-ID: <YW2XMkfAdbQm75j+@kroah.com>
References: <20211018153554.10471-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018153554.10471-1-sergio.paracuellos@gmail.com>

On Mon, Oct 18, 2021 at 05:35:53PM +0200, Sergio Paracuellos wrote:
> Nodes for 'i2s' and 'nand' have no driver present inside the linux tree.
> The normal approach for a dts file to be mainlined is start with those stuff
> which is already mainlined and get rid of the other stuff. If needed it will
> be properly added afterwards together with the suitable device driver. Hence,
> remove both nodes from the device tree include file.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 36 --------------------------
>  1 file changed, 36 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
> index dd7d06c5f234..787220d4d3b4 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -102,28 +102,6 @@ i2c: i2c@900 {
>  			pinctrl-0 = <&i2c_pins>;
>  		};
>  
> -		i2s: i2s@a00 {
> -			compatible = "mediatek,mt7621-i2s";
> -			reg = <0xa00 0x100>;
> -
> -			clocks = <&sysc MT7621_CLK_I2S>;
> -			clock-names = "i2s";
> -			resets = <&sysc MT7621_RST_I2S>;
> -			reset-names = "i2s";
> -
> -			interrupt-parent = <&gic>;
> -			interrupts = <GIC_SHARED 16 IRQ_TYPE_LEVEL_HIGH>;
> -
> -			txdma-req = <2>;
> -			rxdma-req = <3>;
> -
> -			dmas = <&gdma 4>,
> -				<&gdma 6>;
> -			dma-names = "tx", "rx";
> -
> -			status = "disabled";
> -		};
> -
>  		memc: syscon@5000 {
>  			compatible = "mediatek,mt7621-memc", "syscon";
>  			reg = <0x5000 0x1000>;
> @@ -355,20 +333,6 @@ cdmm: cdmm@1fbf8000 {
>  		reg = <0x1fbf8000 0x8000>;
>  	};
>  
> -	nand: nand@1e003000 {
> -		status = "disabled";
> -
> -		compatible = "mediatek,mt7621-nand";
> -		bank-width = <2>;
> -		reg = <0x1e003000 0x800
> -			0x1e003800 0x800>;
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		clocks = <&sysc MT7621_CLK_NAND>;
> -		clock-names = "nand";
> -	};
> -
>  	ethernet: ethernet@1e100000 {
>  		compatible = "mediatek,mt7621-eth";
>  		reg = <0x1e100000 0x10000>;
> -- 
> 2.33.0

When trying to apply this I get:

checking file drivers/staging/mt7621-dts/mt7621.dtsi
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
2 out of 2 hunks ignored

Are you sure you rebased?

Hm, ah, I can handle this with fuzz maybe:
patching file drivers/staging/mt7621-dts/mt7621.dtsi
Reversed (or previously applied) patch detected!  Assume -R? [n] n
Apply anyway? [n] y
Hunk #1 FAILED at 102.
Hunk #2 succeeded at 358 (offset 3 lines).
1 out of 2 hunks FAILED -- saving rejects to file drivers/staging/mt7621-dts/mt7621.dtsi.rej

Nope, that didn't work.

Again, are you sure you rebased?  Against what tree?

thanks,

greg k-h
