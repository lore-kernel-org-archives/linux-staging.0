Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCBE882F
	for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 05:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeZ6pc+N"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-32d9b507b00so2461049f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Oct 2023 22:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697434760; x=1698039560; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SAhyhyywQsJApEGes0Z+kLzxA9BFQIkO86pnB4KjlYM=;
        b=oeZ6pc+NJOMI1dvlQeT3AJothZHlO2sIsgN0cfIyIUBb5q/OxYSupSUjjzwG0/c6jg
         RsIq4zb3H4L4qH8qLo8L0+tWyj3kGsEfBG0m+rcOExVpVZcirDMhdNbG0c8TCJTIWGAr
         rlMidn4HTzDo80L9JbHzytp7mMyl01GSkomHyt7SDAMwQS3gnyg/xIPN0WIJL2AoyfEw
         2xCBoc1t3ALTmRbZq/GFxgprWotC812B+zzYtYNNHGcR9m00n6mKLJdvkutISJwzZ+UD
         0rJhcYPSTiesXdFOs0Bgmww3BCeKu+oxeGav/TTZe59vhvA9ZGrnOyb5DPG8m7FJIt1J
         3Myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697434760; x=1698039560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAhyhyywQsJApEGes0Z+kLzxA9BFQIkO86pnB4KjlYM=;
        b=NwWibhaCJjC71RFbnRdlrtjCtCc3a96s2iYNto5fHw+tvycbUdZiRwwj/r7lsPKJb0
         l0JKr6R39gqEhyKFPWoQFC/M8jjkR3k35X729xf9pgz2QYCTnezFUGYJWV9mcVqfcdcK
         P74gJZ5zdTgEpNzLfxOgFdKnIPEhkBad60USGmDeXKb4R0fTvn7fculCwuEPngUgcS/+
         3DDmHwCikUlMvuYhIR8CZUCnJRuNs5LTvnJWg4gcmK5IcdIKpO5ch0gDWwiyG3Qofg4Q
         KgVJIBSWPBuhm+u+PQUT/pDV6MJgBRxNqWabj3hRRwS4XNdJSJbaykc/6jJYHYer7+r7
         nOQA==
X-Gm-Message-State: AOJu0YxVp3xRN7F+qv71Ec6KNz6RHqKq5xEbwyLLk1lNAAz9E/YP4XuM
	2chZsfrHXZ56qT5m/Y2mzr0rrA==
X-Google-Smtp-Source: AGHT+IHHH39CYBAqvsSK1af/YmT2zspK8LPta7U0tTel7SK8+/JS/p2F4kC53nRhcqFg6aa5y5joRg==
X-Received: by 2002:adf:ea42:0:b0:32d:a57b:8c8e with SMTP id j2-20020adfea42000000b0032da57b8c8emr4192772wrn.53.1697434760301;
        Sun, 15 Oct 2023 22:39:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e28-20020adfa45c000000b0032d892e70b4sm12196991wra.37.2023.10.15.22.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 22:39:19 -0700 (PDT)
Date: Mon, 16 Oct 2023 08:39:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: Align descendant arguments
Message-ID: <3620a5eb-34d8-49ae-a925-66f85a62e09c@kadam.mountain>
References: <ZSuYUmX5P5M0Ok/I@gilbert-PC>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSuYUmX5P5M0Ok/I@gilbert-PC>

On Sun, Oct 15, 2023 at 08:44:18AM +0100, Gilbert Adikankwu wrote:
> diff --git a/drivers/staging/rtl8192u/r8190_rtl8256.c b/drivers/staging/rtl8192u/r8190_rtl8256.c
> index 54747fda552f..a81e88894e01 100644
> --- a/drivers/staging/rtl8192u/r8190_rtl8256.c
> +++ b/drivers/staging/rtl8192u/r8190_rtl8256.c
> @@ -46,17 +46,17 @@ void phy_set_rf8256_bandwidth(struct net_device *dev, enum ht_channel_width Band
>  				    priv->card_8192_version == VERSION_819XU_B) {
>  					/* 8256 D-cut, E-cut, xiong: consider it later! */
>  					rtl8192_phy_SetRFReg(dev,
> -						(enum rf90_radio_path_e)eRFPath,
> -						0x0b, bMask12Bits, 0x100); /* phy para:1ba */
> +							     (enum rf90_radio_path_e)eRFPath,
> +							     0x0b, bMask12Bits, 0x100); /* phy para:1ba */

These ones go too long indented like this.  The other sections are fine
but just leave leave this file as it was.

regards,
dan carpenter

>  					rtl8192_phy_SetRFReg(dev,
> -						(enum rf90_radio_path_e)eRFPath,
> -						0x2c, bMask12Bits, 0x3d7);
> +							     (enum rf90_radio_path_e)eRFPath,
> +							     0x2c, bMask12Bits, 0x3d7);
>  					rtl8192_phy_SetRFReg(dev,
> -						(enum rf90_radio_path_e)eRFPath,
> -						0x0e, bMask12Bits, 0x021);
> +							     (enum rf90_radio_path_e)eRFPath,
> +							     0x0e, bMask12Bits, 0x021);
>  					rtl8192_phy_SetRFReg(dev,
> -						(enum rf90_radio_path_e)eRFPath,
> -						0x14, bMask12Bits, 0x5ab);
> +							     (enum rf90_radio_path_e)eRFPath,
> +							     0x14, bMask12Bits, 0x5ab);
>  				} else {
>  					RT_TRACE(COMP_ERR, "%s(): unknown hardware version\n", __func__);
>  					}

