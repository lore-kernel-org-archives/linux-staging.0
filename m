Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318431;
	b=5pQUUd89Lr6civhV4pL5LCePhDTdQg3OzbxzYTwgCFS1BXx+18azGdF8zmKA90BtOnIR
	 Eqp4QlpWcPpjs0nCWYuDscGlU5/pyojJ4hAC6YgC1slPnSfwOcwtIPxjU8AR1nGXU0Wtw
	 tLZBNAaWIu06y15o8+inimQl3h+A91Kifp4oqG932lSsPZUoedy8YgKI00hKFZCJIe95f
	 q6r3ohdnuo5FzHCejAQiGfUIxr/YRdSsVdIHb90cBL+8UlM3QViM2SgxdM/1tm1EKBoY+
	 jMDqQk64oLL8P+YqvDVJ44IGCr9g/WCS8l3fJgSXr4OYAckdueNM79xu1uN6D8eFOHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
	b=UkUMkPOGyySNTpBd3WY3FStJbU+wXPZ8AhdKTVpZM+4++Pr6TqW74PZZeNy2vtzqWlTO
	 srxND6vo9+5C5nGOqMBSY/4n+ubvlIU7AYikcXtN9N8MZ4l6L6DgizogObdOb8jqharYV
	 Y79VdTxuf509VuqZU9I7PZJxGqkrM9jHncNI1EvxVmskQL3ZnZRvurL8eRtsuIOdFhLHa
	 Lj4HnpKdml5XWY2uHoTvNe2euIT96nxHLxW5mlKxDZYbRKHoWoxsisiBkOgL/zJYYbrWB
	 HzaQt9jfkfqwdPuKA9xK5bsc9EQpIxvlrxBM6MJY+uSwKvxiMi0x26qX+CdnqXjm+9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpSIO1wc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1BF60A2600
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 13:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1BF60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpSIO1wc
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0dba37a7fso21234497b3.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 05:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794318430; cv=none;
        d=google.com; s=arc-20260327;
        b=iwBXbN8647nTef8ghjZF+PuPq3rHsQH0faCezhbii5ZXKip+AsRfPGYSk31b5rokEg
         1w4eV71oHkz+O+IT1oB4IbNuTtnwK4c3l2iwv+VzvZPRH46TDN46chpilQKkU0QPl5Uw
         006xSh3hE8UOAuvJ476b/EKwmGZZlW7uvup+OZFyTNbO9p7wjkK/MMSXb0aPfRfW+Wjy
         gWIYJE/+FedI9d/WJUiVy3KnqXp5LblnAz9+XGMQdsKlMu8qAmVOwfR3+EveHmAHy+0e
         hCZF+5026QYBfC42lJ2kF+9Ya4rTayoKHwA804KPFOGLx26xp6aTIIZbXUN8Q/SxvL/4
         wOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        fh=30dso6Vk8p3uspAzQMYVA023lYgUDzGEzmXUD/FKW9M=;
        b=dOmUQF272/NrlzJ8fhIuBcdYfGaB6BT+X4xeyFT8waVaKQCWnytAn0HIf0WQfMX7/z
         ApCRy+Y9XBWX+jb//28lHF+faz5QTKVsFaIRj6q7Hqpqc32SntxtOZ3idq8OOSCveSz+
         8OZTOGPl1nbvFVvPqPl5MhUtFBHQ3CcXogAUJxjwN29mcz2DWPwrUKb8Pqa2ej9AabQ7
         +aruBZdcMho+gEqOrnMg6/FxS7aZSfN3gYgkphPlzfsfLXFhybpFqnBawFVd630FXHXF
         1fq0XlvKjN1tMD/FoTmiPxU4vN0dPkLMtRRiwrgBMg1bq8w6nMxm36h+P108rdCrcIkV
         +Tbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794318430; x=1794923230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        b=gpSIO1wcnDbsmQqTI57U6j0KVzhbgJaO4eWO0MRnIaSh35WwjDUkrmP4c0ZLsktpWN
         07apdFf6GD80YWE5kZRXBblQSjYEDMCylCbz/exyaQa4f4h0uUxxJs92ytuppVg0eJ4r
         gmC6RipKQHGsIo2B7u7xXownn6cfgad69Xb4rmxke8LmWpMHIE/U5AmTPqo6Np4MeX8A
         uwxts5oX6NytYXYk0Gvvnw+FbwEyK5tjQmyDVUs6By81oh+zewYfYyKbxTbbmWCVQHKl
         WE43NZSo78aZ8OD0FRJ2hncvyae+BkPEhe3RtxCruSk3Des4R6nW1gMsSwIrik+ruTq+
         kBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318430; x=1794923230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VULIAJGgrRJMFuTT2lfyB5+2UCASsfPHnc42/y+6eV0=;
        b=YZjqQ2bwXgofRa/uZKx5knsnV9paVoT5YFKdF6uS2wYzXxAAsNp8SUJdxmUodLTTqj
         RccFbHr43YZkHHYE9dTxbmUVFsIwmUyhAHRoE7N5QQlS2JAm8wAYpWy/7FPfnzYv97kc
         9ZajQUXr4vKjougB9v/3CansPGCao1gj05wdrKZdxkoeIk4+qEwfBUg9tWOS9cc75Nk8
         34hFSJnWUwZcEFXue5dG+4Zl+8wIRceJkHqdafZqpg+oRdzHl5wh1iHYqjmde8F35oIh
         3YzkGL+U7/V80tdx76NWBD6tqNboMH/L+fB1FvaHUN/L9gRvdLx5MxOXYe3fbekDk4CJ
         5c+A==
X-Forwarded-Encrypted: i=1; AL+hErFr3FdXcLjkbSYWHazjZbj6S5gdaon+8G9QOgJi17qqBtSoLnKEWWp05ewZ5oTuSs07orh/aG3imG6By5B8@lists.linux.dev
X-Gm-Message-State: APuU4Z9pZpzXaLqJQ0Bsci26u5T60giJX+IDTQ7yFzuB52KYVZ7LEIgz
	eBL544Dl4lCVLG9kvz2x8aRgk+7uchg3xWVIQkhaJ18rwNF07hJfvwUcvyoy6hPqBhOL316D1A4
	u3ezLkMThWoJPsQsWLPWYkiWJpnt2T+4=
X-Gm-Gg: AYBFou3kjkZpThOixdBrW62hQbicHOQfo40adq5kPMtHMmflgl6PVkM74NHAGQ+WqO+
	Nw8rK8YoIlaXJFUh+6x+/1p2qiF24jux3lmbe5VeIntNQnwgidMTGzbGiKd4I/H+NC3jmH3Vvb9
	lWpXXYIbNLJxIom/9iW6quOZ/+dy7GxjjBVE/xkHpHSDXeTTP7GSpYMyrOsIoWiRDTr1DxFf/fG
	+8LJwud8ylRT5xf6M8pveXgLrNezu1ko2nKEDxVD8L63qFlzhd6OFtyoBzlNOj7X5pVlwoXdau2
	Oyl0LdztC6Z/wG3iEpNi6hGOPF0BuopK+rjzVrKR6dHL+zSJi+aIb22PkQ/yzIFpUAP5iFZtxND
	BR2te5FtIXM2g1FgRPmJCgstbc6BbCNFCePs6b/PMnkevau820/SxUVPWRUU1wbcvHCW/QacmAM
	qg2RYUWv622WeLwSZv5B9nn0KyNIO7Z/nsJDGfkJF6BVwO0TMHPdxh1Gaeg93PFPcwIdTe0Or9a
	LAjF3w87uf+LCMq7K495NAtBXvUbe76ah3vI//izVTZawH9+HAHWBe3TxYDHg==
X-Received: by 2002:a05:690c:82:b0:8b3:150b:43b7 with SMTP id
 00721157ae682-8b392a0043bmr15689387b3.22.1794318430086; Tue, 10 Nov 2026
 05:47:10 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
In-Reply-To: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 15:46:32 +0200
X-Gm-Features: AclHuK--urMkAZ8a1GYQVxfw2ZUUBbdPOWGmQEwXiTmVu28rFGKUFoTFy7m1p3c
Message-ID: <CAHp75VcaoGMkUXX6WqpfmVsudOZvkS2bbotqJ7oatjkBJA8=pQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log messages
To: =?UTF-8?Q?Kincses_Benj=C3=A1min?= <kincses.benjamin2007@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:58=E2=80=AFPM Kincses Benj=C3=A1min
<kincses.benjamin2007@gmail.com> wrote:
>
> Three hmm_bo log messages misspell the past tense of 'bind'.
> Fix them to use 'bound', as listed in scripts/spelling.txt.
> Only string literals are changed; no functional change.

Don't be a meat proxy to some tools. While grammatically your patch is
correct, I think it will give wrong information as the used (wrong)
English word "binded" comes from the definition. I haven't checked if
HMM is a HW-related piece of software, but if it's, we can't change it
without checking on the datasheet. Otherwise this needs to change the
constants and the whole usage of "binded" in the whole driver.

--=20
With Best Regards,
Andy Shevchenko
