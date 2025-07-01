Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B66F1DACA7;
	Tue,  1 Jul 2025 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392853; cv=none; b=CX+KZJkJX0pCXS3Qgmf/U7xv57c7fAmKRbXtrOsU6lcGVZ6Jx1QNjXDfebt/Xo8VxdzMlIMUAqpmaCYN8M6Sdgirt8iwlclFqoNmR2PsLhNfqYxTet1OWm9cOcy7rTgAkt8HHtcSn3K21vT1iPOyhtwlQlD2+AfIhvorJ1nO2T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392853; c=relaxed/simple;
	bh=/FvRPSO7fYdAbOf1AN0zfBLd5lZSWiwNpXWHXWxVGcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDHo2JLvGD5jQ/j+QCQk5gQ9Aee9KY5ZPr7AMke+pY80+2XUhbVVIaHQYQmkpyhciGu66xlTHNbE650Vsz4nvBcwoVGU8WVUFNg7FRcRIG9YAgFPqDimQoEYc+tm2mdXyz0BipPwz2n/43gUcBmBCzFV0ROC/lo643rg3MG9VOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6wUi4fJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6wUi4fJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0e0271d82so1052371566b.3;
        Tue, 01 Jul 2025 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751392851; x=1751997651; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FvRPSO7fYdAbOf1AN0zfBLd5lZSWiwNpXWHXWxVGcU=;
        b=Z6wUi4fJ4Y13tg2J1Mz9q/bZ0xc5Y79Fre6Cgt5OM5SwBNk1+fyMdZ/NIImXZ1V6GO
         XBgBIOKn5AyzwVkiYvdWnUflsBQtL952YltHwVpoiVficsNpsvZpljlOH0foZdjdo36H
         6zgF4AFEoy9X5M2vnXzJru1JE0Ozn44CHWu/IvsGBP17wTlsGmCkv8OCbC+Q3wB9KARl
         JuI565Qx7j6amXILmVRX7EjYonhtWEYX7SJS2RtlEPBkVRbbsjv3jrUl/G6AS/V7nxh4
         fvVsEV0IwtHN9kPaBTHFWmTUrbA2U8bK4xorKRCplBRk2kLmF+GrPKw0oU454EeMZmPr
         YJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751392851; x=1751997651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FvRPSO7fYdAbOf1AN0zfBLd5lZSWiwNpXWHXWxVGcU=;
        b=CeWG0xrMKmikb1H6Eaz0BSxA7lrZozJleG31PLNLK2DQI4vF6YhN8nc3IAteQf00x6
         yP2V/y7ouh9Q4grdx4u+JfbLX2MtQyp0uUMZNhvwDRe3KRz6LcQIUoHlICDvvJ5s92li
         XRFY6WUgo0WxPq00pq5BR0MaB9PUSPqtf8Xyeer6FG22kLpfTYuajYmIv1gyp+IylPqO
         Tj+bu51McJOvWbg4pnE+dKasT3nTYoqrXfn3nkmHTDFdm7MfcxLl2XL2T3JQPVmzXBdN
         LmvrFNTFkupsVSE3tibk0Lber6QHzhxBXxIxk5bUyegKaHGsCk1V6VZm2F5HVjpkpqkR
         Rd6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6Pn7TSMM2HUWCgCwvUJxbMnya/904oE8QlDlWuwk29GbeC6kz3R+Ql+A8knT4KTcqWbISvRC1AnI+oEuXcw==@lists.linux.dev, AJvYcCX72oR5xAzqchvu/Z67m36GnfarYVTZ7FaVtEjQYhpCoOXL8hn+CCDJEHlXdC4bQ94WWDae2IBkRWx9wzJyWY3r3w7aWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YywKyoWASgMEHri4rh/dsF86xDKxfFJlAVOItUf5ZwstcwEhDTH
	QxFjKCfn/lrdAPE5jx8lCcOmM1KMvKRtjmXj8wH0BObVev4M7urDwSoCTS+9L1JeuYXQcxeE+YM
	OGVXQNuzHP8HB39Ei92k8OUBg1iiTpUI=
X-Gm-Gg: ASbGncvaFoXIUvUR9xQOoVwj259jJeLUCAY4NDuu3hewlHXccFCqwVBlVPR0d6U0T74
	KlzYk+FmBy6Wiog7M2qHTd3XN6bECQERW5AAHXI06+ecDkJc9PEwCS7bPTa5Bdpe7UWkP8kVojd
	2thHVozOhMkPqxfyllX8AYBy61KEXFwBprikWlMXd+03U=
X-Google-Smtp-Source: AGHT+IF1zakzJA5dtJuHwh7QhZ+pI+p9A9orFtQ+5iXRAt2oZyf2Tj/MGdbjQO4QKJtIfzKiJY4EpQ3Q9kP2DEfk4nE=
X-Received: by 2002:a17:907:9403:b0:ae0:d38e:5852 with SMTP id
 a640c23a62f3a-ae350109a6dmr1846115666b.39.1751392850229; Tue, 01 Jul 2025
 11:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com> <CAGn2d8ONZpOHXex8kjeUDgRPiMqKp8vZ=xhGbEDGphV1t7ZEFw@mail.gmail.com>
In-Reply-To: <CAGn2d8ONZpOHXex8kjeUDgRPiMqKp8vZ=xhGbEDGphV1t7ZEFw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Jul 2025 21:00:12 +0300
X-Gm-Features: Ac12FXyY3nlETi8UNrfw8VulBztQXHnJGHYlKQEWXzgW8R1ZzAhAnNFBHla1BgE
Message-ID: <CAHp75Veo_GYecergPLjSY9k4fsEnxOQLq9rx2N+rBk6u1LzOHw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:34=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Hi andy ,
> On Tue, Jul 1, 2025 at 3:45=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
>
> > > > Nice. Can you make some fault injection (temporary by modifying the
> > > > code to always fail, for example) and actually prove this in practi=
ce?
> > > > If so, the few (important) lines from the given Oops would be nice =
to
> > > > have here.
> >
> > > I have been trying to test it without having any intel atomisp
> > > hardware and failed continuously, do you have any tips or maybe some
> > > resources on how i can test this driver.
> >
> > So, the easiest way as I can see it is to ask people who possess the HW=
 to
> > test, but you need to provide a testing patch (which can be applied on =
top
> > of this one, for example).
>
> Well, after several hours of trial and error, I finally managed to
> find a workaround that allowed me to test the scenario. As expected,
> the system crashed exactly at the point we discussed. I was able to
> capture the kernel panic log, which is shown below.

Thank you for the effort! I think we are good to go with the change,
maybe Hans can add a summary of this test into the commit message when
applying. Or Link tag might be enough, dunno.

--=20
With Best Regards,
Andy Shevchenko
