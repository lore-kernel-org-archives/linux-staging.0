Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A23C8728
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 05:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779083651; cv=none; b=KZ5McI6zlMaC+EXs154/h3FJdav3WBtJyLlpCAzCC2x6ZEu95UmbFnaEQegRqAT/BKrtiYoIlkdYhvgFkmAbL5QEhNdfmr6BcujS8Z9xbx9sonztIX3DTqnmdlAzf+3JdyBatFO+9BsX2y3bKrVal3p1R9w78/IspPZlA7Hruks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779083651; c=relaxed/simple;
	bh=YtpqEH73oXHK47yZ5ixFx1FBt2jaIIXqgdKd4AtJuXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPV6JMkl0OT88dWEpBWlcAEsWpOqJOFjA9e+A0WQQgeOpH+Sejxyd250t5+/gMCaajtBSmE6Qzo2nHXTFnU3euxbkZOa+6etKffxamUY4EIZOFUFsM4/IDdHXU3SsDkgjQMs0IE0Pv2zMpk0N5zg1ega4bBvvilSOPic5uED/2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+CCTu0R; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+CCTu0R"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso11190125e9.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 22:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779083645; x=1779688445; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XE828kGQfB1YOLYw6olNLyuMatDEpOksBfYxDmp9B4s=;
        b=l+CCTu0RLBMqQsYTibPUL1mtB/+r3YwNZ0qaNlO8ugiJfMM+F6gsbBJcLSxWEiia48
         E9sNHZrc64+Gnduz+sK+/x2P5YzYFFWRyO8nz9fTjuDHNGRGrECnFYg6NTTilkUoB7A6
         QkDlsf2AkQK/FQgCuB3Dn821Bic6y0jOKpgJLYAbN5rIoMDh2FnkGIn2vBgGUyew+QYA
         DLiU7VoQtinxquAxPORzuSqfgzg3E3Y9w7p8Ir62wmreRNB44bM0DYQXF3tFWtsEEtup
         kOGAg2wtU/aIjiMeWLW++Bxf7VOJfTV7NNHsBstdAJJeYkaX3hClaxbCVqcMzRiRl+94
         fLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779083645; x=1779688445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XE828kGQfB1YOLYw6olNLyuMatDEpOksBfYxDmp9B4s=;
        b=siCUJ2F5vPWdaZsi+xXWPi9InEqOPDXOvVFk57PrhVrUQ2vDiWXjGQRoHmgUQZcHyG
         tW96b8kHhQKZKqyv3cV6pirHqP7ps3lTheKDI1cs6fiDVBi3DfcbwbbKDxcFbw6YcK3B
         opN6W68hOAmr3yTCmtTc43/P/NwJsQxqInqxwfbqjNaPfmX1J2ff7YnjPThLpSCDcKj8
         kGevfOI9t/nplHtLEmaBvPn1gcy0jeT83cSEwMZNUt/MSVTuGy5ik7qiZThFOW9WWUJE
         HQA8uz4qtEBRmNGqat5w7+JWwOXxMRDpBkVGXrJaVxScMdXhXANHmsoLJ2gbGfqqJj8M
         W1BQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cq5nk88MUFlMDkrnnDr6bZYGDa4DJO7WiDN1I4zeAeJydTpIHozX3JeqJTRGczvHiVY9+J0T3Dhtt+GHd@lists.linux.dev
X-Gm-Message-State: AOJu0Yy06VgfwgeTfhv4vsGTVKLzdBdPaCuXZbGaEI/SGXAlETrGjxuV
	NS5AswnSjmzmiLTbiMITbdhUgecGl7T5TFrgmMhg9khIK7C0F1BA9z2J
X-Gm-Gg: Acq92OEu8HaRqejgs3NOZLt7iQ5lRMZyMp6ZNETCb3+TnZQN5ySdr6Daekoea4sycwZ
	mSxin7mjXO6+q6nNzlVvD4V5v5SKDAsOXQ3M1Iky2IAAcX45+WQlF6yuapTWp7m1bk4eq08hpGe
	DrHsYCpBSBaK+KRTRD2albqv9sT1kOVpWAl3t7OI3deZIu6JX7NTWJIyzxLwa85xnoTl9kE5beH
	mFhm72l6qfJ5qiiKF96QFPJDhI6dDRFrSRbbCv9cW4HXOBsrwjPWVLfjE596hQw7Ru8g/8fqxD+
	X9s9YP9cwvDZaUWdE7KWWDM8Eqc9dDSw+lWpvptJzGuKLgFw8Fphv11QZ9GcpEZBkeaAhMoF/GZ
	YxycHsdAWl7GP6CQtJQJ749Z8AlkPu5b4TmLOtcayrcOOr2Q8nEIYKmVv0DYM9dP9FZCkySKa1o
	FLhkOFAs+2mNXgxZR//Vo=
X-Received: by 2002:a05:600c:470e:b0:48e:8741:fd3d with SMTP id 5b1f17b1804b1-48fe60ea21dmr185074965e9.14.1779083644768;
        Sun, 17 May 2026 22:54:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm35275603f8f.35.2026.05.17.22.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:54:04 -0700 (PDT)
Date: Mon, 18 May 2026 08:54:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: shayderrr <darknessshayder@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: octeon: fix carrier state, null guard, and
 modernize phy ioctl
Message-ID: <agqpefJAG-QMcM0_@stanley.mountain>
References: <20260517141955.79666-1-darknessshayder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517141955.79666-1-darknessshayder@gmail.com>

On Sun, May 17, 2026 at 09:19:55AM -0500, shayderrr wrote:
> From: Pranav Bajjuri <darknessshayder@gmail.com>
> 
> Add netif_carrier_off() to cvm_oct_common_stop(),

Why?  Shouldn't this be in it's own patch?  Do we need a Fixes tag?

> guard
> cvm_oct_adjust_link() against null phydev,

Can this really happen or is this AI advice?  Shouldn't this be in
it's own patch?  Do we need a Fixes tag?  You have added a
WARN_ON() which basically means reboot the kernel on most systems
so it's discouraged as much as possible.

> replace open-coded
> ioctl checks with phy_do_ioctl_running(),

Put this in its own patch.

> and zero priv->link_info
> on stop alongside last_link.

Why?  Shouldn't this be in it's own patch?  Do we need a Fixes tag?

regards,
dan carpenter

