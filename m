Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1997A12FB21
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711641306; cv=none; b=hGkNO80FAd7uIOF7uWmm1FVEt0KoVkqwHL5v7W0/322p5MzQ3xQ3jPKcvZSGft15WCnZG5FWt5NW3HJ8EfKJg0NLV4VvZ9L4Rl8pxT3SYHxJrZNuWo3DLSY3eOe/Ovs5tanCJifDxeuU9nGNhOT86nsHl1BkJFUCrIekorTUvAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711641306; c=relaxed/simple;
	bh=R7bfIIh4/xk7LeALLFjm8pnnjWc59J54jmaQNWQ6v8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JveMZ7v6vgMFO/WL6rfs0Qr9SX8EsZqrq2yvML54ighi/g92dlmAeA/no4lQDluOoID08Iu5VpzRuerCDU7f38XjFiA2khBGIjBqHHkTjHLG4HTJhmFNQrPsiZAKaXGGhTnXjQ/7+ejGhEbH8IA7DYhwyYwFjwDo9rT1ZzqDaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SDz7w9Fh; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SDz7w9Fh"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d4515ec3aaso10162891fa.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711641302; x=1712246102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7bfIIh4/xk7LeALLFjm8pnnjWc59J54jmaQNWQ6v8E=;
        b=SDz7w9FhhTGJ67pfZJ2zo9W07lzjmUWk40i5/ci+aHX2gmT33RXSzYnd5tgWmRVigJ
         5JvhjYvvOrBK41cjrQEmEL17fD4gAVi07qaoJkgwr2LHDAGW3HPFiSa2rTyr7n+H/rV/
         Wzct+RIS/IawD9BebEWkQ0XlM8FRUsDbqFSFi/TKwgLBPDGQsPE92mmxgy8rwVLM43m4
         i3AYdsU8dF+4JfKFo3/iWJ59MSIhunn+Xp4fTJwOq+NYTWgXjenG5NIoZt8O/ohCRXsq
         zFaHzCLmaDUvcMCz2+8llbLAqMbXZ8pUO/8yQNWsPeDdhzokEhBpMdDRnx7FAYPwRAGO
         KrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641302; x=1712246102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7bfIIh4/xk7LeALLFjm8pnnjWc59J54jmaQNWQ6v8E=;
        b=bGu3RstIWKXeVbUqwTBvhgWgimvfQqmyM61X9lykFAbn87pGTAmEdLNBxo7UBr0gbL
         MpAvTiGXTA2t+4FrEZ/WXvA+VRjWVUmcqtp0HCyUuOXkl6SrWWT381xgEzN+I9Rn5VWy
         0qqisw3DgE+xU2Ef+8QgsL94YswjoAJa2tEKsD2WWzfr1nhANGcc78TpGAx8KeJ69n7c
         6L1UR+FHmqcB8Mz20fQKNTkW7ik6VGAY5PxmYAjP56hxAnS1duNFuitZPjjIgOp4paMA
         v1UDPGNfSRGrDXV/8ojoNkDkRGiP+cty+W6a9yuPCzEo1O+nPNNFHxWM8O37aXyhffW6
         N6ww==
X-Forwarded-Encrypted: i=1; AJvYcCU1lUuqGBRGkkxxkGenaAixqL4U46sWJSsu4qIY2EwBadHbvG5VTQp/2LYjVmGDAV40GBLAhsZelvieZusvtQpCAh/QvhHbbqVGvbo2Ow==
X-Gm-Message-State: AOJu0YynZPdsYzKzASzuhlj4PIKVY7j0V0xXKHCQxo6gmAdWmhRVsYmi
	/GznXz8EjS1+Ahh9va12Q0uK+kFwXg/cJAkKe0KkpxOyk6OcOjfwnznvmkSRYY5tmNGaOA44iZT
	uPfvlwTEdWm4au8qYlCeK1jziMTHNp13B4LCbBA==
X-Google-Smtp-Source: AGHT+IF0/ESH95+U3ugXq1Ok8l0CIDGsN+Io0PuUxNLRneFUjMk4GFow/0Qf+aMkXpICnzlbyE7BpmzBEev1FOymhUA=
X-Received: by 2002:a2e:8807:0:b0:2d4:a06d:5ba with SMTP id
 x7-20020a2e8807000000b002d4a06d05bamr1198649ljh.14.1711641302030; Thu, 28 Mar
 2024 08:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
 <20240327-regulator-get-enable-get-votlage-v1-1-5f4517faa059@baylibre.com> <20240328134744.2fc263b9@jic23-huawei>
In-Reply-To: <20240328134744.2fc263b9@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 28 Mar 2024 10:54:50 -0500
Message-ID: <CAMknhBGAL4m5RtQsLCOiSUofAGw89R2We9MDMzfvaT=5o-4M8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/7] regulator: devres: add APIs for reference supplies
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Support Opensource <support.opensource@diasemi.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 8:48=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Wed, 27 Mar 2024 18:18:50 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > A common use case for regulators is to supply a reference voltage to an
> > analog input or output device. This adds two new devres APIs to get,
> > enable, and get the voltage in a single call. This allows eliminating
> > boilerplate code in drivers that use reference supplies in this way.
> >
> > devm_regulator_get_enable_get_voltage() is intended for cases where the
> Maybe avoid the double get?
> devm_regulator_get_enable_read_voltage() perhaps?

ok with me

>
> > supply is required to provide an external reference voltage.
> >
> > devm_regulator_get_optional_enable_get_voltage() is intended for cases
> > where the supply is optional and device typically uses an internal
> > reference voltage if the supply is not available.
> >
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
>
> In general I'll find this very useful (there are 50+ incidence

I didn't find quite that many. Still close to 40 though.

> of the pattern this can replace in IIO).
> I would keep it more similar to other devm regulator related functions
> and not do error printing internally though.

I did this because it seems like we could be losing potentially losing
useful information when something goes wrong making it harder to
troubleshoot which function actually failed. But looking into it more,
the regulator functions already print errors for many of the error
paths, so printing more errors does seem a bit redundant. So I will
remove the dev_error_probe() in v2.
