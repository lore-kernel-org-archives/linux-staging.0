Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85432C80
	for <linux-staging@lists.linux.dev>; Thu,  6 Jan 2022 10:19:55 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id c2so2145411pfc.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Jan 2022 02:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H3j3OBM8zalTDzIk5cZKKGbGfOPu4uEf9KmgtZeTqBw=;
        b=j3AIMULN87EQ8JeCbKonwMvBB8mnMshBTr357TwGdx6h+wKLPVBElr4UlP5GlpJVxh
         1x0jWASYLFuE5lHfCDiXCE+5hNZZgyPOvACz0umqZicetVOE2CzP4R+ujDPHxTnzpOP2
         fHHS+n/cNX6xDu0uWmQ0XKC24yxH+Kbd58w0wGxBJI57AYho1tDK1GcRKayZUlbWcmo5
         8mjThdFXD5DSznaB6Xe3e4RiMBfnXLg8a2oiqckYkvgrmqFvx0ANf7PzrBRdMEGjmqVM
         keMSj9CoZNrI4paLNnP7VYcH1k8Ny1D+zLpr4Yu1I9KCh2r/LGURj0Qaad7cvaCR0hgs
         wYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H3j3OBM8zalTDzIk5cZKKGbGfOPu4uEf9KmgtZeTqBw=;
        b=0H/XHa/jUnUfdd3YzzEqT5rsB55M54uEF5QhYDMmGr/3B5aSA+Zb69WPe68KWKCOp3
         JpjB+ZCKzHAzRZjU2DYY0WyqAiHbGIXuHMoMcwmpSJ57D7JRUTJOoOFasLxxMe57SCvZ
         1X1eZvC0HpOBkyx89/xWVtB5fkDeTY07dX8WWnQYnG7W4WGGViC6d1PtnqQVE8HPMbcH
         PXXpYVrEfrWCnnUKed9oRq/hXjpe7FSBx9hd0Ro46YLf/iG4G/ANORxPsS9nosAN/vgd
         ggYgWbxbsMSkVJ9UHIsSpochirbQUTJutN5YIgvy/5woXL5BiSOo/EMbe4ePT2+Veg63
         ho6w==
X-Gm-Message-State: AOAM533sRYhAs22RMR/SjQ/OW/vm2nbtQX8HcLzHofrzszAbQiCou9gy
	oChAm2WJDzzrITLaJL78vxtYjNKsrWY7QA==
X-Google-Smtp-Source: ABdhPJx7S0Pqw2sMVIPTNFhfAVp8sEM3Cn1nW7X2eXcb8p6RbxBSAlw7+xP64R0nGQGMEUSr8JjT5A==
X-Received: by 2002:a63:3101:: with SMTP id x1mr52105577pgx.113.1641464395244;
        Thu, 06 Jan 2022 02:19:55 -0800 (PST)
Received: from realwakka ([59.12.165.26])
        by smtp.gmail.com with ESMTPSA id q17sm2133922pfj.119.2022.01.06.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 02:19:55 -0800 (PST)
Date: Thu, 6 Jan 2022 10:19:46 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: move get version func to where all other
 functions are
Message-ID: <20220106101946.GA23794@realwakka>
References: <20220106093110.GA20011@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106093110.GA20011@mail.google.com>

On Thu, Jan 06, 2022 at 10:31:10PM +1300, Paulo Miguel Almeida wrote:


> As a convention for the pi433 driver, all routines that deals with the
> rf69 chip are defined in the rf69.c file. There was an exception in
> which the uC version verification was being done directly elsewhere.
> While at it, the Version Register hardcoded value was replaced with a
> pre-existing constant in the driver.
> 
> This patch adds rf69_get_chip_version function to rf69.c
> 
> Additionally, the patch below must be applied first as it was sent
> before and touches the same file.
> https://lore.kernel.org/lkml/20220103222334.GA6814@mail.google.com/
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>

Hi, Paulo. 
Thanks for a patch.

I think it's good overall. But I have some opinion below.

> ---
>  drivers/staging/pi433/pi433_if.c | 4 +---
>  drivers/staging/pi433/rf69.c     | 8 ++++++++
>  drivers/staging/pi433/rf69.h     | 1 +
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
> index 29bd37669059..a19afda5b188 100644
> --- a/drivers/staging/pi433/pi433_if.c
> +++ b/drivers/staging/pi433/pi433_if.c
> @@ -1116,9 +1116,7 @@ static int pi433_probe(struct spi_device *spi)
>  		spi->mode, spi->bits_per_word, spi->max_speed_hz);
>  
>  	/* Ping the chip by reading the version register */
> -	retval = spi_w8r8(spi, 0x10);
> -	if (retval < 0)
> -		return retval;
> +	retval = rf69_get_chip_version(spi);
>  
>  	switch (retval) {
>  	case 0x24:
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index d64df072d8e8..1516012f9bb7 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -102,6 +102,14 @@ static inline int rf69_read_mod_write(struct spi_device *spi, u8 reg,
>  
>  /*-------------------------------------------------------------------------*/
>  
> +int rf69_get_chip_version(struct spi_device *spi)
> +{
> +	int retval;
> +
> +	retval = rf69_read_reg(spi, REG_VERSION);
> +	return retval;
> +}
> +
If we don't modify retval, why don't we just return directly without
retval?

>  int rf69_set_mode(struct spi_device *spi, enum mode mode)
>  {
>  	static const u8 mode_map[] = {
> diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
> index b648ba5fff89..ca9b75267840 100644
> --- a/drivers/staging/pi433/rf69.h
> +++ b/drivers/staging/pi433/rf69.h
> @@ -17,6 +17,7 @@
>  #define FIFO_SIZE	66		/* bytes */
>  #define FIFO_THRESHOLD	15		/* bytes */
>  
> +int rf69_get_chip_version(struct spi_device *spi);
IMHO, I think that we don't need to include 'chip'. Because all other
functions in this code don't have 'chip' in function name. and version
code seems to be more accurate representation.

>  int rf69_set_mode(struct spi_device *spi, enum mode mode);
>  int rf69_set_data_mode(struct spi_device *spi, u8 data_mode);
>  int rf69_set_modulation(struct spi_device *spi, enum modulation modulation);
> -- 
> 2.25.4
> 
