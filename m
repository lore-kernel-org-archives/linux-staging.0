Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC1C3890E8
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877813; cv=none; b=tnTq5daUEydJJD0HZPFNi00yn4IzC5CSrjRmJgWXEdufxHqf3JOM1YnvT1s+qlazswZmSbdeAfgMm6ytqmPNxc+YEOEGr8Leh4yrEbVSWS2RSHz9e1f+lhBXSg/KDAWWgPQ99ChV+8V7GklsELt1i9lY4l3H+3XjSN+yqs1JiDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877813; c=relaxed/simple;
	bh=tPzArETgTWA5K30DRMtFIey7+0GzDvruUvLN0+7n9J8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGetDqhSB4DWrYByFxtEklFoz1OIbFHOd2ln+umCZrJD/Uu3hJtzx4RhcoefBgYBW9mPhFVCXY2WLnp+T5jBz25vogQnfcigRMd6i1CQWkRr09jfH8j+cCw6hMyyH1louJwDc98Jtlyg1VldLMuzWrulCi1C/DkJi3aAC58VaPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeMGbEhi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeMGbEhi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso24001935e9.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877810; x=1792482610; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yHsj5QKWGOPbdX3F7/TYXqcv688FhIr45BbI5StNbhA=;
        b=OeMGbEhi89nOWufsvUFbifTRGUojcB86gs10M6bjOys4ilexhq7EotXfQp6EYevdS7
         MpFldU56xhXrtXOiK5Yu6dyW5t9YS7C0KNbWWT7WhynVkZwgFnYrAx6HkZLcnjQhNb7+
         9d0OdnWtWi+yOOs/HxT7dczVdeszV4/m6/dhg6/nqeiJJLgv2W+eHf4fMjYvMO3I2IcJ
         YnaF0I+t/aD5DiiEoJFXGrKEM96Z1s1GOA3bGMKShQzL6IjG8oZVD1uBuKU0XLOmVqRW
         WGLNCxJeMGvvqaiggZoPdFd3fsia7aVpHvphHwQwlbf9K4pH/pkBJsnFNNxSE+Th9MvA
         pXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877810; x=1792482610;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHsj5QKWGOPbdX3F7/TYXqcv688FhIr45BbI5StNbhA=;
        b=GgmHmx/txJzFa/5NGUxGvCN9SpjtrKcyhZjU0k2811N60/z/Yl6t5chzhWZKyRoZp3
         vEbIBDKHPBPSS72XcqDatJ0nKajkzBBGHfaNieT8IVuMZCRbUp4JyHYiqxoPsRQYLF8V
         P080/PU/lBgO+a4eEsHg+dP9abfK45Ir+/U43QZJ5LKMb8Szp0e9Hj82OPK3n4llnoJm
         haR0S6VK9QrOUJ00vnxO646+cTwRLqS69hlyPejF4KB8bIl+LNMP6fxoKNQ/lAoaYlKl
         d3/AeSBTheHwS2G1vRazBL/pGEIjuxXGRlGZdYV2YEXTOp+PSugf9IhBSh6k2ThWqe12
         j2bg==
X-Forwarded-Encrypted: i=1; AKwUvBxVgrYds2jQv/IcdCgfH9V4MQIqFn/8PZ34nEq4ZkItx6ErIwCNMvCURSroNCircQGS0okAMQMNfvmVXqvb@lists.linux.dev
X-Gm-Message-State: AFq9FYL/hWKNrzkt/ZTAvASjpGicF/BIMnehFEjpFoRAogCuAedDtjmd
	lawvjUB+KkPJlSyt4jfFsr4n/vFmBkoWL/yxuRcEnDto1+7+CYI+2xTS
X-Gm-Gg: AYBFou2DYvi0TD6gy0TevspUvBIr02SSo+YaNi9J9O/CA7oozouIclFrwWPbnryx0Ij
	JI2ZT21X/s1h0W6mdQ9jmG0S1o2tkDwci7ythhHent30D7TBJ1J4Naf2a7tF+uHB7ejy/tRAzo/
	cjQYJ/vDu1psfRN2QqAewUWcW2lzGbfieT7PzbjQaXynmvRUFFylhMY/0849oS8MVDMw+5ShbT3
	ULlPnAJC3B3mHOSmndMsTdoCQmbtTbuYPlJUuZdWWstsPVtSQAEW1edqaLYV07xrVTlLCCC3xED
	OAeLIDRXp/nP+AjAIARhKF4p1Dt16hQlXhtnpIgFIDZ7FCnn2MPR6ycB7Gly63bm3Smt0lCGNgd
	eqDeZcwO9zACjrHso1fAtVF6zgirKJr2IhHHE1bNkMsPwNEEoRb0VVLrzmdAwyNPzhvqBiF+hyp
	gy+BFIEFxlvVXqJjqZntKzXb2KOM4FWcl59jyaBO9drrTGKaDyZRdLzwGFmwjHICPIZXcjkXJzM
	2PapqbVxjNK+LM/S7nkwFqDngAPsq2cdSBrVjPt53s62CAWaeNbBEM2ADFHEtWZa9ov+Rkp4DJI
	BUf2sVZYSXl7B4SV68uY1wcH7pbqmVE6eyI8v5LqEMGWwk/DYlzTueHs3fomOYbDe0kWP89vs4o
	PL+V3CIs+F24eRmIeNVZzSqKBgZ71Fj3BngaSOQWrBCklZdq7VbSuaLk2kPJiCYPhLKZLEnRVAg
	l4RR38
X-Received: by 2002:a05:600c:a01:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a18e4fe3e1mr244984045e9.35.1791877809809;
        Tue, 13 Oct 2026 00:50:09 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa05sm3203538f8f.13.2026.10.13.00.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:50:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:50:07 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: raffaele.tranfaglia@gmail.com, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux@analog.com, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: addac: adt7316: use dev_err_probe() for
 ldac GPIO
Message-ID: <20261013095007.000052ae@gmail.com>
In-Reply-To: <as1Q-au8dpp9YFeG@ashevche-desk.local>
References: <20261011-adt7316-dev-err-probe-v1-1-27a4a8ac74f3@gmail.com>
	<as1Q-au8dpp9YFeG@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 00:28:25 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sun, Oct 11, 2026 at 07:56:22PM +0100, Raffaele Tranfaglia via B4 Relay wrote:
> 
> > Use dev_err_probe() when requesting the ldac GPIO fails. This
> > avoids logging an error when the GPIO controller is not ready yet
> > and the request returns -EPROBE_DEFER, and records the deferral
> > reason. It also simplifies the error path.  
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> Although not sure if we need a Fixes tag as it might be an annoying (but quite
> rare) case of flooding in the dmesg.

AFAIC this is a cleanup rather than a fix. dev_err_probe() conversions
don't add Fixes tags.

-- 
Kind regards,
Joshua Crofts
