Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B262256C6C
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 06:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937473; cv=none; b=hHrhzbEGHaY5K1uqZNDzwZZdRy0/fgR7QtFECAprnn3PdG3yL15tdL4omVr1ACdOsSpFBQCAlvC3ZZup21NQE+mpKLQALgzC+SgCFlQCPAeWM3wg+16pFbBqN3GgzM5VoZkZ4uHIFzQS5uEUhya/tJDAS5EpoICuRaYc52p7p4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937473; c=relaxed/simple;
	bh=TQEPhLFbG443oi66SYnNeLKncuThmRO45JTbf+qVA0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPfQBv5ysKdYisJWT21BeqnBbFbaaXSxXZCostjT/+J5kQfDUDZthSmA6kQQBaub6ix2XvH9l+/QchVX+kZ73WVG4/GbeZrdDh7SprZ+9iz6tK3laV/My7KEvC2Mg6NujyNIto0CwziMhLt13K2t8Syg4uviJLbC6mbqF6Yr81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJ4xHuCt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJ4xHuCt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f454be5bso59255705e9.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 23:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774937471; x=1775542271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri+6ec1xbEZKw5nXyB/FNfkgPoFjjyOvcOi3F8Vo/Pw=;
        b=JJ4xHuCtw0qajjLgaHVU9rlwHaOlttPJ7nYCM/ParSV8rTal+U5fCxsYp/22VNOaPJ
         b6XRCkCjnjsYGn9V0JiueC08SZMxOjVToPxUbyzIa4OcsHsNpOMqp7/nBxhMfoawQ2Yj
         wIUHDzjk7G7/k9spDkajnqIL/1Kng1WBahfbwEUrJCDevYX/jbTWdaCwFcAnd7wMc0Vv
         P6gEaVCvuzGSfZOze4uyo/QJViOB7Xgf7Owrq2lgfK+BYNX3vhj2B+y04bgyZyNSIqQs
         0MJj4LvI/y7qnKBssyqzgBZ1aUvQC8fUwIEb9FajuGkS9SauZdXg+dcWJtoqKEdT1Z5R
         2VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937471; x=1775542271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ri+6ec1xbEZKw5nXyB/FNfkgPoFjjyOvcOi3F8Vo/Pw=;
        b=W7KNCsOoql/T/fetDJaZiflwE8EpTGUhRECa1sa0NIIrLqruS/C4ai6L1fQTyDmSWt
         xJIr5mC9gCpLWTqmZqUQu8seuvmxZBWnAWd7jJDa62LzNLc2ll3u/GWYYFsLDqGy50rE
         qIKvs5VbLPvDbShrWg2dGbo3tIFYJbpxjIScbhHZdsBYxmQvyovdnQqddRcTIdMfFB0J
         dYpPuMAPSuSQZUpkq2NTPUlasWZKCrWas0GcJ8oXq2CVDLo+NAau89Hn/exZijAC3Bu+
         48O7nICqjgQIlqYQvcyRlJe1BRYdya3RH/OyHF3DddrKMSCjntz0AwJpN3YIPY0AKHVO
         j+GQ==
X-Gm-Message-State: AOJu0YzrfRX9Gh8dZXIhZc7j/J1OO4pzCFsJUVnxzCgq7W2Kt3T0LLVn
	LwxpU6x38K2ra/E/VVGikEBUr0qLn7sfnOvtpwelHq0F78iGDZwtXF/NwcFCuTat
X-Gm-Gg: ATEYQzyoFpDMo1OiMFW20nbacbzNzKYipK3wDxu70nC3zfj9GNu9K1xEUWyx4psvCxz
	KdVVjskum9QY5eNIC5c0tk/SH3H8BIXDLw73g6mugHcKBLzZjQXVuDHBiJtU/5TL0QZ2jIaJj0T
	b48LvrZIkCwNsMfDhVjY3KmeNgcWu38Uye/I/HeyfDV3goSFxCSbg133upYDilxHP9GFtdTeqR0
	pqUxtCVzgeHMIV9L2CqLIsSe7KUhyKi2H92hscZffzN8KyUXl53fWhpNpaGbO8v5no9TY5dVI9E
	AX5kvO+P8y43KwEhxp2JAdflBe8/KKC5T9T9JR+UhIlbehgPq7hrq/QfswaPSzTHMT9KC/VEbRT
	MN3JWgNd3Y8VzFW5HmCQ4mMp8MXF2DsCu/jyZQ8CGJ32m70Qs2hOXIdV1aBwd69D1mjhjU5o8ez
	Abi+/UkcFG2xxG7Nhat/vHs0/JIrw/ug==
X-Received: by 2002:a05:600c:41c3:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488783b1117mr21061195e9.14.1774937470676;
        Mon, 30 Mar 2026 23:11:10 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1882:1f28:c460:96ff:fea3:6e21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm12499275e9.15.2026.03.30.23.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:11:10 -0700 (PDT)
Date: Tue, 31 Mar 2026 08:11:08 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <actk9nFueD-8FSaa@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-3-azpijr@gmail.com>
 <acortY2LJ9f1K4ju@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acortY2LJ9f1K4ju@stanley.mountain>

On Mon, Mar 30, 2026 at 12:35:34PM +0300, Dan Carpenter wrote:
> On Sat, Mar 28, 2026 at 08:21:38PM +0100, Jose A. Perez de Azpillaga wrote:
> > The function configure_isp_from_args() contained a duplicate call to
> > ia_css_output0_configure() using the same output frame index. Remove
> > the redundant call to simplify the configuration path.
> >
> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > ---
>
> This feels like a guess work patch.  Sure, it looks like duplicate
> code but duplicate code isn't always wrong.  How do you know which
> call to remove?  How do you know that it's not a copy and paste error
> and the right fix is just to change the code instead of deleting it?
>

my response here would be something similar to Andy's one.

> Patch 1 felt like an AI patch, and this patch feels even more strongly
> like an AI patch.
>

ouch.

> Please don't send guess work patches or if you do add a giant comment
> at the bottom saying --- "This patch is a GUESS.  Review carefully!
> Untested"
>

okay, I wasn't aware of that. I'll try to add that comment or better
yet, not trying to fix things without the actual hardware. thanks.

...

regards,
jose a. p-a
