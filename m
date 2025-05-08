Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8920C2620CA
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693324; cv=none; b=F+ouvGkPLvQMAnH6USDXWEwUFn5exu4ein4jrki5/It8hkv8BQZ0FL6uHvGG9ZVUuDFdL2KIZ+oGQt+DtRbOqYMg+z6Q8mMeBMP9iqxYyG87kuiLcX9ddjGxLcUa27oVP9/Hf7o9gT2z7nBMa/AeJxK89Z1jJz6jxacCKjE4NLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693324; c=relaxed/simple;
	bh=e3t7QJAuaFJtViosS65Bennck9HPjSpPtTFfrFBECa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KY/Lul1bz+Nr6AuxzJKukHVq3RpFQrUxqFOEwpcSQkjYoJXfiireDrMrcSF8ZaqVnUQJedK+x8jJaNnRZWVjvNclilLUD+d+9pUkD0p3mue3EnZk6kKkGGG3SW+1ISvX8zOGEq2GKIOAtHqHNV6RCH2HDZ7/hTvcMW1gu2iMCX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZJaSciQ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZJaSciQ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fbdf6973e7so894358a12.2
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746693321; x=1747298121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC9aDZS0LKYqmqpbLRQ0il6x7yHH8lhw0zmN0sVe3Os=;
        b=YZJaSciQ8GDzKZrUS7Q3Z7TmzmAKzK3aQTqck4yKRZBxaZs6GvjckJiVIoqI/VzJS+
         86STiHf6S2cKuAfI27mkzrhjhWDyvBV/1ZJmIcBIqtd1VnJY4WrI8FfEC3KwG/d0Yst+
         3cQsl6wtmbAaHw2S/G2oCcZSnTaH7KZZidkcBsI87HQzShQsn9YeR0vkiU0W0NJBQ6fV
         BQQhKzsuz0heZIX3+tK3dAOMFhfDBdXLHiQyCGeHLadOoYoj9pRTwOu7xy/kMvV+RNGu
         OyUaU3p2Ds5FUxrdcJUmX75ePYLzgM7E/lupA/Mw29F8SqUvqspeFm6/ijgWxN97wo//
         uhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693321; x=1747298121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UC9aDZS0LKYqmqpbLRQ0il6x7yHH8lhw0zmN0sVe3Os=;
        b=oNqH64hSAH/7wznygClLXP+B4SG/jl+Wpsx9JN+XGPLMm7l68vDenE+z/4J05Lo/C+
         QuLAZndoVpuQMgDcTBNQ6CH0J0cKXuHZ1Tm8I17DeVx23lGzWzcXGbj38u9d+ZuZ7DOD
         TZ1WGYnom+8indxOH/hEon9UrmnmaxYLHu039QFljGimKprMmfnXGBCy6PT9SM2a87qE
         LGqrd9UUvz9dgP7EQSGB1UUWECO4ngkHj2cjqgSfmjgDVEAfdwSuIo2qrhSea0PmDTsA
         awfaI4oqcAUNhqNJOU+7EdZjS56oAiyN5f5Q4wQkVxd9zhR9cb1Rnusm9BuOSElU91K7
         HVow==
X-Forwarded-Encrypted: i=1; AJvYcCXpusqVkuxZ9urHizGLHjAEuymx2n/BHgkM1leThB2vMFMUozya7uNz6ShP+KFDd4zGTzZkXzJIUrmhnQaM@lists.linux.dev
X-Gm-Message-State: AOJu0YwIY129SmK9LQwpVE3bBOTF5lSY777b8GFXQ4q+I5pMJIcIId4i
	qXulozZhuKnA8N1DKUZ553CdCjHUO1QpE7Y5X1EJcTmGUh1QuqUYMi47/NBZ1M4tvP/ak7MxSnk
	s3EJmXOO1x1gdGqDShGjsKh1x8UA=
X-Gm-Gg: ASbGncttvJmuA5DN+SkUlNp+jAcs9SQmt6LN1buWYmnmGLX0xIhkl1/mNB8JJ5CLsoW
	H8cwaMoMa8P+hQ8GHsVmubVNP/4SYfvcFl3krxnb6bOiF9oMDJ1/jO6fDyewqRsF6vthPS/K9dZ
	zK3/jr0DDFNyBaz+odAB5Zhg==
X-Google-Smtp-Source: AGHT+IFpTRqB004nqyjzDqZJ/RdnM5xzbDAlNgJkwigYL1F9Hqa2p1wCGUuWD8zw4M5LDHI+4YuxtzAWl8MSMgluW7c=
X-Received: by 2002:a17:907:3d8b:b0:ace:c2ab:a720 with SMTP id
 a640c23a62f3a-ad1fe67bec2mr215231166b.6.1746693320490; Thu, 08 May 2025
 01:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com> <20250507184737.154747-7-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 11:34:43 +0300
X-Gm-Features: ATxdqUEYVL7wDPaJGrVwNdydfTxWU0TSHRUnwOLZJPK0ubdIgZb-muGbEwg1zkw
Message-ID: <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 9:48=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Replace the duplicate code for calling the special Intel camera sensor GP=
IO
> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
> the sensor with a call to int3472_discrete_parse_crs() from the int3472
> driver.
>
> Besides avoiding code duplication the int3472 version of the code also
> supports more features, like mapping the powerdown GPIO to a regulator on
> the mt9m114 which is necessary to make the camera on the Asus T100TA work=
.

...

Don't you need the Kconfig(s) update to have proper dependencies all
over these cases?

Otherwise I am fully in favour of this change and the series as a whole, th=
anks!

...

> +       /*
> +        * On atomisp the _DSM to get the GPIO type must be made on the s=
ensor
> +        * adev, rather then on a separate INT3472 adev.

rather than

(FWIW, it's your typical mistake, it's something like the 10th time I
noticed it :-)

> +        */

--=20
With Best Regards,
Andy Shevchenko
