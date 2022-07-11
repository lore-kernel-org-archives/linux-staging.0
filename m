Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1CD1FCE
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657533267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/r5o7wkCaifmX4nx8dD1X4gWt/RrIM+1n5U2ObFDOvY=;
	b=hm0q4tuhXX6zQ8tKElz36MNnBKBpoAmgE+zjKYCHpqo7AsKA9jrpn3NfyWcTZYQGFbvAnJ
	g1+mBn98GNAubxVs7/hMv4P5Qlgn1yvGpKSedkQ5o1UQr0hYTdgsDZo6g9uYS5O1f6oyYA
	/MeF63kQPs9IjFXFRa/XWvsE6/GguI0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-MX5GsiVoNiej6DuzwYok-Q-1; Mon, 11 Jul 2022 05:54:24 -0400
X-MC-Unique: MX5GsiVoNiej6DuzwYok-Q-1
Received: by mail-wr1-f70.google.com with SMTP id o1-20020adfba01000000b0021b90bd28d2so479967wrg.14
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 02:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/r5o7wkCaifmX4nx8dD1X4gWt/RrIM+1n5U2ObFDOvY=;
        b=A74TC7Ka4QQN5l8vO7QOHuRDC9wgxqUyeH/xn2WSP3VPa0jpo04qdGg98aimeodcxp
         xD2y4PQCwj66PpPVcvObWaCGfuwch8LuN9sJ6LHULBkrlw3yf+x3+SQtfZ7n/DlrpT/4
         RETtOWYQqYUjUCa1F3jH1xBp2t8KkcFdbc+1Fm6yNYCfQvSWUOQ07JJuHJOJRMVFh/u7
         lhSkVlvUCQ3l7P4JdKXO0LZTAsxTvb8c2Ry+kWfNHFt2uQ+V72BS6U/nTX/NiliLxfkG
         UFf+kS/+nZlylldH2yjCIgDfBoqL4h18v3205Dfv9Mlms8RUeaN9/pka+JZT1lP54Vml
         BtJQ==
X-Gm-Message-State: AJIora+XTPqQeHwmTRkY/xUoZVjW/G8u4a8ChsMzCmSS9CHdFmyILKxA
	o3tkxeG9Z9wjMdEMvjTM/fg2vtAe+mm1xGK89vqNbNgd3fcBI7VHL715wXU/S4v05ntXXgg1w3g
	gjHWDAnzOHSY6eRsqhR/OZS98Vw==
X-Received: by 2002:adf:d1c1:0:b0:21b:a5e9:b7b2 with SMTP id b1-20020adfd1c1000000b0021ba5e9b7b2mr16250719wrd.405.1657533263296;
        Mon, 11 Jul 2022 02:54:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sbBQ51QtlzjO+HKGQRy/aofISE85HxcGvQHuZ3vWX7i4s2OJEN+ZIlfmPB42g4aa4+kn9CLg==
X-Received: by 2002:adf:d1c1:0:b0:21b:a5e9:b7b2 with SMTP id b1-20020adfd1c1000000b0021ba5e9b7b2mr16250698wrd.405.1657533263004;
        Mon, 11 Jul 2022 02:54:23 -0700 (PDT)
Received: from [172.20.10.7] ([90.167.95.6])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c511400b003a2d3ed9297sm18324607wms.1.2022.07.11.02.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 02:54:22 -0700 (PDT)
Message-ID: <253d0bea-f197-4208-b5e6-39c22ab91833@redhat.com>
Date: Mon, 11 Jul 2022 11:54:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-3-tzimmermann@suse.de>
 <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
 <95302954-76bc-3da6-70ad-25a8a22a37f0@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <95302954-76bc-3da6-70ad-25a8a22a37f0@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Thomas,

On 7/11/22 09:58, Thomas Zimmermann wrote:
> Hi Javier,
> 
> I'll try to give the motivation of this patch below. I known it's rather 
> hypothetical as the VGA driver is probably not used much.
> 
> Am 08.07.22 um 15:09 schrieb Javier Martinez Canillas:
>> Hello Thomas,
>>
>> On 7/7/22 17:39, Thomas Zimmermann wrote:
>>> Move the device-creation from vga16fb to sysfb code. Move the few
>>> extra videomode checks into vga16fb's probe function.
>>>
>>> The vga16fb driver requires a screen_info for type VIDEO_TYPE_VGAC
>>> or VIDEO_TYPE_EGAC. Such code is nowhere present in the kernel, except
>>> for some MIPS systems. It's not clear if the vga16fb driver actually
>>> works in practice.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/firmware/sysfb.c      |  4 +++
>>>   drivers/video/fbdev/vga16fb.c | 59 +++++++++++++++++------------------
>>>   2 files changed, 32 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
>>> index 1f276f108cc9..3fd3563d962b 100644
>>> --- a/drivers/firmware/sysfb.c
>>> +++ b/drivers/firmware/sysfb.c
>>> @@ -94,6 +94,10 @@ static __init int sysfb_init(void)
>>>   		name = "efi-framebuffer";
>>>   	else if (si->orig_video_isVGA == VIDEO_TYPE_VLFB)
>>>   		name = "vesa-framebuffer";
>>> +	else if (si->orig_video_isVGA == VIDEO_TYPE_VGAC)
>>> +		name = "vga-framebuffer";
>>> +	else if (si->orig_video_isVGA == VIDEO_TYPE_EGAC)
>>> +
>>
>> I wonder if we really need to do this distinction or could just have a single
>> platform device for both VIDEO_TYPE_VGAC and VIDEO_TYPE_EGAC. After all, the
>> same fbdev driver is bound against both platform devices.
> 
> With the current driver, we don't strictly need to distinguish. But the 
> sysfb code is the one we care about. So I wanted it to be clear and 
> nicely looking. All the mode tests, etc depend on the driver (which no 
> one cares about).
>

Right. That is a good point. We don't want to leak a driver implementation
detail in the sysfb code. And in theory there could be for example a DRM
driver for EGA and one for VGA.
 
> There's also a difference in hardware features between EGA and VGA. Most 
> notably, VGA has much better color support.
>

Yes, I know the differences. My point was that the orig_video_isVGA was
used to make the distinction and that the same driver supported both, but
as you said that may not be the case and separate drivers could be used.

>>
>> [...]
>>
>>>   static int vga16fb_probe(struct platform_device *dev)
>>>   {
>>> +	struct screen_info *si;
>>>   	struct fb_info *info;
>>>   	struct vga16fb_par *par;
>>>   	int i;
>>>   	int ret = 0;
>>>   
>>> +	si = dev_get_platdata(&dev->dev);
>>> +	if (!si)
>>> +		return -ENODEV;
>>> +
>>> +	ret = check_mode_supported(si);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>
>> What do you see as the advantage of moving the check to the driver's probe?
>>
>> Because after this change the platform driver will be registered but for no
>> reason, since can't even probe if orig_video_isVGA is neither VGAC nor EGAC.
> 
> The driver only supports very specific modes, which may not be what 
> screen_info detected. Note that VGAC/EGAC can also refer to text-mode 
> buffers. The current vgacon could be turned into a platform driver that 
> adopts such a text buffer and integrates it with aperture helpers.
>

Yes, and also there's also the monochrome variant of VGA and EGA (VGAM/EGAM).

Should we also make that distinction or for example "vga-framebuffer" should
handle both color and monochrome variants if at some point vgacon is turned
into a fbdev or DRM driver ?

>>
>> [...]
>>
>>> +static const struct platform_device_id vga16fb_driver_id_table[] = {
>>> +	{"ega-framebuffer", 0},
>>> +	{"vga-framebuffer", 0},
>>> +	{ }
>>> +};
>>> +
>>
>> The fact that the two entries don't have a platform data is an indication for
> 
> The name is the indication. I know that vga16 doesn't treat them 
> differently.
>

Yes, my point was that the platform device name used to bind is an internal
Linux interface that could be changed later if needed. But I understand your
point and since the platform device names are exposed to user-space, makes
more sense for them to reflect what devices are bound even when the existing
driver doesn't treat them differently.
 
>> me that we could just consolidate in a single "vga16-framebuffer" or smt. I
>> know that this won't be consistent with efi, vesa, etc but I don't think is
>> that important and also quite likely we will get rid of this driver and the
>> platform device registration soon. Since as you said, it's unclear that is
>> even used.
> 
> There's mips code in the arch/ directory that appears to setup 
> screen_info in the correct way. I can't say whether that's still useful 
> to anyone. On x86, I could set a VGA mode on the kernel command line, 
> but screen_info's isVGA only contained '1'. It might be possible to fix 
> this easily by setting the right values in vga_probe(). [1] I simply 
> don't have the time to provide a patch and deal with the potential 
> fallout of such a change.
>

Indeed. This seems to be a remnant from the time when isVGA was just a bool
and then at some point the field semantics was extended to denote the mode
but the existing users weren't fixed (nor the field named to reflect this).

Probably should be cleaned up at some point but unsure if the churn would
be worth it.
 
>>
>>>   static struct platform_driver vga16fb_driver = {
>>>   	.probe = vga16fb_probe,
>>>   	.remove = vga16fb_remove,
>>>   	.driver = {
>>> -		.name = "vga16fb",
>>> +		.name = "vga-framebuffer",
>>>   	},
>>
>> Maybe "vga16-framebuffer" instead? Since for example VESA is also VGA AFAIK.
> 
> VESA is something else than VGA. Setting a VESA mode (done via INT 10h 
> IIRC) and then fiddling with VGA state will likely produce broken output 
> on the screen.
>

Technically it is something else but Linux conflates them in many places. For
example, as you mentioned one can change the VESA modes using the "vga" param
(which confusingly leads to the use of vesafb+fbcon driver instead of vgacon).

That's why I think that "vga-framebuffer" as driver name would be misleading.
Specially since it would also bind to the "ega-framebuffer" platform device.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

