Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003257B
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 08:44:50 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id r81so12707405iod.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 00:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lZfEI82UmUSMiDuvBd158Y70vafqY1tMfhM8D96RtI=;
        b=HBAIRoNWWQ9cExkfQ8sq0k283bcqZABHuJWJnKhqZlOxG64aVwVkOg4cCSijv7dnbc
         yD89wMwCSX51YB3lv6ZjYuzK4ERSAmZuGYmIG0rB9I717Y0GCbbrM9kktrdKJblYQjnN
         nTF4V6o1UVqirwksVoorAncCBskzjeppUX058=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lZfEI82UmUSMiDuvBd158Y70vafqY1tMfhM8D96RtI=;
        b=mZ1Ggjzs5CKYXVsV9pg0k3CgoNnZ7JKKeTGApQyRqbImEVgglANPjjeZa+c8IwZPPb
         z/KlASqpKbN2Y7m6KzzvJduXDykTOlAi6w/fjsqXg3kxBDox8j+zBX6FWIGBrCH8YZfA
         kZj5Ad/zD9VDGe3W0AAIAtC4HXLOBYb0+92+dhoydw0evnQc2PYWVqBrU5Or1zxAtoiv
         dWRPcNaAhbFSmVjy9E//wgsgxzcdIQHra62sAqwtH1Kz2TsCm+/n2AMuT3ia6D62nUZ2
         USmE2Q6gW+mfBadNDfHZ6bBy3207+1/At7G2z0m1ZMXHMsr0TgvrXxJM0Qx945JVwSUg
         XW5g==
X-Gm-Message-State: ANoB5pm5/zxWWb2XQNBlM6+3JOF1BQ+u3OxebvoRqYDXpMgZgwSclLCy
	s1YFsaFlRJP5l0chF9yzbCIun9vxL8CA9w==
X-Google-Smtp-Source: AA0mqf6LYfJ4hxRVGfSCqEcnXH+sB/wpMOLlGUCa9sE9pL6NvnlJfpBsvrbwrVulo7+ruevWsnjCNA==
X-Received: by 2002:a6b:dc14:0:b0:6d3:5901:aeb8 with SMTP id s20-20020a6bdc14000000b006d35901aeb8mr3685285ioc.41.1669193089944;
        Wed, 23 Nov 2022 00:44:49 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id z3-20020a029383000000b003738c0a80b4sm6223780jah.144.2022.11.23.00.44.47
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:44:47 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id q21so12709920iod.4
        for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 00:44:47 -0800 (PST)
X-Received: by 2002:a02:c897:0:b0:374:100a:b0c7 with SMTP id
 m23-20020a02c897000000b00374100ab0c7mr3898004jao.185.1669193087058; Wed, 23
 Nov 2022 00:44:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
In-Reply-To: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Nov 2022 09:44:35 +0100
X-Gmail-Original-Message-ID: <CANiDSCvb_HXpx-a9ZmAJ-s23YvefPPJfUy5kHLcEzLUkaKFqnQ@mail.gmail.com>
Message-ID: <CANiDSCvb_HXpx-a9ZmAJ-s23YvefPPJfUy5kHLcEzLUkaKFqnQ@mail.gmail.com>
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Nov 2022 at 16:58, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> By moving support for the USB Syntek DC1125 Camera to staging, the
> dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
>
> Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/deprecated/stkwebcam/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> index 4450403dff41fb64..7234498e634ac61c 100644
> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_STKWEBCAM
>         tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>         depends on VIDEO_DEV
> -       depends on USB
> +       depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
>         help
>           Say Y here if you want to use this type of camera.
>           Supported devices are typically found in some Asus laptops,
> --
> 2.25.1
>


-- 
Ricardo Ribalda
