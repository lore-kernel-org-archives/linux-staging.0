Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265713806D0
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 06:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937270; cv=none; b=bADvs6VZ8HFLi6/ZNm8J5DCiy4xOlMe5V8zD8GCfRvbMCIxCjXTblNdYBjx7hsBSqwZbsSvbmASl29eLzG+5zrULbOx9UK5jGpga9zQYFgJHFZ09UrG2C9+lFOoxQ4KhfrdCgBc/02mJY8sBif7mVCfBQQEWWNMMm8Rs9Q3NmeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937270; c=relaxed/simple;
	bh=Hgx5rEYeNiY7pIGRFAxlP2yioN/2yAlf4o4kAGqeuC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNLiifpk1Rcswe9FPlSVp8afHwXyJYuP6lAJdgqhfboCT7aHiaZ+rlVduF315GwzycA7WbEcOBkNNsm1b9nrFct/sDDVkjBuXFmrBNf6rO3T03WigK+veX6k03mtPFjo5n9MFWeVehatnnAJ1F43H1681QhtcROCCih0z0lV/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH9cmxJE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH9cmxJE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486b96760easo57389945e9.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 23:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937266; x=1775542066; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfZlPXiNzbz0xvep3ZCo3J42gvY8JrXf+H7DC+g2RZo=;
        b=SH9cmxJEj7O2Rn4DJX6caMYdu02JgoBhHFKOyKn9QpTjcwnmibdGtqm1FSEn1/+Fwv
         11+ggwLtaPP7NzhDI0lp3qeddmvAn59+x42HQyd4mEwD1PKEoQG1lnWXHXtgCj9/YIrt
         sPn+ERgdfSM9Ni1IIZeRjNPOgQi7mLI4I5AEzJKtqhGgNCxsQlPrssS80R3tJPpAsUtG
         w5homtjAfS9K0HlPsXkTS2jNdnRYgYsO1hmBCwS8iuXVlhT7G8fmiIZOSedO1D2Kq9X+
         LWpFhCtt16GsSpk3zGB6JO7LwTQ8vOUyPv3yR90Dbg/hoEMUI/yHBTj6mjn15B7E+PMe
         2RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937266; x=1775542066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfZlPXiNzbz0xvep3ZCo3J42gvY8JrXf+H7DC+g2RZo=;
        b=n8hy9fN86jjQ/0qGTkPc0KWiGV8w0G3tu7jw/MRmUWFYY/XJ0txT2++jq65pYNMbN3
         81eMbjA68o8/EUqUtbLn7x8o7zn8gyJ9sSJ5fLLDLcfutb9DN+ekRh3R/wIkZgPb+41j
         ZrP5SiMG4h6sbkKHDWshtTliaTO6wbtQYPJEkrlpGbMab06J4oEWiA2FjJdoTWJ/i5zv
         EzlCflElcFTdJHNYYlrY8wUqxBBLp+htQ2ez+V45QjFcyuk/mggIixkKUSjvnDu8nfeX
         wKBmtRxaUOvasfb1BHT3sWFKR1VAfWPcMVH8Qi+WbQQoJJjkD3WCcHli2y1/P5/ce6Sf
         lZHA==
X-Gm-Message-State: AOJu0YwFmF6EAqFHO3x5pGQMrKF+6xWT/VMx4Z1o7MLbGYovw6b3/P+X
	zRJdYwFg/Fl6Of6YsGjm+lKz+zef39+n0umCSiN1ckoGu1Raa8JEhfr8
X-Gm-Gg: ATEYQzxO3+WSAFSt7cFto1aonW/kReGVPRSf4EnvFIbqEGOtzE+ld6cR2pu3GIw3dNP
	lekwp8Zt86rD6sq2DCEXbC27nyIYw1K9ry23hgbF0EZiVR7lUHbvDXhNZiVIDpNJrTVNOR8CHnu
	VB4bIdwI6zHICcVDp1Ft007x6IUxjeOQC+VlUj9tMXBnQTuooFgVn7zWtTrT/ytJ65Is88wiUxo
	fpF9YoGZaBuuRI8K5WBDLpUMyzBWwI1XXNpGTA/AFydenZCowD+x45jMc18wAN/FQTeIZeEVXjn
	mWcR3jhPKH3/HX/eeGJRtWih49KJpMJUSYABoUPkP41Hr0tbsO5Q75aOQwfD2AUo5zyaIT1KZEc
	VfH+dnG+MidgJaDsEDhc1SGPfRJAl4SxQB9xK2J4YISfoL83pzBl5e8Pi3V3xAQra/+a/q2DkYx
	vZ1H+wRmzO97B/ylEyzUucU0bdaH9OPg==
X-Received: by 2002:a05:600c:a408:b0:486:ff92:63d0 with SMTP id 5b1f17b1804b1-48727d73370mr197462825e9.8.1774937265940;
        Mon, 30 Mar 2026 23:07:45 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm11197345e9.4.2026.03.30.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:07:45 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:07:43 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
Message-ID: <actj-9_YQqEMO58g@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-2-azpijr@gmail.com>
 <acopy6nyxSb16J8N@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acopy6nyxSb16J8N@stanley.mountain>

On Mon, Mar 30, 2026 at 12:35:30PM +0300, Dan Carpenter wrote:
> On Sat, Mar 28, 2026 at 08:21:37PM +0100, Jose A. Perez de Azpillaga wrote:
> > The function configure_isp_from_args() incorrectly dereferences
> > args->delay_frames[0] to configure cropping without checking if the
> > pointer is valid. However, as noted in a FIXME comment later in the
> > same function, delay_frames can be NULL in certain pipeline
> > configurations.
>
> The comment comes later in the function and it says "FIXME:
> args->delay_frames can be NULL here".  "args->delay_frames" is
> different from "args->delay_frames[0]".  Obviously
> args->delay_frames can't actually be NULL there since we
> dereference it here so the comment is wrong.
>
> If the correct response to the FIXME were just to add a NULL
> check then the original author probably would have done that.
>

yes, I misunderstood the comment. my bad. I read more carefully.

...

regards,
jose a. p-a
