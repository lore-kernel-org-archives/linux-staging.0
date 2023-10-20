Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8431DA5F
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="odwVUgQx"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-507975d34e8so1407520e87.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697817338; x=1698422138; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6kzOgo9KLgnzG1tBcKH3CK3w1Ak8u2S5mlzy6a00p8=;
        b=odwVUgQxPgNksxMSR1YESR4NIgfBMbR2/3mKtNjt+bVDC5u4uCt9xa7PAIFy0h1XIT
         xh/XoeA9iJ8qHnuwFgBQAwJaqt8j0iuPmXrEyueIroE9rleo9Fc7JdwWKvhtYJdxGQhf
         J95c9uHpW4tSxB55pJtqM3/2RiCxbyKCM8c59vVuVG/AIbRI/nFxPvKbTBjT+SqbGYrf
         4prFp9+WIxTzPAiNT76rwgzpZY76BdAVq59cZYehCHAdmVSkI7tugGBPYA7xoabgsDUO
         7zkxFVRjpo2lsI0arRZU3E+3+V8ZxKuojAV/wQYxjXTAuZD2v/Asl1YNCEykXjVXBRr/
         vDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817338; x=1698422138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6kzOgo9KLgnzG1tBcKH3CK3w1Ak8u2S5mlzy6a00p8=;
        b=T6D1sjvlSlu4/duYMPkJa38AGnF8zJhOyBlZS4afvqnyRqkOwVYbv6gIRDbdBjbXEc
         c27Cx3wHPebRXhuCDJ7Vybff3E80ZtqwJ/3KQoUWPpirD/cVvy3BGlYjBm0wGZ+8FhyQ
         x5DnGZIws4ayC0teCCzWMtpUqqcut8odAmIrTwhice26eJWomam5K74O1mVoGb0Y6fAU
         lQ3f9DvUVtKqYMH4OjbJsCKRwCsMU+F9y6Ou5tcb7aBtUpgKPcpUaOGK4qB30z8njH0z
         FbrDf6KX3tuKRNF1484kdfoPkjtmmaaOCqsnm/yiExS7yrXyNuS7HEA9q1fnrNiYowqd
         A9dw==
X-Gm-Message-State: AOJu0Yw+LI45hkyhwHHMz92ELRojuNuMzP/N4+ayFY3xCozpk8sx++/T
	W6Hh7CyNG929aCXs4FpzbsXWGA==
X-Google-Smtp-Source: AGHT+IFpm3YF6F1pk+UdApdLVX+ULTxt+ZFtNP4MtvY8mHk6SL+aZm0RGmKhltAzr1WzPTmhZutzQQ==
X-Received: by 2002:a19:760d:0:b0:507:99fe:28f3 with SMTP id c13-20020a19760d000000b0050799fe28f3mr1587690lff.34.1697817337768;
        Fri, 20 Oct 2023 08:55:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u16-20020adff890000000b0032d8ce46caasm1944414wrp.93.2023.10.20.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:55:37 -0700 (PDT)
Date: Fri, 20 Oct 2023 18:55:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen Shuo <1289151713@qq.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: camera: fixes alignment should match
 open parenthesis
Message-ID: <de77b29e-fb65-407d-ab77-f4a2a77a8422@kadam.mountain>
References: <tencent_2E5278ECD059882823EF2A5209D98B53E306@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_2E5278ECD059882823EF2A5209D98B53E306@qq.com>

On Fri, Oct 20, 2023 at 11:12:03PM +0800, Chen Shuo wrote:
> This patch fixes the checks reported by checkpatch.pl
> for alignment should match open parenthesis
> 
> Signed-off-by: Chen Shuo <1289151713@qq.com>
> ---
>  drivers/staging/greybus/camera.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index cdbb42cd413b..ed9e16bab4cc 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -378,7 +378,7 @@ struct ap_csi_config_request {
>  #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
>  
>  static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> +					   struct gb_camera_configure_streams_response *resp,
>  		struct gb_camera_csi_params *csi_params)
>  {

Just leave it as-is.  The original was fine.  I know that these days
we can go over the 80 character mark but, really, does this make things
easier to read?

regards,
dan carpenter

