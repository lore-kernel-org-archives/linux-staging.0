Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75BD1A9FAB
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 03:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771904499; cv=pass; b=Y0nrM2aquUDvmh2xeKZWKuSA+QnKd1kWwdAJHTOcQr8ai000MM8/4jvLF/X0TEogkHkSWpIFy6SLoYkGt9LOoFlU+Fcw92qzxVBLn4PxyCSrI/VF+Xt6ze5ZGU2YnaU7qGEm2AMZ0j1EiPeEK/POcq5ycNoZ4WZYm931QTvyI/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771904499; c=relaxed/simple;
	bh=NjUgFgIr1W2UuqfkOjfLH4MG/f1JTaFkgw6FflWqkKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucOynlk9ZGe6EBx0P3Lk9YZmwzn3s/ym3IlbYflXGNMuqVCU6jmUCh2kDtJlu4YiZmKINPdNZ0FjZR+KVcLK81uaxs6Hu35KFbKoC9TZ7FEQ6ExUe5uzGADKIeo/ixyXnyWLwg/PfHQRV8N7gAFfXtNnpcLms7gtBCDTeC1Ehvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8dHv+bP; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8dHv+bP"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64c9f7576d4so146574d50.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 19:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771904497; cv=none;
        d=google.com; s=arc-20240605;
        b=Whn6fQDpDzfr9I0IGcCihJBI1koMUba4Z1p3VhfIZSev5dkOJqNVgNiQdnn3bJ8jyG
         tATLtNax1e6MlfajzF+4S6orsYwRl6oOVi4gGq46E574vN1wXxrpVfWrZXjYvvP4s7iL
         z6Yzuf1hg1Uq55v4L68Ygj5ZHIy2Csl1Do+5Ec6D2JHaT14QRcLw1XNX4oFs4PWMMpc8
         fpyPaiSI1uZmLggUgF/kIao5NwYJ6StYroIWAbfL4oA/Mw9jabLgfoUQo/w9irzf56p4
         n0W0D83++0lEo097kYjPV0bv8XsgeeeWAQkuoq3pCnEuUbSA40PoK8610iYwIZx9dnAF
         cxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FfbdOxokRF0Q4Sh5bRlzYEVWEQ3qWRLkUrj6g+NsMbw=;
        fh=0+vIZEU8W0dsiN4cJKj3RwLZCrNIkdrSdifbMXVBzgY=;
        b=LjIm+aqjUkrU13rwjodk64w61023HBkISO2ewIJSJnUuIPA3nwSUZfnDxwKrJAr/PJ
         w3GtOgiDtdIo1P5RUUkp7kK5kFAXG+tejWlHOqhnQFfEFo8lUrXeRV+agA6sjG0Qq/rv
         jOcKT8kIRyh9iMgprt/Corci6D3/4qYSSlPewjZPMZe/OzRccZ3kyCEn5q58NIlB3RLk
         xqgnb5ArUNYORGXg4uFlmEqW/t7Vwpu1MKc8Y9hvX8MeNZc6GLs5HYEeJlwFn/TsyL6e
         a46cQGtwx4Kg55kKeQ0eXp8YrNSZKiEs2vmlK6ZbVpVLl0HmQugZD7Zn4ECwCXbRekB/
         kBng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771904497; x=1772509297; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfbdOxokRF0Q4Sh5bRlzYEVWEQ3qWRLkUrj6g+NsMbw=;
        b=R8dHv+bPdLfE3QlPD6vyTth8MfITBFfbNpq1icb/JWISLs9h207UZa0s+uD4C+cZ1J
         3C+g5wwtdtkBOV9PxOuNlFXQCRjz+i+w72H2VHFMElvA/AohVSqxA1IfZsJ4v6VhiOnS
         RlplFrE/W98RMMhMbjWYAU5uvYnUWi0uKQle3a8Xl3FhmyHjUi3j/ey0SKhwbK5BIGHp
         6bVdQtSpyZPEfqeaQPf0ATbktipei7880ubdgULVQRV6Ui9eDgD7VoPlAI5DY8ohsQP5
         BmrCb243FO5ASDRFQJ1QZewBCRPK2jTQaCZC8KNZrJT3GoA9N4c3Msbm87/OD1SgLWyn
         9grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771904497; x=1772509297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FfbdOxokRF0Q4Sh5bRlzYEVWEQ3qWRLkUrj6g+NsMbw=;
        b=AOcBwJWnAjQAdsZRZu33oEG/QySOXv5kx8red3vbhxeV+rJ0kUCq7m6eFctS5K4lHg
         PDdQ939LzfGUdcU3SaVei8wFuAbpjVK/aZFqDknTQYUdPcVPi+QeqVnHXO1D4NQgTNUD
         sr+T5Ywz0dUwuKOw12QcqRvrbHPKfVidP6Mg37oSGyIbqpg1vxsJ6iqHGnhMlLq063aq
         wUOKuKwmGGuRJyNGoH8wNm4oBON6uhX0sqgZtKUUm6MkV2NUCc5mJZxRbWHOeCfH7KbE
         X2FRIyCFoYCHp0HbCrPnPaUZ/DFHzKuOPSZMJCw8+JRnQrtmVWN12Ri6IxJKk0V1bzAk
         Vfyw==
X-Forwarded-Encrypted: i=1; AJvYcCWa21YFCCnIFhteNoOSltFGsmnXOwkenKwT7XhSApEtJ7nQF8a+ed3OPdqVStRhLPc43COlBdbUQNj2zPb8@lists.linux.dev
X-Gm-Message-State: AOJu0YzG5IZkpDGouJ81rM7YVnibwW6c1CS59MfuHzPBZjg6xkJva3FT
	JRtzq11CoPA38EDOYh4cG7iqUNVIfArXiof8CrJz42QJfN4NusikGbI6y5F7QlHSkNnamqFUc/j
	jdxKfvLkqMeLOFJNXgCD8sRzEqdfYMgo=
X-Gm-Gg: ATEYQzwfM81fnL9jjHtBYVuIdKyQLI5/w7J8nTJKyRqcWNLkrHeHOAJZIFcRuetpIM4
	sFIxZsJGzh7L/xoS9NrBBvTxjBDL1sWdH6iLAz4tS1cUXHjv+H3XRTNouyOTIVmKrOJdiG/Nqgr
	NOtSGHZHgNSdAUSZT9yeC8Szr5/QlvHihsQwQnJWONB5oNLAFdMU/TcKEoX6d+XWqcGcCTWc5NK
	RXjQfN5sXHLouz65jbevbNJbnAW8Je7StRIG5//jPMRTtf+YCYtFC7HiHTvYXDFriosxuQLBwQW
	aPKf5KqpMHAAzjofp/DzHdmcKxlcmvGnJtonHw==
X-Received: by 2002:a05:690e:1516:b0:649:d26a:d8b4 with SMTP id
 956f58d0204a3-64c79072c31mr10360413d50.78.1771904496888; Mon, 23 Feb 2026
 19:41:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218125327.21467-1-architanant5@gmail.com>
 <aZXD0smUd3CRgPcv@smile.fi.intel.com> <20260222134326.7fc1f45a@jic23-huawei>
 <aZwRt7ws7PeHyuPM@smile.fi.intel.com> <20260223204442.444c7503@jic23-huawei>
In-Reply-To: <20260223204442.444c7503@jic23-huawei>
From: Archit Anant <architanant5@gmail.com>
Date: Tue, 24 Feb 2026 09:11:25 +0530
X-Gm-Features: AaiRm52gb2mDAHiu4cizzLZxr73QGlCRc1temhPZjuanBPnbtkXMUt_w5MSFeL8
Message-ID: <CADJHxWB930R8A19uqozWfF=RviteJxd9Xns4uYFiQF5zKq5KzQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: impedance-analyzer: ad5933: use
 div64_ul() instead of do_div()
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, lars@metafoo.de, 
	Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 2:14=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
...
> > > Tweaked commit message as Andy pointed out was needed.
> > >
> > > Applied to the togreg branch of iio.git
> > >
> > > Andy, if you want to give a tag I can role that in for now as need
> > > to rebase anyway on rc1.  This mail felt like an 'almost tag' ;)
> >
> > I think you are talking about my Rb? Sure
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> Added. Thanks,
>
Hi Jonathan, Andy,

Thank you Jonathan for the help with the commit message and thank you
Andy for the math optimization guidance.

I've learned a lot from this discussion.

--=20
Sincerely,
Archit Anant
