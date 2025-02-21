Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B315F1FBC93
	for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 19:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740166855; cv=none; b=dL9hVJiObdEFZZIaCZsCWvCVpR09yaaiMdXBEJIIIAzGV2cJzO5IqLvEgUFG7Rd3fz8uj8NNxQBptSdm4EC5KBJNKgs6ETTwXUeA1yhLFkUkxjYdxTUzKRPq3j6sdys5tMHyceHoXhsC3NYNWh0tLXvtLM6pJkBbtO/hu4o0ork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740166855; c=relaxed/simple;
	bh=qQJGApAF4zrpcJgC+gSQ//5Q6sWe25mMWgMWBK484/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=friUFnPluLotLc3AJORb3OO/rlhHyWvoDh8Fnn3/9FhAgVgGP74rzKBv3n6Xwu4J+WNUz9NqVZOLfWbLw6wy8cjo3blE6Y5kOlzA700dg3l9CrYbt/RnO2BHIgpYp0J5ENd/krMyyZvkKFTYCkvGC6vA30cpIdMMkelV5MkSz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XFUg383j; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XFUg383j"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5dab3f372aso2243828276.1
        for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 11:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740166851; x=1740771651; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xPZz9ULchBOM5dOePC40Su2DJgOAZjB9+GW2yfEAxwU=;
        b=XFUg383j7GRJIhliw8BPh35MvssLJfRMYZIyMR/1qsIfhAVnm6bi4WgYMfTgMZu3Wp
         zY0D44qRiFroh8w5chkZrTXg/d2U90cMWhjU6wOr4HdlPMcfz+EZHZOYlaY3xcmB8eKz
         cU0j7SrLoBqpXoTXhf7IHLsbXDArR7RXiuUWGqmszhQi3bPKGF3oSA+DZ48zSZLdWy05
         PY7OCklqgdCm/rKjF1s+sj+o0lXQYux8lnChc4gPgxYuOElUGzUW3r9hkUrRRSVa5Igh
         mkJ6aK+4dOs2W/7n7Rh/1oSZvlcnZJo9iUSNgHrnMwsjREVY0VKBdFqBOTx4u+3FHk84
         uQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740166851; x=1740771651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPZz9ULchBOM5dOePC40Su2DJgOAZjB9+GW2yfEAxwU=;
        b=KuxArbhqd7zWzQQdRM6qBys5zr2G8CLDEJwBQMHQ08vsJ1PE7APcjNBj9MPsA70d7x
         Q1BpAxCTQMssacZh8CL+BvqZ4pHD3HhUD7o3FX/FO2LCagTJ2FA/x5o3cqjK6yPM5vQS
         P9gzM+K2RUzpjYJYrA/Y1xWOSMhEtfHdErBIQdNwV7dZd8tnt9iaG3SZvK8z/akmYyDN
         XhPrQcoZsWO7wLWSqAYZlf02/B9iR+5tokf/y2lAKbj317jcWwYD1y68qggVbBVAOpsn
         LM/n1xc1AjILmgkBLbPhcVnjuXkQRt1XDj8BRD6rHzh0gJVB4GswOdU1a/roGe49Jea7
         nA9A==
X-Forwarded-Encrypted: i=1; AJvYcCXgiNWAqp4nEIWzXR/ik2j8zF8LJy5YPioNq3a0fFMMHffZlRrFJB4ZOqcvM3epLQuIrCuRFpgdPKbP2nZn@lists.linux.dev
X-Gm-Message-State: AOJu0YxBDCLVUX8yHzKC1Jq9LGf7O78/5N0ljd7kkvoMTYNYWNl4gvKF
	IIRBD1sGC4a/BWJHOrDIfOk5RiOKGAFjrutJyTulw5X/IZ99MHVFDqVN8MZ4h9FNZr7JICORuqF
	nrLANpIEfkenhqg1ARtWlAAdR4pARIf9ZQKiIIA==
X-Gm-Gg: ASbGncuiyclnCJq1fI45h1ClavddEFHufMC9DeXo2U+r2GwveJnl+3JylkVy97q6Bkh
	1d+l/ZBMEhPWEMgkvnBnyqx9mSZG98P45uo7ehSkvvigLkcCIux8UwMqrq6nEZE8TwfQ5JJ/BYQ
	IhkykyR5D6zi7L1ylU+f2Jt4sIxtVmnJ0eJSidR6c=
X-Google-Smtp-Source: AGHT+IEyxCLNRttuo0uDO3VhLlk/R75J1rU5eT1mDBu1NVxB54wKeG/GJCTZVLwmIqDJzx++hZJObrJ3XatjODazKSA=
X-Received: by 2002:a05:6902:1027:b0:e5b:406f:3b02 with SMTP id
 3f1490d57ef6-e5e24883193mr3880649276.12.1740166851619; Fri, 21 Feb 2025
 11:40:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250221162358.53913-1-kumarkairiravi@gmail.com>
In-Reply-To: <20250221162358.53913-1-kumarkairiravi@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 Feb 2025 19:40:31 +0000
X-Gm-Features: AWEUYZkwZymW5Okm554Xf4g6za5wBxYH1umaXLW234z_TtZ8U78puT_42qtzn2A
Message-ID: <CAPY8ntD6t+=apmNkrmiQZmoxYJ=wzqFAZrgH07xfNvMx0VxLXg@mail.gmail.com>
Subject: Re: [PATCH] staging: vc04_services: Fix function call formatting
To: Ravi Kumar kairi <kumarkairiravi@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-staging@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ravi

On Fri, 21 Feb 2025 at 16:30, Ravi Kumar kairi <kumarkairiravi@gmail.com> wrote:
>
> From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
>
> Adjust function calls to avoid placing an opening parenthesis at
> the end of a line, improving readability and maintaining proper
> kernel coding style.
>
> Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> ---
>  .../vc04_services/bcm2835-camera/controls.c        | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
> index 6bce45925b..d00d910989 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
> @@ -533,17 +533,15 @@ static int ctrl_set_image_effect(struct bcm2835_mmal_dev *dev,
>
>                 control = &dev->component[COMP_CAMERA]->control;
>
> -               ret = vchiq_mmal_port_parameter_set(
> -                               dev->instance, control,
> -                               MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
> -                               &imagefx, sizeof(imagefx));
> +               ret = vchiq_mmal_port_parameter_set(dev->instance,
> +                                                   control, MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
> +                                                   &imagefx, sizeof(imagefx));

Is there any reason that you haven't moved control up to the previous line?

Media drivers still have a strong preference for a max line length of
80 characters[1]
Your second line is exactly on 100 chars, but can drop down to 92 by
moving control.

[1] https://github.com/torvalds/linux/blob/master/Documentation/driver-api/media/maintainer-entry-profile.rst#coding-style-addendum

>                 if (ret)
>                         goto exit;
>
> -               ret = vchiq_mmal_port_parameter_set(
> -                               dev->instance, control,
> -                               MMAL_PARAMETER_COLOUR_EFFECT,
> -                               &dev->colourfx, sizeof(dev->colourfx));
> +               ret = vchiq_mmal_port_parameter_set(dev->instance,
> +                                                   control, MMAL_PARAMETER_COLOUR_EFFECT,
> +                                                   &dev->colourfx, sizeof(dev->colourfx));

Ditto.
Moving control brings the second line down to 81 chars.

  Dave

>         }
>
>  exit:
> --
> 2.48.1
>
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
