Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41B41E49F
	for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 23:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714520509; cv=none; b=Q212DIHc1zjuRJfsGpsXAr9th17rbZbJSbUmnXndMYX+Z6qZDPjA+RAoKFsMEuH4b3BEFei/8E48ruak+Dm8AbmiOnsq+MttIU+bipLlzV8FqyLDrY/s6Q+acxXksQrwSx1j9EI7cG1fj2EpmdpHtvRQpSv48oXaC2IDwD6GukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714520509; c=relaxed/simple;
	bh=SW9HPTMDTmj/1tOuNUYUrm9F8jqe6Po6ChUZCYKP1K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kmb4M7IJRxqXtqNzTYVPuFJ8/mdEIlqwIfmMdP4nGvi+ezg92neQxNmNr7NB9dnUqiJBQ/wwlD1bprzQVKZMFiL25vTo3qcld1AYvCBkrWlmqbIZO1WYW4FLFu1tBrqRuFFtQUF0fAoyU5Q/0JVMH3DM0hRM21Di1VP/uRqyIRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=fu5dmhrS; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="fu5dmhrS"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de890ff72c2so286244276.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 16:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1714520505; x=1715125305; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyNJHGFWuCMTbeFg405HlnRxBUxH//W5wiUSNddP8XU=;
        b=fu5dmhrSsQ8N56aZ7ZYFLsY/1WuyXSEd3HgRywhNdVRZtQAIuXgN6CJWkr1HS8ziYU
         k94jAf0N5dP+W/vR5fue/nRdglDwq8fTSknwUtM/uEagcDdmVtViUAvvRNLCRr730Ho0
         SDX06A8uckydfPTPhKKY3GogBAmGYEaO5/eoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714520505; x=1715125305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyNJHGFWuCMTbeFg405HlnRxBUxH//W5wiUSNddP8XU=;
        b=uDEpCFHBpJaJ99ivNucZ1ft8pqAGAnqdmVHUhcoL+pbBRH1+i1qaKa+wGCWrhjfZuM
         TriQZhDvQobchqGR1eLexHzwcWtxnhwzyQRoDYmmWw5NW8S0HakLlFFryQ7Ix1HYIj0+
         EpKxm61HCpg2aPnbbt+GcLGXBL2EVjyO4de7nh5PWtJXTRNgF+q1tZCw1p4WFD5ci3jE
         f2/bkNqS/bhSgjBI+NS5N7xQ3W4SOI2EX+/tbVo0fpGnxq36t2PE3Al5YWl0kNpFBzUl
         QY1ZfHFJY994HVZLNEqIoHcLiy+zEav7oG9HTmTwSrtPmGi0/iDLf3XBnztdcX1/7OxP
         n/bg==
X-Forwarded-Encrypted: i=1; AJvYcCWe/1G/7K5Mx044RAAq4QcQdovhZqMP1uRXL19ZxgBWDfGqCz0wU+hkiPNSkbqjAUj1ghISlTeCkV8Rd6nEN+ZEdO0y5OYZneWfcYi0pA==
X-Gm-Message-State: AOJu0YymHqKQFfHnY1RiwML2gTiOVArHEtd4LfsuJjK/rQM3Ztwcii5q
	f+dfBldL9xnGdVtwVsP0ItcYXe2L2xMlY+HzhofZUBgs30GUDhdN+Xm4xjKPCg==
X-Google-Smtp-Source: AGHT+IG9ARc9BS7K77ZQwk0ByPLtLEEQsTsSNZsRxRh92VKyfaBL924BS3RaIxHei9zkfWFIw/3oyg==
X-Received: by 2002:a5b:b02:0:b0:dd1:6cad:8fd3 with SMTP id z2-20020a5b0b02000000b00dd16cad8fd3mr803465ybp.27.1714520505457;
        Tue, 30 Apr 2024 16:41:45 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id p81-20020a25d854000000b00de617955013sm493242ybg.45.2024.04.30.16.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 16:41:44 -0700 (PDT)
Message-ID: <506f15e3-b40e-481a-9eac-772faf4feb6b@ieee.org>
Date: Tue, 30 Apr 2024 18:41:42 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/34] greybus: arche-ctrl: move device table to its right
 location
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-18-arnd@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240403080702.3509288-18-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/24 3:06 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The arche-ctrl has two platform drivers and three of_device_id tables,
> but one table is only used for the the module loader, while the other
> two seem to be associated with their drivers.
> 
> This leads to a W=1 warning when the driver is built-in:
> 
> drivers/staging/greybus/arche-platform.c:623:34: error: 'arche_combined_id' defined but not used [-Werror=unused-const-variable=]
>    623 | static const struct of_device_id arche_combined_id[] = {
> 
> Drop the extra table and register both tables that are actually
> used as the ones for the module loader instead.

So what I see is that this commit added arche_combined_id[]:
   1e5dd1f8279a8 greybus: arche-platform: merge arche-apb-ctrl and 
arche-platform

That moved the arche_apb_ctrl_device_driver struct and some other
associated bits out of arche-apb-ctrl.c and into arche-platform.c.
It *kept* arche_platform_of_match[] as the of_match_table for
arche_platform_device_driver, but defined arche_combined_id[] and
declared it for modalias to indicate both drivers were implemented
in the single kernel module.

The later commit (the one you references in "Fixes") then moved
the arche_apb_ctrl_device_driver etc. back to arche-apb-ctrl.c.
That commit did *not* use MODULE_DEVICE_TABLE() to declare
arche_apb_ctrl_of_match[] for modalias.  And it simply kept the
(no longer correct) arche_combined_id[] table to be used by the
arche_platform_device_driver.

So your fix:
- Declares for modalias that arche_apb_ctrl_of_match[] is the
   of_match_table for arche_apb_ctrl_device_driver.
- Declares for modalias that arche_platform_of_match[] is the
   of_match_table for arche_platform_device_driver.
- Gets rid of arche_combined_id[], which is no longer used.

In short:  looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Fixes: 7b62b61c752a ("greybus: arche-ctrl: Don't expose driver internals to arche-platform driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/staging/greybus/arche-apb-ctrl.c | 1 +
>   drivers/staging/greybus/arche-platform.c | 9 +--------
>   2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 8541995008da..aa6f266b62a1 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -466,6 +466,7 @@ static const struct of_device_id arche_apb_ctrl_of_match[] = {
>   	{ .compatible = "usbffff,2", },
>   	{ },
>   };
> +MODULE_DEVICE_TABLE(of, arche_apb_ctrl_of_match);
>   
>   static struct platform_driver arche_apb_ctrl_device_driver = {
>   	.probe		= arche_apb_ctrl_probe,
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index 891b75327d7f..b33977ccd527 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -619,14 +619,7 @@ static const struct of_device_id arche_platform_of_match[] = {
>   	{ .compatible = "google,arche-platform", },
>   	{ },
>   };
> -
> -static const struct of_device_id arche_combined_id[] = {
> -	/* Use PID/VID of SVC device */
> -	{ .compatible = "google,arche-platform", },
> -	{ .compatible = "usbffff,2", },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, arche_combined_id);
> +MODULE_DEVICE_TABLE(of, arche_platform_of_match);
>   
>   static struct platform_driver arche_platform_device_driver = {
>   	.probe		= arche_platform_probe,

