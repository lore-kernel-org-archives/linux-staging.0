Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39094257452
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143815; cv=pass; b=PzkuEQkFxuCcskEuRAws18tXlP37nQiV8Oy6Wtyl0IoiyEjzv6wmG9dD6LxUcSyHpa1qxCc0MNlKg9EokdH9jmm6VRcpVErUTnshYd7oxWKJm6ihO8GzLSyIvNm58VgEFNeIjdcfGiOlbPYN6SHugg7jPlOGmsX5DXa36CJHUlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143815; c=relaxed/simple;
	bh=BWPoY8zizpvVElCH/LhD7P3g2puHyFW/8a4XTr0373k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTC6kPeIcZweqiZD1da0Mps6JKxgh4ZlBNYhIGtZah4WYLUsi2XF3PIg3nZXWHB5qxQ70t28Ih2nsySm2VB7rfOlihYMC0TUtM8mB8vRYqrcOcuv+ke1+ipbTjQ641NWpFsdvVG5pNpl8NEjpzhm7gLenjYoBhmAV9/46fwoWZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0GH5PJY; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0GH5PJY"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66bb7e098b1so1160690a12.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 08:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775143813; cv=none;
        d=google.com; s=arc-20240605;
        b=hyAmUS+zuaMd1BxDDYQ0NJWHfhJpLjc+r5swGFTVtPKiCCE9YEmUHPkjiPhHOfiXVJ
         bi1uKoEKgVR3IpRST+WqDYmbN/4/iuWcA/qZF9R3hhLCbV1CkQxWDzBGunvFeR6UwiEA
         kZAtVm6KbB1HMeiBRFADyrB7K12LqWuDrqXPBb17Ws3nS8gFqyU97j58WQelfvWTejiE
         BpcT4joDiimaH+maa3IGY7g0EGsFHPhkox0GGEFOF8u1F7yxmj7g9cX/tWVeKy7Ce4h8
         KwEvq3LMx3Z6xlRSlXV++nFfwvG+WNBJ7sZNx51CsXEnr84Ggq7EZJxDcI02aeRxyrFz
         chZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Ne37J99xYpuiphabT7luLi5FdCt7At/MD3nbZaBWRI=;
        fh=Y0FAeZuzVueN3P78StkBdnWzgOPf9s+ep+pusSZxnHM=;
        b=ebibZO7O9weppVpw/BasO7hsP2hK6X9zvtJvkSK/wIQphuSAlRJk2mmm/0RhOl5QA0
         CTvQiAJZ7HZsdurVAPmRXauTlQOhho7p5fZyLzU6ZrIX11vdaYA0icCf30E/RmwWIJHH
         GvHh8niqxiPcXvir2IhE6zXFoLpENHKIO6DCVwbYJsUZEPR9fiReDUefn0CL/2/7ExeU
         DCP/irK2IsGtzyTFWmwbZJjVPBLBNfcJPkQqjvTOb9G6A/CUCgavoS2QyGeRp8PkNQDU
         Q271rwXr7vFrN96nbRIuWUbbyMnhO2aF5MhQsBCWRlKDaoKIH+zC57M1sc8PoqvCSkxr
         deBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775143813; x=1775748613; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ne37J99xYpuiphabT7luLi5FdCt7At/MD3nbZaBWRI=;
        b=o0GH5PJYn+nHrssIJw0oVpLmtMqqRNWR6BcHGsfZYriULSs0oBUZnrTbiUgAqmlIXL
         mmL/14CWxCTC++fCPt6bS+XdbK3lRtvr6kYzp9tGBGMUAZJeKQYOvyaeebm2Ed1PkXOH
         gx3+R5/ewzqrHRqte3u3ws3jmDLVLon4I7nb6K4a3kqjBTJa6xPGMUyZCSb4CfxuFH0v
         LlYwiKBFdQX4XL4vwjyt46aIvlLPM4Er8SXMCYbolRw/ZdkAMB2APvHjfIg34BgeuJgB
         mn1iI5FjaTtLdtSagxh7s+7tr17jAeR2wTzp5ajfdOMP/085phb7HNrJljGrrhicE5Qh
         j01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775143813; x=1775748613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ne37J99xYpuiphabT7luLi5FdCt7At/MD3nbZaBWRI=;
        b=qj0iLabNiFdg/tBf7HsHdNGpklXRBwcqcMbkEUCiFARAGjIC0HkB1Qm36K9uEZmCO2
         +rY4A5wC9u7pcAI9kWKlfJ5kgzVlwERVjZJIwPkdbgrUXTm4qfDSwGEKLXasPH0FBwEN
         poKk5wUGnF//Y5TYZSXAUGhZdj4IvzACy99vbilCfTJx6DP7EwXZdS4HL59ekaJy2tDS
         qock6GgPXe7DfL4gj08xFVKKjx8K3d4pM/AUfznksbbzKYoNMjLqnXSfQUrOzMQCFIm0
         4e+amXCkMwjLxbMbhCAzGUsHaBJVan0GzxXv6eIyRqeycVX7gVOxQ/yNNPXf1bmXRgxo
         XQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZPKJBqmoJBn3WSvb1iM2bDF3gzFtzL0Xy5PuoRWzFBX96ILWOtP6V5MIiIMeqK2iiuhhnJySOKsio2Dr2@lists.linux.dev
X-Gm-Message-State: AOJu0YyoqeGhDfB/cG4OyTwp5/F54vCnPn6cjhE1fiIU6wJA8byHQBWr
	WoXbBJ4W2xbemY2vPwu8yBoCK7CrUiZmYCjNUmHPuFUCjNvy1fb33HvX05Tjt77Rqscjjsxl9+Z
	yIP1LATihZhv/TREmmRwluM8wolXDx2Q=
X-Gm-Gg: ATEYQzz49HGoRjqwjqkctWePRoCsg5OD22vY+oRiI3+a8eTjCiLXeQFuHH4FXOVGK1U
	Y8jCKaEfG9+OI43DiEsKcEEdpgLbpI0IF5yn5+IthXwoZKmYroXKYl/yAFWEY2kJqW1uzshiBcw
	bwICRRY7WRewDvpqXWX31gVkD63VQz14xpmbRRfp5KgbKvtwYd2IQUROJEONBVJ9nBolsGelmhv
	S8qaP21/8BZUUVZGPqIz5APnoh1O0GJmWAqJow1ZCH3KVPtb+jzeEu4Q//wRC9NpGYn7Wlr0b8l
	E6n5deo=
X-Received: by 2002:a05:6402:2111:b0:66c:204:5d10 with SMTP id
 4fb4d7f45d1cf-66e04022755mr2293549a12.22.1775143812409; Thu, 02 Apr 2026
 08:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401163050.34830-1-yqc5929@psu.edu> <ac4rukwPFO0nwlzL@stanley.mountain>
In-Reply-To: <ac4rukwPFO0nwlzL@stanley.mountain>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 2 Apr 2026 11:30:01 -0400
X-Gm-Features: AQROBzB5k1GDWRyjI5c_RQAtITZDWg7kpXT0Q9u0gRtbeo3BbbiEgjwbrxN9Oo8
Message-ID: <CACrCO_VrFwpfnVjCiqU0LKgzzZSwvBhSgPJ53ASEQjRPRkNpxg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: gc2235: fix UAF and memory leak
To: Dan Carpenter <error27@gmail.com>, Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Thomas Andreatta <thomas.andreatta2000@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yuho Choi <yqc5929@psu.edu>
Content-Type: text/plain; charset="UTF-8"

Dear Andy and Dan,

I appreciate your time and the detailed feedback.

To Andy:
My apologies for the incorrect "Fixes" tag description. I clearly
missed the "Revert" part in the
commit title. I will also re-examine the history and update it.

To Dan:
Thanks for the suggestion on the error handling path. I will refactor
the code to use direct
returns. I'll also ensure to use the "checkpatch.pl" this time.

I will submit a new patch addressing these points soon.

Best regards,
Yuho Choi


On Thu, 2 Apr 2026 at 04:41, Dan Carpenter <error27@gmail.com> wrote:
>
> Please run your patches through checkpatch.pl.
>
> On Wed, Apr 01, 2026 at 12:30:50PM -0400, Yuho Choi wrote:
> > gc2235_probe() handles its error paths incorrectly.
> >
> > If media_entity_pads_init() fails, gc2235_remove() is called, which
> > tears down the subdev and frees dev, but then still falls through to
> > atomisp_register_i2c_module(). This results in use-after-free.
> >
> > If atomisp_register_i2c_module() fails, the media entity and control
> > handler are left initialized and dev is leaked.
> >
> > gc2235_remove() is the full teardown path for a successfully probed
> > device; it unconditionally assumes a fully-initialized device.
> > gc2235_probe() must unwind only the resources that were actually
> > initialized at the point of failure.
>
> The "must unwind only the resources that were actually initialized at
> the point of failure." phrasing is too strong. I was hoping you would
> review it and find an actual bug.  I reviewed it myself and didn't find
> a bug beyond the leaks and use after frees mentioned in this commit
> message.  As I wrote in my blog, leaks are one of the common bugs from
> this style of error handling because it is too complicated.
>
> >
> > Handle each failure path with explicit unwind labels that free only
> > what has been initialized. Return success only after the full probe
> > sequence completes.
>
> If I were determined to use a magical cleanup function to do the cleanups
> then I would reverse the gotos and direct returns.
>
> regards,
> dan carpenter
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index d3414312e1de..61fb82b26cc9 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -808,8 +808,11 @@ static int gc2235_probe(struct i2c_client *client)
>                                            atomisp_bayer_order_grbg);
>
>         ret = gc2235_s_config(&dev->sd, client->irq, gcpdev);
> -       if (ret)
> -               goto out_free;
> +       if (ret) {
> +               v4l2_device_unregister_subdev(&dev->sd);
> +               kfree(dev);
> +               return ret;
> +       }
>
>         dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>         dev->pad.flags = MEDIA_PAD_FL_SOURCE;
> @@ -818,18 +821,16 @@ static int gc2235_probe(struct i2c_client *client)
>         ret =
>             v4l2_ctrl_handler_init(&dev->ctrl_handler,
>                                    ARRAY_SIZE(gc2235_controls));
> -       if (ret) {
> -               gc2235_remove(client);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_remove;
>
>         for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
>                 v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
>                                      NULL);
>
>         if (dev->ctrl_handler.error) {
> -               gc2235_remove(client);
> -               return dev->ctrl_handler.error;
> +               ret = dev->ctrl_handler.error;
> +               goto err_remove;
>         }
>
>         /* Use same lock for controls as for everything else. */
> @@ -838,14 +839,16 @@ static int gc2235_probe(struct i2c_client *client)
>
>         ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>         if (ret)
> -               gc2235_remove(client);
> +               goto err_remove;
>
> -       return atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       if (ret)
> +               goto err_remove;
>
> -out_free:
> -       v4l2_device_unregister_subdev(&dev->sd);
> -       kfree(dev);
> +       return 0;
>
> +err_remove:
> +       gc2235_remove(client);
>         return ret;
>  }
>
