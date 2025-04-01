Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2655EACE
	for <linux-staging@lists.linux.dev>; Tue,  1 Apr 2025 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512679; cv=none; b=Wu2XpWflKSqv99KPvcBTLt/3UIUu+22PYUpK85NOTZz2L+1czZU6mxFDaG4O9N2jACx3CrCD4Ua9AhV/Kd4f77mkJjhB4+QqtEvkBuhLuKG7RM5AFaN30AmE+MS+Qsb85DFzv+V6o5CTLnHqZYT6BJVa9lT0btDFyWj0vGdbLTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512679; c=relaxed/simple;
	bh=vtatpFmzhU7xgjZhwA5PCJeITl2kEtzzcHrkI3h7zeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1tykF/USPKU8XizjpfC/E8JtFAaf27/rLw4k1KUANprxpTJAQUszWTF4/d/mE29yq7FiVpUxz4xEffMdd5C0/32z4XSR77gIebKM+wecG4N5k7MufGj4Q6w4scaLXfyDnEM2biqzLQkrcDlvxMvK+8IhoRpAc4duA5ASgvcBI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/+CoDE9; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/+CoDE9"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abbb12bea54so1162494466b.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743512676; x=1744117476; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtatpFmzhU7xgjZhwA5PCJeITl2kEtzzcHrkI3h7zeI=;
        b=h/+CoDE9cfZ38DVjXAZQ7tICfzDrGiWMBQGi654gtOVS3TuStlEHZB2oxYtICi+4dh
         J4QrTcIAgOkxvAakKYlABBL67SMCS4lXTzwbQ8CVBDwzp7TeYWh0+Z3Xf9xxx0VxbE5P
         gSmxWNM9UYM38K+4tfZZZMfVNfcYs/fWhY2pvwWxhvb1iny7CthzXOC2UOFXB/H+pc1E
         2wEwX3hXufTOl+har+ZeIONXieAlws1AnXXmZtOwE9A8FIua/Joqt/4RZPQF4SkUsajA
         2DbLTp7pPwMdwaBH2Azv+0+lTbKczODf0XY9PyzqZIRNn0lUBlFv3rXF8OPdMdn7pdBb
         HaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512676; x=1744117476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtatpFmzhU7xgjZhwA5PCJeITl2kEtzzcHrkI3h7zeI=;
        b=pCUNRW2OxIPrnqLDfmvQuxPwFA6J9fvOvaggNb8QRkaz6wloQ3uAMzH1DpRy6yZWp+
         1uV9nkniDw9QL8kDr2hicIPx/OPmScJ5HOj9/vEFWRD+n+i46LUK3oOZpqq19RLkcY91
         pE1OiNofyLicr0gweI8GgMgZ7Xq9TNfH05gmhGkDa8m3ud9u1BsyvsUanXLTt/ttn6Jp
         Gg+tPyhMOV8bTsgwoLy8ag8qCyqo3hJU2ToNyuyDP+yXYPlv1pqJGLXVN0iF70CJxrsA
         19giYSfvPkK089k1GzJndjvWbtr17WswTzegLzSmkb+6aGcdB1QIyS+Iwjp7SCEESBtc
         hG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf/M6+y7EqW49szwU+MvXS6XYxPpDQ3QvbEljc+z2jKLZgymNzNG6apag5oIdG13I8MGFsOx0oHWe+OeAF@lists.linux.dev
X-Gm-Message-State: AOJu0YxyHLP0qvJfVdhlawyofNrT0kwTBS3Kj/qOz4bBYegURZt6Aw43
	mRCu965L7VGVdXJmS96bOA7ZBfP6kEGxvkYsOeTifZATd13fZ9uIhxw20Q1k3VG4UbBrGlpTJ0o
	eUMziR/lce07/BGGnVRULIvqGAJmICI/+kfc=
X-Gm-Gg: ASbGncsTQl13P0RCfjduNATwcfm+0qDxVGDi9msbRmMMSLALYJWhfD8cEbkkiym9/jy
	75Y+3A8V73kBE24bmtEuY6dhcxCG9IRRbkJtGbUPnAbjmrI5oNeXV6nkVM7+34rlaRbPVgfO8rn
	wGIXiJ3qy1T2zn6AOtdKB4WSO9Lg==
X-Google-Smtp-Source: AGHT+IHZsgzE/OgxX7vZ7ZnSjzcsPxeS13ob9nT5SmHeUEZ3jjaSl08nur2NnbGtlffi9m8wEAGUtFTlGED263jrJZs=
X-Received: by 2002:a17:906:c148:b0:ac3:c7bd:e436 with SMTP id
 a640c23a62f3a-ac738c6f2a9mr1016730066b.51.1743512675974; Tue, 01 Apr 2025
 06:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250331-v614-v1-0-9bc69a873720@chromium.org> <20250331-v614-v1-2-9bc69a873720@chromium.org>
In-Reply-To: <20250331-v614-v1-2-9bc69a873720@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Apr 2025 16:03:58 +0300
X-Gm-Features: AQ5f1JoQAeiz8KzO0Ix3DeA2FFUbKTV02faYpr6Tug3l0lCiOJFfHWd5fqOwTTY
Message-ID: <CAHp75VfVa5QYW9Srx1aDBFuvBp5OcWr1bnNUdhf6rJx_NemEqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: atomisp: Fix Wformat-truncation warning
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 7:38=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Gcc8 is convinced that we do not have enough space in dot_id_input_bin.
> Extend the variable 17 bytes. It is just used for debugging.
>
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1336:9=
: warning: '(pipe' directive output may be truncated writing 5 bytes into a=
 region of size between 1 and 74 [-Wformat-truncation=3D]

...

> -static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 10];
> +static char dot_id_input_bin[SH_CSS_MAX_BINARY_NAME + 27];

I'm okay with the approach, but can you also add a comment to explain
27, please?
(I mean something like "27 is the combined length of 'pipe' plus ...")

--=20
With Best Regards,
Andy Shevchenko
