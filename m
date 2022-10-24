Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D9809
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 11:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F8CC433D6;
	Mon, 24 Oct 2022 11:20:44 +0000 (UTC)
Message-ID: <fd464c8c-1714-3460-4ff7-5c24feda8cc1@xs4all.nl>
Date: Mon, 24 Oct 2022 13:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH -next] media: vpfe_capture: fix kconfig dependency errors
Content-Language: en-US
To: Zeng Heng <zengheng4@huawei.com>, prabhakar.csengg@gmail.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 liwei391@huawei.com
References: <20220926043741.553781-1-zengheng4@huawei.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220926043741.553781-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zeng,

I'm skipping this since the driver will be removed very soon (6.2 if all goes well).

Regards,

	Hans

On 9/26/22 06:37, Zeng Heng wrote:
> CONFIG_VIDEO_DM6446_CCDC & CONFIG_VIDEO_DM355_CCDC
> & CONFIG_VIDEO_DM365_ISIF all depend on feature
> VIDEO_DAVINCI_VPBE_DISPLAY, or the compiler would
> complain build errors as below:
> 
> ld: drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.o: in function `ccdc_sbl_reset':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
> ld: drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.o: in function `ccdc_restore_defaults':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:175: undefined reference to `vpss_select_ccdc_source'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:180: undefined reference to `vpss_enable_clock'
> ld: drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.o: in function `ccdc_close':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:196: undefined reference to `vpss_enable_clock'
> ld: drivers/staging/media/deprecated/vpfe_capture/isif.o: in function `isif_restore_defaults':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:252: undefined reference to `vpss_enable_clock'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:253: undefined reference to `vpss_enable_clock'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:254: undefined reference to `vpss_enable_clock'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:257: undefined reference to `vpss_select_ccdc_source'
> ld: drivers/staging/media/deprecated/vpfe_capture/isif.o: in function `isif_config_raw':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:680: undefined reference to `dm365_vpss_set_sync_pol'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:683: undefined reference to `dm365_vpss_set_pg_frame_size'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:684: undefined reference to `vpss_select_ccdc_source'
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  drivers/staging/media/deprecated/vpfe_capture/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/deprecated/vpfe_capture/Kconfig b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> index 10250e7e566b..557603b51b3f 100644
> --- a/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> +++ b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_DM6446_CCDC
>  	depends on VIDEO_DEV
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
> +	depends on VIDEO_DAVINCI_VPBE_DISPLAY
>  	select VIDEOBUF_DMA_CONTIG
>  	help
>  	  Enables DaVinci CCD hw module. DaVinci CCDC hw interfaces
> @@ -25,6 +26,7 @@ config VIDEO_DM355_CCDC
>  	depends on VIDEO_DEV
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
> +	depends on VIDEO_DAVINCI_VPBE_DISPLAY
>  	select VIDEOBUF_DMA_CONTIG
>  	help
>  	  Enables DM355 CCD hw module. DM355 CCDC hw interfaces
> @@ -45,6 +47,7 @@ config VIDEO_DM365_ISIF
>  	depends on VIDEO_DEV
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
> +	depends on VIDEO_DAVINCI_VPBE_DISPLAY
>  	select VIDEOBUF_DMA_CONTIG
>  	help
>  	  Enables ISIF hw module. This is the hardware module for
