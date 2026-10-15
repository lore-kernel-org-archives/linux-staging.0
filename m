Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E1346E47
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 04:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792040039; cv=none; b=WIbinaNRk8naeCoxQ6mFmM2m+9kqUQz450Ao4Bwxq831uThtcldOG+lldRESPZ2NnKVBakIXitGGocYtVT7Es/WgXziFBDT9KvCn6CtxoEGzZb9GwDAQgZz6DaQaHiKhyFsDehy2440j5hlopgYrJM/Ql2ZDKhVymIKuVqJaYno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792040039; c=relaxed/simple;
	bh=9EQlBHiIkaGfCOcL32HihIjL3Xx+tQI9PghWpzbX0n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNkeTIv5CJeeBWeyFQa75FqlHeLcLhw+IsbypoMD8zOeEoTjbkD9P7LtYak+FnZTxnicuAcvTGPaxoyC4gLhTj005f31cEBA/o6idV52dSD+hTX4+whyR6kAVbzIT/OMtX0FCMvu4uzDSLFX4pKJTAwjFyKvDAFNdzGW9BBZ0Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDPxclmX; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDPxclmX"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-144f79153f5so1110638c88.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 21:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792040037; x=1792644837; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5lov7Kzso+f15NbuRWK1jZpZZRkU4+OPP+QRlJFwAU=;
        b=QDPxclmXBnHrrTpACvRB5NAozcBBeXYqSBLlck7Mqa/bEwnmpbCJiA0bv6x3dCugBV
         pq8mF/oue4SWkI5OO+cyJ+v8IFgT8M6cB0sEqpmESB1YyHExJlh5oUopiLIJkd5Hj5KV
         72LHjeNL6CuwyjYMG/4B9tDBJN/7GLKpd8lKQwoXjEQH5cmyauwDNHWVk0PdxJgD8nN3
         LCyhs41MyYCeIFOusWr9/vqqJEeKuzxud/072mFWdRh79e0Q6z45Y8rGGqMh7kmsTmcJ
         F6KtQUTO5XJKj7Cq8duAsF4x0IdrZod0OU6Htmn9pgh/4lpO92ZIw2qwdhtbsav6X/EE
         AkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040037; x=1792644837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5lov7Kzso+f15NbuRWK1jZpZZRkU4+OPP+QRlJFwAU=;
        b=txDyaaOE13jc1U69d/W+x6deNiekd1Nxt00kyYEbmaDzWebvP7b1ZX3KE6ahbq7c0W
         Dmo2I3v8dhhrKlLb/J5SknTrBhpV4msAQ7M21OvFdP4jkrsXpZ1VakcUWjI50b5P+wy+
         7RxrAsAHr1Q5TKgJpzrOnrnDjAsstgkDRMyre+lt0ww+otkzvs+fne1VO5EK/Udz8syl
         P4ZAkCSWjV81lufGOsOVM3DD6lKtWg3s5dIkGJHJZWMmyIRxCuZA2hXO8PtI8M4IE1Hs
         ejRwTTTj+s2tjy6Xs/wvRgNF3wIssNh1CbooGC/Zus69d1SNkIFL+e7jYE45syYfJh+E
         +7Dg==
X-Forwarded-Encrypted: i=1; AKwUvBzeXkX7RKSWNN8KVxFCeZvGYryoooM8/uIW/4SIzx24F7CjihviCKlMmO/HeBPvReWA8ZtQC+tEmqt+lr6N@lists.linux.dev
X-Gm-Message-State: AFq9FYJNBAkiqaJwc9tW40iH1KCKDAG4XCROJ9IH7zFZCfa7tzwD+ymo
	2kk5woQ0fPDV4755d9GmEKjdGZfC8Td/AASLPCt6n61AM40AbykMEl2J
X-Gm-Gg: AYBFou0xt5y9mJIyAmdMVrQTx3N/AcfHESeetEPE0Zpnd9xGZwfSaeG3/RNwnuUUAy8
	jz1eaxNzzFtw6G+czPjTAEWQ9PMkmdc3LQLFzjSOP5VTd4XEWr592zOXmhpfyj3Gcis0Y7MJSk7
	OMNgaVRv/jGNm0S5rK6nLwnbU3msR6kPZVydKZ65ElygR4z2dEUgJ8/1dmbNiInfJ0cCYmV5NtJ
	+jqfFAuYYhPyEefib6QbOi683xpiUHZmN5yCafVaojlB7op79uA0Of/SS3axF3NHDmZd4sEhLSO
	rRIrW5WnibQS8GACf0+uNA2+IDrPmVWHjRtXlSU4RvD2VNiMKssAqRYzyYRVUQZm4F6P5WXQk4O
	aMgjGmV1CqfSkAzQ24etL2MWYsHUfHa1iuX/feas9rkbJEsok5WZxiGiSf2U+dCb0xZK2qAJzsb
	9pvIvjwA8SA6qtlV6pAcXScShN5LsagSUPVVKg1weGaNKBORGxLjFoVw70FwScihZdIyzlsVWmR
	rcdh/3BCxqRcg==
X-Received: by 2002:a05:7022:28d:10b0:15d:d7a2:3a88 with SMTP id a92af1059eb24-16a5dbfdef7mr22169069c88.18.1792040036881;
        Wed, 14 Oct 2026 21:53:56 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:a490:42fc:1e02:1d0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm50795358c88.21.2026.10.14.21.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:53:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 10:23:28 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <atBcSEXZzZ0pryDg@user>
References: <20261015015624.22031-1-pavankumaryalagada@gmail.com>
 <c42bf562-913d-c449-4c7a-5f67bd08f9d@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c42bf562-913d-c449-4c7a-5f67bd08f9d@inria.fr>

On Wed, Oct 14, 2026 at 10:21:22PM -0400, Julia Lawall wrote:
> 
> 
> On Thu, 15 Oct 2026, pavankumaryalagada@gmail.com wrote:
> 
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > Use %pe to print error pointers directly and display their
> > error names.
> >
> > Keep PTR_ERR() calls when the numeric error value is needed
> > for returning the error code.
> >
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> > v3:
> > - Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.
> >
> > v2:
> > - Use %pe in the firmware management case, as suggested by Jeremy Clifton,
> >   to match the other cases.
> >
> > v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
> > ---
> >  drivers/staging/greybus/arche-apb-ctrl.c | 18 +++++++++---------
> >  drivers/staging/greybus/arche-platform.c |  8 ++++----
> >  drivers/staging/greybus/fw-core.c        | 16 ++++++++--------
> >  drivers/staging/greybus/uart.c           |  2 +-
> >  4 files changed, 22 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> > index 4302c2226126..fa4d2d88dc3f 100644
> > --- a/drivers/staging/greybus/arche-apb-ctrl.c
> > +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> > @@ -145,8 +145,8 @@ static int fw_flashing_seq(struct platform_device *pdev)
> >  		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
> >  		if (IS_ERR(apb->spi_en)) {
> >  			ret = PTR_ERR(apb->spi_en);
> > -			dev_err(dev, "Failed requesting SPI bus en GPIO: %d\n",
> > -				ret);
> > +			dev_err(dev, "Failed requesting SPI bus en GPIO: %pe\n",
> > +				apb->spi_en);
> >  			return ret;
> 
> Maybe it's for after this series gets accepted, but you don't really need
> to initialize ret here.  You can just return PTR_ERR(apb->spi_en).

I'll return PTR_ERR() directly where possible and keep ret assignments
where the value is needed for further error handling.

> 
> You can also check whether the ret variable is needed at all in this
> function (I don't know).

I'll keep ret in fw_flashing_seq() since it's used for regulator operations,
and remove it from apb_ctrl_get_fw_data() since it's only used for returning
error codes.

Thanks,
Pavan

> 
> >  		}
> >  	}
> > @@ -323,14 +323,14 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
> >  	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >  	if (IS_ERR(apb->resetn)) {
> >  		ret = PTR_ERR(apb->resetn);
> > -		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
> > +		dev_err(dev, "Failed requesting reset GPIO: %pe\n", apb->resetn);
> >  		return ret;
> >  	}
> >
> >  	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
> >  	if (IS_ERR(apb->boot_ret)) {
> >  		ret = PTR_ERR(apb->boot_ret);
> > -		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
> > +		dev_err(dev, "Failed requesting bootret GPIO: %pe\n", apb->boot_ret);
> >  		return ret;
> >  	}
> 
> Same here and in the subsequent ones.
> 
> > @@ -338,7 +338,7 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
> >  	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
> >  	if (IS_ERR(apb->pwroff)) {
> >  		ret = PTR_ERR(apb->pwroff);
> > -		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
> > +		dev_err(dev, "Failed requesting pwroff_n GPIO: %pe\n", apb->pwroff);
> >  		return ret;
> >  	}
> >
> > @@ -346,14 +346,14 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
> >  	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
> >  	if (IS_ERR(apb->clk_en)) {
> >  		ret = PTR_ERR(apb->clk_en);
> > -		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n", ret);
> > +		dev_err(dev, "Failed requesting APB clock en GPIO: %pe\n", apb->clk_en);
> >  		return ret;
> >  	}
> >
> >  	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
> >  	if (IS_ERR(apb->pwrdn)) {
> >  		ret = PTR_ERR(apb->pwrdn);
> > -		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
> > +		dev_warn(dev, "Failed requesting power down GPIO: %pe\n", apb->pwrdn);
> >  		return ret;
> >  	}
> >
> > @@ -368,12 +368,12 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
> >
> >  	apb->pinctrl = devm_pinctrl_get(&pdev->dev);
> >  	if (IS_ERR(apb->pinctrl)) {
> > -		dev_err(&pdev->dev, "could not get pinctrl handle\n");
> > +		dev_err(&pdev->dev, "could not get pinctrl handle: %pe\n", apb->pinctrl);
> >  		return PTR_ERR(apb->pinctrl);
> >  	}
> >  	apb->pin_default = pinctrl_lookup_state(apb->pinctrl, "default");
> >  	if (IS_ERR(apb->pin_default)) {
> > -		dev_err(&pdev->dev, "could not get default pin state\n");
> > +		dev_err(&pdev->dev, "could not get default pin state: %pe\n", apb->pin_default);
> >  		return PTR_ERR(apb->pin_default);
> >  	}
> 
> These two are different from the others.
> 
> julia
> 
> > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > index de5de59ea8ab..a97ac59c6f01 100644
> > --- a/drivers/staging/greybus/arche-platform.c
> > +++ b/drivers/staging/greybus/arche-platform.c
> > @@ -445,7 +445,7 @@ static int arche_platform_probe(struct platform_device *pdev)
> >  	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
> >  	if (IS_ERR(arche_pdata->svc_reset)) {
> >  		ret = PTR_ERR(arche_pdata->svc_reset);
> > -		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
> > +		dev_err(dev, "failed to request svc-reset GPIO: %pe\n", arche_pdata->svc_reset);
> >  		return ret;
> >  	}
> >  	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
> > @@ -454,7 +454,7 @@ static int arche_platform_probe(struct platform_device *pdev)
> >  						  GPIOD_OUT_LOW);
> >  	if (IS_ERR(arche_pdata->svc_sysboot)) {
> >  		ret = PTR_ERR(arche_pdata->svc_sysboot);
> > -		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
> > +		dev_err(dev, "failed to request sysboot0 GPIO: %pe\n", arche_pdata->svc_sysboot);
> >  		return ret;
> >  	}
> >
> > @@ -471,7 +471,7 @@ static int arche_platform_probe(struct platform_device *pdev)
> >  	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
> >  	if (IS_ERR(arche_pdata->svc_ref_clk)) {
> >  		ret = PTR_ERR(arche_pdata->svc_ref_clk);
> > -		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
> > +		dev_err(dev, "failed to get svc_ref_clk: %pe\n", arche_pdata->svc_ref_clk);
> >  		return ret;
> >  	}
> >
> > @@ -484,7 +484,7 @@ static int arche_platform_probe(struct platform_device *pdev)
> >  						  GPIOD_IN);
> >  	if (IS_ERR(arche_pdata->wake_detect)) {
> >  		ret = PTR_ERR(arche_pdata->wake_detect);
> > -		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
> > +		dev_err(dev, "Failed requesting wake_detect GPIO: %pe\n", arche_pdata->wake_detect);
> >  		return ret;
> >  	}
> >
> > diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> > index 2016a74f137f..78321be80013 100644
> > --- a/drivers/staging/greybus/fw-core.c
> > +++ b/drivers/staging/greybus/fw-core.c
> > @@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >  			if (IS_ERR(connection)) {
> >  				ret = PTR_ERR(connection);
> >  				dev_err(&bundle->dev,
> > -					"failed to create management connection (%d)\n",
> > -					ret);
> > +					"failed to create management connection (%pe)\n",
> > +					connection);
> >  				goto err_destroy_connections;
> >  			}
> >
> > @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >  			connection = gb_connection_create(bundle, cport_id,
> >  							  gb_fw_download_request_handler);
> >  			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
> > +					connection);
> >  			} else {
> >  				fw_core->download_connection = connection;
> >  			}
> > @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >  			connection = gb_connection_create(bundle, cport_id,
> >  							  NULL);
> >  			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
> > +					connection);
> >  			} else {
> >  				fw_core->spi_connection = connection;
> >  			}
> > @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >  			connection = gb_connection_create(bundle, cport_id,
> >  							  NULL);
> >  			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
> > +					connection);
> >  			} else {
> >  				fw_core->cap_connection = connection;
> >  			}
> > diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> > index 172cf900eaf0..59a112cf47a0 100644
> > --- a/drivers/staging/greybus/uart.c
> > +++ b/drivers/staging/greybus/uart.c
> > @@ -951,7 +951,7 @@ static int gb_tty_init(void)
> >  					 TTY_DRIVER_DYNAMIC_DEV |
> >  					 TTY_DRIVER_RESET_SAVED_TERMIOS);
> >  	if (IS_ERR(gb_tty_driver)) {
> > -		pr_err("Can not allocate tty driver\n");
> > +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
> >  		retval = PTR_ERR(gb_tty_driver);
> >  		goto fail_unregister_dev;
> >  	}
> > --
> > 2.43.0
> >
> >
> >
