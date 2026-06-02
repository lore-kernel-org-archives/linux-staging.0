Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0A0396D0D
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 18:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780425156; cv=pass; b=VPwnex1j57zpo9Q81Yi2nC+16NLnYBG6Tof0zqw+hiTf9QNtxHNNRdls049/u07EQr2FNRicXo8AW8442aivT5oemu3oZGBpb6lsNNek/RZce2KOJ8bcHiyhxBvv1zMvrGX8ay9895SJPfl2BgeUEAm3ZukyNTfWwkvuhMRf4XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780425156; c=relaxed/simple;
	bh=Cu+PErPTR5Ukq3l0vklbPNxm0Ku3rQpUZSHJOUi+t5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKLzCD/Vhg4Gg0MOwru2mwscdzewU2c7/57A40mChZzxOSe1/65tSNfkZQJB4Jn6BXSTm5omWFamrmB5X1ScDD+ZaHIirPHkFLILNr7ELmCpECQ8vmAgSzT5B6Rjj3KcSqM02mI8TWM67xq7arc2/jQdE2LEBX6NJ2rTdCgetvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruYXWwn5; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruYXWwn5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bebbc325000so384865566b.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jun 2026 11:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780425153; cv=none;
        d=google.com; s=arc-20240605;
        b=alR3tm6n0z1Q0af4hjHdCP+2RCMDwbZqyiP2vF/OIu/amjHKlHv8zbdFHVodIO6CaF
         13n9hWso6XZtkzCfY6FzeJWR2QATgG6piEPS3JWQVzomRMOrDp6a2HytlaIy7AUxN9/R
         uMo3uUbnsz8mVgp4QpnNuH+z83uqwQgPqbjvJLT4H+Jv6ql6B6j8Iwsodu6qdI3nK1vR
         65s9oOyhmFwI6tcPWGS+qFkx17pJRreZn7EtKhNV189fpFFryg8ZsoBs7jMcEjv/SeXi
         h52OPXSbYg3jOFvXgJvbDVrgnXejfT1Jmf8Ki8QJg076qilhKHWvCaof2P5S5+96obyD
         /ZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cu+PErPTR5Ukq3l0vklbPNxm0Ku3rQpUZSHJOUi+t5o=;
        fh=z7ubwZKjhDKvDLwz3hoPuyAqbCnI8/mtWNw3Hcj5Vds=;
        b=V4tzC2YujNdPoDUkIWB54BjcNgKs+n3TMT3PgHdwH3K98nVfOtqnOoGmycpy/kYuz7
         9lTXAA9jnCNu70/iTSLq8m/4lwq/YUwOL09vTYQuEczZgE1WN2EqCY4q7AGsI+1l9FxD
         voujWNKaqgi0LkUNwknfIKa/UmVnTZkDsGnvlpMT9a0IGLhm/8M0R8CglxtpqBDIGnQ9
         dyPFYo+qMh/hhnB+ObPOKUI+9Y3wsi5iz/XmZezg76IoyUCcoM0C+Lnf7eGo2gADoUSY
         Lic2BF4/kEL+Y9U32hv1bPN4ZOtOuZi5i3P2uNF6UDuibiRlE4Gm6Q3IItTjOUeQuAoa
         ApJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780425153; x=1781029953; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu+PErPTR5Ukq3l0vklbPNxm0Ku3rQpUZSHJOUi+t5o=;
        b=ruYXWwn5HOtjliT1doMC9zrWtB2AujgKyWRAn5f7JFghtQDQx3wsYgm/EDXFHdsZJD
         z7qYEE1VxwuhXOwd4dfMyQ7BLuPYnBAtRvD68P3RJtj1AIc3RYU0gvLLfTuYmtWPuUHZ
         zCfEt18nveKfIv71p6ean0uD9EwMeQf1k0T+ZBap137NRwkKp45SY98w9OpbmNmNk0aA
         qj4Awc7dESV0lupXBc1H9kskh8FQj2AR6fnSvDbQAOcgpWG8NQ/oCFRpI1c9nEimZXWJ
         FAxU8RKCeWi/XxjAEVBgDAm6pyBV4OBB3R39Wr7QG0PlwowJyaKFUoIFk92snt9XS3+/
         2Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780425153; x=1781029953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cu+PErPTR5Ukq3l0vklbPNxm0Ku3rQpUZSHJOUi+t5o=;
        b=som29aQQuL3rgR9+BGGRwa8goEX5XjGpYMhGjVOXdM8lLYPNWyh5+V/BdA17u/KDLY
         fDrQ53/LZyNzO7yzoV3nxXlhbTKUhxcsRNVtYyMvPPfyXP8ZWw09IqiaJ58Rj0hjDnKO
         e3TZSbmzQ8nx47zK5yh3ZVrSMVckSXwe6Yxsg+vwEGxeJT1VwiFjtA2BqxRiDj8kl3r2
         6aosURNg802A2VXqvD8eMiWhVlgNVn5dOk9MLyJioKPHtqX82+LdYtSnVsTQijBLJWEJ
         5b6hrCRi0wW2tPh8p0mnqEvnQQLWmKz6ZH0jzmJO55bUiDSEgHYZhR0xRtxXULgnDcB2
         S9QA==
X-Forwarded-Encrypted: i=1; AFNElJ8QO9DBggaaGxcSCDrmxx4wKVrAbty+F+8i/o+py6L06IaPzW0806823lLLIlUWkTDRFHF92zXVGUQPQtUR@lists.linux.dev
X-Gm-Message-State: AOJu0YxsnAOBygx7VD2N9PdksH9Qx0sixrXSMI2HFWpfdycjtG4iiuB/
	TL+mi811LxzWQFUhpjzSfzL7jhxmwaCD8CHJV9LGXWu19565Em+U5RxmelysaKJIyp2C9teQw0v
	l6vH66v3aeLXZJY6qdNT2CcisPQfL+qQ=
X-Gm-Gg: Acq92OFZ7yJd8HHhG8THm7/P4Zb0NujRXlXQBUgXJxUU2B1rALXkVbqzSTkXL95ru5h
	cUoqGIIfZq72wdCzvF9Cx123BH0fhRfkCkxVEtInuTW+YoxAzLvap4joVkyfFBTZ6DSOxg/EtgA
	X4Hm9fzBk3rnowovW8rA7bHz5wsFNo/+lpFF0t17pWi4190VUiJ3IayZpQzqmF6A1je+4dYBzqO
	+I8LSujrQMlt47CnuzNqp9aOlFGYHj6QFxcjOHxlkG+fa3OhJXyFKCesViVHp/aZP9FQlRtOgWM
	e4ThzLj/E6I2lUslgmnsXAu/zE+KUavWg0QTWmuTDwbWuN5K7+u9sB/udkNSy+GnLkBcR3UjqpU
	l3MwIWPVj8fy7x/NR5s2zs2hQA+G8vfVCVgE0/Liz9DeOlFC+esog27v2ISjt7+fQTl+VJPCzC3
	hyXlQ=
X-Received: by 2002:a17:907:c817:b0:bdd:45d9:8e15 with SMTP id
 a640c23a62f3a-bf05eedf3a6mr49344966b.15.1780425153183; Tue, 02 Jun 2026
 11:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOSULec2OpwTGB3OUb_n3CdKO6H_DGJnxw=qsBswbd+JBjemKA@mail.gmail.com>
 <CAHp75Vc15t7zmNGeuNG_fLHwCN=Ym9w5Cn92+eqbtsioGxFzCQ@mail.gmail.com> <CAOSULedF6GUK_e_3KRPB+D0Jxgtow38OjQu9B1=vG-XTfsdYOA@mail.gmail.com>
In-Reply-To: <CAOSULedF6GUK_e_3KRPB+D0Jxgtow38OjQu9B1=vG-XTfsdYOA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jun 2026 21:31:56 +0300
X-Gm-Features: AVHnY4JNBGI7LPUW-G8axQLtxVQUn2E5aZHqEdkW01oHLe8JBx5hv2aDMiWM2BQ
Message-ID: <CAHp75VdtOuLEkiuiUqxa3DT75y8Hd-1PtquodpN4qJ=rCFs_4Q@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: replace sprintf with snprintf
To: Enchanted Hunter <enchantedredhunter@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, andy@kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 8:13=E2=80=AFPM Enchanted Hunter
<enchantedredhunter@gmail.com> wrote:
>
> Overall, it doesn't address any compiler warnings, but this is my first p=
atch. I wanted to start with something concrete, and I saw an unsafe functi=
on and tried to fix it. The fact that the compilation behavior won't change=
 is true, but the code will become a bit more formal =E2=80=94 maybe that's=
 a good thing.

Not sure we need a churn on the working code.

A process hint: Do not top-post.

> =D0=BF=D0=BD, 1 =D0=B8=D1=8E=D0=BD. 2026=E2=80=AF=D0=B3. =D0=B2 11:25, An=
dy Shevchenko <andy.shevchenko@gmail.com>:
>>
>> On Mon, Jun 1, 2026 at 3:44=E2=80=AFAM Enchanted Hunter
>> <enchantedredhunter@gmail.com> wrote:
>> >
>> > This patch replaces unsafe sprintf calls with snprintf in
>> > fbtft_register_framebuffer() to prevent potential buffer overflow.
>> >
>> > Signed-off-by: rat1bor <enchantedredhunter@gmail.com>

Another thing, use your real name and not an alias.

>> Does this change address any compiler warning or something like that?
>> At a glance I do not see any usefulness of this patch except an
>> unneeded churn.

--=20
With Best Regards,
Andy Shevchenko
