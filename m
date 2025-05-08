Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639027A100
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716151; cv=none; b=VjQheLUbUHUzTaBBm3kpwj5g3AtL2zT5InbsXjgxmfaw1y61gZnJ+3DSK8ZU1RIAqs3/k09d2om+IwFVIMscbGBEdTngfUSFzJW6NKp5VVlf8Xk9vLm8F5trEIvOuA2dtfpXTpp2BWy7A3kaM7p1GpbApx0e6qlAGq99pdv6RU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716151; c=relaxed/simple;
	bh=Wi41NfxUGhbTbv1pQ0AGhckkbn6srjFISoz8v8J+p+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AE+OSYmSJmE/MqyA7q++xRi5u18jbUjwiiGbclXPTtfsjThph2SWL36zGruWjAzjn3xSCeIkMhF9gcs2PO1MJifTpGAgFei4LUIuFHcLOuBHW2ms2I7RD6/QCJFHpDGz3oLPStHzD1cZbP56iXSDtx93jdfH4gBjYrWcpjUi8fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OASI1Rrs; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OASI1Rrs"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fc5bc05f99so1773924a12.3
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746716148; x=1747320948; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wi41NfxUGhbTbv1pQ0AGhckkbn6srjFISoz8v8J+p+Y=;
        b=OASI1RrswDwifZJGICWLrlPhmVdvqgvhH87F96lQs4ENLG80pwkmEoGEyYA1EAaOKM
         IzyMhLqE9+TKr/0FzztSz3v1dygGhAoH3KWke5b2zl97spg7IW71cfGvuFicQ5Qe0cjO
         SMScAmFx3kie334jc3Z0xVd46Nf1t5/xjP+mpdQipuQjBejx8CSoDUWzcDAtih14zQLr
         4ELjdUjqiPl14AnWtqyYNRfD4AR0DDWxhH8p3pjG7MBexIGrCUF9ofuR4Ak7+GZIdsM4
         LAB40a7q0CBpW1nVqGh71R3NYWKyHm/savgZ+bWpPKE7rna0peIxWdgNs1g01kiNB7TP
         HMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716148; x=1747320948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wi41NfxUGhbTbv1pQ0AGhckkbn6srjFISoz8v8J+p+Y=;
        b=KdXJGnV7ykUTDAxPiCgqig7sHmntgK7Yynr9xXbxTUyGpndO9m5jbc8cj+3X/UOSO9
         8uYanQB0JFOKK6pFCFy6/3DtHaQ6iJnEDrK3dt6s/YPdHKBfs0o0xv9+3jSctlKj5bAL
         mMW7oMrhscwUA3mLpZ+R872wMAQ8eYKUauG9eJOWmTgwIZn8Bg6CE5Xgp2q15Q4H0hP4
         P1JoUQVCwikfiNsW0b51SaLCTcESAtrkzh8TEW1Sevvi745qdDgnNEBTq5tCD5fiX87r
         T6JTaxFcTTrLENfa0JzJHtzt+/AHCZKw/AjSCN8fNQx6qpHeXgYGNS+Jio9Z2LHR39Jb
         wAXA==
X-Forwarded-Encrypted: i=1; AJvYcCVZgjh8zeckzGiCKFCdsGBaigYcqYy7yRd4nHPSdqNTYrq/n7FiyvRQgugjvwp6gdr2gJbzbARhcflA623F@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4hkufy8JyEGNAdg+SN1REQpITOY7HR9S6U9ieUbj2O6NXYZwM
	AEzLOTQTJKxVEsUFHMfElbcsjNqc8I911c23i2ldwMrYeOpOxNSzeLpxcoHYeWQIO0esBTiQSj/
	JVSIYl2tgKnAJEYlLdbwLGsGzwz8SMl9i
X-Gm-Gg: ASbGncvgf3fY/byZsooNU5TE1UCR537Z+d8X4XFy8lywFwN1UH4LYczpR4BHJ8Qc3vS
	GTTV/cN6CzEu4sG16NNAKNMxqUQ2rlhNTCZSIiXxdjvHWv6DJ87Z1y5RIM+3VDcE5ccAvpnhDqV
	TjdIdWacc8oWciK9hPlxsfGIDu
X-Google-Smtp-Source: AGHT+IGiKRW4TiDoK9/lBhRrzeQKcy9vPDCmLn29aM+2GMRxVJdJ+CW9Z051dhndWfzh2L6JSFGlIL4gDWZ3hZmGZI4=
X-Received: by 2002:a17:907:8d87:b0:ad1:e7f2:b94e with SMTP id
 a640c23a62f3a-ad1e8bcc880mr783564066b.18.1746716138298; Thu, 08 May 2025
 07:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 17:55:01 +0300
X-Gm-Features: ATxdqUFbSQF6mj9SBgrSeC8p9uP8gtobKBLj7O4lMyjvY1f-aFMKCyAoOnzP-K8
Message-ID: <CAHp75Vf3jUuALHGk3fXEDRnWKh-z0prSgQ6sYhK_dcrxAiyEYw@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 9:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:

> This patch series does some small refactoring of the int3472 code to allo=
w
> re-using the sensor GPIO mapping code in the atomisp driver and then the
> final patch in the series moves the atomisp driver over.

I just realised that the AtomISP variant is very likely a predecessor
of INT3472, and hence a lot of code has to be shared between two. Or
even having INT3472 being enumerated as a pure platform driver for the
case of AtomISP.

--=20
With Best Regards,
Andy Shevchenko
