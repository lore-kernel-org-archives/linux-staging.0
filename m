Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE41B3451AA
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776269741; cv=pass; b=ZqqFSrzVfbz2bRcsfQ54XLSExEzKaRApG/TgZ0FzdHAVXZtqh6ePXvcamUJCdW/Zse/yWKXd+o20WDhFGPo2kDADqN9FRVrbx7yOOtxTZbaaEXgmY/+TlRLbd/pgqgVeqqggxb6d94zHDK2tNEDKonwD/hs3DUBTQK5tRFrFCe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776269741; c=relaxed/simple;
	bh=WItuPnGGIrOgjomIiuS7GeEGZRfZ6hcEYWWwBgT3m30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZfQEjRx6hSWqEbOWLBWlG0pSCa+VEGT513mzo6e8qY77krNyclvpFbJvitY+DFCAwfcSYH/a4Qlz4AE15FBjQ2D+V97e31tszxWC21J8Kka8dh26ejb9/H2UZa6JOd+9ZpypxPLa3PyE11XSxR7anPMw5FZElkZyVUgKXaguKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AV/fDGfZ; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AV/fDGfZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8f97c626aaso1079085366b.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776269737; cv=none;
        d=google.com; s=arc-20240605;
        b=cTPqt3vhV16uBLu6ntMqT5C2mHnM0Sjo41gXYngewbKkSvbc3lIFNtarVaQ9LQcFkp
         ZJFdsGFMblU2AA1Nkdi+0+4Cl+Knz4Q/a4MJ3gfEVuz10mJWsP6T+Z8AOukoG91zINQw
         lDc3wKnQU1SM2uGYO6CSUF/rfp9YqJ0ylqO3zIm6OpcIVAri21uA6MgotlrbnyG5C4te
         rrEdFe5XO6KS6Y5ALJzXxeKTyIwxa+7A1xOnJIOidnLzqNXQXBrXvlfRC1XTAqS6U6/T
         fb/RCzhqVF7BeEth8cSGvju0EQj7dFdwyyjCZYUVnjML82V/2zCnXq1oMu0snnKeTRTY
         erTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dkJ2D5SrM28PtQzZMmP47RPNezn83rJZ4rES0jLjblc=;
        fh=6DfH/8Z0M3E6l0bwIQ6fw2zycXF+D8OVto4JsRXKeag=;
        b=ZLA6UG6O1py2YCe7pxAZh9obmoWcnXT4H8kZhPhO8uqrRNKGpipYiNJpEoFYt20JKl
         lex/h8vrs6HEnIRKHYBHl1nymAEbM9unHU1dz2VD9iiLBo14eM3yL8aIqebOs+CmtMit
         65KyBGVK1pqsMkrvtljycvSR1S+bRALUupRJnfZA207+IT/LdQLwho1NEqNvfNSim+VJ
         c5u6DRbBum2xmAw25W/y6iOxh5jKCTor0s8jYkWm8p1cNbgjW8IK3VgjUMAbjnQLZZ5o
         4GFYS50nbCeMqgvt8Tt7q9Xp7vpmo2sEnZf7ANyDkwLOmgpeoYB0me74idEUNL7Izr33
         3NyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776269737; x=1776874537; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dkJ2D5SrM28PtQzZMmP47RPNezn83rJZ4rES0jLjblc=;
        b=AV/fDGfZjbcV7L0lgn8E83dWPcLGVy6sQOdlCFsEoOHnuLiu+dBADoEwotDsCRrsYq
         HEaXT4eiZADX0u81VbtkFzHj+DzY02CpErVWxBYPKWdvnfICnegBqKJZw/8QCBNb2UXt
         rFZ2WuDcBHBFt0qzz2z57S2pQhdyBXrNdHSXjAKlRXP27P3fDC/n+cd+vtgx1u5L3eyw
         mNEMq2kHvQo5dzJk3Ra6hjft4x74JRWmrwIZjF8IePQtiWdtIjm5BRzQKJDT0Rnooq+e
         5GgwTDa3v/54ZXyijRbN70WePR5cNfX6yu1vF0sP9A8dy2wzhkotFV/tN8fnGUELREQc
         NiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776269737; x=1776874537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkJ2D5SrM28PtQzZMmP47RPNezn83rJZ4rES0jLjblc=;
        b=rWInuUpTa90o4UiH06J7nAihfli0ctxsrCqxc6Sf6QmkcahsbW4aoqlrAqOfRL2yzB
         K35tfpeN0siPNe6ZOyCpMySlpf7Z0BO9FunAq1tBk5jcfaFsUVWbKyBLN2KqVCbLCf/T
         lvWEIWvXnUcwUxrfhg0TGjMhe7gH7+dY1g1wr7eE5OGIBfua2gAoZxxXu0OccGTlHy3m
         Ld90owJhcOI+hadiIrhkHl+dyBITIL/1spEy4CLYD18ucvfeSnEracdj05pCe9EqSj3e
         jP09FM16W0nVBzi1D5v6n6DvZZDpoW78YrgJxCkN39odScLvn4celPDWf6VrYgoz+bto
         i0aQ==
X-Forwarded-Encrypted: i=1; AFNElJ81oIStU0ircOcBJ2UJFpvlRIJhtUAI1vhxJicRh8+/fx+orEZsNAPAmJFVz4ThiXed7S601sgrZTASqfT4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9jBucimj7B7+z0/B31PX7hTKpK2qJc0RbbcgDkf3Pu8b7uHtl
	9zNBN4SFSSH3f9p+q7rb7hzflkP1uEUdZpys/bfkA1kxEXjQBHkSMZ19X5iMjEJi6UW+TmEtZzx
	JRrxXZ+uCGC9YVvf7kXUX+3f6NLZU9HQ=
X-Gm-Gg: AeBDiesNt1VImz/KmFuH5GcGTM2i1lK35MkWMV/EWpEvnUs4E6MDxVQVHAad3WFrfK1
	JbgyKiVI3VrpSy27NqFVStByYJWy+yAigDlPFGEAvRdAchdhUev7LamhFKaKKu+Jir9d86O6e05
	cHyuOtQJSKsh9q37kqHQUH48/2PLU0ngJeItfVoh1/M00xZB028NlEdfEgdPC2stgw7M83i4BaG
	wVO3gM6+4zTztHnlKWKLkqPsGy8PuVpxeBsObRN4jp5n+IW1BxaJynWddx8fDTo378879LPu3R3
	IF79kNKPu/LhWMo=
X-Received: by 2002:a17:907:d0d:b0:b93:6ae4:aa83 with SMTP id
 a640c23a62f3a-b9d7248aad1mr1239643566b.18.1776269736095; Wed, 15 Apr 2026
 09:15:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403002319.12771-1-dbgh9129@gmail.com>
In-Reply-To: <20260403002319.12771-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Wed, 15 Apr 2026 12:15:24 -0400
X-Gm-Features: AQROBzCoaf6c2Z5ps18tB38loMD1HlBoqzDdfFf5p9n4CXC-K1fXKUpz3vfQlxI
Message-ID: <CACrCO_XTQzD0LDOGQ_z+w8_HarW2=eNMK7pv1oys+tX9fFB+uA@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: gc2235: fix UAF and memory leak
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Andreatta <thomas.andreatta2000@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Reviewers,

I am following up on my recent patch submission, "[PATCH v4] media:
atomisp: gc2235: fix
UAF and memory leak."

Please let me know if you have had a chance to review it or if any
further changes are
required.

Best regards,
Yuho

On Thu, 2 Apr 2026 at 20:23, Yuho Choi <dbgh9129@gmail.com> wrote:
>
> gc2235_probe() handles its error paths incorrectly.
>
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
>
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
>
> gc2235_remove() unconditionally calls media_entity_cleanup() and
> v4l2_ctrl_handler_free(), but these are not initialized at every
> error path in gc2235_probe().
>
> Replace gc2235_remove() calls in the probe error paths with explicit
> unwind labels that free only the resources initialized at each point
> of failure, in reverse order of initialization.
>
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
> Changes since v3:
> - Replaced goto out_free/gc2235_remove() with explicit unwind labels
>   to release only initialized resources at each failure point
> - Replaced the "Fixes" tag with the original commit for the driver
>
> Changes since v2:
> - Replaced gc2235_remove() calls in remaining two error paths with
>   goto labels to unwind only initialized resources
> - Added Fixes tag
>
> Changes since v1:
> - Edited the commit message to be imperative mood
> - Corrected the previous mangled patch
>
>  .../media/atomisp/i2c/atomisp-gc2235.c        | 29 ++++++++++++-------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index d3414312e1de2..998c9f46bd068 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -809,7 +809,7 @@ static int gc2235_probe(struct i2c_client *client)
>
>         ret = gc2235_s_config(&dev->sd, client->irq, gcpdev);
>         if (ret)
> -               goto out_free;
> +               goto err_unregister_subdev;
>
>         dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>         dev->pad.flags = MEDIA_PAD_FL_SOURCE;
> @@ -818,18 +818,16 @@ static int gc2235_probe(struct i2c_client *client)
>         ret =
>             v4l2_ctrl_handler_init(&dev->ctrl_handler,
>                                    ARRAY_SIZE(gc2235_controls));
> -       if (ret) {
> -               gc2235_remove(client);
> -               return ret;
> -       }
> +       if (ret)
> +               goto err_csi_cfg;
>
>         for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
>                 v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
>                                      NULL);
>
>         if (dev->ctrl_handler.error) {
> -               gc2235_remove(client);
> -               return dev->ctrl_handler.error;
> +               ret = dev->ctrl_handler.error;
> +               goto err_ctrl_handler;
>         }
>
>         /* Use same lock for controls as for everything else. */
> @@ -838,14 +836,23 @@ static int gc2235_probe(struct i2c_client *client)
>
>         ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>         if (ret)
> -               gc2235_remove(client);
> +               goto err_ctrl_handler;
> +
> +       ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       if (ret)
> +               goto err_media_cleanup;
>
> -       return atomisp_register_i2c_module(&dev->sd, gcpdev);
> +       return 0;
>
> -out_free:
> +err_media_cleanup:
> +       media_entity_cleanup(&dev->sd.entity);
> +err_ctrl_handler:
> +       v4l2_ctrl_handler_free(&dev->ctrl_handler);
> +err_csi_cfg:
> +       dev->platform_data->csi_cfg(&dev->sd, 0);
> +err_unregister_subdev:
>         v4l2_device_unregister_subdev(&dev->sd);
>         kfree(dev);
> -
>         return ret;
>  }
>
> --
> 2.50.1 (Apple Git-155)
>
