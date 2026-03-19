Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133753A872E
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910974; cv=none; b=W6YT3lvIRtUlG9DxoJeBkjSLgMSe+RZpzZSACz5x913MV+vXQbic2y/3lOXyAC0Cb+X0L3jCNaK4KYrB2KzQ2emLu8blqmdn0F2dnTDhuE6HX+bqj3RegsNUdZ8nRWpLqNcCbQECxdAywR1GCxyyb6LOdHx8FgJW9BYwfLeChkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910974; c=relaxed/simple;
	bh=75nM3lYRQU7IZ2qAXZ2X20vZw1P7LFmoQkBFEZVgVAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nY+H0M0Zr2d9WdJoAF00zJOmyFP5CiuZiSvZJgmNjWLwb26ISS+9A1xm3rNSMQ39/k24MaAdxNczrsOtua0YjtjIpcNw6bHcDzuuwQT5QIfngzWgXYZy2ZJN+E3Ojw+Cuy9iGijsZp44abWs5Hhy55CtgSY5hTwJGZ/yCe8mo8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L8JTX8MU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8JTX8MU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b611274bso190594f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 02:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910969; x=1774515769; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kDHkOh/+rJs2mQxrqKz06BUKYb3btvvpq78iMwVqDVQ=;
        b=L8JTX8MUtfJNNHG0QeQc6VswUmj8Nl22+vJdtqqO9G1llOkHd5hc5fxYEbYiHajXXn
         Pz+hYu5tf7Dy6TB0PGPqL+29meuhx46P7nZMm8a//w0KU7+NzD5YZIwoQMP9qrFfaT12
         7beRjQshhei3h7QzgkqyoOusFe3HdlHnjMEmhhRUMk0iQKaxicr0dFG1Hzkbx3622bZU
         QYP/t4OkGlUI3ZtqEILs1Px7Q8PiRRnrFFNyy4yV6ASFGp/uA9dn6fFBw4GuqmS8KG80
         USXZdJak9+F/SyPkBzNtSzcdNjLE9Is/StSy8X4rw/Yr5RPelbgkpIGqfWOxSh9oM/DJ
         IInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910969; x=1774515769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDHkOh/+rJs2mQxrqKz06BUKYb3btvvpq78iMwVqDVQ=;
        b=HLYh9BeQxxCXKYV9AqLtN2mHDufsDXGeQAKMwdvE8UQMzTYs2z91Jfk9/DDNY5yqEI
         qjK2fhRq2/z83dltdWn7dbcQZwwJ+qs5rPw/TqMr6kF16i1fJXb5GWCi0XbAPIVpbvdx
         Er7h7Vvn2DmxHtZPsFstxfdVUtOVC4TM7hk0qAnN4DTEmF6COkvzQ2uBl0o5xmSIoFVq
         M7BJ2d+LQUEYyqFiaHAUNfUak6Pi1TZFDZN8V5As9Qz0xoeFYGfNnXTmyiCMZaJGJ8ap
         aljyuJWSuCgHuVx6TnLYhFm+pLAAgKRGMRk7H81HQ6sE6KdKGHrskdrqKTOnxDgGoWAi
         SsKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTiWUgSYZnJPGaSF8plYfne/S8J7g+1A63FEYoCniYwxho0fvhA4ROPXeF6kSojO5oWPzuEoCSFif0twpK@lists.linux.dev
X-Gm-Message-State: AOJu0YxM+H+JP7VW3L09N0iRdy19uFAXt9DnrSJcobZWQRsJty0GxgzV
	K3w8mB2GUmHNTs4cNxF2HHCHQUzQP+INpc5AAAqPoDxNi2ZSgcWnIeFDfkf4s5oVDHk=
X-Gm-Gg: ATEYQzyddInIK5YfV/J+RAau8Td3WW/OdE7Eb9gbBnpHOCLK6nruXN16fwzqShQBP1j
	pS5r+OyTy2um5oziwLEAiAz+LJI3GKFv/xd+DOHcLO8MfYHhESwNbrpXDcdp7UhJFHcJCY+a5z8
	IgfQZbh6320N3nxvgPPtrrCeiZNNA+5UqUjEBEFPsVaA3ezpkFj6R0nebN/c/uhiDamaSFjqGxW
	osQD+5+5Qed/+Rdx8cv9tbVea4clkRE337s5UvtJOOj1mjPyB2qYQVStRHv4taG53tPHd/Vfsw4
	s2wcQelgD0WQTDJvOX7eWIfaMi+OowIm6UkK9J6RHOqYsSslGdVDzacjknmUWqLP62B3l9At/Qa
	QFzPUy75e7re5ubYzBajtXwmq3NhGfn8ATXyX7FMvGIWlREAKN89uxAU35tJ+vA7NHId5fy6CVP
	c1+ZuU20mVWUhxKwO0X0EkABkWK43g
X-Received: by 2002:a05:6000:2006:b0:439:b629:42d7 with SMTP id ffacd0b85a97d-43b527c6c7emr11231724f8f.46.1773910968290;
        Thu, 19 Mar 2026 02:02:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm15002809f8f.1.2026.03.19.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:02:47 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:02:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Message-ID: <abu7tNtikJJWobn5@stanley.mountain>
References: <20260318191149.109616-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318191149.109616-1-ss22.kern.dev@gmail.com>

On Thu, Mar 19, 2026 at 12:41:47AM +0530, Sudarshan Srinivasan wrote:
> This patch fixes below warning reported by checkpatch.pl
> WARNING: Too many leading tabs - consider code refactoring
> 
> Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110.c | 32 ++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..970343c4ec51 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -932,6 +932,27 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
>  	return ret;
>  }
>  
> +static int handle_ts_memory_fe(struct dvb_demux_feed *feed,
> +			       struct dvb_demux *demux,
> +			       struct av7110 *av7110)
> +{
> +		int ret = 0;
> +
> +		if (feed->pes_type >= 2)
> +			return 0;
> +
> +		if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
> +			return 0;
> +
> +		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
> +		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
> +
> +		ret = av7110_av_start_play(av7110, RP_AV);
> +		demux->playing = (ret) ? true : false;

Keep this as:

	if (!ret)
		demux->playing = true;

1: It matches the original code.  Don't make unnecessary style changes.
2: The original better style.  The old code said, if there were no
   errors set playing to true.  The new code is ambiguous.  You might
   think ret is a bool or something.
3: How do we know that the playing wasn't true at the start?  This
   could potentially introduce a behavior change.  That wasn't
   mentioned in the commit message.

> +
> +		return ret;
> +}

regards,
dan carpenter


