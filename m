Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328DB374A07;
	Sat, 11 Jul 2026 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782836; cv=none; b=obj66GRs2ztjJqcSekRXxyuofWol+JSHDO+7Co5frMaU1Tnwugoc03liLxp3x7hrz9hBpIFA24i/iEm+m7GU0T4H44v23wnMQTIo2bAP0PAL1lFtx4AxKQx3RAwnSR5hCJeNHhkGJHM0mgjWkfecDKHKrAckMVrgpJSIWhpI9d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782836; c=relaxed/simple;
	bh=sDXWQS6dOHId7445+Y/ZGN5y9lFGKjA7sUnzyFygZdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlCeTeFiGXaEOXMpZawVEJIGEQY65Z9TVtRiujTW2bOMktI29KMoUh8/7VMXARFASLqAkJEMf+0QXvVMwfv72kavClJCNF9KtNz3Pmt9H26NpRVYOMgulBXq/gfN0ilTxNrs9tfCuUb9a/WS2HZjvuMKIXkuemrDBMdr+y557yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FFX7kGTD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FFX7kGTD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B9A1477;
	Sat, 11 Jul 2026 08:13:47 -0700 (PDT)
Received: from [10.20.1.47] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7053F85F;
	Sat, 11 Jul 2026 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783782832; bh=sDXWQS6dOHId7445+Y/ZGN5y9lFGKjA7sUnzyFygZdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FFX7kGTD7Dm5jT3f9oQBpF2GinvIozz2BLkJfOevHZOF93dKmhapKSP2oBd4ZVKKT
	 ZNaed3qMVh0NXCsAclQ1gL3SyjgeomTEQYirlFPsIEb7dirRj2/bXiFYKpYPqkqTBU
	 CBdySDNvnKzcgYTsdhpziU87bFo90FMy5BWgVBys=
Message-ID: <da0f77df-80bc-4917-8892-e61da365454b@arm.com>
Date: Sat, 11 Jul 2026 17:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: sun50i-h616: Add video
 engine
To: Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260711135959.3616919-1-wens@kernel.org>
 <20260711135959.3616919-8-wens@kernel.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260711135959.3616919-8-wens@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7/11/26 15:59, Chen-Yu Tsai wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The H616 SoC has a video engine, and two SRAM regions needed by it.
> 
> Add the video engine to the dtsi file.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> [wens@kernel.org: Add VE SRAM region and commit message]
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Checked against the binding and the manual: clocks, regs, interrupts and 
reset matches. Also test-built the DTB: that worked fine, not sure what 
Sashiko was complaining about.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
> Changes since v1:
> - Corrected second IOMMU port
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index 1598e86259ab..c6b3a3f8359a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -175,6 +175,18 @@ crypto: crypto@1904000 {
>   			resets = <&ccu RST_BUS_CE>;
>   		};
>   
> +		video-codec@1c0e000 {
> +			compatible = "allwinner,sun50i-h616-video-engine";
> +			reg = <0x01c0e000 0x2000>;
> +			clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
> +				 <&ccu CLK_MBUS_VE>;
> +			clock-names = "ahb", "mod", "ram";
> +			resets = <&ccu RST_BUS_VE>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&iommu 3>, <&iommu 2>;
> +			allwinner,sram = <&ve_sram 1>, <&sram_c 1>;
> +		};
> +
>   		syscon: syscon@3000000 {
>   			compatible = "allwinner,sun50i-h616-system-control";
>   			reg = <0x03000000 0x1000>;

