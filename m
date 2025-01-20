Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EAE185B48
	for <linux-staging@lists.linux.dev>; Mon, 20 Jan 2025 06:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737355331; cv=none; b=RcjkwxL3Aa61oIOrwxs6n5CCCqoWkOsFaBHYVxfzsvDsiMFmd4g0v2I9hsawMmTyqkpy1etPhXeyXF+P3QqHd8uTpO8+8nuTnallJXfomnRZYBskLHA3w6X5SZrovKZFAZ3GZUqHbf7Pd+c8iu77r1Hwm3FBsesH2b1VK3oKLck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737355331; c=relaxed/simple;
	bh=aNTuntpgQwsZSlBVRgdq1S8B6jlujxSvkINGtUXUiNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAH6pXuufJONQdofSfh7lCEMUpnp852qXWdtvhLh+cWWTsDW3wD8XQJ6Mi9k/zXmTrxQd58DrTGdIu5I0cLDGGP7fPolOV3mOa6lHAEVniggg7GSgiLYH88iw7BRXG6f8tjJxuapZt3EPQeKDT7yUhHWL5a+pMC0udffzO5KukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AuP1EjF/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AuP1EjF/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so41977715e9.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Jan 2025 22:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737355328; x=1737960128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QPGkqAJOixMG4PuepbTknhdASJFaNL8jP11KJv1ltsU=;
        b=AuP1EjF/n+9wWrSBbNKCEH7WwFddYR2Ks8g8nUpxMwAep9TqDnUo0KfSTMXBMdzu/u
         NQUV7lbSkqTwouXTRyqRQvzp6gwo2h5kiPgRKmIPG3h3/MHSu0GD+uzeonVGlVdBNJ5x
         qND2FayTE2LCH+pgDMIGD5bvy546BnA1NpGc4HObUostICs3hAhaTAafOJf36Z3IwfkL
         9MFni5+qJn9+CSNMNBkK1QpIynDpDLPxSyzkUI/gr07Jzkiwi1ZR5mmoh6WNUil1D44Q
         J8xYLBsXusMleKzp0bbg26pkFQXpURPRGDH+1wvLpcunR+FpCNl5ZGu/4OO1uvbCKh+t
         RRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737355328; x=1737960128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPGkqAJOixMG4PuepbTknhdASJFaNL8jP11KJv1ltsU=;
        b=Kkhxohwc10IYKw86bB6B/hFJbmsCbRLmIYYuKj6ANTp0GNB9409gvte7TnFGaux6V5
         yEAoc40Stxoi0275Y9QRLh1/bFE3r8fuuL67eySzZVBMR9o3ckZN6NCSDv2KjKRyKqBk
         wwwy/MHKgTGPqt/+WvChUYLsCGPju3Ces2t0xYWaXrJQUCYv4CSWXupGRV3uRH4Y1dem
         GLaASismbp/rcvomDd5GpT8EHwl2oi/9x5FGZU/OZtqbXO7IvzDMUOaIblWNPPr//v/X
         1MwsGgrsHuQVmcy6FwobqNWMk46EFIvKElNwb7mA9ZoP3/2K8okuWaPElWVme02ru9Y5
         rrFA==
X-Forwarded-Encrypted: i=1; AJvYcCWCFPXgZi2ZBrFb4C8dCTpzmucY5UnHYl5o6xF5vhwUt4/PwgJ0Xh4T3J6jSHDgNKlPy4DlXVrrhPVVo4lm@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0qNZ07qP1NqODld0cUnlxbvcaodAHwMHR5LK/NreHyYhV0SBL
	3GCYUQzcqIM9oUJgs/8g0YUcMExACfSOjhiiVXQRe2N5Ob0tp0BBtxw2WCmfUYs=
X-Gm-Gg: ASbGnctPTjMfJeSJyrybLX32TS4b4BxP0vSz7gVRM68LobDi1dpvdGYtUII9AJ2dE4V
	WHzJ9Cs/2uK37ZyWFlrHDSRD9LHCIhhOFxGXhSRhwKVBoytlLrIVEZ9LKFefVG/NUht5LM08p8y
	0EaKsTy0Iji6/0rqXOxmSLKHfUXYzHRAUtg1SMmYyWvMbI97pqlRc82g9xXC7Ag13EcAOHcc38u
	hnn3O1BCLlCS4gipRYF9kDwtqkuHaNH4HkAfEQPt47x2oAFGEp8HmD3WdD9Bj5t0P8vE+2hJYk=
X-Google-Smtp-Source: AGHT+IHc15I1C/WvXuthTwMDfFaEW9g+XNf/G8+29J606btXxZW3Uhxz+7UeBt4aZy+MTdDKhJlSoA==
X-Received: by 2002:a05:600c:4713:b0:436:9227:915 with SMTP id 5b1f17b1804b1-438913caa3cmr92070545e9.9.1737355327790;
        Sun, 19 Jan 2025 22:42:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389041f610sm125935885e9.20.2025.01.19.22.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 22:42:07 -0800 (PST)
Date: Mon, 20 Jan 2025 09:42:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: gpib: Fix NULL pointer dereference in detach
Message-ID: <d51c1d1a-f063-4971-b30e-651cd535cf89@stanley.mountain>
References: <20250118145046.12181-1-dpenkler@gmail.com>
 <20250118145046.12181-2-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250118145046.12181-2-dpenkler@gmail.com>

On Sat, Jan 18, 2025 at 03:50:45PM +0100, Dave Penkler wrote:
> When the detach function is called after a failed attach
> the usb_dev initialization can cause a NULL pointer
> dereference. This happens when the usb device is not found
> in the attach procedure.
> 

What you're describing is true.  The ibonline() calls ->detach if
the ->attach() function fails:

drivers/staging/gpib/agilent_82357a/agilent_82357a.c
   230          retval = board->interface->attach(board, &board->config);
                                           ^^^^^^
   231          if (retval < 0) {
   232                  board->interface->detach(board);
                                          ^^^^^^
   233                  pr_err("gpib: interface attach failed\n");
   234                  return retval;
   235          }

But this is a class of bugs which is very typical when we free things
that are not allocated.  We would normally say, "don't detach things which
are not attached".  I would be surprised if this is the last bug caused by
this particular call to ->detach().

In fact, I notice that agilent_82357a_setup_urbs() has a
kfree(a_priv->interrupt_buffer) so that's a double free bug.  It's better
to have a system so that everyone knows exactly where to put the kfree().
Fortunately #SelfPromotion I have described such a system in my blog.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter

