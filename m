Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23401809
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 11:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56B1C433D7;
	Mon, 24 Oct 2022 11:20:49 +0000 (UTC)
Message-ID: <f0ce21e1-eeab-ea51-4e6f-32f302a530b8@xs4all.nl>
Date: Mon, 24 Oct 2022 13:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH -next] media: davinci: Fix Kconfig dependency
Content-Language: en-US
To: Ren Zhijie <renzhijie2@huawei.com>, prabhakar.csengg@gmail.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220926060726.44556-1-renzhijie2@huawei.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220926060726.44556-1-renzhijie2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ren,

I'm skipping this since the driver will be removed very soon (6.2 if all goes well).

Regards,

	Hans

On 9/26/22 08:07, Ren Zhijie wrote:
> If CONFIG_VIDEO_DAVINCI_VPBE_DISPLAY is not set,
> make ARCH=x86_64 CROSS_COMPILE=x86_64-linux-gnu-,
> will be failed, like this:
> 
> drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.o: In function `ccdc_configure':
> dm644x_ccdc.c:(.text+0xa46): undefined reference to `vpss_clear_wbl_overflow'
> dm644x_ccdc.c:(.text+0xd46): undefined reference to `vpss_clear_wbl_overflow'
> drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.o: In function `ccdc_sbl_reset':
> dm644x_ccdc.c:(.text+0x696): undefined reference to `vpss_clear_wbl_overflow'
> drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.o: In function `ccdc_restore_defaults':
> dm355_ccdc.c:(.text+0x43a): undefined reference to `vpss_select_ccdc_source'
> dm355_ccdc.c:(.text+0x453): undefined reference to `vpss_enable_clock'
> drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.o: In function `ccdc_close':
> dm355_ccdc.c:(.text+0x475): undefined reference to `vpss_enable_clock'
> drivers/staging/media/deprecated/vpfe_capture/isif.o: In function `isif_open':
> isif.c:(.text+0x654): undefined reference to `vpss_enable_clock'
> isif.c:(.text+0x663): undefined reference to `vpss_enable_clock'
> isif.c:(.text+0x672): undefined reference to `vpss_enable_clock'
> isif.c:(.text+0x67e): undefined reference to `vpss_select_ccdc_source'
> drivers/staging/media/deprecated/vpfe_capture/isif.o: In function `isif_configure':
> isif.c:(.text+0xe61): undefined reference to `dm365_vpss_set_sync_pol'
> isif.c:(.text+0xe7b): undefined reference to `dm365_vpss_set_pg_frame_size'
> isif.c:(.text+0xe85): undefined reference to `vpss_select_ccdc_source'
> 
> Add select VIDEO_DAVINCI_VPBE_DISPLAY dependency to Kconfig.
> 
> Fixes: 6971757bdccc ("media: davinci: deprecate dm644x_ccdc, dm355_cddc and dm365_isif")
> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
> ---
>  drivers/staging/media/deprecated/vpfe_capture/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/deprecated/vpfe_capture/Kconfig b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> index 10250e7e566b..63a0808ed104 100644
> --- a/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> +++ b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> @@ -6,6 +6,7 @@ config VIDEO_DM6446_CCDC
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
>  	select VIDEOBUF_DMA_CONTIG
> +	select VIDEO_DAVINCI_VPBE_DISPLAY
>  	help
>  	  Enables DaVinci CCD hw module. DaVinci CCDC hw interfaces
>  	  with decoder modules such as TVP5146 over BT656 or
> @@ -26,6 +27,7 @@ config VIDEO_DM355_CCDC
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
>  	select VIDEOBUF_DMA_CONTIG
> +	select VIDEO_DAVINCI_VPBE_DISPLAY
>  	help
>  	  Enables DM355 CCD hw module. DM355 CCDC hw interfaces
>  	  with decoder modules such as TVP5146 over BT656 or
> @@ -46,6 +48,7 @@ config VIDEO_DM365_ISIF
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
>  	select VIDEOBUF_DMA_CONTIG
> +	select VIDEO_DAVINCI_VPBE_DISPLAY
>  	help
>  	  Enables ISIF hw module. This is the hardware module for
>  	  configuring ISIF in VPFE to capture Raw Bayer RGB data from
