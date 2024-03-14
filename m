Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD91E480
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 18:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710441860; cv=none; b=Vs/QGH6Bh5BFBmEtXVXdyeJEHXVINQ998o3wOZdYexInm9nNEnZX1x8+aRJ83qDuIGfUyBZA4s1Hr1Dw8HNLhgHfBpUiNJ08l5KEyG720muZXW2Of3GYAhzsi/tM6ANCQizx1J7FuO8/EZ7BCCaYlA9Qx699QdTo3OxVfYEbmKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710441860; c=relaxed/simple;
	bh=kJz+3GphfQRjGfzcUODxvqODVcMOmDoo08SCKA5W6Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7B8VwWToDuuLxvOAC6JpdtUd3Kx7zKrSbFEVZjbUqV4YfqJs9LUH/p95xPbo4SmEU+hy4kcDITL0lQpS7FGiqEoElwEdss3V8vsi27j/5lBhR8EZNxjQ0JWvWNAyfRqMhRUyRMECLYzDDtfSg8CNMQ9gdcCEFqFv/hJzOsEUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaY2JIYJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaY2JIYJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso1249686b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710441859; x=1711046659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJz+3GphfQRjGfzcUODxvqODVcMOmDoo08SCKA5W6Co=;
        b=EaY2JIYJFGyVomQlXXJTaG7qbJzSpAi9JrOWZD3u0gyXO36eh9jP2dJK6UEOlD790h
         ZWxFw6L4kfaaIREuHnBKY2zdZLy6qDEwgTQyyeKbNEZYwrTr5a5dj392pUrZ0/oHZyaq
         uuVps/qH8dhlivMU1eWiKPYpKRJLsJpwt6jyzrrqVcvJJbuAWtd2s+LTRFQUHC6nOfh8
         0v7iLDB6TT09xbaxaD9dtalj5ZFIMUhqKz+Kp1HFHBJlxdKnnJYO3Sk63cGZnLz1kJ26
         wDnDj5DP2hgJRrdIcw4yTwyBR4AiGKpGHC25PAJFn53tea+HyzMttRR9PY6Q5k1E1V7O
         cJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710441859; x=1711046659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJz+3GphfQRjGfzcUODxvqODVcMOmDoo08SCKA5W6Co=;
        b=i0P1yaiYcCLomjh6GXU5WVAlY4iQCjj2VHoJ2X+QxBiz4yBB5CHMpSfr81iirWI6Ig
         uwXmLJ+lZi41aUUi7sAqm7nwOT3RitJmddmrCjSe6H1hPoqe7K1AhJcL5mbGsmgwx9R+
         PKIVmZcWQ9xFpJlTX4rLhi5/I3W8BJKNp3Y2PKGcv75qKJY+hbJIMbyGZ6zqMKoBlIAg
         5U0F+k5uCHWVK/Aw6GdeiFIVuG5uBxuflvXrlJMW+ZE+vnOkUmeFX84VaEvlXZAKm2AB
         m0HM6HtvknOrfLii1vr2kt7Co5VJUYwEF8dUby7RM5Vf/ZC0ywZTN27PUgZa+OpDhWbs
         kiCg==
X-Forwarded-Encrypted: i=1; AJvYcCXzMxDWpwCex1Y9qMaa23qWH3tr1YVgSYOTjOMCDmwbIXOfvxT7WcfT3F8KodceucGbqGT8M7rySNUBkId8mxf8lTspP9xX2cISxxpMtg==
X-Gm-Message-State: AOJu0YzG/LTv+0Vc3nfSUGwniZshG4fGp/sF6yTHKUz+/WVVzToqVdG5
	HXVWdNDocSTC5BMy5YwVG0LbePnMJrImA/Ffg0vLSNZj0yBVyPgJRJ5w/FEEnWOtfC92sHqNBse
	q7fh3Yy8ZrMKYautbbCisw2/A3/E=
X-Google-Smtp-Source: AGHT+IHVh0RTfRsRb9qBzH00kDp5190hZcjprlGA9pYXBm6DQD2MCRakmxgYPKjHRPex76AnjnKvRQ0FLazeWULWWyg=
X-Received: by 2002:a05:6a20:9745:b0:1a3:17f0:c4f3 with SMTP id
 hs5-20020a056a20974500b001a317f0c4f3mr1010234pzc.35.1710441858697; Thu, 14
 Mar 2024 11:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de> <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com> <20240313175434.GA96726@ravnborg.org>
In-Reply-To: <20240313175434.GA96726@ravnborg.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Mar 2024 19:44:06 +0100
Message-ID: <CANiq72k0yhmEh3720HBDaE8dJt6wUNrcxCopbNvc096DJhQsrQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org, daniel.thompson@linaro.org, 
	jingoohan1@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 6:54=E2=80=AFPM Sam Ravnborg <sam@ravnborg.org> wro=
te:
>
> The driver does not set BL_CORE_SUSPENDRESUME so that part is a nop.

The driver may not set it now, but it is still not the same logic (and
unless I am missing something it would not generate the same code
either, so not sure I would say it is a "nop" in that sense).

But, yeah, I only meant to say that the commit message could be more
accurate (e.g. mention why the difference does not matter) -- that is
why I quoted the message instead of the code. Apologies if that was
unclear.

Cheers,
Miguel
