Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B2E1F91E3
	for <linux-staging@lists.linux.dev>; Sun,  7 Jun 2026 18:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858369; cv=pass; b=MmY9qZM8MQHU7XluPACOPfWvxUdsNFfeOef8iR118S19KEMxhooC+boNAzDd2FpQK79rTLbX7cT2OYoNObJBf+wLw3dyjwZPCooOsV0GjAawEp3GImNQWupb1sUleWOV1frqJZtlRUvFezUFdQhQKuQfnpTVzmrw7OyotLr42LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858369; c=relaxed/simple;
	bh=sxGzZMUfrs6/QHN6gxYyfffxrC4W0FfdRMsXLu9Nsgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTK4lQnnGwuV7ma6Z3zYaDxPugINO6Q7Jn1MSOsVAgj2XzrSE9GDs0xMFAbyl+xLCzEW22Cp2fCj7Bjv5HL6LWgA2tH2m/EtJ8S69SmQR+ME3IwFQq5kS3tpl6gtN/SYajaWSkej3B0XEJpHdVymHrjLR19PyKhp1tiQs23e1ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eM6QgGWa; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eM6QgGWa"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so5103884a12.1
        for <linux-staging@lists.linux.dev>; Sun, 07 Jun 2026 11:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780858367; cv=none;
        d=google.com; s=arc-20240605;
        b=YfefhHmU6H3gu9nJd7m4xVgpXybZu5ZLOqUZLEb/H7igNfimCR/hoS7tlH798p+JCG
         X33opOLhfrYZPcMmJjynyMbXJPkSITZ8ZWd3y/HK50kqztv3ZIg40pVu+cEjEOB2G+cJ
         Z7h2Ao2l/HFo6bQLc9F9qxghUfbBTiBcpS/HkTubzInqEQupXi05n+mIfxaMQquhQhSw
         6ziqWE1TohA47xLmD//9soBvqCtF4vm/gKWX0D31959u/dUm5FHzjjHaCUfwilkRAASc
         M4WlE0FclgsVQFBkM9ayquWWsyVmEAO7Bfert6T7RPBBrSk0APMdd1PqA8OUbFHvwGYM
         mjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E07QAK0Ozjnxfvn7uSekYocA8bPQTqhruQbfEXuVrOg=;
        fh=Zg0NLqNwqpS5ecLPcfTkBiEEsslC/FSvS5bFsOpKBf0=;
        b=Lrx2feb8gYBSdMc6+wyGqx+1cjMa1XQxO/isrbSkEb4ud2hm7B5orS4wsFOTE8C8RL
         eb1bzICaemeNMR7kzg5T3w6KEDzbyMU++wJ1V7LxzFciajn2ZzfLDf2/h9+zU2BBfwLC
         7oW+4MrxU980gkm10CP1E5QAN/orALuiq43HQdaGsTjYT8kfN96rgno4kureGo+s8BWy
         7SQnMr8qq32Of/s+7QKxEmhIzrMOycu0hw7NEMzdTatDmz7i/pT33jaxjBpD/12QiwpA
         xLzT/Kfoo0L6zK8em9ePDvq3SBo0yEDOTnnn79e3aRaJxpgLfwBOCZ1d8gcsaDCf2pdj
         Raow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780858367; x=1781463167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E07QAK0Ozjnxfvn7uSekYocA8bPQTqhruQbfEXuVrOg=;
        b=eM6QgGWa0BYyKJZkbRD52EMMt0ZGUR1eMiho4FESgKGdN7l7hYKgqC3qHzWm/F/CiU
         orclbBn5lVrhvaPbbfBfNN35rUJZIXIuMR8rfJdV6yEsVmxWCHkO56aptcTfylw63xw6
         h2llyiUZmhZa0mhPdHWGcAeHYfOdYiniINjpYFLoCPUZyqT2J4FnRyhkUnOsLQ5XCgw7
         MrwHL0V6tcJL+Aq9lkPSvmuBh1mWRokscPaK/6MkJOUYiyhc+iPMWphR/L2tggEVspSY
         zaUvtCtBl7QIgwjirxBzpucLsfoQgmhipB5ySGUlDkh4q7Ot3SEM0iF3T6b11vgfVHm9
         K4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858367; x=1781463167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E07QAK0Ozjnxfvn7uSekYocA8bPQTqhruQbfEXuVrOg=;
        b=avIJZ5ZCH+T4ESh/pVYFdVpaTvbelfcEjgK6mXJpYMUm6lqFbUvJvUOuN3VF4/CmPZ
         RUFk46e6qQXbwxAYn+2WRc//lmLcFgD7pHUnOYGS+Fr6L4lDeT9Jy44vO81VtNSkapr2
         Sowe1VaiE09SaD2xPQOK6v49e56GqPlzaNrtTt00sCnZ3xwBIWKyMbut0kiYkTjeQrHa
         cY+FuoAMiSHJeqigj6B2Iw/veVySNGHi9BEn+7OQB5c2aN9YFIXYpS6enL5W0J0rhFMF
         mjHFwHYEn5vo/PVF0Lg8ZBXu5Re9+t6BjQfGv6ZLSwrPfZZ/wKSUzlD9+7CGIIadCsWS
         4xGA==
X-Forwarded-Encrypted: i=1; AFNElJ8elt9q5lpncOqc6GNgAQWQD0o218IS+tQPyV2Umpt70EkcBpetAjs4ewVxFKxWygT4h6CwKiOjideYkzhT@lists.linux.dev
X-Gm-Message-State: AOJu0YyMn7jJxHRH0SUHR1wS12lnF2RgCejdcE3IE9xZmGjIMfMgCiUn
	WLhhai9U2nG//bOCfSf+uwevh57s+I1XVfRGCkEQVH6Z0yVjYLzB+kIGOyVfyUpx0mhS+Oq21cO
	W1fNAXwDSexqFNtAMq4+8ZBR4fLmpj1c=
X-Gm-Gg: Acq92OEAj+UOPENHd3JQtk2PAGEVUwep8WZwqKjxh7ID3+jVF0+hPmkbxrRxn/JQIwP
	9V/WtcZQMjxOqd937AfR0b/hWcR/W0TFdZS+LQ4RlBliERMH6/qVDxBQbgjyPOmus3t0YpSVcGr
	0U/lrBm2QDX8GuoMyH3TcatspYSL3ABUQgtkGAla70pE+v90jAW0XZix1OPY3iKgD+bRXsBJb7u
	nH/sOGA+yYml6Jj5+hRGYNgsuq+oK66RYY2OtRVuG0M7b5xvp5jeMzjH9YSrHWy5O1VEk+ZmWOn
	cmZ5N8R6WrDsjeJnexFSnehUpiGQ5TBTlecnQmoCxbhVNx05LnnqTWSw3DDzyKyxe2ZUr/joB8/
	QRWskeU4Nf1140uGfdZNehFamrYcPEOj29erBlBk5c6wd6HOVmSABrKxOwKDamtzh1PyntyILnV
	e64u8=
X-Received: by 2002:a17:907:2d92:b0:bf0:59a2:4ccc with SMTP id
 a640c23a62f3a-bf36fd9bc68mr664811766b.3.1780858366770; Sun, 07 Jun 2026
 11:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606234427.9902-1-linux@notrealandy.dev> <20260607121833.10058-1-linux@notrealandy.dev>
In-Reply-To: <20260607121833.10058-1-linux@notrealandy.dev>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 7 Jun 2026 21:52:10 +0300
X-Gm-Features: AVVi8CfiiScLGYgh904z_dS_H6sFbPWdyTv6pSxK5s9SwXaQdygOyEuTqKyOaWo
Message-ID: <CAHp75VeojUKPE304xr9B0EAjVLdM1i5kCHB02=_y+OoMkxTiBA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: prefer kcalloc over kzalloc
 with multiply
To: Andrew Soto <linux@notrealandy.dev>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 3:19=E2=80=AFPM Andrew Soto <linux@notrealandy.dev> =
wrote:
>
> Optimize memory allocation layout in sh_css_params.c by replacing
> the raw multiplication inside kzalloc() with a type-safe kcalloc()
> array allocation wrapper.
>
> This prevents potential integer overflow vulnerabilities by validating
> the array size calculations before interacting
> with the kernel heap allocator, aligning the driver with modern kernel
> memory allocation standards.

See my reply to v1.

...

> -       write_buf =3D kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
> +       write_buf =3D kcalloc(8192, sizeof(u8), GFP_KERNEL);

While at it, you can switch to a more robust sizeof(*write_buf).

--=20
With Best Regards,
Andy Shevchenko
