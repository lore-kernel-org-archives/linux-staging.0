Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566157;
	b=XkZ0GNaP3fWINI0vM9Ei/bbSuCrsWwVF/3ndlMcLp5tzOSlsLC3/YZ2MLGdpC9rBemzJ
	 0AjfJ1iDmgi8RtNrv4ZnXWK1+Ck0Vi41sE5mhfPAC5xGYZKKebvIkYetPvzazLa09jlF3
	 aObHvS7kHyB0j0B3QI3U8pFa4BzPyOaUSsGCg9Cwloh9MIV4kndr8oVi0zDZX3bDoyReN
	 zpXfUmV4TJN/sdiFsYhLLivSCJ7ZoUkf4tsPMS8lEO6ruoZZ6k+shNaNSABzJbH2xbTZB
	 DUw9eNeQBXM1UKb8usyg99fjCH+/0u9WNpFw7HM1aSvBg4ltkqtqYE0nYCARBKWXS3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ScI2PR6LLaTrA1CijXDQyJr+PpnB33pyJUIbjOPXVkE=;
	b=Hrk/9qOZyjV8GQZKtZeWjqEWY2b4UhDuFOr/kGeRX3P0/LLejqekpiLg8sOg6xzAJIOe
	 LbR+TiRQi+K2CGjnmAsz520SKIzVt/jdQfACEg3Nr4Oo9tlbymTWLiEzV6D4avdg2sMsp
	 TsKs7NsmIAqXYu1FSpFjQb2qieSgfr6AMPWGVJqURZIqTDFn6a1qm9VTOy0ofOVJ6agMr
	 4UGuFtpMrbCKpaziTpRDUbQz8qeE1e1w6HJsnG1rRJ7es0UuFxX7Vm78WJSAAtT8R9wH2
	 bx99mgxlqTIfY+SLrgk9FyAK+NFtvc6yIK9RmVjZ3WBVimEGvSrrg/yQzFathSHb28w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cPH9WAGS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31480606A31A
	for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 07:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31480606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cPH9WAGS
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso12063421fa.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 00:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792566155; cv=none;
        d=google.com; s=arc-20260327;
        b=FO55gn5ZOAMbDUSB5YybUXPVO93PEMa+qkr3yKvIQz3oVcr3GVR2dsGx8+mTcyE7jD
         XfeDsygn/FdcY0yLOwyoCvRj2i2fBhkfkYmM9ya/ug+uQtZPayWlxAUQMns4ESe2Ir9w
         DxfVEaZ5ULtldu4SYPqFwvp/lwWjO858dFo3fl5Mm7HLFxZtKhKa9s5+sxj6H/OZmdHU
         cLu/AmRQNmgQheCpJMkS4eU7NwueGUDAgJw27KcFoaW6a4Bsyh8m3GPUzdMTTi+JubOv
         RW+A9qnB7KsDjefLf3QaVMMSWJYR7876phY8vhLuEFlxD8u8Qwf4X6L9SueQsEKcXxWl
         M3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ScI2PR6LLaTrA1CijXDQyJr+PpnB33pyJUIbjOPXVkE=;
        fh=IdTBmbO2t6ndhYUo8A6xbJnfoec3lKmRzvODYusxcbM=;
        b=DvsyNV7rBiDwgNVfZK0eB+tCPSqQuBYVWyEMtNkvckAFGHP8j/bRGRpkN27z75tjWf
         ZrQIY5KsXGsMROwX7qDN4vY9NkKtTLo4Wa/DMfBUscZzh1TbmoOnJ8cHhmyZaG9G0PUT
         1ZMv4X9Utvk/gLTHr0jvZwkeyquDfIo39jZRqVtIBlHT+EFsSk9lXiom/QOkS7xkZ2ac
         G4u1hvWLiTLXpRRbmovQJrCChwAw/hQmLluEFTRTHZgLcURA5F1bCZOLf9S3bSI3oGga
         0TebQjnqPd4eshafBhQDUL5kqBq8aadzzH30H4qJYKWJUu+JnmU/JL4phG0IAFy+Uw0m
         Q/rA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566155; x=1793170955; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScI2PR6LLaTrA1CijXDQyJr+PpnB33pyJUIbjOPXVkE=;
        b=cPH9WAGS1J9GwHd+bvrRrQMOQwtANjlnVHeMvH7VwelFzgDrq1kmjERhNRjwj9B2VF
         hTYHvt6miXKcMo6k17+tN/Nl6A6fYdyQDzfV2dQjwQHEfcrSR6g56EfYDxLT54+dzVYL
         eYqk5h5EeRzcF60PuHD+YDT+Vup+EfllISOmqbzEXVDEoZsy96CoYXh5uL1YgRGdiyAA
         u+tgEWuWFtJuWjBH/ZwwKYI0fB6VHOfqNRcOznjZ9eaW0/QN1b1CPcvhgMUPy1j8xkVA
         8iJInf2IHtPH8hOmZrCMJPfgZXFBI4cHXtphp9qvHqOBqBr0D3N8FvlTSQXjntI9vA3j
         OM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566155; x=1793170955;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ScI2PR6LLaTrA1CijXDQyJr+PpnB33pyJUIbjOPXVkE=;
        b=V89cI3R93PErg2nM/RxeYlE6nAG4NFsv97ZPbF4lJlUcgwdBdqQuUPjrx7D/DED5g1
         977BMPlPv8kZuTASoh4OdMZWIyjjphkncFa1zlLJuRfyuPuqZ/JaMT7Y3aeZQ19YtqRv
         uII10D+U8rLfdeGMCZ5A0RVbcUao34JQ26MqQglDcaDj/yOgcHGIA3nK9hbFdqQyQFA+
         NrHu5gRRUWJSmwKd7Ua+CdjII2o2zX8FU2l1pq8vJCwm8xWA4fst4B2TqXoeVIjZzLPJ
         xjut2ey/UU5ucV4M3K43TRyuPIrmDEBi02KNImV/C3hH5rirWheZpooBpQrPX7SyTL1r
         0yPA==
X-Forwarded-Encrypted: i=1; AKwUvByR8odV+UiVAb9ghh3OlNj7ENurmD5iT5W1s6Rw0VNYHVRbTFhr8nSPtyl85kKs9SOkVX4mfiksQgZKwmXt@lists.linux.dev
X-Gm-Message-State: AFq9FYJOmHUuxj5VNCFkPdg5ZMQ5NiRdYO9I+hzwl3JC0XmNqIsArEjj
	sux2F7tfQOPgPn9APbJRnPrui/D78pEAuJqqaFPOKvU18776BVbmxl0EgICpC9m88oxy7h95j8Y
	beRc+zwZV2nZ00YOQu/CACNcxhE7rqcc=
X-Gm-Gg: AYBFou2LLa6qvMcU5kjheYnmbetZoY0I2Ax455SqKJ9lC8ca7gtzvVvHvv8VB7Imb7S
	4BJzTuWUd+whB483Z4bM/++DSVw7IowgzX/rMn/nZpcoB6R4SPiSIM3woffJKILVjE98weEvp7s
	2RdAB4e2/QIOvkRhSw9qKoF5aDU2adMOCfDvp1QT923Zd3AyzXwWriNCb02DrI85aBlLN1T6m9y
	2vroqQNpLMuTBEQdtmnoKGSbFBML39zFdhNLzox7rze4Y3uttjIL8Galom/Pevx8vvMswWAOJsj
	ootDS7iJSTrhC3w8mCy+YuZl2nVf3Jk17HBCvirJhaMMW9vORM2nb+SxmHe4x4uvWoqwpND0wWE
	UL38ES1jpoToDuruy1EjRLy6ruDJWuaPYNlAnBV9ZFWsqbTNP5ySXUai5
X-Received: by 2002:a2e:be90:0:b0:3a7:635c:d56c with SMTP id
 38308e7fff4ca-3ab4edf6d7dmr9603521fa.7.1792566155073; Wed, 21 Oct 2026
 00:02:35 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261018-adt7316-error-codes-v1-0-1970b7e242ac@gmail.com> <DM8FXLI78NYT.1211XFYSRH5P7@gmail.com>
In-Reply-To: <DM8FXLI78NYT.1211XFYSRH5P7@gmail.com>
From: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
Date: Wed, 21 Oct 2026 08:02:23 +0100
X-Gm-Features: AclHuK8t7geITgCelH7NvQN5uToH4QCPhBjI31ls-GZ-beJJ-UXA196JduQkipo
Message-ID: <CAJsKa+4+raxftmYPT5yyU6EnP=jEnngOy4PSGaztUgL-N+cXkQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: iio: addac: adt7316: error code and probe cleanups
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 02:58, Ethan Tidmore <ethantidmore06@gmail.com> wrote:
>
> On Sun Oct 18, 2026 at 4:41 PM CDT, Raffaele Tranfaglia via B4 Relay wrote:
> > Two small cleanups for the adt7316 driver.
> >
> > Patch 1 makes the driver return the error codes reported by the bus
> > helpers instead of replacing them with -EIO, so callers see the
> > actual cause of a failure.
> >
> > Patch 2 removes the dev_info() printed on successful probe, as
> > drivers that are working properly should be quiet (see
> > Documentation/process/coding-style.rst).
> >
> > Tested on arm64 QEMU, with i2c-stub providing the device:
> >
> >   insmod i2c-stub.ko chip_addr=0x48
> >   i2cset -y 0 0x48 0x4d 0x01
> >   echo adt7316 0x48 > /sys/bus/i2c/devices/i2c-0/new_device
> >
> > - probe succeeds and no longer prints a message
> > - device_id reads back the stub register value
> > - writing 0/1 to "enabled" updates CONFIG1 (0x18)
> >
> > Error path, instantiating the device where no stub chip exists:
> >
> >   echo adt7316 0x49 > /sys/bus/i2c/devices/i2c-0/new_device
> >
> >   before: probe with driver adt7316 failed with error -5
> >   after:  probe with driver adt7316 rejects match -19
> >
> > Signed-off-by: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
> >
> > Signed-off-by: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
> > ---
>
> This is the current policy regarding AI and staging [1].
>
> Thanks,
> ET
>
> [1] https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

I see, thanks for sharing.

Thanks,
Raffaele
