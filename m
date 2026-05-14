Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59F83815CE
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761108; cv=none; b=smj3FdiP7KlHvwMG0Tx5RPp8+1nNRd2f5g+JsNG4GGnnKM6k7+pbh1NlKQlz9aKhaz6COZvWLhDA7iI5ytV8bWlkaY0eUavDVqKc0BHUVr/9JfSdZut5FhJ4WTKGTN1kRntmuR6b1zHgpgrR3OQ/+2T2lliCwo1DSI095izAyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761108; c=relaxed/simple;
	bh=gXR2IZNMnwEUAg2UR4zcBwDXGq8bNswBPoqCKMbgS3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBTiQi3tw1b6ALh3Cvl+BkBjtpg4aW8Y1GryVrgcdO3Rm9eG3mX1mRFx39bwG8roZC56HR/214r15UyaWUXoBI3+HOTsvj3qmgosRRu7tenbo81dAekBMv9/q5gpR7WruazM+MXG6iV7n8p8llL4YKrr3sAGuCqrRw0H0MKJntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1s9VbOK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1s9VbOK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso1769375e9.1
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778761103; x=1779365903; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AG1lvR6pl4BzaSh04axvEB6iGN2Hc8q6AwQQAJp6LYs=;
        b=S1s9VbOK1tpZ5X+2/a7aP6Z+ukyvo1pYfguoyRo7+uvlA2tMW2e28e1P3uHrIB6LnN
         uIVFxA6VWAKu9wxpCSbDJH9Zqoz9YkGX4khtgkxmy0eR11GJCoqdlOJ0PvvrzGO/FUuQ
         vnt+HL0g+/oBpHoyJpFTx4A2GL1aZ/vAFB9pUD3U0bdUGinzzCuTdoORWeFsYq37mMy6
         Mw/edWWZInSoqPF+L8Y06KlHDIgRAAK4Eej6UEVI6YjO8LshfcSWlkHKT9/jw/oLwZMj
         M+5b/qJgfp0l8LLglKohjUsmnZa0gZW4/j65C7utHQst7C7qHDC30mLOHUm7IXMovb4V
         CAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778761103; x=1779365903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AG1lvR6pl4BzaSh04axvEB6iGN2Hc8q6AwQQAJp6LYs=;
        b=jM6BjgGVOV4GxZgViEkI/wkVFEwPFcwJ/AUvnKUIU2oOCKcA7d0Eq8HOgwxVaBvII2
         KqeD4CByucuA+Im5R5zul7EmshrbBpbRPzlDSUyODMEBYc4MQAGyxHQ3rCB/6On2qZ2A
         eHfJw6WAs6QOn86JdeqIbYMObes25CrcYUGcoBhkKQdTrKG3tfPDCmARHIjSKBkDDp93
         2ZvrtVjmdbWS5b80SnMO7wjymDFrsJa4yF1h+2Or1GyvRpNdaIiY++YYSlU9kGB9sTK3
         rROwTzWSADdYC6HKtyoKmOT872TPeTWdpIgnjKjnLGMSYWtSCI3aI4oE4HcvGdGNpuwX
         gs4w==
X-Forwarded-Encrypted: i=1; AFNElJ+mNM/DbJw7EOyTotjxmPkSqTkGrUWetxc0B2qQd84jTCa8djD52KrZ3ZTrNzGEE42EfRpn0m0IvFoiG9KF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj0NWKas0/Zt5xRJmML9tZkmFMBzmgKUGO1FPs7SbM3KbmJruI
	AoZJHjoRpCKPqWbXy4UIus8AkxMQCEGkJ2R0a0iZjMoQKn2ETbZ1v1+d
X-Gm-Gg: Acq92OG70krdaJpaKTsqqDIsiE84HnbZ+rjulNsMCaPlhkXEw8TRIUEGNMY5jkvPO3+
	V2WGUo+KIcnNKAxuRwyTCU4k7vumI+Y+89hyJPOxtKkDP6Y3kFRRs79L6BCkMwZfoIVAL0d5DsE
	dFhfRlkLVeqm5c6rHcbQZTOFst9fMoSrmwu7nJqP8Vf2ZN1MrrZwMN4D8/04l139GXYiwnSp++N
	pIhnn/UwZjL3vtzzZcymev4vfFikWPDf468j+F41kMC+1AvYDcUxXXjqc1HYxHKOMHQxxEHQ01i
	m5bQYdHPITshlSgkk5moBt9FUm7R8rx7SgrAzXre1AuX6pzz4aaRoa2CkpP7g81X39eNtF6etMI
	TFr80sdJyovOf0+O8bPqWVNHkY8shzvnvA+gy+25NHbWLn3en4IlmR/nIiuAMftqH00cSwmQINc
	6eZtTE/RaksrC2p01bYEo=
X-Received: by 2002:a05:600c:c4ab:b0:48e:7f1c:8760 with SMTP id 5b1f17b1804b1-48fc9a45b3bmr120011915e9.27.1778761103365;
        Thu, 14 May 2026 05:18:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd76801f2sm22188035e9.7.2026.05.14.05.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:18:22 -0700 (PDT)
Date: Thu, 14 May 2026 15:18:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Chhabilal Dangal <yogeshdangal66@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: Re: [PATCH] staging: sm750fb: Add suspend checks to copyarea and
 imageblit
Message-ID: <agW9i3X6HOL4Zt5n@stanley.mountain>
References: <20260514120102.71615-1-yogeshdangal66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514120102.71615-1-yogeshdangal66@gmail.com>

On Thu, May 14, 2026 at 05:46:02PM +0545, Chhabilal Dangal wrote:


> The suspend path calls fb_set_suspend(), which sets the framebuffer
> state to FBINFO_STATE_SUSPENDED. Add matching state checks in the
> remaining accelerated callbacks for consistency with fillrect().

This is stating obvious but unrelated things as if it means something.
It feels like information but it's a waste of time.  fillrect() does
not mirror fb_set_suspend().  This whole paragraph is garbage.

> lynxfb_ops_fillrect() already checks info->state before accessing
> the hardware 2D engine, but lynxfb_ops_copyarea() and
> lynxfb_ops_imageblit() do not.
> 

This paragraph is useful because it gives the motivation. But last
time you hadn't checked that the AI was correct.  You're just leaving
it up to us to check.  Why is your time more valuable than our time
that you can't be bothered to check this stuff?

We need to know:
1) Is the AI correct this time?
2) What is the implication of the bug.

Please do this research on your own, don't just enter my questions into
an AI.

3) Wouldn't it be better to do it at a lower level?

Smatch says that out of the callers only fbcon_bmove_rec(), ypan_up()
and ypan_down() don't check.  So check those to see if this is a
real bug.

drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |      fbcon_bmove_rec | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |    fbcon_redraw_blit | (struct fbcon_bitops)->bmove |        PARAM_VALUE |  1 |     info->state | 0
drivers/video/fbdev/core/fbcon.c |              ypan_up | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)
drivers/video/fbdev/core/fbcon.c |            ypan_down | (struct fbcon_bitops)->bmove |           INTERNAL | -1 |                 | void(*)(struct vc_data*, struct fb_info*, int, int, int, int, int, int)

> 
> Assisted-by: Claude Opus 4.6 (Anthropic LLM)
> Compile-tested only.

Put this under the --- cut off line.

> 
> Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
> ---
  ^^^
Here.

No Fixes tag.
Please wait a day between resends.

regards,
dan carpenter

