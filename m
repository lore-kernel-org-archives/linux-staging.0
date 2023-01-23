Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE59EA5;
	Mon, 23 Jan 2023 15:05:01 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id y25so18589876lfa.9;
        Mon, 23 Jan 2023 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3rqFJi0wYIMyx4eFEnrANXBYlUWFGjnlOrB4sJY0mc=;
        b=VSvjd1+J+2hfVE0rK2aWfDA0OVUPFITcaGU/EEk+ovd3PB+LZoSIbLXjg/6O4g0QkX
         wQSOdPQHW8ShVOvuv6K4ehak+/FUBZ6bBjlKapxHcHQImaA7q7t1gEwYZmwObqGrP/PP
         CuO1Q1/NA1X4wba91SbkMkbJ02vBgbwFgxkUGAZz0utThM5EFRk4Y/dHFQrqiTC3T8XY
         pxEaA9cykcbArWN/Q14sLzrf2oqArLVwTmvV0IHeWZXjaXfjdJS++GDWvaf9CtXKja5B
         /+o8WCQ6Z8OG5i90gfUfiXJhw6rQk2gldlIFYsb4njbrpXyfD3NMkTBxEGrhoTwav/UE
         HUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3rqFJi0wYIMyx4eFEnrANXBYlUWFGjnlOrB4sJY0mc=;
        b=NmDdM3roc/mO5HHzuPLi8yYNI2mYTeZob1b+hnR/2AfS7mrLWA/Ci23qiG8Nih8f1u
         7Dsfc7RsuRbFun7KA5Dk7ipSctwuX5EdaKu7iyimdyAkxZ9IrnbpJXkGpRWvEadZxW+8
         5d9GeN5dldQpaEAwu1odBNvBl4Z+KpbqtAKU0yUhWZXNPT9WpL+Jp80CmyY6nwRD/A2P
         /d/YkfZiVuYj2THGME54Pto2uLAuAMRQCsu9Ydvb0PrGqfOW22aEKUJvK3RpHfeKamdo
         hP9fR65UXn54lTYU0bOEiZghDGCVE1fWHAaHaw7RpuKdbwXow2ZrUfS3qg0zc71wZsdf
         5+qQ==
X-Gm-Message-State: AFqh2krhAX5XAZ3KF8unzNNalhK1yUuaOpKzKaRiszICJn1SHwLyOOM4
	otlEl0iAh38/FhCCml5wupM=
X-Google-Smtp-Source: AMrXdXuHnINfpXEMI/5P6IHfO27xMrOaiT1cQnmYVDzQ2npYaq/u8eUakJKoBBnDu0eFJD/hs2QaqA==
X-Received: by 2002:a05:6512:340a:b0:4d2:551e:3838 with SMTP id i10-20020a056512340a00b004d2551e3838mr7464162lfr.29.1674486299330;
        Mon, 23 Jan 2023 07:04:59 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id b8-20020a0565120b8800b004d593f218absm1011508lfv.108.2023.01.23.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:04:58 -0800 (PST)
Date: Mon, 23 Jan 2023 18:04:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: broonie@kernel.org, miquel.raynal@bootlin.com, linus.walleij@linaro.org,
	krzysztof.kozlowski@linaro.org, vireshk@kernel.org,
	gregkh@linuxfoundation.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	kernel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <20230123145953.ytaaq3x4tetgepyf@mobilestation>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>

On Fri, Jan 20, 2023 at 12:23:31AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---

[nip]

>  drivers/spi/spi-dw-core.c         |  2 +-
>  drivers/spi/spi-dw-mmio.c         |  4 ++--

[nip]

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 99edddf9958b..4fd1aa800cc3 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -103,7 +103,7 @@ void dw_spi_set_cs(struct spi_device *spi, bool enable)
>  	 * support active-high or active-low CS level.
>  	 */
>  	if (cs_high == enable)
> -		dw_writel(dws, DW_SPI_SER, BIT(spi->chip_select));
> +		dw_writel(dws, DW_SPI_SER, BIT(spi_get_chipselect(spi, 0)));
>  	else
>  		dw_writel(dws, DW_SPI_SER, 0);
>  }
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 26c40ea6dd12..d511da766ce8 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -65,7 +65,7 @@ static void dw_spi_mscc_set_cs(struct spi_device *spi, bool enable)
>  	struct dw_spi *dws = spi_master_get_devdata(spi->master);
>  	struct dw_spi_mmio *dwsmmio = container_of(dws, struct dw_spi_mmio, dws);
>  	struct dw_spi_mscc *dwsmscc = dwsmmio->priv;
> -	u32 cs = spi->chip_select;
> +	u32 cs = spi_get_chipselect(spi, 0);
>  
>  	if (cs < 4) {
>  		u32 sw_mode = MSCC_SPI_MST_SW_MODE_SW_PIN_CTRL_MODE;
> @@ -138,7 +138,7 @@ static void dw_spi_sparx5_set_cs(struct spi_device *spi, bool enable)
>  	struct dw_spi *dws = spi_master_get_devdata(spi->master);
>  	struct dw_spi_mmio *dwsmmio = container_of(dws, struct dw_spi_mmio, dws);
>  	struct dw_spi_mscc *dwsmscc = dwsmmio->priv;
> -	u8 cs = spi->chip_select;
> +	u8 cs = spi_get_chipselect(spi, 0);
>  
>  	if (!enable) {
>  		/* CS override drive enable */

For the DW SSI part:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

[nip]
