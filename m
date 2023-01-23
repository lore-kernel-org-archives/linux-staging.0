Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9815D1391
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D527DC433D2;
	Mon, 23 Jan 2023 12:37:03 +0000 (UTC)
Message-ID: <bf1314db-2757-553a-f115-cc85896ec15b@xs4all.nl>
Date: Mon, 23 Jan 2023 13:37:02 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH -next] media: staging: stkwebcam: Fix the build error with
 stkwebcam
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, mchehab@kernel.org,
 gregkh@linuxfoundation.org, ribalda@chromium.org, neil.armstrong@linaro.org,
 geert+renesas@glider.be
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

FYI: for v6.3 the whole driver will be removed, so I'm dropping this patch.

Regards,

	Hans

On 26/12/2022 10:48, Gaosheng Cui wrote:
> When I am building the kernel on arm64, set config CONFIG_USB=m &&
> CONFIG_VIDEO_STKWEBCAM=y, I get some error reports as follows:
>   drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
>     function `stk_v4l_dev_release':
>   stk-webcam.c:(.text+0x3e0): undefined reference to `usb_put_intf'
>   stk-webcam.c:(.text+0x3e8): undefined reference to `usb_put_dev'
>   drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
>   function `stk_clean_iso':
>   stk-webcam.c:(.text+0xb0c): undefined reference to `usb_kill_urb'
>   stk-webcam.c:(.text+0xb14): undefined reference to `usb_free_urb'
> 
> Fix it by add dependency option on USB for VIDEO_STKWEBCAM.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/staging/media/deprecated/stkwebcam/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> index 7234498e634a..083fadab232d 100644
> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_STKWEBCAM
>  	tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>  	depends on VIDEO_DEV
> -	depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
> +	depends on USB && MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
>  	help
>  	  Say Y here if you want to use this type of camera.
>  	  Supported devices are typically found in some Asus laptops,

