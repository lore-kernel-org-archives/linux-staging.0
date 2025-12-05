Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F22352FBD
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764919604; cv=none; b=W/GG8Crfq0GYoKOpf5E3sXeTZQdKRjA7b8q4AIpEfo3uhULQeSUIlVgXLr8zRuhYLRC5q7oRkmoRjMXnDXyCK6pRoVsuxylvM/CzlbAzoIPjm2ea3fJu6uaRjHIpnASLNo361FflyMYZ/1Zz1P3JxVPWvNgePxE3tamKUbMYMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764919604; c=relaxed/simple;
	bh=y6hpwNXHvn8h2JT93xx/rL4yudlgZvynbQSQBzkE8E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsxFT9MC2J31L4/FjM0K52MhZLHD15Ogk6RRwjkXHWVjhsnWfftLzKuAAotnoj8qzgF91Qvo1r3RtXw1XCIEz55ojCDUEooNoqZErZzvmzY9fN2EEw6Tri4q3VjPcPnpHEiE4reknzHX7rGLdLQ1HoXMbczC6Hx+qDi+Y9Ocnrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IOHedbw9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IOHedbw9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso16548565e9.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 23:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764919600; x=1765524400; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1/xSk7k7y5ORewyP92d4zP5k+wuexOEfuZzjXOsxttE=;
        b=IOHedbw9E3t/g6pJ22MxLaUo70cMOZNAARJYyz/KOOycPfqnrzoJNoaAtaQaP4wLZ+
         ZfCOxD572SxwO+NAV0qtXaQU+vIXRuqR1mIj18iR+NDQh/Lo+8vD1XXrBk049eslegBp
         EzDqZbc/0o8tJ9L+H1AWjKRg3xQsPm8wzbzg/tTewuiZPnnfA6B9wpMWhtDidYVw275N
         PGoZGHesd4dPKMlY3c8Q/pV4n1zon1gFXYuaJSel97siiotIqLziVTwL5dvB7QkQhXRQ
         t+nBNg+dnnXGGRN7AemddpIsaVwbmHWBC5+haj/HYKsnuhVgnjIglt4Sq8oVC+wMKu2c
         uamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764919600; x=1765524400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/xSk7k7y5ORewyP92d4zP5k+wuexOEfuZzjXOsxttE=;
        b=FeS16Mps1ORvSGVzwL3OEwFzhWXoib65AAemMLfnDwe1GB3stOGCrOrt+iXhtK1fEG
         c/ypMf4RTwv1RoqHqTvbALV6/qsIwf0vaLRudaTfanqPfqI6SVfgkf7TS6ZnPRB5VSyw
         UkVDmxC/6R8GQ+94LU186E++zF6InnTN+znviGW9piSi0nxtjsd5LfjaHrhTvAtJap94
         KqOP9dxrMfuBrbG0VGynFl95ACoevQZuekOte21cJY8IBPwuzn56HaSLoJif9XpeicAE
         jwD3X6dP0jK2e44Xr4IhKgo83K5XlsfZ0SZ7QWCmtvnKykPxvBCwSdh64KeJ8nAhlBrm
         vnVA==
X-Forwarded-Encrypted: i=1; AJvYcCUBvHbcsbkz8vzGl2kzkgh0J560Up4bnOY5GG/lTJ72SiLUiOZyrrt1TU2OmD6BRRTekWvz9yKuG3uUD7ki@lists.linux.dev
X-Gm-Message-State: AOJu0YyzsoPmJHCMMAkty2twRz/U0OgTyJzPHUVapj9QZx1nuQEBBIiC
	dmeZG5X9xTFmgA9l7yV+nCUg/pTXgakOnVpB0oUUhKU9tXqdyJfsYekew0PUKMXG4FFhlO7IRdr
	fS876
X-Gm-Gg: ASbGncvQuY9Kk5Wb3ylTxIKWJJ2QIVHF8hiRrZ4IbhBl4bG+WdZ4TsqaXmjQ5FjMGWY
	cYUohQJSPpHmbdPPjVkpo/2W1HD2JhhZPfyuPm76vr4xnE9v/QOxRaycmNNWbWy7rIPJTR/HY+f
	QxT8LL911OVvXLqSQ3r6sLkK4oFjVNmT/3aPM4pbcMZFOlhJG7duoth+JglYqjDedKL7915xKrs
	5gyJ7JD594ydKALI3QR63D/vhuiQx+MNYoA/qkfGTkk1sjuD8HF6sOSvvKgXkqDF4EbfwDOmKLY
	BexxS3l+ZHFssZySEGm8QmBkvKenrTf1jYG3VK+3jKJZo3maRU5alwfo51fKrldqk1Uyw0FwqBk
	xnyvpcpHhGHDEEaBL0Ng5q2ZZLJTHXI0+AjI2BggZix+WDPji5H2WB51+EzlH39l8Kx6w09Jfio
	yN54ITfqKu2fkpd3wx
X-Google-Smtp-Source: AGHT+IF4zI+PS5QqylDs49iI5Q83p+mebfmgs63dSePFEMk3FtdfDXsG+qtXKiS/FoLXt0OZ9d72Eg==
X-Received: by 2002:a05:600c:4e89:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-4792eb438d0mr65416405e9.13.1764919600168;
        Thu, 04 Dec 2025 23:26:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792b140cf4sm65734635e9.5.2025.12.04.23.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:26:39 -0800 (PST)
Date: Fri, 5 Dec 2025 10:26:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julioccps <julio191096@gmail.com>
Cc: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: arche-apb-ctrl: switch to
 device_property_read_bool
Message-ID: <aTKJLAZaPjEcS17l@stanley.mountain>
References: <20251204231110.65847-1-julio191096@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204231110.65847-1-julio191096@gmail.com>

On Thu, Dec 04, 2025 at 08:11:10PM -0300, Julioccps wrote:
> Switch from the deprecated of_property_read_bool() to the common
> device_property_read_bool() API. This makes the driver agnostic to
> the underlying firmware interface (DT or ACPI) and simplifies the
> logic.
> 
> Since the driver is no longer strictly dependent on Device Tree,
> include <linux/mod_devicetable.h> directly for the struct
> of_device_id definition, instead of relying on implicit inclusion
> via <linux/of_irq.h>, which has been removed as it is unused.
> 
> Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
> to better reflect the agnostic nature of the new implementation.
> 
> Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>

This doesn't match your From header.

> ---
> hanges in v3:
>   - Added version history (changelog) required by the subsystem maintainer.
> 
> Changes in v2:
>   - Updated the subject line to match the subsystem standard.
>   - Updated Signed-off-by to use full real name.
> 
>  drivers/staging/greybus/arche-apb-ctrl.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 90ab32638d3f..eea9648a461c 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -10,13 +10,14 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
> -#include <linux/of_irq.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
> +#include <linux/mod_devicetable.h>
>  #include "arche_platform.h"
>  
>  static void apb_bootret_deassert(struct device *dev);
> @@ -314,7 +315,7 @@ static ssize_t state_show(struct device *dev,
>  
>  static DEVICE_ATTR_RW(state);
>  
> -static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
> +static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>  				     struct arche_apb_ctrl_drvdata *apb)
                                   ^^
This line needs to be indented differently now.

>  {
>  	struct device *dev = &pdev->dev;

regards,
dan carpenter
