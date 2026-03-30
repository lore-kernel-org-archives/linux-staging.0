Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B253B5832
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863341; cv=none; b=TXfpWgudld04XKmegfP+CSbdXXZ441/nHbLxC3pivK8PIIDgZEj8f+czTu1cGYp5FmhVeR90y+75kJu8WEp/8tO4MeJXb66XzcvszDJWfAAWigLoCCnaW7ewXySiwGT3KZVTKrSmsYT9jVI3wrAWSo+C396JywgfK1oW2uEzdSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863341; c=relaxed/simple;
	bh=/XueMGzPm4zPnQnHxrbXHtgv66p4UQa9Q1v05wFCHbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/dQvbxVH2rAWXHQGa7eeKP/EX9DlVU7e+qWspdouwAwycGofrAOZTed4TRYqU1S8JmeUqiz9bf75j5pcO0GAO2m9KrrQlBsQmEu9keJKB+cZ7ZdkEkSt65GsfrZCbzEeCxt/EUhNxNuYmIVijh33a9QS5GAfZtLb/87EQVq9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKZ5OADe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKZ5OADe"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97905516faso568890266b.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863339; x=1775468139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BL+71OcAEP7wDYzWwkyQPFAXej1i6XT+ASBhRFYtYs=;
        b=hKZ5OADeyFeUjtCCJTVyLivZx+MBm6+mude658iicsIekVwLz5jqyuXvkT7ch2glXo
         13gQSfx9s5xUvlQcyuzPJsn3XIKRQgvv9wHRvqincaD0916PD51k3V96D1wy1i86fxP8
         LcByOd3KT9iasGLOEHPKgrfAFb/qPmnGN+6X/y91OfdQRsmED20NCBc4X3wZ6Tegr5SR
         aJ2I+a0uutSF/VsShxmrhHd2MdV3jZafG5XxpjH7SMstylm7vxM1Jl9nS7uZjx092axB
         pKB8j8opzcR9UxMvCjBlKf3emcGKcumy+rX13e6Zjxtv8udnGLwbz12nzniWCb5mMDaH
         oqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863339; x=1775468139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BL+71OcAEP7wDYzWwkyQPFAXej1i6XT+ASBhRFYtYs=;
        b=NM7tmTb8s3AntE6In7ov++wviVa/EpFC0YnMqzj9cA/1kDJ+zE3DubKarrT4YZKaw4
         IROwzXmKTvLd0tHDyONUlqR3AhI3MllSa+e4DB3+BjbQrKhUtTvne7KJhEdrCkruWVjk
         4yefo9yqbg+s5++7uE5Vt07qY+l3HzRQajpJ0eMAS9PmcetHidfmqDV/ZdHo/F0Buo4N
         R425ca2dQ5RB3cl5OC/+CmYGfk3d4QeQPK6yUbPpMbCARNZ1TcsDY/I74k+n/62XkjS7
         HaKJX9DgUNVyvb5buLRJkzAXxhk22WEA2izWzJclizm0agWgBSjHaUFj+wP48EGy6cGt
         GYdA==
X-Gm-Message-State: AOJu0YxpemaSP9ifcYgAFU+pC9i2LRv1PP6mZfnFvGV0lgOUHylvuK1i
	L0ZKMUI29JtVtzPlWP8yLbmpF3Ctb0n9OXWGDxpT3TDKtOYRD4UVICoT
X-Gm-Gg: ATEYQzwMCpvNyItYK9t0sHjeThlEnfRv7WjR0fNjeMuJ+HNHj4fzkodv0A1V0ooDCSY
	IhDP5RSKCbvNCjcqnkV5bA93EVIngMR7wWF65LpNr5HHwS5z6cszrsU7dg9VvjNH0cAQ70EQNdo
	2SQ7yuubOgmsJ8X/qMQouOjWZy6tbbMNTxjYD/QrjtknERoalQQnSs5MS/KOEwteaI1lab3c3Rv
	iMCWHm1Ud2HU01t/yVxiak5zYO3Gy9It0KWHZoyl3uTNBOyp1DCZ59gevHGl5ZAu2s1A/S2FbGn
	2ucPZ1J5qeaMkN8usodNp/akUMWJ1WG+TLgIByLZUDo37ez9neEfEBW7Prt/Nvu+tHgL8aVRRgG
	ZQs5n3YbHCVjfzGDxaAcD0P3EjkEMQINJvHyUbEhS5c7Yi6lwduuxsQLkL/haOFOre1N9yeUFWl
	3p0J171IWFuJPu+iQdLQ4=
X-Received: by 2002:a17:907:80e:b0:b98:29fb:f32 with SMTP id a640c23a62f3a-b9b502b9148mr792518966b.1.1774863338773;
        Mon, 30 Mar 2026 02:35:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm250626466b.30.2026.03.30.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:38 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <acortY2LJ9f1K4ju@stanley.mountain>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-3-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328192721.255493-3-azpijr@gmail.com>

On Sat, Mar 28, 2026 at 08:21:38PM +0100, Jose A. Perez de Azpillaga wrote:
> The function configure_isp_from_args() contained a duplicate call to
> ia_css_output0_configure() using the same output frame index. Remove
> the redundant call to simplify the configuration path.
> 
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---

This feels like a guess work patch.  Sure, it looks like duplicate
code but duplicate code isn't always wrong.  How do you know which
call to remove?  How do you know that it's not a copy and paste error
and the right fix is just to change the code instead of deleting it?

Patch 1 felt like an AI patch, and this patch feels even more strongly
like an AI patch.

Please don't send guess work patches or if you do add a giant comment
at the bottom saying --- "This patch is a GUESS.  Review carefully!
Untested"

regards,
dan carpenter

