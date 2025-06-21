Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC6E1547CC
	for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530423; cv=none; b=kk8DZ0MW/vIz5P0m2Wr8c7tGXU0m5AaOTsSrmfHtXZmvBfXT2rqJ95qU3nU6vKit7KByeUJNvH2hP80QMh7Qf70SKrrpyfRWpS7MN+8LLTKqyVUrkTKVXmmT1wjzUeKCDEAaYcIC1XquO3m1QzkdxrOLrRW82SXA8kMBZz81iLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530423; c=relaxed/simple;
	bh=U9YZoYYImG0JaaXjf+TZhZLctBrJrquR7CQZjMxBEvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifAFIrfAmdjnKtkLbNMcUUXmM4v2RylkjLEu8itXSEcOpL+iJL32EHxopM/aGw+j9OcBDiOarqv+0SdBHmCmq2jPpFJaGJyKkbwxzB4yDj24YMdacsl0c1fVlaaDso4Pt2CNWRuDzMoF3dyHaCM6uqDxL+u9hFD3IX0pe2ehW88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAZ/cBqN; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAZ/cBqN"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso5549596a12.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750530420; x=1751135220; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpscXX20zvGpci4UxXWKpwL6hXgbJYya1UIZqa9ZRN8=;
        b=hAZ/cBqNr20IF1D3UlF7Ajtioq8QOqJEn7X6ZjTUDNAG3jMQfLSh31NiJ9yPttzeZb
         bJ/OXPgteIJWOYhDSmSo35fn/U6I0CHdUvQYTKmGXE9YpxdO9pQGGmEAWfV5hj6QVKki
         OEVUc8i0rzXmbai9f81S3eqYxqfnHmX76SszJFOEChRtbR6K1Mxpdn4OkDoQy9o5wuNs
         kaViMMCMQODXKcR5rS9KR3N5vC84nzOdZGGqbocvOmoYDQ3HmG4reJoZT2n2NabXPKQY
         WPM38Gsl9H1V2Re5JutzxvuRGpGJAfhg5oZJkR5HZ/K2gEDFh4dFI64LEIm6ETsbWh7q
         EV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750530420; x=1751135220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpscXX20zvGpci4UxXWKpwL6hXgbJYya1UIZqa9ZRN8=;
        b=s/joqWZj2AuMcTxpN5xFYMIEH8brbzObR07Bfp0p20CXe/YgT+REec0/wnK7b1n3Hn
         AWMA3dq9ETndiauxhAstCjUtsrcdBenfqla2AnFAxhB0QoGC+I/lfv7VnXVVhZNd1R3j
         wBu0Q/t1UO802hxvVOrVqSM/L9kwmlWPSPDe3hpJ07dAwik78FKa9IsggYn1rk1f32Rb
         nspwQJ3VE78eR7VmrexCLcQtcbb55gy5Xr5IonZrB1ysV5sBgTUQ6oEFmZpsL+GMiiK4
         8mDDBFWnqehZqh+qEJ+IMX64JrjJiPk0Uxiv32IIRrBnhCPSem31/dLhlPG0Yr7o6sTc
         ZFpA==
X-Forwarded-Encrypted: i=1; AJvYcCWaF8pS4ludyJcjyIkcsRR2e9/YuBcDCP9OoG9iVVzpmYRn4qioy1GzYRmHDgxgMaAnrCUDhlNqRwcxSrvI@lists.linux.dev
X-Gm-Message-State: AOJu0YxUQ8EhGtOi2QGZmKVRBEnwXZXceIfpNnrYJDL5hYTNdwvwW6qu
	8B+c841GaOPLD805J0D1/dbQrQm5MfsH2vGaTGP/HoVPAMwz3aq0IbjS8Q83OFDgi4GdHB9uQvN
	qQoFtmOzysnf+mv47M5rchkBRe1/xpcg=
X-Gm-Gg: ASbGncshV0myQ6CbbXgTqYo2t7mEp5ReOSNRjfbx6hn2Gwywt+FeV5YtOBPUKm7C2LH
	/sOVdsyhD1XhD6nAmlrL+EM1fU/D6MVaeRj3L9bhNVyDOx6okP/4riW2qCTRJ1UDYL7CvFSx1Ii
	humFq+R7c/jW25ONDce74Pb8aWeisDOwVBV9IRgQSIN7w=
X-Google-Smtp-Source: AGHT+IEHRptkqa+LGu4XawDI9fo1KWyDHv5bRmJNTBeBg61tk2jM2Adf8P6lwsID7iXnW0w7sSxC/nB1sBA+Dhnmbxs=
X-Received: by 2002:a17:907:9603:b0:ad8:9c97:c2da with SMTP id
 a640c23a62f3a-ae057f6473bmr662798966b.40.1750530420340; Sat, 21 Jun 2025
 11:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250621-bar-v2-1-4e6cfc779614@gmail.com>
In-Reply-To: <20250621-bar-v2-1-4e6cfc779614@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 Jun 2025 21:26:24 +0300
X-Gm-Features: AX0GCFv2R4o5HgTkGeyad_hvoppFVtnZrW6opZBkdmWRJfshAUZag9Jj25RzrnQ
Message-ID: <CAHp75VdHAYvTHJwZs0NL5uHEkUtQ2Gyp1Y5GC5JY68h8XS7pvQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: fix coding style in ia_css_output.host.c
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 5:32=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com=
> wrote:
>
> Fix two checkpatch.pl ERRORs:
> - Use tab instead of space for indentation
> - Move trailing statement to next line after if statement

...

>  int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,

And what about this big space between 'g' and '*'?

> -                         const struct ia_css_output1_configuration *from=
,
> +                         const struct ia_css_output1_configuration *from=
,
>                           unsigned int size)

--=20
With Best Regards,
Andy Shevchenko
