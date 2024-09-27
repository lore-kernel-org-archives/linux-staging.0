Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3BD15CD7C
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431845; cv=none; b=joEEBHtQmDTCgyaLirVf1ZlP5PTSO/XIsffWp6n1Eq8V1GrS5one51fWGTQ51MkFpvecdnCngdzLlvrjkuJ2SqhM0B7ajxKDO7Nu/AgkO95+OQDkaObx50DBIvh99MpNzQkCD+z/DihsWaGWipC3mfvd1t0QjQdk/oIkVUfzYbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431845; c=relaxed/simple;
	bh=OKkJMWMqOPetP2NlKREt/esvyeJgwlCMto1d4Bpxu5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5+5QsXxEV7X09V0nncCBk/8L+ACeKh7wBNhiqyQz/Z+qx1tTa8i2uUhjc7/Phu09eqcZyXd4lZfKzlMbI+di88wCtTpZ5pWNylDzzCPPFns5cifUkumVKLiGATUoyDBR4OtMy2srcrRMUFP0LGwZ9NtNwGURlsnL+7Pb51UmfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOYPxDXO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOYPxDXO"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so2207151fa.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727431842; x=1728036642; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fygk+mM7NoEIV6VRwm4uS46K3a/TjaOoGKzCjo0g7vk=;
        b=lOYPxDXOZxl7pnSKbBerwOT6+ouBtXiqxy5rUTXaiL/IRZjDCrwqnKyKK6BnAbxXCd
         11MwSQM9Vj03Y42EuJgXGp9fKNlN1WL+ab6EyJnMgsji3WwMbkm6vGDcSP39N0oXgjKs
         v5pOjaQyLXPFM6kV+MPTaNuJEznJwbT/jD+2pE8mXCd2Wb+93MQgPCR5OS39/J0ArFVZ
         8Moc4/G0AvH4aVcHHBDeZnYmWuT7Lz6bviKj6GOZdhtVapITlCacp3ldhJ8D0oXMmmgB
         E+7smTSukaPLodANwPcYt4SEfXRr0mhvjQd4lWaTCWnFc9Mvg2TFlD0kzYcuXN35wLEI
         f2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431842; x=1728036642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fygk+mM7NoEIV6VRwm4uS46K3a/TjaOoGKzCjo0g7vk=;
        b=Ijyt1kCEnQqn9XgAAma6jf7bPL4vuJeqs8Y8naLDZd+GtCCgQ3rrc7d9O17WZfc2zL
         CppI3sWTqSuWG8pTKedfaQy5SKXj49zXSiQ9IcM0mk3pleZEDBdgEO15z+I2M3s+iVin
         Wbcmkf0vUTDiek3AGo9Lo9CU4b7H7q8BV0FsP4Ubwtr9/4pG+twb0V5p2ZFu/NTjY1p2
         3gPzLVNI0dEQ9M2QDQBLxNmloQToqf/RBVhCBtbtUdNJIVzFNuD1rgOJVtLEIrcDofRU
         DwuMNT7mMvNoG5Sx9Gss2r5UIeY9Ao5Twk7YLEWoO4DZ5WWfH64kPyvWA1Rd+6TQJoLw
         LYZg==
X-Forwarded-Encrypted: i=1; AJvYcCXWAB0jlH+KKX9n+r3am0q96BGw0CB5jPVzcWRSYWJ+d6w6nGpN5csgCmi6XjxJ6lP1mxvE33Rp6A60XttB@lists.linux.dev
X-Gm-Message-State: AOJu0YyarSON45Zp+jY/B99a+rLaVyd3O3wKfI1P9DWKNlYrH8P9CCb/
	wM7HzeX8mudDQWX+FkUJ6ZN1Y/vDAKDTgb0BoryFUWAP6o5/r9faNNsrMH0PRu7+6qgkVgXoFvs
	xsGe/fOdKNWQZc7NCZxShwYKsuyU=
X-Google-Smtp-Source: AGHT+IGlE3RHUGfXy3qQvFc/07Sqw3cISbgvO+cgEBs4c6MnmnOz4mTcHXqIkra0nfdRwLvtsOkLS4uec4KjbUm3fr8=
X-Received: by 2002:a2e:be27:0:b0:2f6:5df8:bfcb with SMTP id
 38308e7fff4ca-2f9d4199141mr15883531fa.38.1727431841875; Fri, 27 Sep 2024
 03:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org> <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Sep 2024 13:10:03 +0300
Message-ID: <CAHp75VeGAzU1BT5bE0BrVj4MR=TR2KEzjwhoFUnN5Q=fUanJZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:02=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> The str_up_down() helper simplifies the code and fixes the following cocc=
i
> warning:
>
> drivers/media/platform/ti/cal/cal-camerarx.c:194:3-9: opportunity for str=
_up_down(enable)

...

>         if (i =3D=3D 10)
>                 phy_err(phy, "Failed to power %s complexio\n",
> -                       enable ? "up" : "down");
> +                       str_up_down(enable);

You never tested this, do not bother to send untested material, please!

--=20
With Best Regards,
Andy Shevchenko
