Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28E826D4CA
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066407; cv=none; b=ZY3wSmIjijRdasUAJH8mJiHeGP75LBRz2QhODQ5nyZruF+Cu9rMNH4zj1b4MDcsY1HOZH5D26aNGecYXCn5xvKwsyB3S6IWGFEJe/FA9XufNxyVmmpixuXXt7FRt1RU4J9Neb2y6WyFufqUOP/s+3QhzU0G4QqC88Mkyq0Ozj+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066407; c=relaxed/simple;
	bh=zdH+IOOBV2baj5d9rZ4dm40njWgoiWrQrN/U10L+YbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2O4gWIMGSnmY7ozADRM987qlYcl/lXwpIQ1y41vcwpa5GFzH6JTxXrKGjYu2Zry4QbmfGA7nhF1RKwKwpCkb025VThQqOJjqOV6ZULQgG5zsgJmKEnEzowcoIb/v8NlxKYxMHTgCa2R/jTltg0aC9UsLr5bsmc4UGLN+S7mV4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=KHS8Jil+; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="KHS8Jil+"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e027da22eso351442885a.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792066404; x=1792671204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nvo89qAGwSb+Yzea1kpe4OCQr5Gc5wnVwAn3hnKuGGw=;
        b=KHS8Jil+JAXehgEnLq0bltVQK9OphBzwd7N2YroAgd1G81N8kYmpsZlg2Tjh3VnP9a
         2ZgkkgpOTqKVkoJ3Iom3LfkvJOmZzOOd+G/6FsAFDcmFteAq7A+Rj5Nfey+mvBP5s4DY
         3wXCxc5EQW5LENSDrFZH4R5UCBk+IYv4tV+TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066404; x=1792671204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nvo89qAGwSb+Yzea1kpe4OCQr5Gc5wnVwAn3hnKuGGw=;
        b=1dSrw5NuiWH5xc1fSnpLzrDh1Waszfd925VMX8eMVkV22+/PUMdiRZisuRDTNgoaw7
         x4/oeM3V2UCzSQzW+S/Bwo3u3eT+B9O5cUnJpdEoHJXf+oKV0NAzpcG1EyU04PZ5Flhz
         myxXJYa/TIyDvNW7UrcKNmlFf48EOS6LAo4soFXJ6OG6bmwa6AT1Y+/HxlFVmHlWhVA7
         XpzoXMAlmnrJFexN4P5Pp4tgSHphFhL8pxwFi6+S0OOseTRuk6XQA18EMf4pjokoPako
         XcUDWjLa53+dIeO4lCuvWsDdfJ9KSctwoNiIEDwXTrpVG8gObH6jpZrjJTogwwk225xY
         EVaw==
X-Forwarded-Encrypted: i=1; AKwUvBxILauLWBJKmjZqFfGc4QjMtnpxSGB2G5gTFdy//U6iFBJO4ET4HGv9Gmx7Xbks96NYLzqKJqYESK6oXL/J@lists.linux.dev
X-Gm-Message-State: AFq9FYJCrWC6wjA/tnVqW/tKyJ6/ATtu/fazaHALaZAVW9IyyOA95uUz
	YnY/u6ukHEAxPfS3OuQlRJ2j8tUwC1k39YtLzlfHwv+Wb31+JXKYHTNFSrNSa8YYzA==
X-Gm-Gg: AYBFou396uq2BavED/6KgfzHdL5mFoXcIywgp0h2PVLU/jk/EGvLwwdvWr1D3VcqsPY
	vpG3ZB9DzLMjYogmZvOtPoYoMavZvEaN3sEhU946eRqoQXVRr4VXt0qI79UrTetMJbEdgri9nJ6
	yiRcGuvjPsoYIBOWNCK1XVKK2S17IqaXm4t7uXMO5z28098GoQs9KJ69VMIx28BkGa5cjl/GMss
	m5f5xuLGT5yF9UIklDnWcQhgy67Fz7PZyxgdyjFFslrmXLyRK0oO4HniJ9536O4LBUXVyvCDp7S
	GFgDdY83j4k1Lm4+hb0vaGxEoHyPc03M7KUviYipDhBPOcjrtW93Fcfai0zI5pCcGmiTFuQMX0V
	uQFQ6i+9A6xDINCpZuK7WOkU8LhL6Wy0PoYuLipzwGtUSmBRlTLN0UBjdqgMkYug4l3V42IC2/5
	NzJ/JDnMoG6UgO8reDqYPzC9cLYkjKEZkwd9hZN8IX/FEZCZzxdqwFemxtVB5sXXSY2A==
X-Received: by 2002:a05:620a:4407:b0:939:a199:45b4 with SMTP id af79cd13be357-93ebd208f11mr3093274985a.39.1792066403617;
        Thu, 15 Oct 2026 05:13:23 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-93f13fff574sm78712285a.13.2026.10.15.05.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:13:22 -0700 (PDT)
Message-ID: <99cd529b-dffd-4315-b9be-9b0029973497@ieee.org>
Date: Thu, 15 Oct 2026 07:13:21 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error
 messages
To: pavankumaryalagada@gmail.com, johan@kernel.org, gregkh@linuxfoundation.org
Cc: vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/26 3:22 AM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Use %pe to print error pointers directly and display their
> error names.
> 
> Keep PTR_ERR() calls when the numeric error value is needed
> for returning the error code.
> 
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

In a few places you are *adding* the error value where it was
missing (which I think is an improvement).  I assume that the
return values in this case are negative errnos.

It would have been worth mentioning this other type of change
in the patch description too.  But it's not worth doing a new
version for that.  I trust you found all the spots, and fixed
them this way.  This looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v4:
> - Return error codes directly instead of storing them in ret,
>    as suggested by Julia Lawall.
> - Remove the unused ret variable.
> 
> v3:
> - Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.
> 
> v2:
> - Use %pe in the firmware management case, as suggested by Jeremy Clifton,
>    to match the other cases.
> 
> v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
> ---
>   drivers/staging/greybus/arche-apb-ctrl.c | 37 ++++++++++--------------
>   drivers/staging/greybus/arche-platform.c | 26 +++++++----------
>   drivers/staging/greybus/fw-core.c        | 16 +++++-----
>   drivers/staging/greybus/uart.c           |  2 +-
>   4 files changed, 35 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 4302c2226126..d30174310828 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -144,10 +144,9 @@ static int fw_flashing_seq(struct platform_device *pdev)
>   
>   		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
>   		if (IS_ERR(apb->spi_en)) {
> -			ret = PTR_ERR(apb->spi_en);
> -			dev_err(dev, "Failed requesting SPI bus en GPIO: %d\n",
> -				ret);
> -			return ret;
> +			dev_err(dev, "Failed requesting SPI bus en GPIO: %pe\n",
> +				apb->spi_en);
> +			return PTR_ERR(apb->spi_en);
>   		}
>   	}
>   
> @@ -318,43 +317,37 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>   				struct arche_apb_ctrl_drvdata *apb)
>   {
>   	struct device *dev = &pdev->dev;
> -	int ret;
>   
>   	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   	if (IS_ERR(apb->resetn)) {
> -		ret = PTR_ERR(apb->resetn);
> -		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "Failed requesting reset GPIO: %pe\n", apb->resetn);
> +		return PTR_ERR(apb->resetn);
>   	}
>   
>   	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
>   	if (IS_ERR(apb->boot_ret)) {
> -		ret = PTR_ERR(apb->boot_ret);
> -		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "Failed requesting bootret GPIO: %pe\n", apb->boot_ret);
> +		return PTR_ERR(apb->boot_ret);
>   	}
>   
>   	/* It's not mandatory to support power management interface */
>   	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
>   	if (IS_ERR(apb->pwroff)) {
> -		ret = PTR_ERR(apb->pwroff);
> -		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "Failed requesting pwroff_n GPIO: %pe\n", apb->pwroff);
> +		return PTR_ERR(apb->pwroff);
>   	}
>   
>   	/* Do not make clock mandatory as of now (for DB3) */
>   	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
>   	if (IS_ERR(apb->clk_en)) {
> -		ret = PTR_ERR(apb->clk_en);
> -		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "Failed requesting APB clock en GPIO: %pe\n", apb->clk_en);
> +		return PTR_ERR(apb->clk_en);
>   	}
>   
>   	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
>   	if (IS_ERR(apb->pwrdn)) {
> -		ret = PTR_ERR(apb->pwrdn);
> -		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
> -		return ret;
> +		dev_warn(dev, "Failed requesting power down GPIO: %pe\n", apb->pwrdn);
> +		return PTR_ERR(apb->pwrdn);
>   	}
>   
>   	/* Regulators are optional, as we may have fixed supply coming in */
> @@ -368,12 +361,12 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>   
>   	apb->pinctrl = devm_pinctrl_get(&pdev->dev);
>   	if (IS_ERR(apb->pinctrl)) {
> -		dev_err(&pdev->dev, "could not get pinctrl handle\n");
> +		dev_err(&pdev->dev, "could not get pinctrl handle: %pe\n", apb->pinctrl);
>   		return PTR_ERR(apb->pinctrl);
>   	}
>   	apb->pin_default = pinctrl_lookup_state(apb->pinctrl, "default");
>   	if (IS_ERR(apb->pin_default)) {
> -		dev_err(&pdev->dev, "could not get default pin state\n");
> +		dev_err(&pdev->dev, "could not get default pin state: %pe\n", apb->pin_default);
>   		return PTR_ERR(apb->pin_default);
>   	}
>   
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index de5de59ea8ab..8e75accc34b6 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -444,35 +444,32 @@ static int arche_platform_probe(struct platform_device *pdev)
>   
>   	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
>   	if (IS_ERR(arche_pdata->svc_reset)) {
> -		ret = PTR_ERR(arche_pdata->svc_reset);
> -		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "failed to request svc-reset GPIO: %pe\n", arche_pdata->svc_reset);
> +		return PTR_ERR(arche_pdata->svc_reset);
>   	}
>   	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
>   
>   	arche_pdata->svc_sysboot = devm_gpiod_get(dev, "svc,sysboot",
>   						  GPIOD_OUT_LOW);
>   	if (IS_ERR(arche_pdata->svc_sysboot)) {
> -		ret = PTR_ERR(arche_pdata->svc_sysboot);
> -		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "failed to request sysboot0 GPIO: %pe\n", arche_pdata->svc_sysboot);
> +		return PTR_ERR(arche_pdata->svc_sysboot);
>   	}
>   
>   	/* setup the clock request gpio first */
>   	arche_pdata->svc_refclk_req = devm_gpiod_get(dev, "svc,refclk-req",
>   						     GPIOD_IN);
>   	if (IS_ERR(arche_pdata->svc_refclk_req)) {
> -		ret = PTR_ERR(arche_pdata->svc_refclk_req);
> -		dev_err(dev, "failed to request svc-clk-req GPIO: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "failed to request svc-clk-req GPIO: %pe\n",
> +			arche_pdata->svc_refclk_req);
> +		return PTR_ERR(arche_pdata->svc_refclk_req);
>   	}
>   
>   	/* setup refclk2 to follow the pin */
>   	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
>   	if (IS_ERR(arche_pdata->svc_ref_clk)) {
> -		ret = PTR_ERR(arche_pdata->svc_ref_clk);
> -		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "failed to get svc_ref_clk: %pe\n", arche_pdata->svc_ref_clk);
> +		return PTR_ERR(arche_pdata->svc_ref_clk);
>   	}
>   
>   	platform_set_drvdata(pdev, arche_pdata);
> @@ -483,9 +480,8 @@ static int arche_platform_probe(struct platform_device *pdev)
>   	arche_pdata->wake_detect = devm_gpiod_get(dev, "svc,wake-detect",
>   						  GPIOD_IN);
>   	if (IS_ERR(arche_pdata->wake_detect)) {
> -		ret = PTR_ERR(arche_pdata->wake_detect);
> -		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
> -		return ret;
> +		dev_err(dev, "Failed requesting wake_detect GPIO: %pe\n", arche_pdata->wake_detect);
> +		return PTR_ERR(arche_pdata->wake_detect);
>   	}
>   
>   	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_IDLE);
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index 2016a74f137f..78321be80013 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			if (IS_ERR(connection)) {
>   				ret = PTR_ERR(connection);
>   				dev_err(&bundle->dev,
> -					"failed to create management connection (%d)\n",
> -					ret);
> +					"failed to create management connection (%pe)\n",
> +					connection);
>   				goto err_destroy_connections;
>   			}
>   
> @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			connection = gb_connection_create(bundle, cport_id,
>   							  gb_fw_download_request_handler);
>   			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
> +					connection);
>   			} else {
>   				fw_core->download_connection = connection;
>   			}
> @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			connection = gb_connection_create(bundle, cport_id,
>   							  NULL);
>   			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
> +					connection);
>   			} else {
>   				fw_core->spi_connection = connection;
>   			}
> @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			connection = gb_connection_create(bundle, cport_id,
>   							  NULL);
>   			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
> +					connection);
>   			} else {
>   				fw_core->cap_connection = connection;
>   			}
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 172cf900eaf0..59a112cf47a0 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -951,7 +951,7 @@ static int gb_tty_init(void)
>   					 TTY_DRIVER_DYNAMIC_DEV |
>   					 TTY_DRIVER_RESET_SAVED_TERMIOS);
>   	if (IS_ERR(gb_tty_driver)) {
> -		pr_err("Can not allocate tty driver\n");
> +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
>   		retval = PTR_ERR(gb_tty_driver);
>   		goto fail_unregister_dev;
>   	}

