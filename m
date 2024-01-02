Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2797DEBC
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfkHWHmf"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-680a13af19bso20249026d6.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154503; x=1704759303; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIwM6KRZK3tz4EwN0J1avePE2ZDdYEFfaEyBcpZ/vcU=;
        b=dfkHWHmfRBIOQkh9fxLwNiIKiy69UFkyLO2eDCEkVkBhbXR2wparMjG9jjOSuykua/
         15DYCQIEhV711wL16QR9fc5KHaq8I97P+Zeml8o0SYYCil8b+Ubv5Nkcf2ABedbO0LhB
         KaPJ990FIs/Is6CllkURqwl1VLZ937lpks394t2Y+J0X0Xi6cvcunS6clTIMwTaG9SFV
         O+uCEmzNLdm7/HwTTDU2UPYD7HyZv7QpzfOV6QNy8LoHvaBA+aaR5YWKjBVgWWyZpRw1
         Ius791PoRL2q5x4g86/9o55AZgHeYz0sy6mCQjgkewwWJ46J+zmJk3/OqcXo0aWcrgeN
         ICfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154503; x=1704759303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIwM6KRZK3tz4EwN0J1avePE2ZDdYEFfaEyBcpZ/vcU=;
        b=K/J0ICuZbtWHIIOkJPI4/hKI3Jnm15o6wrBH9EECDHR9523xln1Yn7E2BdUxxpWTGQ
         cBwKNsbzfD3j2iirk+WCF/fdr8VH3h0R+7yhB6s95RTMObLhVORHPKy4l4aTjwl7YuWA
         CW4jBFkgy/gP8yM5+WaaNpp9BOU7NNfkA5Jc7f9H+h0yzNmUsvV0fW+nOBIt2//f8GJn
         j/xK/dZk7w5Ul5dx1BcYfphPXMUnOTR4Nw3QZnP9rY8By8+uDxevXPK55ZeMhRogsYgu
         7muvEOjcOERb+ycj6+O4WE39yyggaK/5D3MQfcj1gxHD6RVpAirO/OF8D4ANhE0VZGEb
         YqyA==
X-Gm-Message-State: AOJu0YyyNnAOH35YzI88PLzJlxITtFeePdy85hy4lOkesEyg/hnv8ob+
	E8S8nY/eGpS/B8jmiTsiq93jg16ZxHnDkOyntvA=
X-Google-Smtp-Source: AGHT+IGgWzk5CRUI1H8y+iXsp6s9wfUFhaHnBYT3P/nZpwwAeZhSFkWSy0uBAAg10PFrOj0suCjhBDoHA+r/pjoLHpU=
X-Received: by 2002:a0c:ee8e:0:b0:67f:cceb:465a with SMTP id
 u14-20020a0cee8e000000b0067fcceb465amr16174040qvr.88.1704154503028; Mon, 01
 Jan 2024 16:15:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-2-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:14:27 +0200
Message-ID: <CAHp75Vf9pa9MsKc1YJex3sBAPMuRtYYOck8_9Ryz=RNuP5JTmA@mail.gmail.com>
Subject: Re: [PATCH 01/15] media: atomisp: Adjust for v4l2_subdev_state
 handling changes in 6.8
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> The atomisp driver emulates a standard v4l2 device, which also works
> for non media-controller aware applications.
>
> Part of this requires making try_fmt calls on the sensor when
> a normal v4l2 app is making try_fmt calls on the /dev/video# mode.
>
> With the recent v4l2_subdev_state handling changes in 6.8 this no longer
> works, fixing this requires 2 changes:
>
> 1. The atomisp code was using its own internal v4l2_subdev_pad_config
>    for this. Replace the internal v4l2_subdev_pad_config with allocating
>    a full v4l2_subdev_state for storing the full try_fmt state.
>
> 2. The paths actually setting the fmt or crop selection now need to be
>    passed the v4l2_subdev's active state, so that sensor drivers which
>    are using the v4l2_subdev's active state to store their state keep
>    working.

Two comments:
- why not 'if (!ret)' in a few cases?
- can actually v4l2 generic code define a class for
v4l2_subdev_lock_state() (and friends) via cleanup.h and hence make
those labels and unlocking calls unneeded with use of guard() /
scoped_guard()?


--=20
With Best Regards,
Andy Shevchenko
