Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4DE2F1FD5;
	Fri, 27 Jun 2025 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015032; cv=none; b=AkwIa9e4mM2RkYxnkcurU7nP8Fa8twS8XpXy/g4hrK6hSc1omJ+2fQVkWpyxt2xcjneBbhlAr8ChNmdpq2wK42pCI2NXveLqHxyTCI3PPxuKjQ/siyutZiypcyYeOdEdBFyUw7fYaU4wCN9TgAyy77PpYCLOKwFYvefd2ba1C6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015032; c=relaxed/simple;
	bh=SkT01FuiroIHQcsTRFpB/e7tKPVnTyJoT7yGqpKBv3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7nxjodLTutSdVBZs8yzZudBHnE8yKaEuHGxWZjgAze/mKqC3FlhrlJji3TVdEY2aAzwifX1Iog5zE44gjHde9k0xlQnkb8U2qK065+5l+ZCovqjQ6EPvC0VLhNP40I33vqnCivmDZMoeFXgXPsL0buoJ5eVdIz2XW1W72GNWQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alK4fye4; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alK4fye4"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-713ef518da4so2217827b3.2;
        Fri, 27 Jun 2025 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751015030; x=1751619830; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxPXFm/2Af/O0czSgJFjpR6ljpGP3r1+LOljZ09h6rw=;
        b=alK4fye4ax2Xm+4DCPO8V7nmraLpdBnFwyZe0DZ3OYAEBpvioTf/ZjgXYeIj84Jeb1
         4QzG0+LLlaVzkq2C7nYFveZ4gzZ61xVMNnH2Q8MaAiR2/jg5t2YM07NQbw9fJue+QmIQ
         IqD8XE2Vq24kcVOkhaZGueKm8vvp8PtmdJaaf6hbP/hjiGDe6ik/lpGI98BIrSKPfH5Z
         kd0qdpCv6qt+bVbHBYGQhvaapHk1RIfb1J9NPJf9OA6xhreJ4D3sHYkPz7uY7kzsso1h
         tzZSRcJjyacsBrR4EqC1tUCPuZgBEmz0ok6N/WzkIx0yUx9BW55nGZKVStUSLFakmVjl
         2hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015030; x=1751619830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxPXFm/2Af/O0czSgJFjpR6ljpGP3r1+LOljZ09h6rw=;
        b=TQuMo6MfOPzXvmFwDBXV2SaxAtQM+7+iMceVk2t4M3I2/9I9SLkzL4ugGd2l16FY6m
         69l8l34o6twk+odSGZoyDyoa+ZGFn+gWRoylLnG9wIZEjCDgd2hV8gN7lLEhLf6Yfw+w
         qFEobPb6p0h4VhENbEx+ZbvBFaU4Ai9WhQu/kadwEfJcGyqvCsUWjywqHI7J8D0yZnoQ
         V2sfEiDlkd2LjepxVY4Rx2IwVmSHScgJFwoiKEefTz5wCNaf8mjWBFGQkdJpiVAx5+En
         iJxSxkIqW33iTwMLWjVGY/PG+zVUQt4OihuYNIvyXDnlU8mLhyTeUfpW+tnd2nGXi9v4
         IoLg==
X-Forwarded-Encrypted: i=1; AJvYcCUWV6ETwjGaYHifa4+TU15ZzpYD6LbaC8QssLPGTqMxZ8bu6cI2gPEBI2LoEhX7XJiEX7ipLLqpCwDivDPvcQ==@lists.linux.dev, AJvYcCV43JL+NiP3OfoD8k/lcCRuGIQz2Kicg3Z8+FAcxE70pFSudCkBZopnZi7ziOAolya+pdES5oy3tYbi2HpC1DAYrACGdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN+8jN2LIzwqLmzo6HCX5q45dfsL0qBgz9x2szuQvhxUFDKUvf
	zLe2mLwdQ9N4KUMWa8/solygdh6piOyGpJjuhGjF9fZovfNPK5gk6yVEAvogcafv6ApJFuFqXMr
	ZU0uTgKGT0wzsWCyZxKyPFrsevxCu/HE=
X-Gm-Gg: ASbGncttH1RAKMQHKWqzWnhOsEo8fbXpgNJznqLcMf7ZdcWKjT6zy4cWl0XExPdaGWM
	o/CoEGJ5D7jVaUEdKdek/B803mWaLZOdj3ia/8XcO/94WgJKpP8hvtQ2GqXxvMi878XVlPhSnnR
	PlAMOLP+rrvhp1U2s4sucUQWOKGqKpm/3RNsjUex2bsv3/gg==
X-Google-Smtp-Source: AGHT+IHxWtIJzA7AjqYBeRaD1K1kJoZF1TThU2Qzy0U70LW+zaf9l8TXpjHPTMMpS0pxvero1s7YpQzkzOAIKEGREi8=
X-Received: by 2002:a05:690c:4a01:b0:713:fff3:62ad with SMTP id
 00721157ae682-7151719d791mr15585547b3.8.1751015030205; Fri, 27 Jun 2025
 02:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250627072939.21447-1-abdelrahmanfekry375@gmail.com> <aF5Y5MurVIn1mUk1@smile.fi.intel.com>
In-Reply-To: <aF5Y5MurVIn1mUk1@smile.fi.intel.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Fri, 27 Jun 2025 12:03:39 +0300
X-Gm-Features: Ac12FXwOUEosg--SmicR1srEOI1Ci9W95VvN9pfI47FDKsi8dSoopfUooLVYraM
Message-ID: <CAGn2d8O-X8mgmf9kED=XbFYAoySs6+is=dorkz4yPbrSLiP6Nw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Jun 27, 2025 at 10:29:39AM +0300, Abdelrahman Fekry wrote:
> > The sysfs attributes active_bo and free_bo expose internal buffer
> > state used only for debugging purposes. These are not part of
> > any standard kernel ABI, and need to be removed before this
> > driver may be moved out of drivers/staging.
> >
> > - Remove active_bo and free_bo attributes
> > - Remove group registration calls form hmm_init() and hmm_cleanup()
>
> ...
>
> >       /* free dummy memory first */
> >       hmm_free(dummy_ptr);
> >       dummy_ptr =3D 0;
> > -
> >       hmm_bo_device_exit(&bo_device);
> >       hmm_initialized =3D false;
>
> Stray change.
>
sorry for that , will fix and resend it right away
> --
> With Best Regards,
> Andy Shevchenko
>
>
