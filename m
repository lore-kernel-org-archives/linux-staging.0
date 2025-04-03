Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FFEBA36
	for <linux-staging@lists.linux.dev>; Thu,  3 Apr 2025 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743639652; cv=none; b=uKwmjkgt/Z9jbI+wmKGkrYjjK3kRJvm3i86rf99rnfF9jM2IhVwKUGGFhtv3ipLI2LzcVD3ONPYop+Ngq9XUHiR0W9GAOXeUNqMi5mvyExeOZoEV8SV3C8PMO4AUjeNArSQGEVh7NyrrMLNvf73M+Gh3KkForcRwEkz54TAooJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743639652; c=relaxed/simple;
	bh=YTcWcC3eS5xycxGOwbIpWeqr+3UyjvW4rwYWi/skT/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLvbBeWt4pichV8jbiuzijLXhgJfQcctUA1CUaUjW6fvRFsACRDOu14FOkzbg0rfzAtPbj6y1EGa7XAx5a299EOK2I2cnocuPPMA6ev0i5b39KCDGjDC9Ir+mnRdBtFzmTCn25Yn1j95ZAhFfzfqUcSHrjpYF5VBe/y5f5QKVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2oH29bi; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2oH29bi"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476a1acf61eso2911871cf.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 17:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743639650; x=1744244450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTcWcC3eS5xycxGOwbIpWeqr+3UyjvW4rwYWi/skT/0=;
        b=l2oH29biNaU2HAqtGVnt4zfzcV/gGLnjqlqy29tKV4s3e47l6ZFzlUpVpwruwvm3Tn
         EZ2XFMp1cr1z4X5rJB8vQLRohfUmxsyEQs8/e0VbALWB6Lqjax6LfN+eqbGbDOwUDaLJ
         +fop/Ie+q6+C5Tr42fad23Bk6ZkcEbW8rkdaZReAGc7Ug0IExfCwsu92zq2fUdoVWR4U
         TWqNMZewMMvsOJEdUlrEBrNXaWmlD/yWttP1kYjhllHg7cu4KA8hpXCjhyl3Knr/7EkY
         z2Uni6eUJ92HpV6jXW9OeUPucegW/YQ61csnh3zuHVflGsOdxyzGSBummVjzUfnEcCky
         HhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743639650; x=1744244450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTcWcC3eS5xycxGOwbIpWeqr+3UyjvW4rwYWi/skT/0=;
        b=a9Ml6acT9il0oJY/UyRSIJS1+AfJ8d1MWaGLzYqXYjlcNMCWTkn9VEEezP+Scq76fn
         0HzHEzya+VU6UVT8R+a3fj6bEmAEpCLEFZ4ZkXbR+S3gue3w6NpcB0xNFcoKIkAZUPK6
         lEb7CS+BiM5P6te/UMQ/2ghhZtC2BtrsyK55jbYZmnuOuQI4Z5+Vys0SOrqei1GjWjEB
         D2T0K6ksN6OW4NcGxDiYQajMAvEuCGwl2xGDB56aw8LackCp7XA1q1F1Em0bAWwwF1uI
         mXhq7GxrjAUpLz0a0JC4NhvSkAnaIODwXCZ5koXDsvbGppHcIXFPA7MRM5ra4nfkKFHg
         BTYA==
X-Forwarded-Encrypted: i=1; AJvYcCXaeEKPxx5lnStdguYkj+pau292h1B95ZWQ+W5Bpo1HKFyIZQvrqFHaehbLb0xrBaYRlkinvgDno5CYre4U@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1efHqIgYhd80mngPJdDPc/TBxaY+LmmIMi3K/nWKm1b5LRduV
	I3U9CFnfUIUUtff00CZjjr6Y0vqJHO6cSWRaZaDjpS6fnD+zVApT7KtHIFz3psDd45HCRbE2VrA
	vUOrp5URoWZ8fNBP2V/x7fGmUTxY=
X-Gm-Gg: ASbGncuHSX/k/OCmv1QWvM7s9G7GWz4WSbvzAjHLSUVZ52fLuHkuRSxjKAGIbu3dMK2
	E9cSE6LhFzdUa+y5zDClZTRH+z72T7NuYrGjFqnJ+EYHFi30Q1QqrzAkBS8WEorJMGzAqxquMin
	9qRFieWDW4tiAMPYeSXvYglpJ2sCdxRl62Em9ca0BeqqTGfp8rjfVnQd11sw==
X-Google-Smtp-Source: AGHT+IGzwHjTIZKTNeQqWvRvh98uML2RqTMbLoco8WCy7SIhCZDAQ33OpZ5L8LF732RiieS2+vgu9G6uDHb146LBflo=
X-Received: by 2002:a05:622a:1446:b0:476:7b0b:3110 with SMTP id
 d75a77b69052e-47909f79ec7mr78348071cf.20.1743639649908; Wed, 02 Apr 2025
 17:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402135001.12475-1-gshahrouzi@gmail.com> <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
In-Reply-To: <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 20:20:00 -0400
X-Gm-Features: AQ5f1JqsvGSzKWOas4Sgn9LEyx6jBvrZcC2qazVUaWvDVj5nrhnApX3foc-ewxI
Message-ID: <CAKUZ0zJ+N9BoxZVnkGnFhH00yZJKP9b+Dnp5oTwv0N5gZKSW1w@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: Fix indentation to use tabs instead of spaces
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:37=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Apr 2, 2025 at 4:50=E2=80=AFPM Gabriel Shahrouzi <gshahrouzi@gmai=
l.com> wrote:
> >
> > Replace spaces with tab to comply with kernel coding style.
>
> Still 'tab'. please, capitalize it to be 'TAB'.
Whoops.Completely forgot about this one. I'll have to reread the
thread or write it down so I don't forgot in the future.
>
> But wait a bit, the driver maintainer might do that for you whilst applyi=
ng.
Sounds good.
>
> --
> With Best Regards,
> Andy Shevchenko
