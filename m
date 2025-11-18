Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554A9248880
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467865; cv=none; b=lmqhowsroiB7GzbbqQNM5ocpUWqhJ7TSsHTtNEnUphpbI8MZDHI86Kq1LgU8zmIXrDz2dqbN2v6C7NHpJ9K8CWRKwSlstuwUockj3J6+V8gRkTZ8Q2XIAu3G1jSJLz9AUI4Z4xYI/aNIY0MqfOWJxmckEFhJC1T2Lp581hseyws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467865; c=relaxed/simple;
	bh=17XNnwLdMemyuDuOqXGKlJ5O6NnP79UC4YL65XMZBtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFdD9GWkEEUwmXU7HP96PcO2IAVCF3wzuX0fgvOtk9TFGiTuuuI1UDpJW1ovIdBEX/S4lB63/h3s5S1upcSe3/v86YjS59KWQ6HHK85msZpLxuDyh6bNVVMhK9iM5us9S7tH04Rk6VDBKMF/NKFU0vQ/CbznDVa78yCOGFI/UwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk9WkA5P; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk9WkA5P"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b73161849e1so947009866b.2
        for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 04:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763467862; x=1764072662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S96NTwNKmvexih7lLAZCcVSzdOV9SItIYr/gsU2pZA0=;
        b=fk9WkA5P6x6YHMh7hvX+aPYZpgjshrfR0gYeFpsFR+kexLt+tQgf8CjTMaG3SbRzlc
         pj0vjy7ndqGQSDjeoxGEY5ZaBOH3SNBTacV1FafD0tefs0DXBe1XbggODDud+TpsDRdn
         Q1FQr1InNjCu/b4XH6TbwtnocGo4IsLR88TaYzTYXGtmGUiAOC1b2PpaS1OgFp3vyftV
         7Ro4/7N8L9CRC9GWhYUdI7WLnjDL+rLirOuzvj/DsaXcH5ykWQk9OBdOeO7Op7fuQvGj
         +uq9XDU/sqMnJUQJxsyUnuTJxbjt1gBF48u08BTmFgkdb71V783ZM5Eg/YxJbPT+xyLw
         qUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763467862; x=1764072662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S96NTwNKmvexih7lLAZCcVSzdOV9SItIYr/gsU2pZA0=;
        b=vpCqZorJ/PFkG+v2sqCI0j3TUrKlygywbQcHk8Ve7WnZIwTFrM61nsWZ41xS02OI/H
         zpYJePU+x/Zv0560ki7ZOaHr1IJZ5oTYptCNGvMuxAW0LE4Vq9qd21Pp78xYa+s4Vbt5
         fSlI72ySuF8BdiHcrOyUCYBsNmksW5Iq6ae3tZ+BgHXjRuMphxU9ZJshmvASlHs7teYc
         Ilb88OBiJjpiXOAuyiTvsF0sLYTpv4c3fpkgVlgqF6Jtl5M0TkAs29AxSTrXgTIopvlE
         MjobBfj8iThcc7Uippw0zYD02tKuzeGd272xIGqHcD7uO5m3ZTiP0v5g4iQURvlwsDZQ
         2e2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8WUt2GEByGLKz88uw/JjmJtauvB/oxpJHi5NoyGb7PrVG7TfnDmLPEmY3vKSKdquT8KH+1yol1PkEUDr3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3s3QDMaeSBz8b0kpX2JE6xcSmZMahJq/rNYnZq10Izbvv7mHd
	3u/HlfiPDVOv7UUg6EzFIQRW+35/f7QE7s5yY6Hli7NfjmrpqYv1EA6SYb9u0PYmeYZsEx43QgD
	gbMd3AGPWGG9v+isWEiGDHcQRP6eLUzc=
X-Gm-Gg: ASbGnctBXvA8RXqJcS51eAd7NAgZwTvbMcbPTDJ6IslbQlu4q0hVpkC7hVFgkI4yOr9
	VBFtRC2rXTU84Bg3DDmcZH5flh7JFe22iB4y0MbM1Vc/1e05E3vdO9h8kQlK3P52g6M42h3FJNV
	Tdfv5xtIpD0lWaUU7LFQ/1GzbAlIhffr1sp7DzIdMeLYuWWBrpQl3HNaUeMLd81D6ETkvyg8xZB
	BfaWDe90/8k5PYHN3nT+MBij9gmZ04RfsipDDJoAOhcUBg5LlfNCaPc38zBHnFdSzHfkeFxWJNY
	7SlE5nE+YUAaYH6nugWCISdyG4l2LVfhxwWuvT8PNHqOP1sDGe2XnxVjNP+fo20zcsZDU60=
X-Google-Smtp-Source: AGHT+IG086oEWZheGOwau+XoF2l2bVGxVG+fm1vm1dIRHk44wbZ5lS3J9QohWdvbh4rKsAG9075DeYIITho2M4cbvx8=
X-Received: by 2002:a17:907:8dcd:b0:b73:79e9:7d3b with SMTP id
 a640c23a62f3a-b7379e9837cmr1402879066b.25.1763467861752; Tue, 18 Nov 2025
 04:11:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251116101620.25277-1-i.shihao.999@gmail.com>
 <CAHp75VdY7W8EgOfKuxtTALj777aVatxV5dqsxm688JTy=iVW2Q@mail.gmail.com>
 <20251116152800.4c1849cc@jic23-huawei> <34a55901fe0729145097d287a98746f23eea13d8.camel@gmail.com>
In-Reply-To: <34a55901fe0729145097d287a98746f23eea13d8.camel@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 14:10:25 +0200
X-Gm-Features: AWmQ_bnlFWB8k-p28R4cyez2s9mHpB0Dy7l8qo3cMKv2hx7hvO6Ni9lYDoVRUbg
Message-ID: <CAHp75VejBvRX=5psgVgGPCsKk7gVgcDUd1q3Gn+4_jyzk=2pEw@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: adt7316: replace sprintf() with sysfs_emit()
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, 
	Michael.Hennerich@analog.com, lars@metafoo.de, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 10:17=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.co=
m> wrote:
> On Sun, 2025-11-16 at 15:28 +0000, Jonathan Cameron wrote:
> > On Sun, 16 Nov 2025 13:08:07 +0200
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...

> > Applied, but I will note that this driver is a long way from suitable
> > for moving out of staging and I would be surprised if more than
> > one or two of the lines changed in this patch make it through the
> > necessary refactors (should anyone actually have another go at
> > doing them).  Anyhow, I still think this is worth taking just to
> > reduce the noise of remaining instances of this.
> >
> > I'd have deleted this long ago except I actually have one somewhere
> > and it one of the supported parts was still listed as suitable for
> > new designs when I checked not long ago.
>
> Seems to be now "just" in production. So no longer advised for new design=
s. I gave a
> quick look and this is far from being a simple driver. It would require a=
 fair amount
> of work to bring it out of staging. So, are there users relying on stagin=
g drivers?

If there is no choice, yes. For example FBTFT is famous for being used
by IoT / DIY _a lot_. Currently a bit less since we got tinyDRM
subsystem with most popular drivers reimplemented there.

> But I would assume that for staging we are still free to drop support it?

At any level, we are still free to drop :-) Just different conditions
applied. For staging is basically an "effective immediately" case.

--=20
With Best Regards,
Andy Shevchenko
