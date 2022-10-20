Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5F7E
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 20:22:23 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id b2so2292888eja.6
        for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EIPqJ4tUUqVv4kMlvwmVLXisEqmV1Wy98VDaAlo8cFI=;
        b=CS2zvH+k5N7l3LrbqPDzVAfRb2X3xwhWeezCIDERtzeXe7n3Jc1kxEm5CvcbYFdjbt
         sVp8d5gnhwyB+Qn5SJYvQgrR1WRBw19GHkhVrFji8LpGhZsEaN8B7em3CYtrOqJwZWmJ
         gdFvoliSKMks6Xuigzq7/keq3/dqgAjcyQSCd7qRo7bTwbzn5uWmqrRe440YKIQRcbO1
         K2+A7EtHArXAZqknjFS7Wmqfmxq2qjb9axcuugvyZDMfxMMKTiXzQXZapDPXYZzoiryu
         ihjpX5P6OU84Oct6wN3fY5OGVYgnc/BeethM002chyqpXlZLsFjoQqC1klvphzOxhw1H
         qWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIPqJ4tUUqVv4kMlvwmVLXisEqmV1Wy98VDaAlo8cFI=;
        b=l7i8MbzMYzvMkUw49CSmRX23NqBPe6MHMOk3lBIw5jxOUSHEkCPwSDRTnPpvJHr7hj
         Ty7coZca+J2r7Tc5+cHlU5Kvoh6xYCy9APwDULWLqKEGFazgZuQN5W1+58Lyo+fytob1
         Vd4UbfPL3wRllpH9visQ/5ijS5HtURB7Y0dsV8ZsvrOimgxm/kzyM6mzfToH5xTOu7X3
         i7a9D6koRyIb2I0JmLh/k1R/LtQU8KbY2AuB6U9BG6u4IKh/TwAHY01K0prRXiSIzVW9
         TuvoZPyP9VkW59JpLnbOhsngdfcIu0AXS93LbhX3six+hfqqg0PHtsCFhtZC4eTdD+lu
         1a5A==
X-Gm-Message-State: ACrzQf3JeMok5SqBs44LaHr6Qs18yNQORKrWomclMhflTQtaU0uMivho
	+oZQ3X+zZNCPHzT3Vn2IwhI=
X-Google-Smtp-Source: AMsMyM4f2ufX2BUCbXdG1/Dplbhqpe4VBpCycpr9+0UsaNzHZxPdhBKRRFdQffGiHCzRx/XbIFEnFQ==
X-Received: by 2002:a17:907:c25:b0:78e:1a4:132 with SMTP id ga37-20020a1709070c2500b0078e01a40132mr12598741ejc.521.1666297341799;
        Thu, 20 Oct 2022 13:22:21 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id x9-20020a170906710900b0073a20469f31sm10743281ejj.41.2022.10.20.13.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:22:21 -0700 (PDT)
Date: Thu, 20 Oct 2022 22:22:10 +0200
From: Nam Cao <namcaov@gmail.com>
To: Gautam Menghani <gautammenghani201@gmail.com>
Cc: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/pi433: Change data type of bit_rate to
 be u32
Message-ID: <20221020202210.GA16547@nam-dell>
References: <20221020181815.31245-1-gautammenghani201@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020181815.31245-1-gautammenghani201@gmail.com>

On Thu, Oct 20, 2022 at 11:48:15PM +0530, Gautam Menghani wrote:
> A TODO asks to convert the bit_rate variable to be a u32 so that bit 
> rates up to 300kbps can be supported as per the spec.
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
> Please note that this patch is only compile tested.
> 
>  drivers/staging/pi433/TODO       | 2 --
>  drivers/staging/pi433/pi433_if.h | 4 ++--
>  drivers/staging/pi433/rf69.c     | 2 +-
>  drivers/staging/pi433/rf69.h     | 2 +-
>  4 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/pi433/TODO b/drivers/staging/pi433/TODO
> index 5cf3fd99d521..8530bbe61d70 100644
> --- a/drivers/staging/pi433/TODO
> +++ b/drivers/staging/pi433/TODO
> @@ -1,5 +1,3 @@
>  * currently the code introduces new IOCTLs. I'm afraid this is a bad idea.
>    -> Replace this with another interface, hints are welcome!
>  * Some missing data (marked with ###) needs to be added in the documentation
> -* Change (struct pi433_tx_cfg)->bit_rate to be a u32 so that we can support
> -    bit rates up to 300kbps per the spec.
> diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
> index 25ee0b77a32c..c958dcfa9f96 100644
> --- a/drivers/staging/pi433/pi433_if.h
> +++ b/drivers/staging/pi433/pi433_if.h
> @@ -51,7 +51,7 @@ enum option_on_off {
>  #define PI433_TX_CFG_IOCTL_NR	0
>  struct pi433_tx_cfg {
>  	__u32			frequency;
> -	__u16			bit_rate;
> +	__u32			bit_rate;
>  	__u32			dev_frequency;
>  	enum modulation		modulation;
>  	enum mod_shaping	mod_shaping;
> @@ -99,7 +99,7 @@ struct pi433_tx_cfg {
>  #define PI433_RX_CFG_IOCTL_NR	1
>  struct pi433_rx_cfg {
>  	__u32			frequency;
> -	__u16			bit_rate;
> +	__u32			bit_rate;
>  	__u32			dev_frequency;
>  
>  	enum modulation		modulation;
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index 8c7fab6a46bb..7e754a3aef5f 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -185,7 +185,7 @@ int rf69_set_modulation_shaping(struct spi_device *spi,
>  	}
>  }
>  
> -int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
> +int rf69_set_bit_rate(struct spi_device *spi, u32 bit_rate)
>  {
>  	int retval;
>  	u32 bit_rate_reg;
> diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
> index 78fa0b8bab8b..46a1fb2d5329 100644
> --- a/drivers/staging/pi433/rf69.h
> +++ b/drivers/staging/pi433/rf69.h
> @@ -24,7 +24,7 @@ int rf69_set_data_mode(struct spi_device *spi, u8 data_mode);
>  int rf69_set_modulation(struct spi_device *spi, enum modulation modulation);
>  int rf69_set_modulation_shaping(struct spi_device *spi,
>  				enum mod_shaping mod_shaping);
> -int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate);
> +int rf69_set_bit_rate(struct spi_device *spi, u32 bit_rate);
>  int rf69_set_deviation(struct spi_device *spi, u32 deviation);
>  int rf69_set_frequency(struct spi_device *spi, u32 frequency);
>  int rf69_enable_amplifier(struct spi_device *spi, u8 amplifier_mask);
> -- 
> 2.34.1
>

I sent (almost) the exact same patch a while ago. I received a reply
saying that doing this is not possible. That conversation can still be
found here:
https://lore.kernel.org/linux-staging/20220315180820.7393-1-cvn249@gmail.com/t/#u

Best regards,
Nam
