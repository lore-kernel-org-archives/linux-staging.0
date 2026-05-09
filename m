Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08AD382F25
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 20:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778358365; cv=pass; b=EBzg4ehGZbCrwr/jYvv8XUQ5/HimI7lihIp3aD5VcmXVWT4CFf6tlWeGT0pi6jfMk7MzAGp/F7TeiLR6pbxmxsBY8Z46ZJHhXuJgj18pOElkzvuTVotpT4IqHFqk7UnDFTQtcsG+WILI9qDj7RRsH+6mk5PPIA3Bd/Hcqr6bF+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778358365; c=relaxed/simple;
	bh=su+isiQqtQCsNpLq6V2xgnU6bpChhZzlORZaROftQN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqhJYBFjQRXmbjZ8OxYv3CWOXI2Vkg5D4BuHjW4b21t7IxEr1lvPUgaGZfq/zcYyRrhrXNQ/KB5gdRP9yvfFaig4BfTJHxgvIuws6fO55MM4YJcLrecH+gtiH9m2cw2tu6vH5OUWFusL63juU118rWfpFJM/Dp32KaF3ickkVVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHOGjxte; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHOGjxte"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7b4ee3a88e1so31695887b3.1
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 13:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778358363; cv=none;
        d=google.com; s=arc-20240605;
        b=GsxAycdloYkG4dnNzkQG0WItIW2BFYLizV4aTvAq/Vjte61RytFobLQPkiV9Z7kjqH
         2u3elZexVuTy5S+srOD4sZ2nXNdYnw6ItE1VsoBqw6Q7M8QcnUMjNy1pOwWyjbyBlCr+
         looQAJZ9IvCknyLlvE/sAUsCuN69TKIx3Q2D71Cj6Pe4YmyPkFlRenA+SSE/RcHnCEup
         LhMAN9C3KV9YdJ6+L9iidGQMnFEakE5pSB8gpWpFEhkdcSeo5EfwmFnP2w5yQm4XK8es
         vrf7U5seRlRl9GSfDdgorS/AT37QtYi114klRQQeLpmiRBXm8qY0J0QE9WLL3xQb24uz
         ERag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R8YQsGP8uw0vp9urmqjIKxpnukHxbZTJqWmAo3vcZPw=;
        fh=70HCKJZ/aI2elvZ10ib1j2A+WdTx1J0P6wb/yEiGvEY=;
        b=J8Y8JtWAbxTw0y78aQjfejDZr04xhamq/dO6CbsXgA2jfCWmwMerxqVH4i5jSkMgSw
         tn6p/2WYAaI6RwLWdttvIJRjej3Pt8q1z6J2DKXfpni8HfAo3WzYa7f0t7hsorhEBUNd
         48/1+IHCBjDPQ0EvQnZGDAH5HI7l7ICzITliPBaya/OL4Bk2U6PBGGVhwtcFe9Fn4xzq
         Pqhyr2JO6hbPUzzmMpfaB6LNsIoq/X4b+MzC2BdeWdeP80Dz7qrXI1fQdRdBboJzmapk
         4uUOPzNYwa59j7Ps/zUosz63Cu1oPTEDC3ncawpih25ZEgoZih/DOSoRp5AbQrnqSJwA
         uwUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778358363; x=1778963163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8YQsGP8uw0vp9urmqjIKxpnukHxbZTJqWmAo3vcZPw=;
        b=rHOGjxtegEe7gusXaxKt8ifC/tDeA6gfWRugjopmiUnsla3VQkatAH/I5iVmPgE06Q
         Vlvh2eElq51kaavEwJzUQAKMdCdZT5ezqjD3AgBJwnazNk4EAdYYeB++TDlIfck8KlRO
         bvoYSo/bZBb4i/zDR641OOGofcc/aFa34cIqhO/PXeYUdh0qRPS7z3kjncFZbW7ApCkQ
         RFsXCxozYZH3b1PURYD1GHVjk0MOJWkaeBUlDLr9K2LDgSxHb3ZBPXB+CsQ/HPYQ7TEh
         uCxOpNxUNdSUKE0QS1jYyU4x5GXVMyT0nAo9R2C331UYJoLGT2ky0i3B3zQT7zYs+TXm
         pNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778358363; x=1778963163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8YQsGP8uw0vp9urmqjIKxpnukHxbZTJqWmAo3vcZPw=;
        b=lXIOiQe2+b8WgzBLmVBiqlHOx3hhLiBWiQQl/MO4II7DrwQUmD1nChj7tsaAN3xodC
         SGyedCPuC2lVcXupfdBCHqII92/OMRv9KSMMWyFlhtIFYzrGvRG787G7L5ad2bGpR546
         QP8VLdDPZx/ggvl1XssoQJ29gZgKE7Q9gkEPknFmE1LTnkqxucCBbDWiY47KCmrrNvks
         GAt17BuziP2QYpwJ6uNBj6z4LX4in4s4lxdAcfocRAAw/pAOdgFBrN2ZP/kJyItVhwf/
         k+tFZ6zZSDuNp98Yf/KWrz6fBE7mD0PE7wIGRmiX4VRsEP9OEkrQCrg6VpvQNQ85X9Q3
         OlZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JI+xghQCC40Vtb043BQxjyHBkgtGKlCzinIL1z3cj2OHyfzIgfDO/lVWjmOUw088gQRwwVYzdgkw2Ka/v@lists.linux.dev
X-Gm-Message-State: AOJu0YzXAv0dD19mlLv7ema/ZoLvmkiVWfTEusKl3CpPCz7uOcnlbuYw
	xXfwBDT8fGQyomIMHo3k8S1sY9u+Ka80UGK459AhU3tt/wAYBIzgV+A9e1TWzPSibW68vn9J8Ro
	+r8Adpj2G6iKGBreOuVQyrsuVSfWQQHk=
X-Gm-Gg: Acq92OFNtT7XarGzF/wkLqfHefNZxCfIGxjKvuRdrWYoD7vWWcwbE/fGx425lpjvRx8
	ahN/zEnbR6yGXJvSoZdmE7NX5NiaN1RwdJjaNBhi/O0BQna+30zmGvxHqz8b04bzubI5zpj6ZKW
	bakcnQG7hHZ3SMw1c4252Hh/bIG9OR5hQYSRIqLqLb1bgVkmQxek0dv8xj7f0R1+u9qOckWYrlq
	5bNC9l6weGjvoZ10JQYaCYkz+Z5bfdVGra5BcSglAvBEIpRjJWy5C4tw2i6cKJagLxi9vGjreOE
	OuZt
X-Received: by 2002:a05:690c:c6c3:b0:7b3:f33:35e5 with SMTP id
 00721157ae682-7bdf5e07727mr152824747b3.16.1778358362999; Sat, 09 May 2026
 13:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509090320.85481-1-dennylin0707@gmail.com>
In-Reply-To: <20260509090320.85481-1-dennylin0707@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sat, 9 May 2026 15:25:52 -0500
X-Gm-Features: AVHnY4Lsr7DnfygKRm3d_eW32fDtFl_-Ze2-Xadd1Z7KS_jr9JbRFTdGKxviX9g
Message-ID: <CAKqfh0F+rAqAwdu=BtagPa2D-F-TANm8Tx3RCOoLyZXkYAn2pg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: check SPI write errors
 in probe
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 4:03=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> The probe function issues three SPI writes to switch the device
> from the default I2C protocol to SPI protocol, but ignores their
> return values.
>
> Switch the repeated SPI writes to a loop and return an error
> if any of them fail, as failing to switch the protocol should
> abort the probe.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
> Changes in v2:
> - Return error instead of just warning
> - Clarify that repeated SPI writes are converted to a loop
> ---
>  drivers/staging/iio/addac/adt7316-spi.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
[snip]

Hmmm...has this been tested? Normally patches like these don't get
merged unless tested since we need to know how the hardware would
respond when we hit an error case and quit sending data, and also some
of the timing changes introduced by writing, checking if its an error,
then jumping back. I've personally tried this patch before and it got
rejected so I'll link it below since the questions that you might get
asked will likely be similar.

Link: https://lore.kernel.org/linux-iio/20260426205039.125818-1-m32285159@g=
mail.com/

best regards,
max
