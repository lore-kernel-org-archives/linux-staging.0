Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5F2DF136
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345931; cv=pass; b=M7lVNgwKd/GR1iL//xXHtSzIlLNqO+EiX7ZP/L4iNbRwhrl6GeuD2XjFio6Es51slD2tneVNRf9lgkvqTC1XeDcgzhV8yarjiPedbL7B4unQRG3g04QlNMsZi5VnZHGKaBu3/y1rdXzO1p0D2qEa17QYcnc7+4O1fjgkXetZWRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345931; c=relaxed/simple;
	bh=X03QoXU85mjUaiUOlaEq1U2mY9Zj6t10qA6xUtZtLkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwPgSvcRqNcN7E/sYiG1KdstzviA5VELCy8YC0OtKZ5BxrJJxRODbp+9M4mIsOkJlewkvOmif3lCOAwMLCZ4Qxh+bMDH3GT1UkeN9yaoPVk+KsWPb2Z51S9TNpUULO2djPU+5scNdXXPzYcTjOQBPLiGQUCVPxTzZGPwWk3ofpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqMqV21R; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqMqV21R"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso4236493d50.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 08:32:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771345930; cv=none;
        d=google.com; s=arc-20240605;
        b=EUS2LszpyRYcBI80nkRGml0Gx44PmjxC7lHSo+lLr8reRSeaZDpIGrZs8KVynWH4S3
         m3Mgi9XaRB+k4YcxJ1XixVqZ8vT5Ji+VSiu8VJjyVZa/+CahrIcUkPcxUhaJENRmhZb9
         5tUKDJZQYiXPV6GqSlkKx9Jet5XkPmHsycZrVdTwBEHsUShrDHOw3XctOK856ZBOfKt3
         bi5IbImxCVezzEP3nhdUT10Nxc+3axLMHQOaDy9HXImTwQPDdO3Fdx/s+gvjsyGdfvXg
         zJRXXXdJRiX2jE70gM9d/7cdj9bgVL4LJzjkgMc5eHy2Eh/+Y/Nm5hQeUQ2pnHbLeLn7
         FfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X03QoXU85mjUaiUOlaEq1U2mY9Zj6t10qA6xUtZtLkc=;
        fh=r5H5RIibld/kaGrbtV1lFUFVy/J0S7CGmL0/JaavuKs=;
        b=XdakzbhD+qzuzBqB0olUqPvMqBMhhIYLgiFWv3voTASGOTkze9Ru/f4t3bp/CJCD/D
         jRcjAP90XLVPCEjB7OJyhe9By3Xps/LuPB39sdX/BkXhnYfx16xRvEsk9eRM0/+0Wp2c
         Uq8DzgZCeLdPUvHfdVuGgo10Ba3mKG9Ixooi9A4+n9gxZVnfiylUYALpz/U2Jrgf7Oou
         It9bz/9sFAvmFTnWF7KUwJOJ5DhrOAP+GEPH+cauMOQTJXMIIiCcYgoE6dw64p8x73vs
         tiNcpENfLNpYwuGoYhEZ7yC3PZMIPKIXL/QWBYoeQRn4YwEcscvjQDGizekM1cG5wIWI
         PQQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771345930; x=1771950730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X03QoXU85mjUaiUOlaEq1U2mY9Zj6t10qA6xUtZtLkc=;
        b=ZqMqV21RF3YCOUIpk+5sHPPyD4w6Rqjm/l36/uh+p5vA5G77jFRQFt84GXmtvwD/yn
         UN5qXryLQFIU/rjnpOuLJv8h2so06mQXQI6ezk/M1CFsBLOcHgH3Jfigpxb6hYmj+7jh
         h/KZdgTdTVO7Plea1exiixhms08Aq8ngS+UfN+qW9M0ZppZZn78tbGqL7VN8PsdYdBV1
         c+pFoHPdjOMiNOcvBnCGTQlFDZaB1nLGokGlNq5D59pZDU4p21yEuOpcjadQy8/MjqFz
         eMQP+ubVsyjjmj5+kQa5IR9PqMEXrMS3t60ov8KwAAcC3cwqcCuk8wk1QB8L6taBp8T2
         2D3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345930; x=1771950730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X03QoXU85mjUaiUOlaEq1U2mY9Zj6t10qA6xUtZtLkc=;
        b=gzB8M4NVTcVXLPX31zqXoLFYPVfixa+B777GgN4RHkpN646nWtOId3IRPjXb8+nPDm
         TCucW5ox1X+VJ73Y4Y+qEIwufJcHd6QaOgbkBR7qK1vtL8xTZ3TofOYkEEUo4GDpr7bP
         kwaZMErHjLYk17/kCdsOwVkzbT4EQuIvl6Fp5GmqcACks/Ayh4PCopdB0XUtolY29Ty3
         xu3ZcjwGjghxkDiz64R/K6lWMW8UABA2SRa+hzZxumLo3Jn20vta+5XcC/29kPFjFB1F
         uFcH5VFRyu/aYpzN1SGjlIxxRV80lOk58K9a2VR43Q9EAgyn+Pou3BS1hBLl76W9qlKx
         oE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrzekwljL9pIy5kU2YJ5LQa+vm8xgHCk0H/bjkeFmusviXGeM0hGfHRp0iODy9r80V69N7Ilrk4N8AmcXP@lists.linux.dev
X-Gm-Message-State: AOJu0YyfmRP3lK5D6Px/LtWwsWKA2liyQpzOciVzejaxU7jZXUyATXY5
	0GOivmx4a+hQ3gX5W0odR49wJx1gpSCA/j/iy7QVeoOn+WKxhbG2u/dmbm34PZKwkaYnTXfyA7b
	CZxh16G2ORKZS7NgF5LjG34qCEhqb4hQ=
X-Gm-Gg: AZuq6aJ7ufmvzcEyC7OWdwR4XFoQHngPnQ05MbeNv6pyspNdBUQue9B+TntCmYNNK6n
	MkIHqx/qJbhWJjCmqW55s8dZ2Lifzwp3bPDsFg6hCnI4bkB0Z8vZeTVdHK6zgVsPATIH5+zrAaI
	/qCsMPs9dZCLvwtL6hun4t4dMXdCXUxXU22mh4OrRFq/ofsBwyRI2pI9SL2u9T9+MxKVQGvpTc5
	oQpIrUEyXxp9XfcsyLzMUMUBcN/KsIW8r8H3nWlfNlvMRHMOLWaygNXg1cOgqs087SHkmy8kUeM
	w3KuIOywe7bTKNDAwOLl8mxC5/jvhg1skl14Hoc=
X-Received: by 2002:a05:690c:c50e:b0:796:6d82:10bb with SMTP id
 00721157ae682-797a0cb6f6fmr95454897b3.41.1771345929739; Tue, 17 Feb 2026
 08:32:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122145633.14938-1-architanant5@gmail.com>
 <aXI-ZV4uAd5GyFLz@smile.fi.intel.com> <aXI_HnvDNbX68-lq@smile.fi.intel.com>
 <CADJHxWB3b+bH2+HBP+SG0jxhGNcozstBeWeDH_3dgS-4c2G-6g@mail.gmail.com>
 <aXJmYAZ-8KkXCFI9@smile.fi.intel.com> <CADJHxWDCer97pMNHV-69B9AEVY0NfimTcxo8k8yFBbstg0wMQw@mail.gmail.com>
 <aZQm4QH_svsQuaRp@smile.fi.intel.com>
In-Reply-To: <aZQm4QH_svsQuaRp@smile.fi.intel.com>
From: Archit Anant <architanant5@gmail.com>
Date: Tue, 17 Feb 2026 22:01:58 +0530
X-Gm-Features: AZwV_Qgq3Ix1Uj-7loRjO2lZwEdwLNMLUPre5wGnLYsyiLrazMIDmB3u0UatEIM
Message-ID: <CADJHxWCUB=emUTfBTwtU=oZp=PH8AC0+QTebo88akgfGOBBOnw@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: impedance-analyzer: ad5933: use div64_ul()
 instead of do_div()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 1:59=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Feb 16, 2026 at 09:22:32PM +0530, Archit Anant wrote:
> > Gentle ping on this.
> >
> > Has anyone from AD had a chance to confirm whether the original
> > truncation via (mclk / 4) was intentional?
> >
> > If there are no objections, I can prepare a v2 using the BIT_ULL(29)
> > form as suggested.
>
> Gentle ping on reading and understanding the given comments, please!
>
> > On Thu, Jan 22, 2026 at 11:33=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > On Thu, Jan 22, 2026 at 10:27:52PM +0530, Archit Anant wrote:
> > > > (Resending to the list, apologies for the private reply earlier.)
> > >
> > > First of all, do no top post!
>
> ^^^ Have you understood this?

Yes, understood. I=E2=80=99ll avoid top posting going forward.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

--=20
Sincerely,
Archit Anant
