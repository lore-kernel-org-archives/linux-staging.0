Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FAD155A2B
	for <linux-staging@lists.linux.dev>; Mon,  6 May 2024 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011811; cv=none; b=OVaX7CFvhDZL33UDiOnC+lvF8GZZXLglgacf2Ngs2WRZm/32t8JHwCPyyBVl9U38K4CYan0l1jjmRhgehPcBFs+d6/oNrfFYDvFQ/BKSAnADfryCSss9Mzhs6W2Ue5U/cXfDgKbzbIZKF5ZMEgmrLb1RfHThTio8A5N9DV/yGF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011811; c=relaxed/simple;
	bh=eCmNUiiRJVnsgoDYJTjnI91mf0WYtOPxNku6ZSZtSbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atb7APXZJ3NExayyWcTdfjc6I3e3Cg6wV2Iu6Y0dEc67zfz8KWx1ulu9u8QPpVFT4wf7iG+LnR4NrsmBQMwOESAnGS/BLTGgBEt38UJr4wsSRsJ5OVtpKFjkpJpJPuKkklJJ7/XjShoXVRg2zsIicpr9kvBo3dRqVeSEInhwU/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HTiBpQtp; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HTiBpQtp"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e27277d2c1so28213391fa.2
        for <linux-staging@lists.linux.dev>; Mon, 06 May 2024 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715011808; x=1715616608; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nutCb6hy2mWUIhHOiW3+RagNvLqQap85OsgVrcHl9dk=;
        b=HTiBpQtpNCxefp/JhLsz5gTuI03fN+5ziAcYFfQ4i3Ac51jaJluSTCW9UeQkHXY+3P
         AIpM9nKjmH8SVLKgdaa2JLdGI3i0sDpchtq9ZiRKr/fHqpC1FOOy+MUtUIXGIXGLG1PX
         +Mn8XVnmTfcY9XvA9qAnLMgGZ1fZibNz7wW/yUSFU3/ld5p5P3hflylnX5niHPsaqEEh
         JU/JW9wAKpnBdsLPuLXZ1EhheauTPAr7sufXiDUfyrfMKfppZ2CCMiRyhxgoCYn9+zCV
         o6cfkNH6p8QV2UDdTUIMG0sDbGR9uA91XXvpx8OdrTZ70ufCcDxDsopDQc3y7eTX7wre
         SepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715011808; x=1715616608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nutCb6hy2mWUIhHOiW3+RagNvLqQap85OsgVrcHl9dk=;
        b=ZGAEjsYe+AmzJHlgZhaDA9oKN4YT7uVj5wPR7qnWMx8nCjPWQvJ8GitXzLwRf29Dzp
         uOW6Zr5B1eKVjS6wvqk3BAACyZWMj18B121xhOCkPzolw1vugXVOaWR0B1+rIZpH3od/
         BSBkSSzoMiIBPEnB/1AOMZgnackHf9ZAzpRVgqd4u2nfcu+Aglndeb7EVMHh8z0O1ZTB
         jTsz8yq2sY8XfkLDVSZO814q/0sUTk3CaO+NmLe91AxvQ/kWhpwBC3VxPpT6b1UBPXSJ
         D9OOcNQJERNn0iFJi2BZ/nGdIdzVVokmcjvV1XhvdmSUUvYuHkHUSAQ6FcT0N/W5mjKE
         vHLA==
X-Forwarded-Encrypted: i=1; AJvYcCWQPHPayT4nHKJAJC3pYT67gqLaaksmShBQ63R5gbQKqR2iAnoSn45xY3i3OTNJTgQosDihQP8GCuH8ECCP6Fls1k3sR1Og8Vcj4jGaqg==
X-Gm-Message-State: AOJu0YzIQnPwwa+0/9VQwG8RVScrjBBrL684HOvH5VuMRSZkhlqJaz0J
	GNuuQtGc9W9zCw++ftjTNxkLOVSqmUNUuVpZTEa4Gne/oIHQj7GK30Tn67PWyT2sSeMTcBJ1P8D
	8jR7sB3a6OKGpp246h5nYwNg27Q79+1x8EsVmbQ==
X-Google-Smtp-Source: AGHT+IFxBzWxShB6K8Au7V8PY/rACcHC+u67upHljxePNYb/sfK3sX2UX+dZzknbFTW6GN7T4L5DGWVxF4IItIRQjKc=
X-Received: by 2002:a2e:3a19:0:b0:2da:bbf4:81bb with SMTP id
 h25-20020a2e3a19000000b002dabbf481bbmr7101049lja.2.1715011807732; Mon, 06 May
 2024 09:10:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
 <171500756002.1968386.17290951989557329800.b4-ty@kernel.org>
In-Reply-To: <171500756002.1968386.17290951989557329800.b4-ty@kernel.org>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 6 May 2024 11:09:56 -0500
Message-ID: <CAMknhBEADE_fY+naO46Hf6gDP=H-Ap_dG6jRRzU6i7WR2J7LkQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] regulator: new API for voltage reference supplies
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Support Opensource <support.opensource@diasemi.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-input@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 9:59=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, 29 Apr 2024 18:40:08 -0500, David Lechner wrote:
> > In the IIO subsystem, we noticed a pattern in many drivers where we nee=
d
> > to get, enable and get the voltage of a supply that provides a referenc=
e
> > voltage. In these cases, we only need the voltage and not a handle to
> > the regulator. Another common pattern is for chips to have an internal
> > reference voltage that is used when an external reference is not
> > available. There are also a few drivers outside of IIO that do the same=
.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git =
for-next
>
> Thanks!
>
> [1/7] regulator: devres: add API for reference voltage supplies
>       commit: b250c20b64290808aa4b5cc6d68819a7ee28237f
> [2/7] hwmon: (adc128d818) Use devm_regulator_get_enable_read_voltage()
>       commit: cffb8d74bd4e9dd0653c7093c4a5164a72c52b1f
> [3/7] hwmon: (da9052) Use devm_regulator_get_enable_read_voltage()
>       commit: d72fd5228c9f2136a3143daf5c7822140211883a
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>

Hi Jonathan, if Mark doesn't pick up the iio patches here, I'll resend
them after the next kernel release.
