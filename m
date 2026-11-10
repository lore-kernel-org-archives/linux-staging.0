Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314360;
	b=Idz/fmUKJn15FbpsFQw1xwHP3e6kVIAkiPorJH+R52o5H/MO2TfuOt9CCGxQUkNyxttf
	 hEF9S+f7yraYQUcwgW6+gtvmC7GUCkMV/c/NnXIG84Qk+eyvmJ3Ppi+j6jyOqlgq6wmpk
	 a3DPlNjeBgd3f1D2OUbBYfQmNY1Izf4TO0WRflGre/RIOJfUz9jx7DXSHhS/a7yz4xyZ5
	 y3VLGJr19kTwDQw8SDzxxn+Vln/vcx/jrS/7QZh6kjo9PyBVynPha0l5S9B4U3I6nD4mf
	 fH1rsOKCRW77P5qGkM9zDDHgXmI8lKIo9ew38GsiaQo1sM633kNitzCOYl7n1Z+PZmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lERbEvwlWe3cCdFev/F+yYdUIQIpkID3701B9vPyvz0=;
	b=Q4gV61Rw2XQpRxKtlmCdCh+madKw0rYcF2iS74V5YVcwOYKmqwkcH4cXzXmEtmVOubF0
	 bzyBgotPaHnBAH6yYRvMqaoJHaVB6U70wTuRqLSNFb17st43hXnO6p+jCQJV1TXDuQXLA
	 TwmnbsjEyrwCgEoxFD6lGSvyyTp08aNokPzNBRr3tb/ryH8hpR+FGhVyu14harVtIPm+q
	 z9TqPC6IVTkjLFVhu3K1VA9f3HB77YfU2jj6n+N14qsu4I1Tu8q+h/MuCyR/o+lyEFAZc
	 JV00bh6ap7HZnIMUrYT9RQHg3wjwN36ulsU0gcHM+2yQZqd5LV2PsIJfuUhqnH3ulhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVWPKFYm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBFF60A2600
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 12:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBFF60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVWPKFYm
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso276111466b.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 04:39:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314358; cv=none;
        d=google.com; s=arc-20260327;
        b=gf8DaDiGXHU3NerNx2DXsGZFstm+3CnGod7LkgXZOoVWOmLwOlQ5+yLtCJ6Y/ZxOaZ
         Qlp9xi4i2X+o/v+p4Fwd4bLq66qC4TTWXZ30MX4acBcmJf5IAreXyeS3FqqXuZdjK/5L
         +TO9asd6ReNXyl9/dbc4yOPdxq31VnDG23PY8+jfkpDj9EuEYSF0NP4C4k4y4zBAr+ng
         i3pJwXbgb5Cf8uTNB11ospIf0hhqxEDflrYgJfJ5sXxbT26r2icGdX2yMMT8WLudmYlA
         VohL+xIc3H8tT9yh8hQ3B8CPN1UyQjQWFo5TsLvA6BquOgaRRSGHw7OpB4sTg8+AbO7i
         2ZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lERbEvwlWe3cCdFev/F+yYdUIQIpkID3701B9vPyvz0=;
        fh=lPQMjVEPMr7pQxi16Y1RIywD/8EP70k0rq5g1/PVsxI=;
        b=QZ4EDn/ahH38FNL+P3+dZJ20+yxo5MwcMpnEZfoONu/l+rXHPeGowUlNExExTbM3+e
         RHDQ0l6O6iKa3s8CGgeZXu1kVmSrRK1mqWAaBHwB4BksAm8gjblf5BDVYmkch5PxtDJn
         4RvpZNQULBy9LlpJN8ZwuQxD7gZFpahrOn7TRPp4CGUdeEuV2qRSnJbWmq1LE+Lte49k
         Ab8qX8inP5gm3BHro+B4kmz+JGV37zsEBuxaIi9XmeZ2zgu7j+IAIkH/Z5xUW6EH5amY
         7tLlxrGeDKFBqcAGZ1JAywPGokkvsbSdn/gQke91bZXe/lp8iPcAsp4jy3uurRGMVmTH
         kvhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314358; x=1794919158; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lERbEvwlWe3cCdFev/F+yYdUIQIpkID3701B9vPyvz0=;
        b=pVWPKFYmnSsmqkUbTAFFlY5assYg5Ac0oNQ/8KNOxrbY+qQslbflwqeO8cDiNsyVaZ
         RXGWxfWAD7O8d5u21PEPt0aQKHQ8R/ck9Ueyoel5Ul4oN13h6kkAY3JEGDpnRvB1LfSd
         TfZ0r+Klfa51Euovc4mKg96NDVSHcKN43BVyqnif30GTZp3ysXjCsmDg8bsHaMHkaKNq
         riaP67MNq+j0emKEeypRRItHyEPuRhh1dDWwzd0hPgZwJhgFwlJd8rQr16hqFx6n8P89
         O3L8ufC7eqEOfcIprStCYdNHL2vGU2kl7dqWrmPu/O7CoJuq/6uwv7o4OcGuwycoQnUj
         +4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314358; x=1794919158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lERbEvwlWe3cCdFev/F+yYdUIQIpkID3701B9vPyvz0=;
        b=TmNtCClzlpPiWA/lizJgKw/06Qr52cnYxup+Thb268IDQyAUIdRiREUoP3ABmMnZj6
         OAV1Im6Ibh3pGtO7gPDNVMG9xb0XIU6rH4OpUgdvkmcoSJd4WVnL7ZTUu2LHEYhmUGai
         6YQy5T/P7DcC4POfYn0UTvO1btvTAOm8ULx+E68mXt7jMDdSAgLxfpmlbRvF7PUQDVJ3
         1ZsfmnM+xOiC/n6jEZ05JzTbYwqSedUVGgxSB8qjK7E8ENRZmV2tlOoC1EoWCUhteaoE
         H/HhsVMV5yVeHEz65yu6HGK0WBzwY4oWlvuHaEB2Qvu3QGJEe379IflyjwksJCjNR0pi
         ILSg==
X-Forwarded-Encrypted: i=1; AL+hErEj/iejbIeuG/RTT1Gp2XBD6avYjLXpt2be5SClXni2yuirbB95ew9yLJWwBcwtka9nLVfN2iGxSzS+627v@lists.linux.dev
X-Gm-Message-State: APuU4Z9wG7de5Ru+TVkkOjKAeMXVyextxnKKdYd/ql9Hi/UUVJFWO7YL
	D5afJ5sAiRnVNt9eSNXCl9VXKFjK3C9oE8KRZ1s0+z3iGK8wkXu0m6njY41EweOfKGaChIAn7Cz
	cic1bpTnTYgZRQW3N8V+e9yviMMtkI9A=
X-Gm-Gg: AYBFou1gKDruWB1+lclEh+4ywaNV5AEqH/4orFBdvUdO8tl9RP5EpnvaWMmvJJoigiO
	2ZaRmeFVIE8LnkJbqxvw/9S6ZXuWuCgzoL7JO85yukPyUAQAYol5hXUvlS1wmJ0qOMhTj4e7zgY
	FazXUXvLet7GnmIbqSAcZegxNXoKp2t2W0uLYYNuppA6MavJ5HZid9qVJ9YptzKyj/syZmA9yPv
	JNhRypfA7OIBHA+5DwevO3BN+JgfCdr8bHu/iwHdJX/FCA9NNSOYIzMr4YMAGJ7leYX3Mg1/ayL
	8f0gtydG6fBvLjepyfaa6dpIGpx5fFeFvnTnJLXKoHdKx1YQIvHadoK2zvhARIYB8pWjkFFxYIi
	5oD5ZvnWfe2oBEk6bZFrVE+MDLrTpEn9+FoKd8L8=
X-Received: by 2002:a17:907:7b9f:b0:c49:cf3a:a324 with SMTP id
 a640c23a62f3a-c50494e75cemr197141666b.22.1794314358170; Tue, 10 Nov 2026
 04:39:18 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-octeon-parentheses-cleanup-v1-v3-1-ea6d4ecf2ec5@gmail.com>
 <avMLsZaC_AywFjUs@stanley.mountain>
In-Reply-To: <avMLsZaC_AywFjUs@stanley.mountain>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Tue, 10 Nov 2026 06:39:06 -0600
X-Gm-Features: AclHuK8ZN9_E3C7zyQ1AMfpKZD3xshRIIAFhPJDvkybX9DTHvWqr00KVrc0S1k4
Message-ID: <CAHDi9tqpPRBC38Tin6Mm0erNbTVdccYtbVHprf8vSFo+pLjKcA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: octeon: remove unnecessary parentheses
To: Dan Carpenter <dan@cryspen.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

You are right. I ran it again with --strict and
got 0 checks.

I was analyzing the file based on the previous automated revisions
I sent, which tried to clean up things that checkpatch don't
complain about.

Thanks for the clarification, and sorry for sending unnecessary
noise T-T

Regards,
Alejandro Lucero

El mar, 10 nov 2026 a la(s) 6:19=E2=80=AFa.m., Dan Carpenter (dan@cryspen.c=
om) escribi=C3=B3:
>
> On Tue, Nov 10, 2026 at 03:37:24AM -0600, Oscar Alejandro S=C3=A1nchez Lu=
cero via B4 Relay wrote:
> > From: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com>
> >
> > Fix checkpatch.pl warnings by removing redundant parentheses around
> > conditional checks.
> >
> > Signed-off-by: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.c=
om>
> > ---
>
> Search for this on lore.
>
> https://lore.kernel.org/all/?q=3Dcvm_oct_common_change_mtu
>
> I don't even know how you are seeing these warnings because I
> changed checkpatch to not warn about it.
>
> dcarpenter@stanley:~/progs/kernel/devel$ ./scripts/checkpatch.pl -f --str=
ict drivers/staging/octeon/ethernet.c
> total: 0 errors, 0 warnings, 0 checks, 1037 lines checked
>
> drivers/staging/octeon/ethernet.c has no obvious style problems and is re=
ady for submission.
>
> regards,
> dan carpenter
>
>
>
