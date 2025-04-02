Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2520F07C
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 07:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577930; cv=none; b=jZ4SnDHYnPyiXMqdJwtA36GqrBAOikzSDQSVcb8hmOOfb8mtXaQjnbcu8AjnDn2zKsZR1jk8uKhVwugmSTUG6+jPJ3dsB9dt2X3hXRIjxIaT5mFCysWTp5fEY+vRkctawo7I+tZxD5YT4OkmVm2WPtdLuwO3pl/ndrJB4iCVq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577930; c=relaxed/simple;
	bh=6iFnZi1P6witgBKpE/o6BqeB6+V8t3TakEte9t4WYx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tevm3I2MxsKAjHSyXcNiYbyVuTqDGMpCPsNs+zpgtl76JEINSgYKZiYLNOvAzAC3IlIojH141MpA4/tZi10BsWbQ76TT1+BOvGUMPPUaWfxc5wcZt0NjrT9//YapJJ28Ca3JmhRdR+JyJA1csFzkI991Eq0Dgc5PS+ZsN1ZZ25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6OHZIP/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6OHZIP/"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac73723b2d5so771177866b.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743577927; x=1744182727; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iFnZi1P6witgBKpE/o6BqeB6+V8t3TakEte9t4WYx0=;
        b=Z6OHZIP/kNXYC0P5q/hm75EC/aPpAtsIBsrJ85U7KRfVIoV7gJOEtnhjB+x4ADdcSa
         RTXYc+vBa88ZFAfhljcOa1ci3jT6l0zwGPY7mN5brx8CI6k1T6fxuVM9kkGLvgL5UqHL
         3awwCztAoeZb4N6j+Ayk+KupI/aatpSVYxkyT9XOJvPuNr0AG6NpeMBRES2m04KEYo8B
         GjROKW57Q0suvrFTcrI+DrjLik2pXHUvoR8ZJgyz14kTRAEZ8CI8Vtnqexb6VDVIe7Qe
         fKVWbR+9dgiV986j6nUAFfvrPeBeYbuDn4HAwz84xeRFIgpaBoernzpkQLs5FoOp7rKu
         I0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577927; x=1744182727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iFnZi1P6witgBKpE/o6BqeB6+V8t3TakEte9t4WYx0=;
        b=s0+yLli1d3WVCYzaNmDv4D7ULaJpogukdk7D67ARCqqzPPHo5SZICeGkcVbR7YJTLm
         S3i67Gd0ygwcb/H6yrG7TMOaIpYZ8j6W42WCBBMWvnUUvJqZNpthrdc5YJj6ojiYLf5H
         0ucj3SucJMucrayGwKQXehoXvvYmiUr6a8BiHhErVrxB5rWpYPBF78dWojhS2mBF6NZ8
         /bcahQ6D+/xH7h6TKEQ3KhDIDifDDM+fRdBgAE+FyQHvfLI7H1aJM2wKWwCYP6VO+C6w
         X5ejqH7eWaJ49UHtyLvybzJnvXXoWchz3EGUfii5aeYQOUQBxmCirzRLSZ3ljBDDaO1T
         7tHA==
X-Forwarded-Encrypted: i=1; AJvYcCXMeeZ7tHZh3xFw3Nh1eshh+G8W64uiQeC1JAeGs4fTrJ/bNEMkra16n5LxXvEMsKlvkV11wR6YZYCYNZux@lists.linux.dev
X-Gm-Message-State: AOJu0YwqryjWMVt0tuJ5zvPMRy2XY0yb91/HD+wTyYVHzguNG+QQAzQG
	8x4FrPGsPJxfgGClF7CGpCsDnHG2c+MMU1DtyLRUA/IVUrsMCntQq3HbLowOtCrO2WIWicnEEy6
	kd5miFZIYF4iytEfVpvExjCLNLI0=
X-Gm-Gg: ASbGnct2GGuGua04GEosb0fbDrTJhWjHy2b46oaypD60mltCoLmXf1BPa1ZswvK0hO0
	lIWHUbabAAjQT0Ctr8l/QYkVqtamyJHYD3gQvd03YVb5UouxPMVw+KbC+ECA2bLvzJXyqWFe7uE
	tJL3cDMnFTCaxzLU7p315UAJJmlA==
X-Google-Smtp-Source: AGHT+IH3BWLD3tLCVWSUmZRZKrED9lsK1vHEHE8xL52TPa7BRnKW6uUV4Ea/o9T4grQl94+wGXUom+Ok0bulUsWSu9o=
X-Received: by 2002:a17:907:d91:b0:ac3:c05d:3083 with SMTP id
 a640c23a62f3a-ac7a1799930mr91105166b.35.1743577926958; Wed, 02 Apr 2025
 00:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com>
In-Reply-To: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 10:11:30 +0300
X-Gm-Features: AQ5f1Jr8U5LUwv4hCvfjsR9vrE7hdyKZzBftIfbzMD_OqPBdJ50H1aovTJj51OA
Message-ID: <CAHp75Vf4abzcNFwo2W-=-fOr1_j51RAUPxDbGNVX9F-Soxbs3A@mail.gmail.com>
Subject: Re: [PATCH] staging: media: Fix indentation to use tabs instead of spaces
To: gshahrouzi@gmail.com
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:40=E2=80=AFAM <gshahrouzi@gmail.com> wrote:

Is it your first patch to the Linux kernel? See my comments below.

> >From d6a08153171ac52b438b6ddc1da50ebdd3550951 Mon Sep 17 00:00:00 2001
> From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> Date: Tue, 1 Apr 2025 22:04:25 -0400
> Subject: [PATCH] staging: media: Fix indentation to use tabs instead of s=
paces

First of all, your patch is mangled. You want to use proper tools,
perhaps. One of which is `git format-patch ...` and another one is
`git send-email ...`

> Replace spaces with tab to comply with kernel coding style.

Change 'tab' to 'TAB'.

...

Change itself is okay, but is this the only one case in the entire
driver (which is something like 100k LoCs long)? Even though, and
while for the training purposes this is fine, you can also think about
checking the common style of other functions, which may be shifted
with TABs, but still having not enough spaces or so.


--=20
With Best Regards,
Andy Shevchenko
