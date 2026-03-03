Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F12386C05
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529701; cv=pass; b=K5WHKCqxpEHaUDL6qEEDScLinAVG2G5mGvBH1zh3EgZuelbPeoGQoYzZqwni9jWdvLwmqg2dfwE5mtCUmcs7X6txmU1EOa1f3uWQDSkt+lxRDmkCHRy0jgZ8ERbmRhkpKU70coq/St0FQiWyTS+UI1BDbyndGkI1kHNmTwrr9Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529701; c=relaxed/simple;
	bh=fN3t0vmb2MEuNSgkXqPeudxeGP+K0mWzA2P+qEzEmPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyFlthAsSP9oh/S2cG+zHoybDuwqcLe5Ylj+he0iolIBm/CcYWfEOKrOSqy5CRik0S9ysuNlsc6dXiJ5w+2QaxdP6SLEocDx6rEPL7iSRVOOUyorbviycfg7uwAhrwOHNS1olJV86b+zN8pzaBhZds3TJr0SyIw23zT9c/KrRlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uw51t+W3; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uw51t+W3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8d7f22d405so851028466b.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 01:21:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772529699; cv=none;
        d=google.com; s=arc-20240605;
        b=lzhLzggOUfDwiYN6SLc+K5JsT91fWQK47szIP+iT3Qkn4XQr7fUJJsPhKSH6n4WMEZ
         yIeT9hX0Qg/dnBh11zy9oGA/Iri1SjfVSxXy8mzNF6mWuOpR3cDQkMmKHXRWmJAqoUGf
         aaq2kHJXmXR/UnpYBUcDCgpXUdByb8Sov9dnnDTer8vBlRaVSje01WWRzSAWM+cPIi3Q
         zSW0IhGbQU/hOu3ZAgnEZshX6fAAif5SvntCJovputowN29baFqfBEyfJb6mHgm+mgVb
         Rh79yKSJBN9qu68r+/6mo2pjCEQ/I++bvHsbrMSv3Fx0Aw883jj5MxilXAmqCMWaqZ8L
         iVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JrB2cc9THhmiBknivOgMNl8QvoNPpvuT94F8tRthmYA=;
        fh=1rGN/sBzy+zqhLV4cLnPEzpVGkCdzQ0K2m1Q4GFYEtE=;
        b=lQSxV89npgGRuckYVs4uqt+I6C9P467AUVrnHcGgW86wsoy/mSHSj5cRdZ5A8nJeP6
         PZ96zoHwjZI22tvPoIyO1mX3a4QUqeQGbtGox5mG9HqM/rMBRzUYvs+DpZVS6ccbJlSJ
         zXmxnOrzW+Anmre+j4gAOST/w9XggihL0La7wlsPWWO8N05FuE1gOaIQEYgHhtiN1Hbf
         psw0VTkjCuJGwKsSdvdwam1PbYomPV8oJIVa0XdA4paAsedc/6p/kWcXCtu5TIA8gK9E
         ruHjvFrDL4Rct/JvXH8Sjz+ZjX+tW481UT8rN5pYuSMMcRX5EFWhma8xKr8ampkqmWVX
         hfeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529699; x=1773134499; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrB2cc9THhmiBknivOgMNl8QvoNPpvuT94F8tRthmYA=;
        b=Uw51t+W3+8OsSkKtZRR3WFN4TLoklO66wtVQ/WvWNFIxdT8Au7UhWkSk2H55dh1ILR
         J0j2E7ByeBHCnOw642JBNFnbrIE5y68Xpa6/cVlt+mnRTqNCXfBQdiRGrOHom/tUWSSx
         txN2cz+2ykdzGWLfylNnYhuTyqnHqNswN1hMxJdWj6QklyX7ImHc0WPFVL3SKf7MpllN
         h1GEBdeDAlFT3AyT3IN1QjkHYeDrHvy90PiNaW9p9Gj14pCkJh0O7Ff3hwCyg82wEUAf
         +KKrQEx+pRl/PYZqDmKgMfxCjhkUKCSWM0hMxj+ms94lwXnir0sFTrsipKLF0QNt1Den
         n/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529699; x=1773134499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JrB2cc9THhmiBknivOgMNl8QvoNPpvuT94F8tRthmYA=;
        b=YFWUCt6tfRLyrcdeT9GOvf7aOyd+OGexVEwOCngC0kkarIWa/B1Xe59A5Lr4lp9wu1
         ooSviWvrRFQLC0HZknosMBYOqLxLlYya5erpXqx3NnuKvbmXRBoP6bi8Dl+O5Wrn1k0c
         ZoGfvjMB3FMnCJXT8HW87bXDiqRMTD7WvCFQw9T1vM5ZxXK14LuRnQHqgWMNoim3u89C
         nOzNAZhHQunKOxuNvd5LIyASel4alewOVuzi+oreonzOySuBMANug9QUKmtwy/Gi2G0R
         Eyz6fTYE1DozNIa9rt2j3OT3oZJzRsaflASl3UQVXnYQc4M2DndbuSKtiE7jiyGOW2na
         YW0g==
X-Forwarded-Encrypted: i=1; AJvYcCVcRwz5YBCsfFkcRQC9eaE7DGzqpdA5iiPd58DOQO+EAnqOTF+lHmCZvyQfQrhkJX1WJec9EEq2+ZBhMW0N@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc4dyIzTalhXdTVNi+8GwJ9juRizxGufMEuB8pwXosBWn9aSxk
	hubVfgTVgxlZ0Uw+D0PPx0WE8a7Uo6DlqCF4OglS5UejkWX2PW5PPgD5jyTcPGCTWaktG5DNeOL
	e4wMd2Faw/11yLWlOFoVw+Yw6D3CsuAg=
X-Gm-Gg: ATEYQzybjiep7QihRfFAoM3E1jovH7ev/6pB0HQw4NzQx72vXhb0Af278Qs397qsj3/
	ToeGXN45H9Cu1ic1cnSn8YwUAu525G4Hk7ZZ8e9FMBwrXBywWYWVUg9fNjE+CXiGeR9I3OMMKZD
	ZesuJMu255H14rXfMt2adQ3yNeYnTrws75tv1WgrfUJu84bbgJQJ/Z1Zk3OID84eT6+3mkPyt33
	0T2v9As7ZZje9jM8n65B88L6WR2qF8ivis2jSke98PREUP8dfm/f8yCwh7wIGzMql1Cey1tPL6j
	RFZSTImB8QWAgYHeAeXxBIAqtLrbQarxHI9hMQVkg2lKPAVUcWe+O/6Xa/niOayT1zKFIBrUDyx
	SUJPiOjCun3V/qOom/Q==
X-Received: by 2002:a17:906:c145:b0:b8f:6699:a036 with SMTP id
 a640c23a62f3a-b93763a28dfmr996571566b.19.1772529698649; Tue, 03 Mar 2026
 01:21:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260303083501.3886922-1-sakari.ailus@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Mar 2026 11:21:02 +0200
X-Gm-Features: AaiRm51jqtcJjBk7U_Is4f-hm6C4SiOIrwgEnfnYpuDykoNtDCu1LqaawynvC2Q
Message-ID: <CAHp75VdaYxvQ+tx51WDPFYSzFOSWqHqFKB4xaNTOt-rx4O9CPw@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hansg@kernel.org, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	Soufiane Dani <soufianeda@tutanota.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 10:34=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Disallow all private IOCTLs. These aren't quite as safe as one could
> assume of IOCTL handlers; disable them for now. Instead of removing the
> code, return in the beginning of the function if cmd is non-zero in order
> to keep static checkers happy.
>
> Reported-by: Soufiane Dani <soufianeda@tutanota.com>
> Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-0=
24429cbff31@tutanota.com/
> Cc: stable@vger.kernel.org

> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

Is it the correct one? Driver was before that, so I believe this needs
to go deeper.

...

> +       /* Disable all private IOCTLs for now! */
> +       if (cmd)
> +               return -EINVAL;

Maybe even a warning?

--=20
With Best Regards,
Andy Shevchenko
