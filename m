Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E23A6EF7
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050958; cv=pass; b=Bjn1r9vau4APvNQVA0y0Sw2SDO5Ukrvxk3QANvVawuebNmAJ+xWi62RYXzHgWRIXqfy3Rp5Tv5yvJwLVHfZc3/I4rxFaTnaNHJu4Qa7ZMV6IwTfjS0T0fEi0ozKsuemST/5hZToglvnh0ROMaf+559NyZLlUaJuoYBY6nEBNnm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050958; c=relaxed/simple;
	bh=ReTfp2BNb5+vhenEth+YeZzq4FqmmZGH7TQ3bS+terQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipYkkSNF61ozLLnpZtxFG5Z99sI6d7UNbhO/8xvWDllELaLDRNUatQHWef0r+ikObzn2zzzgpMgKF4LmhHf8svPEuqvsK+3oltD0G2spcPINkdVZG+qqQbdRkKgYPhDzDsq+ycy9RnBk1h/tiY52k0nEssJHbM5fvq4/42mTdsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZW5bUklA; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZW5bUklA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f97c626aaso1250256966b.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 06:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050955; cv=none;
        d=google.com; s=arc-20240605;
        b=OaKJHUkGq1yGs1FyxPWLscgAmNo72AfmmXz3o3NpemOSS2FC+nfdmWOe7aLQYB1dom
         r8WFomORBK2MWH0zLZos+AwMhlHW+2AlqtoPVcA8Bx6bGZUXp7aoKusaz0kKyCeyVewv
         wZ35Qlmns6QSRlYAIVVZrZi/EN4syybNOUzltjxf6m0L7EwAAp4JqD8Pp8bWHQZP08Zw
         7XKfT1uRTogbqQw3Fwc1pGM2PubqWU5bNtmMOv5VLg3eAd9VOCKsKl44aIv+VDDH27OA
         UlQXkxoU+zuDKmn90nezHRbsloGYzDAgPVjOf+UulLdE5KvI+22kRhgelbxzeEAvgq7r
         zIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rwB30YTwjUpF0yMyhBCPvLGvl3V17aK6OPJmntebyxU=;
        fh=BrMO/exe8irvxI2CU7xuOFD7RzWFY5VSQnln9WxdlSc=;
        b=j6QzLCvY53A52VBnTx0erCxbPdxShj1RDkH7mI0+mUvV/A0WG61jQtP37Zy+xGaXMh
         NM/kJyATICndqpDEZarkPENNTH8QM65Pg9d+QVzQ8vPTxUJLypFd9LNfFQ0UVqMOM4Y2
         lP6TPbqufp5LTXg2JZJFmsat+OAAnDiGrk7y85gpctEGM43yEJaqK+waOm6PX993FRm5
         X8wVlMRHpo5lPcJYuIq6jKKaBKLp0K4sry167+v5YmJ77PC6YEYZuH6f5zpqDwGDtS9b
         3YW2cWF+xglXDtVot6oDbxd2OtDm+m6SjMmlX9dvJ8IwCYiHlBShOzXCv/VP+ltSHNUn
         zuOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050955; x=1775655755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwB30YTwjUpF0yMyhBCPvLGvl3V17aK6OPJmntebyxU=;
        b=ZW5bUklAAMTzpepMBDkjiU+pdf8I3EEX2Ug9Nj5R4SE8/BfZ6cyQ7WRcMWmis/Nhcw
         QcAK560dyRzdc8EhCtcpRFXeFfhDSG/t7iXkk09f4urxUZdnRZdFqUUrtLsCToi3VcOM
         QtSWAVrlYTix7D4+RSdsNHvzTIYVGprIYRW55FHKOtbW9tI4AS6QKCZryWMzQxGiQ8tu
         9gG/BVuc3pGVlVpRaA2VWLrDJFCD5vRHgEfR8MN2DFtVsAo/qYSiGyL9oh5ktJHWUQnO
         vKxXHnidl60vJANnCmFJDGNUm3vaca6JuzI5werkdDgJVZsaVD3Vu3p9+j3VAwUltDbC
         bxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050955; x=1775655755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwB30YTwjUpF0yMyhBCPvLGvl3V17aK6OPJmntebyxU=;
        b=q02hLWy0g8edylaBX5d1x2+/FfX9azIm9ruub7sg2Y22JH+Wjd7VKQY7Xmvz88aD22
         ngsZYefDnWU3GSkH2vrNRR3Jl2xi2iLoRsWvKVOpX37ZnVXm3YB+IrdmdPNlsW4PaGe/
         GAlrEN7IIGxExBpLsTdXeo6Hi5z73TaAHRknLVG3JHHmbhbbjuTy0oVSxCaNepRODK/r
         EkvJq+mQkIiFZsEOak19htX82WazOClCfkNqlIZwZ6x5HB8tlABWzI4+F6j7p7MR3tzx
         iANVowcfNLrr/9+6uNM0GXh7wmS3AshoakIDE2+QT2FZcsZziHSEZ+/u6TWAbIMU7TZv
         8MDQ==
X-Gm-Message-State: AOJu0Ywp5ZbKw6CKPZClq9slbATOmCzd7+TD6a/CkDIfUsuVrvpK/4Qy
	WoFOxRgYSUHR1k7/OdgFOtAkUIChw8exmLeq3XQi+Rfekf/zuglvAvXAhHscBiVMh7kfkIt444E
	YEY0DM0rzHtvbUIt1clpBHNnKUq/mr58=
X-Gm-Gg: ATEYQzzPNArruqBv+EiObeLUVXh2PUSa8bE6z9Q59gbRFM6ho8Dvlsidqiq1LApSRNq
	JGw6B4K8lWE4m2cLQ+xMQZlvwmLohKcEqe82OP5seSXSUAraNhjWAYIvGKTGO7YXEUmww1q6tRN
	HO8fsV/1Q3eHY3rClzsj0znlHfk2hBDgPfJ1FQ+Nzgo0JbN9fDspf9FDXiKhrTk6jQpzyU/b0Aq
	+u33WWPRA8jQXgT2fXq+K/YUtV5GItgRJkgGDRGekNd1syZ2Dk2/yV3XAf31sf9xTI0f11R5dWD
	+zLE26JR+kHHdgz9RjTVcN4aYdBQKPqxHSrRf9xhg4VFaSpzZ8wVQAseh/jkMYWMKqaMHBxTFCe
	U/k7lZZI=
X-Received: by 2002:a17:907:a0d3:b0:b97:1d24:bfd7 with SMTP id
 a640c23a62f3a-b9c1379d454mr281131666b.6.1775050954856; Wed, 01 Apr 2026
 06:42:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331211649.421777-1-azpijr@gmail.com>
In-Reply-To: <20260331211649.421777-1-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2026 16:41:58 +0300
X-Gm-Features: AQROBzAyQMFMW3zpRjh3z9JYTieFZIvJvEOK08Jx4jrfEiGt9fTQs40_G4qRCK8
Message-ID: <CAHp75VdBC_Rza3qvUnbUJpXSgjLWefN7UFu=xeJWNXGjm+Urhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] staging: media: atomisp: clean up ISP
 configuration path
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 12:17=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> NOT TESTED, REVIEW CAREFULLY.
>
> This series cleans up technical debt in the ISP configuration path of
> the AtomISP driver.
>
> Resolves a long-standing FIXME by gating ref and TNR frame configuration
> behind the ISP feature flags that already govern their allocation,
> rather than unconditionally attempting to use frames that may not have
> been built into the pipeline, and removes a duplicate call that
> overwrites the same cached state with identical values.
>
> v2:
> - Replaced NULL checks with feature flag guards to address the root
>   cause rather than the symptom.
> - Updated subject line and commit message accordingly in patch 1/2.
> - Expanded commit message to explain why the duplicate call is safe to
>   remove in patch 2/2.
> - Updated subject line in patch 2/2.

Actually we don't need "staging:" in the Subject, it makes the lines
unnecessary longer. AtomISPv2 is a unique driver and I'm sure staging
or not we always identify it right. Also check `git log --no-merges
--oneline -- drivers/staging/media/atomisp/`, it shows the common way
of doing that.

--=20
With Best Regards,
Andy Shevchenko
