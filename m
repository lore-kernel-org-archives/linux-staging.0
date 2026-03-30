Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807033B388F
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860854; cv=pass; b=d7lEFZXKKenfY9IVVrOEyWOEUCCQvEuvd1i9cUA+wA+OWOkvxEErysO0G1Huqz5CFqOvBlYwMJKCQ3g9cvZupGBohtdgAAXJwJLW+Obazd7qW+q1hSeDj14eOXCJOn8TtEcrjrob4XyrOPdjXaY/JCVoGgl/HOs61il25WXlk4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860854; c=relaxed/simple;
	bh=HNxM95WlIu5Lk/QekeknIKUHWej903tFP5tcv6R7JRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gm8G7SJ4OpO+bopU3BgUw/PirfGdQ1zxgG1nYAfXBhOUk4HgA2YzA1iJM54VyyOc5ME4WzLEB7w1EnnUm8aAHrP+vt+MAAoX8hYKPbU7f/z3ufqfoEKgw2tZ7RZV/TPo6HcQkpFMZGjrB42RDxij9d3Rel6WSOdTzfrgs8DAx4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqHaqxV3; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqHaqxV3"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so1781474a12.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860852; cv=none;
        d=google.com; s=arc-20240605;
        b=Ku46zUrbTNRGdhEWXHN2uaPfoeZigyDxvXU3bChntSk1RLdbKoZTlGPrenwTYNAvho
         hKy3v2U422TDo+gHAL/wcKnTjFi0b7ODOn23pDS3+AL50972RsfZt5jk5rm2SRlm97bR
         YzcRoArcZhwdG0p5v0xcuOO4xo+7qAMKBYIlzJFDV6/J76CwPTrp7AkTaU1r9xmVKO9F
         94Vg1MWT7nT87/znZkX3d0s9QVxZ2XUg9rO/2YEyn4Q1LUJkJARNVE/p9Gskl452DcPV
         Q6UsqZmVWz3ZFDJJjLoTnVlAhxHyCa0EWJXKBb7mCmOMGPggl8EQjKu6JMNQH1/rzPbS
         RlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28a1s1exaF1LEG4PHeiHxuwcHnnKjfA2nX9LzJwMQX8=;
        fh=Jeh23pxfIFTmPlN5qCBNeEFUsPGtz8/w3ZE/lHRUeWI=;
        b=R78N2c1ZdaCDOYS7dnoylXRSi6hmPXTCZumWKBKdGqeZPBoA2OGo4dsgzxAXfN6KPh
         s7UcR+fvsQ1UtuyPnkNZbpEWxS6vK7w/fDXEoaV80+PA9/Yp3YqM6FAevyEGj1+Yh6Rd
         g7/M6eis7GCJ21Nhe3PHHkBP8fJVRGa7q0xb6gC9X6z9JaugSI7t6bWeArDiLRmtMD+0
         n8JfX7z5OxsY5UIZGVWWTkO3+eWPdJfNQvtlylcppUA2CZzhTTv7V6W0Wu32zpZhkpqo
         cxnXIcxGb76tBBJuozu5iSDWZZGTnSBfSkmkwZWHaFDdMRFJh7x+SEzO6gixw+4zjhCJ
         kwPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860852; x=1775465652; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28a1s1exaF1LEG4PHeiHxuwcHnnKjfA2nX9LzJwMQX8=;
        b=kqHaqxV38EZMFOcsbuG20Y/GvCVjaJR23BI4FtrFjGTRJrjCORlQD54PvqeViAkadQ
         Dd3p8h4MKXQizktp7r2uHdOJay5cfuPN7klj4fpl3R93IoeMqDR6LTkG/TH7F22EiQZC
         bz7AMRVClIoJxrPcFdA4UpAqZNBUBY/VcZYQ7pAmzVyS7zWuKSYLvq3g0Tg6k8I7nyAm
         QBXcW4GCJtVBjtg8CjwhTjZUYDGanBOGMiaToYTuy5QSKCav3+hShHdg1v3ajdaK3BAa
         5NyDNdsmEchuUW1lI8DGoYTrzpAlz6HKeVS/Qqv74CXUPKG0SLIazZRuXGQR6HTqC4Ka
         yi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860852; x=1775465652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28a1s1exaF1LEG4PHeiHxuwcHnnKjfA2nX9LzJwMQX8=;
        b=OtYkYn0ABUhxttKj3ph/tk/cYkVqPszVQqSItT6eyJYsQdL7IxFcCAfMhVpLD/f3yn
         C9rXlpoL53bQrakDYL44NFdJYxPtfbamuk1zSZYXWZWjpq7cdjTSxiINd2pYcUopw3cx
         AUVmq2wIanqTd0X3NxpCP45aSni/Aw5xPg9XqcFjw0c1SmpEGiSS6UrRt0BJNTROj1cn
         nOBS0Fq/ff9e0nFsvMG4985C/gBPxpoexldmY6s8qlHObUG9FrJ2uBu9sy6nlQXqXKVc
         Bbhp8PZZ7fRvnUr0WdUv3nFowqVJjNB3HFuPUFDz4xuEz3BGbg8ECjN8psxIr6WDX74a
         LcgA==
X-Forwarded-Encrypted: i=1; AJvYcCVzNWmSOElnCbaqfVjufWMGAj16n538nBW3OPgoVsxmap5FgSosC11aGLWDVGRR/nXwd1fxkqz2f0/i4qAy@lists.linux.dev
X-Gm-Message-State: AOJu0YyPXtJyx38uAZh+5eSti+M/qQrRrlDi6Qhwg/7TWHBOQ+6sSN2y
	JC2QNlNG9G2STbfXZKWGlz4Uo+M+jEx6QDO4hVNQhDJL5fydfnb0dASc3N+2FCRQY4IWX/GGlKf
	opDUwr9agVHS7dfPl1qUeaHI0+kviD4g=
X-Gm-Gg: ATEYQzw086gpu6L9Af18clxafKvPyf2/zF7ekbxExAJMqqE1DKgfLuUZtfw4rsV7CVi
	5H3IeLJej+VrTYIy9SnO7SReml1jQ4ENULuGXkFkR2fn45EFgVs2TneoxbjTecgGZESjPbEDNkB
	+e1y3S/UBDvZS/w7/Fjma+xRUuRdx/YzpnokXFr1Sf6R5ZOMCzq4Vjj62C78ae1XZA8M46e8hjA
	oXqVnX3MiTEJiZGRTc1F/Uwr0d0sBlgUol9fgSr/i/a7sHa4wXuWZMIdA4kPjakVWo08cOIx9Xa
	fwu4DS3lEYGxHRgEKb53jBHMjNCLcqFSirY6IobEBdHh5LSk73wvm2VZfnbQNdo4ILbjZFGfnub
	68R6eGcs=
X-Received: by 2002:a17:907:9702:b0:b98:654:d9eb with SMTP id
 a640c23a62f3a-b9b2e9f2a5amr819725566b.22.1774860851683; Mon, 30 Mar 2026
 01:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com> <20260330073549.5782-4-robyserbanpascu06@gmail.com>
In-Reply-To: <20260330073549.5782-4-robyserbanpascu06@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:53:35 +0300
X-Gm-Features: AQROBzCE--T4kUYa7KyYdaUv4_8VLHD_UIld1T5clwfY6-zBdFelAq09jqbXbAk
Message-ID: <CAHp75Vdyjr5YCoV2r2yoNHmYWL_PhXQG4CpR9d+ftU-WA=0GBw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] staging: media: atomisp: reformat block comments
To: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	m-chadhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Serban-Pascu Robert
<robyserbanpascu06@gmail.com> wrote:
>
> Add missing asterisks to block comments to conform with the
> standard Linux kernel comment style.

I don't believe it's the only problem like this in the entire driver.
Fix more of them if not all.

...

> -/* this extra define is needed because we want to use it also
> -   in the preprocessor, and that doesn't work with enums.
> +/*
> + * this extra define is needed because we want to use it also
> + * in the preprocessor, and that doesn't work with enums.

You should also respect English grammar:
this --> This
define --> #define

>   */
>  #define N_GDC_ID_CPP 2

--=20
With Best Regards,
Andy Shevchenko
