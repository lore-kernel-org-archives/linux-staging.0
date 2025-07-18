Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFB6D528
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 02:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752804168; cv=none; b=YiPmBwIBLtEV4IKlqX4enMMMvqriZO98s4n7gHy+osyQIYLW9UV2pLe6P8Tq3ucxdzZCWsrtxV1KMLXvU2SQphv6fQL9q+P9DO6fLbiqsB4Cb3DK3x+GWMlC6E3+ooJilvdM+eVJgjU+j1ytdNHh10JniHGND3Z6GEiANrgYVaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752804168; c=relaxed/simple;
	bh=tItl6Xkm0myXhSrQP9N9X6CM9SpkzyyAffNHX9OFsgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGqmF881LCUVGm4zTSbo6G6RLoEOHvRnBF9GZUUwrA1obXa+IEr3IN1tjWsZZkJx4SQst75PcaxN+2PLPRXktBlOYeYNF8oU9wFNetNd2NhIH1VxHEDXLtDpO/sjH1LU+6yysrOsP5OD0aIBG/yfCqrJAQArH+geRnXGTka449Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tx9LsgBa; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tx9LsgBa"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73e7bb65255so687165a34.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 19:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752804165; x=1753408965; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQIQyKdRFgYCxy5HSe3Ua2IVeutNacTw7X3cVK/drF8=;
        b=Tx9LsgBaQHP1FhMqBGjh9e+zKGraqWavSo43Kbw3haQj/GRTMrbOB0AzcFEXK8Navl
         bBnwIRmtXfxRaTlStUaAXkgOqiJTuzj5SdsHv41hb6dnOn4xlRTMjrTmt6Bo49TgVRwo
         AA8OY1KhcckIbTO/FxBfYTb/eMEK7Gi6Dl/xiK2uoiVCAvOHXCyetbkf2evBPhUcMOGf
         nOgVOJYoR0AZLc3FtFwuQpzYZZ1wi82pGt1BPD7jldfDEjTjz9Ka604V6fcgUWclA1ZD
         gd8cWxAM50fgkjbdvS+D+avxvzpj/0cXaEK5+GXF6xnf8RTJuXJ80iwkQhDG+xdWmL38
         N+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752804165; x=1753408965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQIQyKdRFgYCxy5HSe3Ua2IVeutNacTw7X3cVK/drF8=;
        b=FTKhwmRzYyDrg01XzDV6+8AL6KS/m1eqCzEmEGyBew3PJFDjEiajWfa1JpnHibqgwF
         0FYI3ABnrPqwlFKX2uErsFMwkj7nvzgiKXksJqeLdZCy6c7mHQevtpGBibQr08Wb4IZx
         KmSvd6TmWLLucYCkYZnL3lHAXMl6YkEQi4+sfs5QSITHT8Be5cNHHKEAmnJkFTkFJIj6
         cbQerrjdKI04xA1TsFyfSfyCoRs+n36gmeklHvnH/BLxOyEb87NQvKp0CyUT9V2xxfpT
         +mHqVP6sBZBT7oDUpp9QPI/R900ikfWCSyV7VZKVSDufc006gK+GHqd7c7lMaH3FELy6
         mZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV96e1Zo4DOy6VVNsRm6zSgEf+dF6WK2fPS9xY6vnBGgmrKCgOhqR491ZBo9gR03tR0evzPCM2H5Ajlx1/Y@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxxbpd4Gg39IpO/SHtH4oGgMURTdUlJBYi8jQWEsUys+GQPCk6
	AA+CsA4nhmeDGhDTX2Pu9kIfJl2vV1uhid4Fzxaxs4BYUVHstBWoKXi23ILKbrwZ2ig=
X-Gm-Gg: ASbGnctqOmMZiJ0mKC7piDu7YKVYcVPKgw2cknf1glElI5CK3LG7f8HyHUh/QjnFOyK
	5WbC9XuQGSjiC835HV4TyYaPHO+wHXpc3tVtFkimS1gDPCx5/MZRZceoVgXHQ2pF+smPr7hkR5c
	Md4H/ihLAnRSzqwPawjnrnJhNrk+rqQh6Cc6J7CY6QxwejzP1H6vx2GuyN2enk8tuw+zB80Pef2
	2iqcU64PhHEvP+Jb+3SSpDtGZ3Xia2eaRjLDPh/kIf9n47hi7Nd7QuZ8lSxckXZML7zXbbtGysQ
	sPzrx0vJWeBXMuuhyI3aB2/vrdpiotc1sROXXaQN5R5AajfYRtmMCNCKB1SoQu44qxHeUH2PMpd
	ZnHhqbehGmWHi2mDCqmvCZujO7mqM
X-Google-Smtp-Source: AGHT+IEI8sBMyOgnw6y2eCUr5fjpT0b/Hn5vFbc1u562p9vD1WxLFCBfM5OhNgbekGnp7NVxtkJ2pQ==
X-Received: by 2002:a05:6830:8104:b0:73b:1efa:5f6d with SMTP id 46e09a7af769-73e661974a1mr5923482a34.16.1752804165130;
        Thu, 17 Jul 2025 19:02:45 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e8367f410sm249912a34.24.2025.07.17.19.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:02:44 -0700 (PDT)
Date: Fri, 18 Jul 2025 05:02:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: rtl8192u: Rename ChannelPlan to channel_plan
 and fix index name
Message-ID: <6c0d6a6e-4b47-48c9-acbd-b5dd33fd0001@suswa.mountain>
References: <20250718015525.162561-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718015525.162561-1-vivek.balachandhar@gmail.com>

The rtl8192u driver was removed.  Work against the current code.  (Just
use linux-next probably).

On Fri, Jul 18, 2025 at 01:55:25AM +0000, Vivek BalachandharTN wrote:
> This patch renames the global array ChannelPlan to channel_plan
> to follow Linux kernel coding style. Also renamed the index
> variable from channel_plan to chan_plan_idx to avoid
> shadowing and improve readability.
> 
> v2:
> - Fixed Cc list to include Greg and staging list
> 
> v3:
> - Removed EXTRAVERSION = -vivek from Makefile.

Heh.  No.  Still there.  Slow down, there is no rush.  Let people
review the rest and see if there is anything else to change.

> @@ -145,12 +145,12 @@ static struct CHANNEL_LIST ChannelPlan[] = {
>  	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14}
>  };
>  
> -static void rtl819x_set_channel_map(u8 channel_plan, struct r8192_priv *priv)
> +static void rtl819x_set_channel_map(u8 chan_plan_idx, struct r8192_priv *priv)

I hate the name chan_plan_idx.  Probably "chan" would have been a better
name.

>  {
>  	int i, max_chan = -1, min_chan = -1;
>  	struct ieee80211_device *ieee = priv->ieee80211;
>  
> -	switch (channel_plan) {
> +	switch (chan_plan_idx) {
> diff --git a/init/main.c b/init/main.c
> index aa21add5f..648589720 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -680,6 +680,7 @@ static void __init setup_command_line(char *command_line)
>  
>  static __initdata DECLARE_COMPLETION(kthreadd_done);
>  
> +

This change is a mistake as well.

>  noinline void __ref rest_init(void)
>  {
>  	struct task_struct *tsk;

regards,
dan carpenter
