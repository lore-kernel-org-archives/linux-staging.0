Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D42641CC;
	Tue,  8 Apr 2025 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112775; cv=none; b=vGkc3J81R9Bkn16y/sEuYoxXJgY9zDjifxIe1eG1ALYn7w5z5/FnyDa61ra75ZiC89p1oPCwHl9Dk1q9uiqNFYsqVeNfKF7NalQL2xoPq0ZOLTv/KL0Attfv2o0Q1RJ2sEnR+ZiyiT1xyLwHQKVb+H8x1xjcMAVCcPsbl63/Wtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112775; c=relaxed/simple;
	bh=vfYcDK8W91jQEu8aDezx1/EMBUzk7HuR49zxGn3n2ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTPQ+6XOCK8FCzu3G7F786Ea4umPgywVWRHrFJ5yyLAo1OznTUfyYCn4DFvTDZGukZg6aNXxB4uVz/LYb6nkizGzy2KPNLRGJ6ddme43A/69CLzo42hwG7X9TU2/uoUkt3o3sOoOdnPRmNcmQOcHLsNKAX4DYphPIEisxyS3Izs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdGfbIKl; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdGfbIKl"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1818480e0c.0;
        Tue, 08 Apr 2025 04:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744112772; x=1744717572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfYcDK8W91jQEu8aDezx1/EMBUzk7HuR49zxGn3n2ug=;
        b=TdGfbIKlKiZE2RNZRTBAhm/AujSb6PP6f3W+swGtR7Kq9ssqpiaJjdmvobLJvQqKf4
         Qh0XCVxVBF7FQEadWNwZq4SbDztLOwrK40yAYP2a6GYEp/gZ2wMHVHIY2JMf9x8ZYtLQ
         dZsQ8VcMOsjeK/+qcnNXXj4xBD7XM1sL4ZX7Uw91ozueYc4X1pF5Xd17H4VaAb/2Eu2N
         TM+Tb9rGxdxLUpR2UNmov+ILELpFb87n29mkn9yrz7p64XcfAU3nvI9pzixcAQ9EZGAf
         S2lYupdNo2XcAJpabCB+Le/Opw9UN6zrQnP9IoVbRBIhjkg0mY9RH2vt5rTkEN9CEY8n
         Natg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112772; x=1744717572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfYcDK8W91jQEu8aDezx1/EMBUzk7HuR49zxGn3n2ug=;
        b=fGj6jtCmicDzj5GV+FJnPe8q+PnKgJCP8jgOJeFfVcRxSq4UYFpbtOcxhCL2N8rSDj
         ll8bKN2Hh3IEhbfPKN5InifgCpF5HY0HXYKZv3Mi1GMA2zgArP20YrmwUYqIIH1vvK1V
         lP4v+ApXhACt8HLODZ83x1SA8D9HE/RzBXv05LpmOsq5yWlBsemoRQODdD5TUXDbdXPg
         tAvVEkbKKYOkJC8FDUyzQaajuT0Zj0zi5bFNTJ1rREcXMFXKHUIn+VcXEs759a/W4nZS
         BzN/Ekwq2zw82nuH86ZRKX7M+rvHKHsASlFgfB/6hOnsnhfR80n4G+bTmpJhlt2cnOf7
         vh9A==
X-Forwarded-Encrypted: i=1; AJvYcCWkT0KZRJAF9nCvaCcQZ/MrvZ3gK+fS0IJz5VSVeQ9j1GQXuE7DIQ2JngXrI5kjpGfIxtJwd3d0dj8/MYkr@lists.linux.dev
X-Gm-Message-State: AOJu0YxwNJVJKao8YLVyIBszA8rZ2G4EVsPR4i6phnivPkUjgWbsQRXb
	lNlL+g1BpQjf/eayIAW2LiXAp3hvnKvjlwZxXkpTx264TQJ4C029VA2SWZ8514p5qKExliIytdD
	F/czJZEytdX65bz5/fo1VsCCsOlU=
X-Gm-Gg: ASbGncvremrO26zugn1LxHKDYbxk7vrWt0o8jzLGgnQ4KCf9hcBMR19eE2HPKKlBuLa
	DfDGQnT9scNBUP1r+YfHEqKJAaocXntXIzmMR4tqLSnosTFs2+67NzQTTtWlxFwrGLkdYFP+h/h
	Zs9arD4SHZmTMUfAux7ovfAbXsIg==
X-Google-Smtp-Source: AGHT+IGc7DDfMqh9nubhR58qDhK7AJO3px6RkG3rfBzevANUMo8NKMnT5ZD39JWOXn5PG3fovJZ/bytwHru8KKdxAH0=
X-Received: by 2002:a05:6122:250c:b0:520:5a87:66fa with SMTP id
 71dfb90a1353d-5276444665cmr10905004e0c.3.1744112772482; Tue, 08 Apr 2025
 04:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
 <CADYq+fYeXCUgXqWu_97gvUBOvTG+H4Q76TSX2M1s5jV7EWcuyA@mail.gmail.com> <Z_TuIjwuihXF3mbM@smile.fi.intel.com>
In-Reply-To: <Z_TuIjwuihXF3mbM@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 12:46:03 +0100
X-Gm-Features: ATxdqUETrnM7RqnM5irfx0EHl9vUJKqc2rm4n9p8JTcJxxQNWiJnaUY83TsWmNA
Message-ID: <CADYq+fZAr7BMvzex7izRuR_t4Ez5v3f3LaaPOS_=7=LYjwExbg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 10:46=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 08, 2025 at 10:28:36AM +0100, Samuel Abraham wrote:
> > On Tue, Apr 8, 2025 at 8:21=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> > > <abrahamadekunle50@gmail.com> wrote:
>
> ...
>
> > > > Changes in v5:
> > >
> > > This is v6. Are there any changes in comparison to v5?
> >
> > I added a cover letter and named it v6 to show it's a continuation
> > from v5 and to show I added a
> > new patch for spaces.
> > I was not sure where would be best to add the change log so I put it
> > in the cover letter.
> > But as it concerns the patch for the % operation, there is no change
> > between v5 and v6
>
> Then it should have
>
> Changes in v6:
> - none
>
> which then questions the purpose of v6 :-)
>
Okay, what should I version the next patchset I will be sending as, and als=
o
how about the change log. Do I write it in the individual patches
rather than the cover letter?

I am a bit confused with that please kindly clarify.
Thanks
Adekunle
