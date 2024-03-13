Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E71C122
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 05:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710307707; cv=none; b=PjC1+nBJv/eT8mIvrhYK6MQht4ddQW9J3Fp2pNwnxBYonflMDYEwTVP1MEcU4S0oLLe/y7Z4ixvK/jNr92AxKkZidyWUaS7fbQDB75bpkd6mMIj9/ZRGT/JnzJGEB7Kxrcem4bqBVQGJ5ZXbFVYbLs6dgHPqHXEIQqkzyAhfXKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710307707; c=relaxed/simple;
	bh=iu8MZFNXjpyfTpdGoSxoKHjAe7jJbUr1WqmHPzd/CPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMvn8Svht1WrQVcPU7ZtRwnQEmeLPkjtWSJkd/2Klv6n7m5pUaZRay6coMWGIGi0S0cacc4e2yyCCFpoldestlKgC2seSGJARuMx8hX08W1AgbEG4/ZqveCDcIECCW0DFqIEpO/HJ3FbdfK9E+uFLio6vvSsY4INW5zaQdPg+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BY6z5mzg; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BY6z5mzg"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so6015853a12.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Mar 2024 22:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710307704; x=1710912504; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WK2hLpaKA4dIBaZcF1LV8ZinLSkxIAD4k/3MzBtpkYQ=;
        b=BY6z5mzg+rNbE6XOoZ2LMAYBbdm8KR9kuNmPpIji8g/hlNNVM1pGS/N97y8DZuM8q6
         2n02ef96xhghTzW0/n25CWFOul3R2f0RqvMVMufIzbenL8TNp11mIJeDI8XiaPGAT5C+
         Iaq/9JFg8CbTBUO7NzCdLBT3oCyPcFO5wBqymrZdr5yX1CGge1+ACz5xk2MxawJBuPSe
         z+OS/lnO78e71Juk7TS+wSVyrnrVTG8RQE5ao3gm0Rsn6OrAdFxg8ibWEWi+LFZ0f4XN
         1prGYOxb2VmjNycTcZEjRQDKv1TMRH2Am2b7mZQYqWDswibLcSTyHutkbJh+vjcJJilZ
         +R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710307704; x=1710912504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK2hLpaKA4dIBaZcF1LV8ZinLSkxIAD4k/3MzBtpkYQ=;
        b=sTamnwzBpnTH2OtSrZ1IeW2WaAE8zQH0PT9XgYopsRCEpu0uMVrvR1cQjsIqYj/C6V
         VY/kcQaLTTyHUNByeAtQPrHQJlj7a4lnHC3etSSIfqgldAIv8O92neRUAhYn3cpz44S3
         Xa004qdRKy+62qqgOX/jfOF6BiiS5n4R/eSxOk5lS0nH10OMI2zIR3w348dq6MaOIWkL
         LNN1+6azp0cLdRZPelmzkXIloMbfBcKkzRocYLsitbxlhTkA92eRO+5ehoBKYVeYymYM
         +Y6i2mSF9DvXEWxjIt+ngzJNlKmtYaZf0cZzMSyFPUuiREY6AzkilgOVZNhoEfssigWO
         5zCA==
X-Gm-Message-State: AOJu0YwLppcXkQkaRLh3hjZZk3bPN7wYm7pgxd6JaJASsWTEYYgW/LG3
	ZgMC4VfcboBgGpWp1/apdRG9D19N6/7MSe5wtny6TaMyUvER/uynpXC6DKJXJos=
X-Google-Smtp-Source: AGHT+IHdo/pRzTGpMU3NhdGCBeySjxGItS83ehTI+LVXX2XWvdWoC/Qy9rucnosX9IKGYQW4la2Upg==
X-Received: by 2002:a50:ab1c:0:b0:567:5f01:99dc with SMTP id s28-20020a50ab1c000000b005675f0199dcmr7353956edc.42.1710307703869;
        Tue, 12 Mar 2024 22:28:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fj10-20020a0564022b8a00b00565af2ea649sm4547786edb.14.2024.03.12.22.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 22:28:23 -0700 (PDT)
Date: Wed, 13 Mar 2024 08:28:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/3] staging: v04_services: Add connection structure to
 driver data
Message-ID: <590966d6-dd65-4341-b1cd-10353fd1aa52@moroto.mountain>
References: <20240311231607.124491-1-umang.jain@ideasonboard.com>
 <20240311231607.124491-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311231607.124491-3-umang.jain@ideasonboard.com>

On Tue, Mar 12, 2024 at 04:46:06AM +0530, Umang Jain wrote:
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 52569517ba4e..b8b51267bcde 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -72,10 +72,20 @@ static struct vchiq_device *bcm2835_camera;
>  
>  static struct vchiq_drvdata bcm2835_drvdata = {
>  	.cache_line_size = 32,
> +	.drv_connected = {
> +		.connected = 0,
> +		.num_deferred_callbacks = 0,
> +		.once_init = 0,
> +	},
>  };
>  
>  static struct vchiq_drvdata bcm2836_drvdata = {
>  	.cache_line_size = 64,
> +	.drv_connected = {
> +		.connected = 0,
> +		.num_deferred_callbacks = 0,
> +		.once_init = 0,
> +	},
>  };
>  

Modifying vchiq_arm.c is unnecessary, because these are initialized to
zero by default.  Once you remove that then this is quite small and
easier to review when it's merged together with patch 3.



>  struct vchiq_arm_state {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> index e4ed56446f8a..cb5cba94dd54 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> @@ -6,6 +6,16 @@
>  #ifndef VCHIQ_CONNECTED_H
>  #define VCHIQ_CONNECTED_H
>  
> +#define  VCHIQ_DRV_MAX_CALLBACKS  10
> +
> +struct vchiq_connected {
> +	int connected;

connected should be type bool.

> +	int num_deferred_callbacks;
> +	int once_init;
> +
> +	void (*deferred_callback[VCHIQ_DRV_MAX_CALLBACKS])(void);
> +};

regards,
dan carpenter

