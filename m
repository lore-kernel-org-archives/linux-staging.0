Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD01779BD
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727432215; cv=none; b=bi6jsRUEfXiJJncUrjVy1TCUd0rnNHIYIIanrEl+qjpoa5YsetvU6TcGbFZhUMokss/FpHlzbzSj5JTmhCpPoJsEMEgd58VwSvFn9ZoucBw9Nz/9akStcsYZ1CeS7v8wwDIcySlRLefhfUkBEHamOmiTGhB+LgI8SbI+vcA8+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727432215; c=relaxed/simple;
	bh=cAxaVY79viWfr3dOL3dJjnZC0KcE579FMqX0FSoNdpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOQJ69S3SwTzQL5LO5uPegoUuvSzBs1TvzHD+tZAapn3UDWpNGMuI+UxbUuOPSGH9/jQR+CfaedghMn++SJvXW+0OZyQq4vTNQ6FpcUJLWZjH7uUwW4lhxUn0DQ2DnDfZManQFznQrG2Kvc5LJ+yZBVMxPrTdWXLK94OEFz0jGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=goAH8EE+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="goAH8EE+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-719b17b2da1so1489863b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727432213; x=1728037013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwCiuRYsk936wm4u/HVOckfXG1k6CXzT+Xy0kwjFKfs=;
        b=goAH8EE+WmFP3I6QZqsHqcIrGsvCoq8L7Q4gdVD6InLDk/AGuQPN6ylQIPm1KgVcdW
         sF5qvEOISf8iFEpx63frgyycgcUWN+eMhc5mPR2T9dcufqKzaxsMgsO+FWHAh/m0tahy
         nWcfPpic+X7DIao7nRfKsHAPqcraqpNfkrGpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727432213; x=1728037013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwCiuRYsk936wm4u/HVOckfXG1k6CXzT+Xy0kwjFKfs=;
        b=aAEysHWTFcu7Zunr4acobsjGr8BRtZpUh2HN0fHYWheG/hgP3a1B8AxFsV3E9CiZE3
         bWNyDL8XTe1kCLlakNCW6I5P4jcGE/xmJp73Z+2SeRqeA/K5l6/cJwbQuT1WhPZnm4i4
         bBBsSUBtsj/8Fm7wexbcRWyK2SE5EqreurAad8ajcqt1kEuCjD2cgOUXcDZtvz+Iq5eh
         ga9daVqOCZljTrrSle48cXbpWngcmXSnM234GJ8FEOmrWVl/5pK8ymoU+c0w5YALGgC4
         av/h4PYNqkGqjoVMdqSFFW8dyn/y0iPPzpzj58HAn0Pf5opUI1WwgXra5Yj3/R6+UMhw
         u/0g==
X-Forwarded-Encrypted: i=1; AJvYcCUO1lDMqmv6hK7eJVkwCXtGbhKw6Qv5PWTYz8aYR0V/tlFGKgjE2YoF6qA4pRj8PhmvFGb6OGeMJjfWBAQi@lists.linux.dev
X-Gm-Message-State: AOJu0YxTnv3Jdtz9EDxHCvlSAGOqls5gbAox2b8gb57CmUdScwzOMh6r
	cb6H+lBAqI9RKk1NHEt1mFCmc21y9NruGm0m0DGjasRCBKzTOOaXtKRaTqQVpC7K65nn4hdzqLE
	=
X-Google-Smtp-Source: AGHT+IGQx0I61zkGBJ5Kof4Y8Uv1gyJf8bijeFhSbpj8/DDYcW7qaev0KF6v0h1G5KGmME1+167ACw==
X-Received: by 2002:a05:6a00:99e:b0:713:f127:ad5c with SMTP id d2e1a72fcca58-71b260681abmr4457474b3a.28.1727432212958;
        Fri, 27 Sep 2024 03:16:52 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c6a1sm1279286b3a.44.2024.09.27.03.16.51
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 03:16:51 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e07d91f78aso1599181a91.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/FWy4Bb2g7MpW+OfTnY+JDHpf+SMZk/oFEFJSQ039i6zdXO2YVovH+hOmtZbvbbiduRJuCk1JHkFCZyv6@lists.linux.dev
X-Received: by 2002:a17:90a:ba95:b0:2e0:b6f5:1884 with SMTP id
 98e67ed59e1d1-2e0b7b83739mr3267623a91.0.1727432210480; Fri, 27 Sep 2024
 03:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
 <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org> <CAHp75VeGAzU1BT5bE0BrVj4MR=TR2KEzjwhoFUnN5Q=fUanJZg@mail.gmail.com>
In-Reply-To: <CAHp75VeGAzU1BT5bE0BrVj4MR=TR2KEzjwhoFUnN5Q=fUanJZg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 12:16:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCvF4g7H77Tuy=YUfCG5xYxcb8R8oTsvCjSt65zPAsepog@mail.gmail.com>
Message-ID: <CANiDSCvF4g7H77Tuy=YUfCG5xYxcb8R8oTsvCjSt65zPAsepog@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy

On Fri, 27 Sept 2024 at 12:10, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Sep 27, 2024 at 1:02=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > The str_up_down() helper simplifies the code and fixes the following co=
cci
> > warning:
> >
> > drivers/media/platform/ti/cal/cal-camerarx.c:194:3-9: opportunity for s=
tr_up_down(enable)
>
> ...
>
> >         if (i =3D=3D 10)
> >                 phy_err(phy, "Failed to power %s complexio\n",
> > -                       enable ? "up" : "down");
> > +                       str_up_down(enable);
>
> You never tested this, do not bother to send untested material, please!

Do you mean tested in real hardware or compile test it?

I did test it:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/test-new=
linus

But obviously we are not building that file :S. Let me figure out why
did this happened

Sorry for the noise

>
> --
> With Best Regards,
> Andy Shevchenko



--=20
Ricardo Ribalda
