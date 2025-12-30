Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7209A2D6401
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 22:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767134599; cv=none; b=QaehgjSchNLAs9R2qT9zDZD3Ookj+hT9vAZAj1k4yIyY9FKHlGMM4hcpFsbH9v5uYxeMsLW6LCZWdEXcpJmq8kv76zkcZrCx5zfMf46w+AsjvznSjWcLDqO+3cVW5igbnBr/I1piG0AtN/0LnckQrrz089ZEcLXEchp8S/5473s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767134599; c=relaxed/simple;
	bh=9mEi6OrHM82M1e0Eu4BKfGlCSswhhgbyi6wTYu1Esdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9x/Lzw4MvTD1y5+TF7fo4Dd2gN+ELPpN/xr0LXPhwAdNA2h+yrZN1cuhm4Lb5mjRNaqcztXtvN1EioryfixT6SPPkSoFC3nE7BoJgb4nB5/IR7ZA9qUtYEiwrLJhCeU21RzjbxhEtCMqujEwVj1ub1EyCGmgm1DvMYWHxJZBFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjYYp3Zx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjYYp3Zx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64951939e1eso16686313a12.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 14:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767134596; x=1767739396; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mEi6OrHM82M1e0Eu4BKfGlCSswhhgbyi6wTYu1Esdo=;
        b=bjYYp3ZxgfUlfLQ77X56z/m4kHYAf9D74+4uE/O/bYYnDCzEi2ED9ydh7oFDszmDbz
         nS83mUJcr9npJ5FPPVulfBGHqKSrhdCCCWx5pluSiTAw6NJlHIlpzxzHGC8efVbyl+IZ
         16bSo5IIgfRTI9q3J40j0uJx/xgiK2NFDSsBlb5NI2LZf4REV2uCKkUDBbkaRMqYnjVz
         w5AAQ52THjkbFyi1JlJQ+EN+3bgzDLu02ZgC8/MCWTNKeY7gXQoi2v5TU931eGZUCnsB
         gleaTd0QYAllnbQa+bn/zAa6Sw2FiADvRylN29zOcRcp5mzc6qkvf7OPjmJVscR5lrsQ
         iCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767134596; x=1767739396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9mEi6OrHM82M1e0Eu4BKfGlCSswhhgbyi6wTYu1Esdo=;
        b=hWqTV1zJztfiT45LH3shuUoWO8ZGVVIRItn3oNozN4YG7QTTVzdmIMdHb2t/ebf2OT
         IcVn/MeVeG5QISeu+2vCW9tHXKOsn5YffZTuYvi+xVAz4fWVc1dt4j3xObI7cuTASjzl
         WMLi4YOXOaIaPBisfk2nXNcL1v6AXSmmUECJHUUcaev2WfgfVVm2fl49pBX5p5a6zPZ6
         hZCCAz/KKk2OFf4tTK5RBvWQWSsG+EoNFP+6QL7cCxPmAlaMzCNmG9uEb7+SHN1/sxq9
         11e7DCbBBFIqK4W9tJZI3fDZrVDKLIxfCkBZmVuWSIj9QTQ9umtmvMJbRsZi+9iwDfqu
         tbmg==
X-Forwarded-Encrypted: i=1; AJvYcCU5BkdPdhJCBxDmN+3FjAkNS5bl45tXIrQJTou04x76UrGvXnIruXUL5/puhNiRoP1yST8YKYr7172/1VFc@lists.linux.dev
X-Gm-Message-State: AOJu0YzKzh4iO+rR7Y8B7ijVqFzs2E+ktw9tbc7JJRqy4PmMw+IbVBHg
	Iiixw/+vVzP7oAKG5nKO3xxnyRWSWdlF8w3dqdogh0k5HerBzdaqimuWMq5TeAdMgox1dAD/lsD
	mmqZVhwu0GcJuGtiIPtdDTysb1a1HLUA=
X-Gm-Gg: AY/fxX5M2KNz6gk6D5hzIMENcDVPTbCLFR0207rrRYc/R3cvPAAkDS2Wtuo1BYZB3aR
	QuetrcI1hMzq1/2B0EDcyjCAw/FrKZi89lkY/CPG8W4o7wj7BUGN/+ux1tBWo6L96aovL2UuerY
	PebCuOzzMCGTk90PSNNPHjl4tOnhkGN221IM6WQjiWFiaWPExyY3h+iUz0jHmxCejQFTSVX3vPk
	4w4xFTTh1JGxxZ0YJnCAohXzOgUq//YprrpeMp6ctaLuhCtSPh4JbTbwWJzyfEaqJr/69QRcGoD
	eP2nOiQsgZ9rCj5hmOFNNjouhJ88WYYPzB5oEtD8h3JJIvr2xvX0IsYIrmv3gjsscQNqtu0LqmK
	2pUWXpfg=
X-Google-Smtp-Source: AGHT+IFQWfQKkPBeY8y1lW4UgnrOAAMI40g1X5cdWEdu84v+wi5zQgy4ZIJWy0xewaTSwh16p/etDzIVCFjsFTSA5bA=
X-Received: by 2002:a17:907:9408:b0:b73:6998:7bce with SMTP id
 a640c23a62f3a-b8037152a19mr3578554666b.33.1767134595488; Tue, 30 Dec 2025
 14:43:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230052827.4676-1-chintanlike@gmail.com> <20251230052827.4676-4-chintanlike@gmail.com>
 <aVO5X0NKSdkH6Ab5@smile.fi.intel.com> <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
In-Reply-To: <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 00:42:39 +0200
X-Gm-Features: AQt7F2qWtePPexAYMwq8dRDWvuDOrmxY5lQaE1jMdbfoOaWp8Hbs7ajPSCcSepQ
Message-ID: <CAHp75Vf0n2wQAEt_kfvZKKyjS7VqU3_SvF0vYbYBGikP=7dQmg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	tzimmermann@suse.de, andy@kernel.org, deller@gmx.de, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 8:01=E2=80=AFPM Chintan Patel <chintanlike@gmail.co=
m> wrote:
> On 12/30/25 03:37, Andy Shevchenko wrote:
> > On Mon, Dec 29, 2025 at 09:28:21PM -0800, Chintan Patel wrote:

...

> > Still the same issue I pointed out in v2 review.

> Sorry about that. I had actually made your suggested changes but somehow
> I mistakenly send old patches instead of updated one. I will send
> updated one. Should I send v4 or v3 is fine?

v4 needs to be sent.

--=20
With Best Regards,
Andy Shevchenko
