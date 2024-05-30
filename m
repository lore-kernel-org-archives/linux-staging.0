Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8235918755B
	for <linux-staging@lists.linux.dev>; Thu, 30 May 2024 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081984; cv=none; b=bEF2GC0fLNAYPIX/IPwrqgLHOCZ+Qp14ytML4HiYbMya0On5VH/ckK6d6k3fZ52Tvu/3fTpEB/y+46Q1YGCBn8wu/dDos2mBpM4Fdt7H42HimgZHf7kRsBWCKc86Rgjh2pCn5Yqg56Td+f//eJRT3mkjTiiUzlzkz+ZKtfzSOOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081984; c=relaxed/simple;
	bh=V3ahdf+n1zZZW2IzsyT6UV14FnQwVR4T11DXtk7qxAg=;
	h=Content-Type:Mime-Version:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=P7b6lFYlBMmAHxYbsa8uH7VVee7BLMqehLEsu0xk7KrV/z7W+ROUCaTjir3BioB1pUoGw/wkELrlfnK8repj1pSCcQbJDKk980DnveF/j/YcTVYFfdQRo5PZZyBqSYQ5iL3zbMF13rHIMlBW9kRYiC2wa8CF7TP2lBB1VmRxzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmbfYJCP; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmbfYJCP"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e73359b979so554261fa.1
        for <linux-staging@lists.linux.dev>; Thu, 30 May 2024 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717081980; x=1717686780; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sdavdw5+l/AHZBYtBFKUSS7K+LP0eyfjKFkIWe8Ymi8=;
        b=VmbfYJCPcoKL00OTs5iAxGshGPC+MobeTRRIuKkvR5nG2E+lHBHsbNQYgsDe2z9psA
         9iTTdziX6Pbzzej+1fmelWMJxkMeYgGjRUKTR7QfH1P6Gp9aXO3WqPo0r8w8/xwb6wKz
         lq2KaFml30m1HQzg8q4j+Lo+lRBLg0ASFBhw0aT0EUd471Jg9wHhduMIcLN0uAuWGj8x
         hwI83ULXhZFmJFS8IGMcnXpDiMWYxR70MkiCoglMBxk8BX5StvF3JACsiF8NhEXiceqE
         0tkY4nkIOd5r1MavLhL4xCJrTFWVcmxM+HB8un/olGEasZT8TmiWkZAO5GswtO4ZfHb1
         DN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081980; x=1717686780;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdavdw5+l/AHZBYtBFKUSS7K+LP0eyfjKFkIWe8Ymi8=;
        b=i/gSOiHAf0y9a1xTVk7JdclYaU7MLKwfSIbsz9OhHG5PY67j7NbNvoy2J505zqRujH
         Z817Bxgp63oW+vYKP+vh51tGvsAcaR9BmnwSTYJqS+DSR/K5FvskfXzcJtD48scUkkrO
         3kEmlvbJcStr0MdVNBN/DPCVHzrtIbZJUmPNk/99gmFIhrZwrJ+A8KaouaqxLQnx/pdZ
         rkn0gN4y/x6B9xKjY1AGcmSziWz3Hh9zBhzT7UdzQS2Qc4h4XqTqf2FILRNarSf8VoVg
         w1NtaY8I9CMWsj3aMrBfewLCWH+49XULYztlEaOM40YNgqET5V1IZfP4rmIGiIkG7Rqs
         WshQ==
X-Gm-Message-State: AOJu0YyrMIJey4CA66IZLCd/mGB1XgeTHd4AzJAn2uXmsU4U+PhaIDjm
	UHXMs93blddXmQA4nq7G85hQRmReS5T68j5MQ8vgtJg7S7jZlcNX
X-Google-Smtp-Source: AGHT+IH7xZsBkbPjq7eBQnxaJVR6RQUmAuxBaU7Ci2dJOv22VX7dqvueTfj/Jh0Juu8+KjZBAShrsw==
X-Received: by 2002:a2e:b0fb:0:b0:2d4:3e82:117e with SMTP id 38308e7fff4ca-2ea84873320mr12877791fa.32.1717081979348;
        Thu, 30 May 2024 08:12:59 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42127079536sm27841245e9.32.2024.05.30.08.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 08:12:58 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=a2632c94a24b51b1ce87ba75765e7af51906aa4822f6b0fd9e4b1e0f6638;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Thu, 30 May 2024 17:12:58 +0200
Message-Id: <D1N2RF28D1Q9.9BPMZE1VNFIU@gmail.com>
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes
 robust
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, "Ben Dooks"
 <ben.dooks@codethink.co.uk>
Cc: <linux-staging@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, "Thierry Reding" <treding@nvidia.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240421104642.25417-1-marvin24@gmx.de>
 <2338e58b-1ec2-4500-9675-2d8a3aaa107f@codethink.co.uk>
 <79c10e8e-bf3e-7eca-a0cd-e177a270a517@gmx.de>
In-Reply-To: <79c10e8e-bf3e-7eca-a0cd-e177a270a517@gmx.de>

--a2632c94a24b51b1ce87ba75765e7af51906aa4822f6b0fd9e4b1e0f6638
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 1, 2024 at 9:03 PM CEST, Marc Dietrich wrote:
> Hi Ben,
>
> On Mon, 22 Apr 2024, Ben Dooks wrote:
>
> > On 21/04/2024 11:46, Marc Dietrich wrote:
> >> The i2c controller needs to read back the data written to its register=
s.
> >> This way we can avoid the long delay in the interrupt handler.
> >>
> >> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> >> ---
> >>   drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++-------------=
--
> >>   1 file changed, 24 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> >> index 45df190c2f94..214839f51048 100644
> >> --- a/drivers/staging/nvec/nvec.c
> >> +++ b/drivers/staging/nvec/nvec.c
> >> @@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
> >>   		(uint)nvec->tx->size, nvec->tx->data[1]);
> >>   }
> >>
> >> +/**
> >> + * i2c_writel - safely write to an I2C client controller register
> >> + * @val: value to be written
> >> + * @reg: register to write to
> >> + *
> >> + * A write to an I2C controller register needs to be read back to mak=
e
> >> sure
> >> + * that the value has arrived.
> >> + */
> >> +static void i2c_writel(u32 val, void *reg)
> >> +{
> >> +	writel_relaxed(val, reg);
> >> +
> >> +	/* read back register to make sure that register writes completed */
> >> +	readl_relaxed(reg);
> >> +}
> >
> > I thought the default behaviour of writel() should be to force writes
> > out of any CPU buffers. Are there any bus isuses here causing the code
> > to be necessary (and if so, why is there another buffer breaking the
> > writel behaviour?)
>
> if fear that's a question only NVIDIA can answer.

Ben,

in case you didn't see the discussion on v2 of this patch, it's here:

	https://lore.kernel.org/all/D1N2OIXAF6QQ.3TCYLBU42CJ3U@gmail.com/

in a nutshell: there's indeed another buffer here that causes these
writes to be queued and the read-back flushes that queue.

Thierry

--a2632c94a24b51b1ce87ba75765e7af51906aa4822f6b0fd9e4b1e0f6638
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYl3oACgkQ3SOs138+
s6FcyQ//fknH+u7CruPy+YJ6jrIDz0nmA5iKp99JinZH6eM8KfjCUbxC/k+cFmem
GQTgKNC1ToG5kmM9KZWAttnFtTbFtBGynkrpBq0xBpZboE1C9s4rkVKgtkUoX5E4
OLzqh3vti8nCnK2CvcieJAwXxWcODpNEkbYY7EtKW3xHXBCb1J37f/5BX528cJ9z
91J2asopgRbFzY8yN5grM9+DHynYFiBQCz8qzxoxEmpynT5UWCk1I0thy9+vOGU1
63oEWzzGI+eTR7TzAyyQ3hxJeo+EPmgCDeSuDMpb0wu3keFr0kc6pm2CeXdGvnRR
EZIo63esjl+80glBU9hFYoFqmJ+0mdSnlCqQqs8rf94AYSnitCOACkAyOHlqhd5B
ggU56KqCvGrlhE7pt4O6h+vZ+f/lJKMFO/GKZp4yk+vXUm6xp9YWVcRgtRHpZOut
rRf2mcAEKFkysdewM1ZRF4qH7bglkov7NwJk0gOf33vroj8DZHSszCuDxM3Cntko
NHhdmYFhBJ/C7y/nw2IdJJBvvGrj3ljb4YYwscyge/3OqDzYcPIUTqY4LbIh39uK
c9w0Wf1UlzV3JvDf3lx8gg64yyhQEAm2fkhXNcMGALjD5vdHhUha3GXpPju9fuHR
0iP0Ikg1IumAo/lEy/g9OwMYSIvYb/5raYwHmXQaRCNbXOqyKIA=
=6Cr/
-----END PGP SIGNATURE-----

--a2632c94a24b51b1ce87ba75765e7af51906aa4822f6b0fd9e4b1e0f6638--
