Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B9620299B
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960960; cv=none; b=YYoXoh4v0orkYX5psFt5WiT9myDZMlca3kVVXad6wR5wTEHnqRkhjhAhKX0DKldlFWg8bhIVw8/NTg90z9Mo3rUGdTSE3NjVCDq61c97brMBVCCtoGMGCzmgzEVJb+pFazKWE3SsNUkrX2Q6ZZrsSiLuVeu7IVD+gR/sWtDzNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960960; c=relaxed/simple;
	bh=cK/F/XRWVdGgsrv0imtZS1Am8/D8n9MBxKdjORBtKh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcuHC2V5RcRPQNBspZrPm+mFInIuYsL643SprvgrWsoVF3Y8HKJ8HGlFF+gXLLf7AlWrdEBf3SIC/1bLmbZVuA9tNuyYbl0gvMlmcUifbDsD/ZQh0Lf7u/15oA/Tam4FMltQ3uyk+9z6lme1zuRqqly5CcAkZWjkWRCnqpT/Q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtPctBJq; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtPctBJq"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6116d9bb6ecso755765eaf.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 11:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750960957; x=1751565757; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FuBXeZYcaGZJ+A3VKNOAHUUuR6YcnbhEEbsYOpI28oY=;
        b=TtPctBJq/+NfC9zG4D5d7IqyYE1XvheWsff049CYxR+c24X80Gy2HIH8wVUsNjxZqS
         QBPPmsfClr0Sgm2qd0D/lmM34C7zp3od6zZxQoJj/RhvURsz7bZZenIoHWIOnkfYakSh
         UNHdyDD5NcxgWb5J1rB+4lScHtPzfYOjqLyPcoGrdZOL1GfRp4pnS8BEozyxZAQTIBLZ
         VO7OO0XzhfXEpkueCY8EgrIqpuVVg3dWxbaQles1iTKl5BdBt9yC0ghnH4MHYgrCtoHD
         5mMtRmyelXxHWdrC0rWFuedoRgSB9rMjDQS4IdjcNe8ohLppzXir8E0K/cr6d+CTdUVJ
         sYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960957; x=1751565757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuBXeZYcaGZJ+A3VKNOAHUUuR6YcnbhEEbsYOpI28oY=;
        b=RTgEIc3d6bsSzANRXYTkQy8RdlHbs7kE7CaK/trkel3z2NAOQkhPeGD18UJJ0wWOBr
         6yuDzASfVJKLSkDpEPEjxiwpZa9eB3Sz02gqdFAqghYieBT759JMeEGkjn6QqDQbCJjZ
         7DKxUUQLeKZV7I0HTm4HZOEpcb1jinVRoQudgBnHalPbtFFAcbfyxdMU4UiVfNfRmttR
         01H/CoGczz3Axk4TFgsnwXRUhCgFe4i27M8c/CMNfwk0Z6ubSpXZj3lpx4ptnY0RWGBa
         Y1vapeC9UGKQb/3xlp9IG7dWFGs7PuWuv2kJbV2/7daoNIeRxWilSCoBzjPd3Io/d/dI
         Lj3A==
X-Forwarded-Encrypted: i=1; AJvYcCXw9L/g1KAPnmdipjZ5heeylSJs7fUVT3YOgpL/C/vgWce++3MMKsaXcP3eOnAUyy3vnKKCPLEz0KueGfjY@lists.linux.dev
X-Gm-Message-State: AOJu0YySvieaGCS/MRB1xbWS9KJ/MRXVSTzeUYjip8yeXgKsfSzhx9pa
	otUmTq+6U18yCXwZo5Bb7ofwgmgq5fXtvoMA/p6ySxdYzEEgBR/tpzQVxR3BBRVkquA=
X-Gm-Gg: ASbGncsuzvYlgw8Z6WZexyhNQxaPQOLsJcylHXMnR2d4IhdENp2TcKX9HsFCyN9PrmZ
	cHc3SBWrXsK0tpy9H7s27Mi7t4N4+nLyoyD2/em6OT/en+zWlh2oKafV4QdhRxfkBq5lGpgOJD4
	S2lf7WzQv/+A57qI3Tsu78ELRds/OYMbvhiPUoCCewyMXYp72DBYQHRNqK5fBiNEr/zjm5XIfL1
	ZFygNME89I78uczDAg/e+5R3SxLQaDAqwWGNW1cjRkI3V+T1BFJoFyq0dvtpTrFDRBPaAGsBbmS
	EYTzWHfBqaZsKpPs7waoLARhGkyEVybdvLp/i7KD886qHcqWDg8N+REW7u/IcVDDAh8B
X-Google-Smtp-Source: AGHT+IE0Wq2OGy/UBABihaj30tjkXqQd3OF/6SvLXaubvLuwAxvs/RkGqwkr/Rqy+NYKM/SPFesEow==
X-Received: by 2002:a05:6870:f721:b0:2c3:1651:ca78 with SMTP id 586e51a60fabf-2efed4b5be6mr15093fac.14.1750960957043;
        Thu, 26 Jun 2025 11:02:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b0cf0sm453080fac.29.2025.06.26.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:02:35 -0700 (PDT)
Date: Thu, 26 Jun 2025 21:02:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <407addf1-4cda-485a-83a6-5eb2f6d5f7a9@suswa.mountain>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626172412.18355-1-abdun.nihaal@gmail.com>

On Thu, Jun 26, 2025 at 10:54:10PM +0530, Abdun Nihaal wrote:
> In the error paths after fb_info structure is successfully allocated,
> the memory allocated in fb_deferred_io_init() for info->pagerefs is not
> freed. Fix that by adding the cleanup function on the error path.
> 
> Fixes: c296d5f9957c ("staging: fbtft: core support")
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

