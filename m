Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53B7340277
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511522; cv=none; b=LSZP9irhdoqdxAMazYUbMs6icqr81XTMMuDkWST2rPc5T+ouuqxbkP8OMegNcIs1IMLqnFKK2di+IToWw0pfAdm+jKaX0EHTjX6oFrT+jjcYWYhyUUT02FntgEsfFOZsHfx6NK3tdwrEMWwnCYDp2YIJCKTjstljdMAHTWcFih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511522; c=relaxed/simple;
	bh=0SLhbTg1yYmb9zAVPKw8xoKnLQ9qB2Jhy86nwGzc9Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AX1dhQF/r2gKS6yqqKQzNFeOkaf38/24xT2kbloGpi6oCvYMalH0GxXNAZ+gEFvdaEnLaAshNGasPi3v0/sTaF9QlUGRKsOz+TW2zdI1AjBPx5GCmhjmw3QorAy0ad/YllQ14NorRQX6yOnOS+rAu71Zr56CAXC3QYAIHMKbPso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=geLTgELq; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="geLTgELq"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-483487335c2so10094585e9.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 06:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771511520; x=1772116320; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i+qKFoabRqEgBnmXyIvDdSokcUG88HYAtO4ot0il4iw=;
        b=geLTgELqcYTMKOFQWqhxK/gxt93YOWQ2pmy3pVz+lCjrIDVLIw6CI1DGjeViYPkgE7
         KCNYC0VyIflG6aSEcwJryWw477C18Qs35tw8AAuxcB+tTyXEcVX2VB+/RrvdImHiBTpG
         CalCzRqsM+hxwwP8Our74IY6w6vGYaNUybTIChZOS0ZDps9XBmQKnbr3rHM6CiizwJ7O
         g+lAdqzMtnfwf0/SlSeuTaFUKfGKbSnm8eVephiuT7rKI+k67Tf2/GIuhBnf9HUQYB1f
         INm5PO2u25NqZMWXWY+iJgfVxXaEwYbWNX+vDBPQ1q9KfvXQvTIedkbpQh9ZfVZGWWsN
         c3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771511520; x=1772116320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+qKFoabRqEgBnmXyIvDdSokcUG88HYAtO4ot0il4iw=;
        b=OokMIhd6kEiMB6BNF5gvR0pOS0XJiGBHiiW1lOo4XWgh5rk/Ay/rtfBFtzI1ILF2yQ
         tCa9JzhlUdbJGkZB18dv+mP7+6DjM6PLojLiMpmYf1HyLuOj68va1ySMAeAhv4AbOMSF
         +E4expVMjv/gzmfOqVBIdc653aWkFppjDiqpVOB81vhTwlpp3Jy56US3eRtE/OOD2Zvc
         Io/xZAO4yB3FRh+bRjEHQVrYI0SY+WBZZPgT7fYdIhCSOmegH0Votemyu4H9S9X3TNhy
         n2FHrCBPl0syodCqMPIQmptUV9LhiKd8b87JxQWT9wA/OP6g4XljfL/ZBjARsKSIj94T
         4nmA==
X-Forwarded-Encrypted: i=1; AJvYcCW3QaAIXH0ryHDZg26Ki3RzwYQ1xBBUsI6aXN9fFFY3lxY1wP7cAhv3a7L7hfjhWqoqNdz632/+qFNEcW0t@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5tQJ8k44j7VpmGc7R0H7RbsW8jfEw5qLpOwxTfj3CciJvaZIk
	Jv8Nx5g/6mY7IaAoHzOear9ckMX8lWfxWXL/bq3k91n0SgbCruR4iDKg6NR7tEKbyTw=
X-Gm-Gg: AZuq6aKcw80rxe0f8x8VsniZun1+UQHSJqQ/jzh1kkjZx3Ick7oV9t5zgN8nTmEW4hd
	JHW8ib1OaXZ+m0Fye7XMjtU4066T9DtCvNL2mCYVYS+inzDWeyGQn1yy0YpEtVWWfiMzSttC0u5
	SbOMmzq3pTM39oArXhLkmG4kTxYCTTcHv5Iuwgrhel1ediX5pfaIOQSVBhVl3VfOY+KBNfjgHTd
	GS42ab5crm+NPRIhy0UCg/g2dXPISNzd9FTvy3CZguexHm6GH53HgFU5kG0ytExRaP3ye+F+Bfb
	ZV0hxFYvKcu7e9K4w42m6pFn4I7PGHXtgnRUozBVDyQ0tGlRfM0JLoju6rGJ+PJ4343eWAiXXju
	lcXm40TqGCshRk8Wa5pJP8Ai8Kwd1ykagyiz5okL6lrrHoXtYUJd3H/bqkh1ZUhzmZ7GweIUrYM
	Ng5YvOJmenb+God9DcDxw4vBd1U6xI
X-Received: by 2002:a05:600c:a51:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-4839e6682a2mr41932915e9.29.1771511519890;
        Thu, 19 Feb 2026 06:31:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b2d1sm52919229f8f.4.2026.02.19.06.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 06:31:59 -0800 (PST)
Date: Thu, 19 Feb 2026 17:31:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?Q?Bart=C5=82omiej?= Konecki <bartekkonecki97@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: document codec mutex usage
Message-ID: <aZce3JIfKM_FgzyC@stanley.mountain>
References: <aZcP88KGUnxDBjTT@LT495s>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZcP88KGUnxDBjTT@LT495s>

On Thu, Feb 19, 2026 at 02:28:19PM +0100, Bartłomiej Konecki wrote:
> Add comments describing lock and register_mutex
> in struct gbaudio_codec_info.
> The lock protects the codec runtime state and module/DAI lists, while
> register_mutex protects hardware registers.
> Improve readability and clarify locking semantics.
> 
> Signed-off-by: Bartłomiej Konecki <bartekkonecki97@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index f3f7a7ec6be4..90dd3426d4a4 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -70,8 +70,9 @@ struct gbaudio_codec_info {
>  	struct list_head module_list;
>  	/* to maintain runtime stream params for each DAI */
>  	struct list_head dai_list;
> -	struct mutex lock;
> +	struct mutex lock;	/* protects codec state and module/DAI lists */
>  	struct mutex register_mutex;
> +	/* serializes access to codec hardware registers*/

No, it doesn't.

regards,
dan carpenter

