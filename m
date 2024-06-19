Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02D02901
	for <linux-staging@lists.linux.dev>; Wed, 19 Jun 2024 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718817586; cv=none; b=VBf8qI7EHxwIlcywTKyvhtpxctjLD7u04zU5ZfLXuRviSaKT+My/AEVM5ofrvs0DXqUnng1cv5DPMOlSXUs4tyZogFlqFWSPtB/lKHWPag5rT7mFSoeycvfvkiz5hgeDy29wmRPmZMgfLTjwlJnLqzk/xc7dps2n/NOvynQ7CIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718817586; c=relaxed/simple;
	bh=mm1hylyXkmDHuJt81ydCZkHXptOfO14tJz3vZpematc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewMUFUG9qoNIq92MCOWuR1Q3zQrh/01C/oNKQZbd/JhIIdxQww9HPgJErxRM0L30Z6OHfhHpCMZrRWQVkxcOCZPWjSoyj/z0GiAfEB6/PGIpeYBQik46ksKyMw31G94APrfFS1g4rwZSRiZFZder+uKZIYKAWT+ppk3gFdwVm8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuVthczp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuVthczp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6cb130027aso464258066b.2
        for <linux-staging@lists.linux.dev>; Wed, 19 Jun 2024 10:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718817583; x=1719422383; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukRvnNcVX5voue1fTgUH3KmAmzHRKYHvwwI9CKvpFMY=;
        b=MuVthczpSlnjwF5cqHOtlE9VwUbpUGbyyuprg+UbWr8HVPFHX5GOC6HxFer2DSioEo
         lYZ8t/t2ihar5BWkT2w0+V4/eKAbmZqOEytd4SMsn7TtHY31GRPGDZOswafYHHlGgUMM
         s5324LtNAoFsI3DKPrN3g4bROLxnqiCU6QTem2p4fbGH1DxEPKOa/9P4IdPhoBAZKDle
         O0kIiDmtaQ1kdU7xCJXY161YURzh9FLn4p6qGWj8GN3y2yZYVNwxg555xmwhCWlbwKW9
         J0tflDzs7Brj828uW8oCaKFftztwxgS+KHI7eiOtxhafN0U8rUU53rI5T2B5HvqCytnf
         25Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718817583; x=1719422383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukRvnNcVX5voue1fTgUH3KmAmzHRKYHvwwI9CKvpFMY=;
        b=vujXNOGtwxWbHJxnUCboFWgel6RjEqPwMEthTub1rdnR/XdfbuF9qXuBMzXH7RTn9H
         xLvL+6xLhfutXWSbZ7WonVp5ZWc49HIiypeWWgjnd8JR6mw44b6zRZ2mXOF3vPnWHfc0
         EaLUSC/UdBR9FZOn3Z/Flxq07BGgN1LgrcEl/sLTTiT0wUfCap/UjHUqb7zEKyyfepAY
         kd8XK5ptVoEocUraA/mH/lLVH7EGg8DOLcOXeZlZja7mttUHWZNAmbz9QnSni8VjTdjU
         GVLOish3skgLz8XvreMIYOVl2bVLvczfCbULZPEpDBMLUOVENBdCp8Fwy0AIIS0We9H+
         WM4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiuZJzgDb/WJaj9cufV3JD1MFVS6Y3NceLHFx4kwz83C5PRS31vVtahhiWLZIOYfYbTU2MdX34MfAnZ+hhFCJPSleRbwlfpQjztxYc3w==
X-Gm-Message-State: AOJu0YyaFtf2LTSKmrOmX+kjHqSzJLj4+Iid5IsX0zEkTnKAuVwLV0Hb
	q1kdNOk+iUkEoPt8sQmNHny39L9d/0CdYbczwCotLhpyxSL4jSc=
X-Google-Smtp-Source: AGHT+IFNzK6QeAtlQ+ZgmOEcPV0B9TECO0/iPeztr7u31qsK3JvkUB2iuN22u9S27LK6ks8S/XPQqQ==
X-Received: by 2002:a50:96cf:0:b0:57c:5874:4f5c with SMTP id 4fb4d7f45d1cf-57d07ea857fmr2350044a12.32.1718817582346;
        Wed, 19 Jun 2024 10:19:42 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:a583:e39c:f68e:e81f? ([2a02:810b:f40:4600:a583:e39c:f68e:e81f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da371sm8529513a12.24.2024.06.19.10.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 10:19:42 -0700 (PDT)
Message-ID: <052f2ea7-2ded-4d39-a513-3a47fee1bf02@gmail.com>
Date: Wed, 19 Jun 2024 19:19:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
 <20240619150029.59730-5-detlev.casanova@collabora.com>
 <6e5ddd5c-340d-4474-a490-427a82db4a97@kwiboo.se>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <6e5ddd5c-340d-4474-a490-427a82db4a97@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 19.06.24 um 17:28 schrieb Jonas Karlman:
> Hi Detlev,
>
> On 2024-06-19 16:57, Detlev Casanova wrote:
>> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 50 +++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> index 6ac5ac8b48ab..7690632f57f1 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
>> @@ -2596,6 +2596,16 @@ system_sram2: sram@ff001000 {
>>   		ranges = <0x0 0x0 0xff001000 0xef000>;
>>   		#address-cells = <1>;
>>   		#size-cells = <1>;
>> +
>> +		vdec0_sram: rkvdec-sram@0 {
>> +			reg = <0x0 0x78000>;
>> +			pool;
>> +		};
>> +
>> +		vdec1_sram: rkvdec-sram@1 {
>> +			reg = <0x78000 0x77000>;
>> +			pool;
>> +		};
>>   	};
>>   
>>   	pinctrl: pinctrl {
>> @@ -2665,6 +2675,46 @@ gpio4: gpio@fec50000 {
>>   			#interrupt-cells = <2>;
>>   		};
>>   	};
>> +
>> +	vdec0: video-decoder@fdc38100 {
>> +		compatible = "rockchip,rk3588-vdec";
>> +		reg = <0x0 0xfdc38100 0x0 0x500>;
>> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
>> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
>> +			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
>> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
>> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
>> +				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
>> +		assigned-clock-rates = <800000000>, <600000000>,
>> +				       <600000000>, <1000000000>;
>> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDEC0_CA>,
>> +			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>> +			      "rst_core", "rst_hevc_cabac";
>> +		power-domains = <&power RK3588_PD_RKVDEC0>;
>> +		sram = <&vdec0_sram>;
>> +		status = "okay";
>> +	};
>> +
>> +	vdec1: video-decoder@fdc40100 {
>> +		compatible = "rockchip,rk3588-vdec";
>> +		reg = <0x0 0xfdc40100 0x0 0x500>;
>> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
>> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
>> +			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;
>> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
>> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru CLK_RKVDEC1_CORE>,
>> +				  <&cru CLK_RKVDEC1_CA>, <&cru CLK_RKVDEC1_HEVC_CA>;
>> +		assigned-clock-rates = <800000000>, <600000000>,
>> +				       <600000000>, <1000000000>;
>> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, <&cru SRST_RKVDEC1_CA>,
>> +			 <&cru SRST_RKVDEC1_CORE>, <&cru SRST_RKVDEC1_HEVC_CA>;
>> +		reset-names = "rst_axi", "rst_ahb", "rst_cabac",
>> +			      "rst_core", "rst_hevc_cabac";
>> +		power-domains = <&power RK3588_PD_RKVDEC1>;
>> +		sram = <&vdec1_sram>;
>> +		status = "okay";
>> +	};
> This is still missing the iommus, please add the iommus, they should be
> supported/same as the one used for e.g. VOP2:
>
>    compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
>
> The VOP2 MMUs does have one extra mmu_cfg_mode flag in AUTO_GATING,
> compared to the VDPU381 MMUs, however only the AV1D MMU should be
> special on RK3588.
>
> Please add the iommus :-)
When looking add the vendor DT/iommu driver I'm seeing serval quirks
applied for vdec's iommus. Since it's rightly frowned upon adding such
boolean-quirk-properties to upstream devicetrees, we'd at least need
additional (fallback-) compatibles, even if it works with the iommu driver
as is (what I doubt, but haven't tested). We need to be able to apply those
quirks later without changing the devicetree (as usual) and I'm sure RK
devs haven't added these quirks for the personal amusement. If Detlev says
iommu is out of scope for this series (which is valid), I'd say it's fine
to leave them out for now (as no binding exists) and the HW works
(obviously) fine without them.

> Regards,
> Jonas
>
>>   };
>>   
>>   #include "rk3588s-pinctrl.dtsi"
