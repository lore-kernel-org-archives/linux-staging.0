Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D85123BC
	for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 10:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626C4C433C8;
	Tue, 18 Jul 2023 10:58:09 +0000 (UTC)
Message-ID: <263b3c0f-53cf-14b6-b956-e0f5b03c95b5@xs4all.nl>
Date: Tue, 18 Jul 2023 12:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 11/18] media: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 javierm@redhat.com, geert@linux-m68k.org, dan.carpenter@linaro.org
Cc: linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230715185343.7193-1-tzimmermann@suse.de>
 <20230715185343.7193-12-tzimmermann@suse.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230715185343.7193-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 15/07/2023 20:51, Thomas Zimmermann wrote:
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by kzalloc(). So do not
> set it.
> 
> Flags should signal differences from the default values. After cleaning
> up all occurrences of FBINFO_DEFAULT, the token will be removed.
> 
> v2:
> 	* fix commit message (Miguel)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andy Walls <awalls@md.metrocast.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> ---
>  drivers/media/pci/ivtv/ivtvfb.c              | 1 -
>  drivers/media/test-drivers/vivid/vivid-osd.c | 1 -
>  2 files changed, 2 deletions(-)

I can take this patches for 6.6, unless you prefer to have this whole series
merged in one go?

In that case you can use my:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
> index 0aeb9daaee4c..23c8c094e791 100644
> --- a/drivers/media/pci/ivtv/ivtvfb.c
> +++ b/drivers/media/pci/ivtv/ivtvfb.c
> @@ -1048,7 +1048,6 @@ static int ivtvfb_init_vidmode(struct ivtv *itv)
>  	/* Generate valid fb_info */
>  
>  	oi->ivtvfb_info.node = -1;
> -	oi->ivtvfb_info.flags = FBINFO_FLAG_DEFAULT;
>  	oi->ivtvfb_info.par = itv;
>  	oi->ivtvfb_info.var = oi->ivtvfb_defined;
>  	oi->ivtvfb_info.fix = oi->ivtvfb_fix;
> diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
> index ec25edc679b3..051f1805a16d 100644
> --- a/drivers/media/test-drivers/vivid/vivid-osd.c
> +++ b/drivers/media/test-drivers/vivid/vivid-osd.c
> @@ -310,7 +310,6 @@ static int vivid_fb_init_vidmode(struct vivid_dev *dev)
>  	/* Generate valid fb_info */
>  
>  	dev->fb_info.node = -1;
> -	dev->fb_info.flags = FBINFO_FLAG_DEFAULT;
>  	dev->fb_info.par = dev;
>  	dev->fb_info.var = dev->fb_defined;
>  	dev->fb_info.fix = dev->fb_fix;

