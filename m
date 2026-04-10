Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3522E7BD3
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775849526; cv=none; b=CZIJE1cH2Zg0U3h7O0GA7moRRtFA9GHA4+gYblxCL8HLoM7AqFWWvgf8eZmGKjDtxHuwYwDvR3GnXC21rKaeezeWpnZPaF4X7XUmYSECaplzz5NvDLZfxJClgqMY7LQWgi2yMTr0v11+ASn+hiFewjolnTx4bnMQMDcQ2ZI5GMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775849526; c=relaxed/simple;
	bh=4aNMebw4ACxsWJKNNvkW1wZZlAGBiQcTpUbCeZqns+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItZiV5tNiL1k4OuCaoE9kEChWjURP4WFHoLULFz9/YpGiAM1ZAz2eqgRZfoh1NEqC+AdFjoQHScTOeKJAoFv3peJwauTZ7sTXUXAf7yk3v59ArwZ8/yn5R3Apkkt0EL4pPFK6j6DmiTgoVU1Tu41GWVIYCIppb+paiRuHUS3/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=JHeB+8uL; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="JHeB+8uL"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-46808125c65so977015b6e.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 12:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775849523; x=1776454323; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VBCELTROl5Mnj4WGXA1yUGtxFKCFwOhFgSR2ya34Ti4=;
        b=JHeB+8uLtIKB5/Zik4M/9NWwOMBHzFY8y/TOOMxtYEKU+/X67MVziwJSJxn2DSTi4+
         d6QabRKrs9/tIeO2TCjzryw3oXW1GmV4rw6maI23OHFdW0rjylkN/df85ELDIH/Hal22
         rH1qucHdeCXNeZdSszwDZFDFzNuD5UW232fdmHQ0e3YQbgTuV1L6BCiQpYZg5D6sUogM
         GjvDbUE615Olvlynw8Wle9SO3hP8t5vkBSH/oMYiV7RJLbbV2UXfa5REDNoWdce1CcfM
         v7OhAxtL1rfhAQYPXRoRPjye9cH5wCg+nQ/7dWK/8U7CrfVLqjlYvg7CFJf0Pm5jVnYK
         DA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775849523; x=1776454323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBCELTROl5Mnj4WGXA1yUGtxFKCFwOhFgSR2ya34Ti4=;
        b=RDMGf4TBUM3dId58iZ3Jv0L0BQllf2zqWQ28BDVc8hafYRW5usPqM4lveuGProq24Q
         TBvnZqdui7vrK/mD3w497WvuX8lfx4Th/wEXYhFDMqhO6QKRptxcemzZmbDU/Q26AWm2
         YrWW2KAlm+I4Ik1WqRMqTwUZnYMTnB+CEeiADZtMi2pA57YyXE4R7sBJl9ll6ByDemMF
         pgqTinOw/AU40Uz7eHTxhNQ4HHS6/dDA0SnR1IRUMMY6/RhTudccXhG59yEqoVaA/wVv
         w2o6urcTmVWnfszNF4jRAxvIsiBvoTm938+omgEby7GSvwPW4lxAL1PeydAAWv1RkPik
         rdoA==
X-Forwarded-Encrypted: i=1; AJvYcCXEp/zp2ozuZl46IvsvnYO+vd0VraJSr1YsTW3f+eSAtxnHLn0rIXkdJ122wJ1+EK9vwIDB8d+Kc/vxqAhz@lists.linux.dev
X-Gm-Message-State: AOJu0YwJdGeZ+6ouW3w4b1/Ox1SBjjItlJMqPttjHsqObKGXyIZmUfOx
	PFTkq5s3jl1znuFvXGJGUaARH1EMFT0re50rQoJcvljrkQaDMusvqsFwlksEISt7sQo=
X-Gm-Gg: AeBDietv4B0H5z2zSniyMAFxFqnG0HHdZMN9N/ckaz2V/nqFDtrDBA1hfytQvr8Dr4e
	VSdEJl7K1+keZv8OdZwl+KYXXxPjX+Wf7WXbmvwLkhORGGNTkynP6cmCnH1t6T9sgEizbTywnN6
	ATxzD8rmPQX6dIYPNr+xYP1pclMZ0Ei4SvywF7s+UP/USqh9MQ/FsgJZQz1XWADNnllPg5NBdtT
	bUSQcedsUD2xK3Yz8ifQazQrRClYcDClyfdSLEBsW8ArPo4aElH45CtyidV6P1c6eOlG9K0i/yX
	qqKn6qyOvkQMJ7UU/9GgT2QwBl87LoZoPdaen0RQLjwVuHCJInm7pTEoRTMDnd8waU1wuzhG2ow
	Y8wpzBzl2vFmBvKi4/6s+gLL+iaoIP1PT9D8cx6/A6a1qbzkhY5X+u7Vv1a6vEH+DXugUpLCjDM
	CAOT9yvg/nuFrW0O06qL7yZFV/5IWW84YVtupkVwh/i2qTr7xjqzplYZXt45KvS/mDH0W4vIJSn
	Q==
X-Received: by 2002:a05:6808:17aa:b0:474:b050:bf5d with SMTP id 5614622812f47-478a141398fmr2178834b6e.43.1775849523024;
        Fri, 10 Apr 2026 12:32:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-478a131c049sm2060468b6e.8.2026.04.10.12.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 12:32:02 -0700 (PDT)
Message-ID: <0fd8a01c-0ca9-4caf-946b-5e0e756e4cab@baylibre.com>
Date: Fri, 10 Apr 2026 14:32:01 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add entry for QST QMC5883P
 magnetometer driver
To: Hardik Phalet <hardik.phalet@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brigham Campbell
 <me@brighamcampbell.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20260409210639.3197576-1-hardik.phalet@pm.me>
 <20260409210639.3197576-5-hardik.phalet@pm.me>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409210639.3197576-5-hardik.phalet@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/26 4:07 PM, Hardik Phalet wrote:
> Add a MAINTAINERS entry for the QST QMC5883P staging IIO driver,
> covering the driver source and its device tree binding.
> 
> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa16..d0b9bfceb283 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20274,6 +20274,13 @@ F:	Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
>  F:	drivers/bus/fsl-mc/
>  F:	include/uapi/linux/fsl_mc.h
>  
> +QST QMC5883P MAGNETOMETER DRIVER
> +M:	Hardik Phalet <hardik.phalet@pm.me>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/magnetometer/qst,qmc5883p.yaml
> +F:	drivers/staging/iio/magnetometer/
> +
>  QT1010 MEDIA DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan

This should be split up and added in the patches that actually
add the F: files. Most of it will go with the dt-bingings patch
and the one line added later with the driver.
