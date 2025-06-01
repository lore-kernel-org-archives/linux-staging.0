Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D71422AB
	for <linux-staging@lists.linux.dev>; Sun,  1 Jun 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748770281; cv=none; b=pWaLVcKohusLB0PizgaE/Mm5xilQgQ+PrFLr/kGiGnXDHi6qOexqt+wOuacOBJd0PERPcFUOOkHdTQ1WK3y1A8Mwi4m7W9b6ww3fpIogZcqL+RKb8AZDflnK2UXhJWoBXjFC/C5xMInYlkMqKJgD8mIFD2N9QVlAPgh7J66t3dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748770281; c=relaxed/simple;
	bh=cia7b5/pwiJRcIfZ5Pzs0Ic6wr5bXLhP5y8DFKuUFoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ps4lPlQu7UwcLXpXpSVZbSgdFKrkhKbthHFcw9RCOBZi0KjLnRnqvLrJKEWQZGgz/fcPfkCp5vkLldk7/7Q7QRoZMXPJfk0uypBEZ8//KJTBH4cJaPB7QNdMpoReJOSLgU48N/978eivvSQDGXOReASIUnH2GfitklXvnPknz+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MagGX+Jw; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MagGX+Jw"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7086dcab64bso30684767b3.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Jun 2025 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748770279; x=1749375079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2XnIZlfqbuB02O2JRcDHPIrk01jX+E1tx8F/ogvGZA=;
        b=MagGX+JwLgSC/Z0LaTuZTiyOSjKJ7QJ7mRR/6oLoiW+H8zSaRemBt5kxA59lQC6jKJ
         NVcvvsBLimitndnhk3B6cZyWHr4tJU4Cdi7iv88Qe1BqYxbiEEu8VjqF8UxDo5EjoMtU
         AhIU6qhyXlP/tWxZEe9Dmi/jeVra1d/eVl/PNiJjjBwufU5zv6h/6v9W4MnKYG872oBd
         J5t9G3ExbZZmZpFFysoy2Ge/y7NnMJ8AfbFgXhb9fKalc5oOQ9Ee/HmcCcI5Rwh1SsAz
         RGOS+2KucFIOB336L2TKXzEsE+COWUB1mGeKh68HOx2CeURvxKUgqW00Qp7yqdiXYHMx
         9i4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748770279; x=1749375079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2XnIZlfqbuB02O2JRcDHPIrk01jX+E1tx8F/ogvGZA=;
        b=w5iPJUJyAPEp6sEVjJrc7yGcw+zGv3BmFcBFBgWTh1Jo2MM7e3iXohqyCNT1BzdajN
         er6FfuUo8JABKNBqHXIwmbktsNyqb1KGQ7FIJ9K19FMAmFFvABX2VuHe8Wkyf11gxL66
         wF8h82A7BtxgAkIrswax1cV8KklF2GefhYswx3gTCdlWiF7x2dwQNafTchJujpPPvvtB
         vxR8Z2aomlksPMdZSMisPqK621WkPJV7+0scyqVXyMXM3rhpooQouNDI3cNN8OZg7HfY
         7PKAXH/SF/Y23ZvmMoPt7yp+C/emv+EEMsUzpRmMmASXHUMNkZAhzCCtnixaChqyHIWJ
         brlA==
X-Forwarded-Encrypted: i=1; AJvYcCWPU5GX1Wpm3+wnyUjmum7ADoJeUDB/FvQcStfkljqcd+aD2b05Md2mH3aliWoWeAewO5QYgdBmiR/JfqU5@lists.linux.dev
X-Gm-Message-State: AOJu0YwXZWXPVG3GCtX8sT0Ib/V51m3VQrvFiDq8rHoDfmM/+zxJ0FbL
	YwQAHIDJ8LMBkuSEA4nD8vuf74BdkIv1tAhRPVzuUW+mHZKhiemsr2fuuuB14489uJaezkjl7uG
	Sfq7jYpuyza9a+1KyQTM8nppd2+WVz/o=
X-Gm-Gg: ASbGncsKV69i1DXhlR5kDN8zJE58MMJ02r2pN2SpY9d5eahRKdXPJ+q1hE1Q3vf6Fjn
	LZhn/TGAYQ2ESuPcAKdBrXyNm9D0t6dFQpAiiNBbQfd4rCadE0NRpfA2xVR8KqEpOWlN+z+T0n2
	Qbj2yG8YebwbEQb+2t95kApu2uvc8R59YOP3pAC+Zk8+VC5zo2I45xKcUonE5n4NY+5Q==
X-Google-Smtp-Source: AGHT+IEAVxxVpc52dXYXmYpF2W2KyGQQojuQC/tNyL+Jz/nubv7tptBH4Ky3KnPNhkTPSeL9J6BGRhHiNSfj1DyScu4=
X-Received: by 2002:a05:690c:884:b0:70e:2d77:3cfe with SMTP id
 00721157ae682-71097c34bb1mr62644577b3.2.1748770278556; Sun, 01 Jun 2025
 02:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
 <aDAvnmtgnssj7K5l@stanley.mountain>
In-Reply-To: <aDAvnmtgnssj7K5l@stanley.mountain>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Sun, 1 Jun 2025 15:01:07 +0530
X-Gm-Features: AX0GCFvrKlBcZktxRYZfmtgwWx5h5VXrJDETBQWkyQDAgoH4Jt5t3xNUgvl3A9M
Message-ID: <CAG+54DZC9ATaTme_WknauN5LVQRKut-ZJs8SAaZv8FbcQMCf7Q@mail.gmail.com>
Subject: Re: [PATCH] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,



On Fri, May 23, 2025 at 1:49=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sat, May 17, 2025 at 09:11:30AM +0530, rujra wrote:
> > To ensuring that the firmware_tag is properly null-terminated. When
> > copying firmware tag strings to prevent buffer overflows and ensure
> > data integrity.
> >
> > The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE =3D 10 bytes, and=
 it
> > may or may not be NULL-terminated.
> > included in "greybus_firmware.h"
> >
> > changes has been made at 3 positions:
> > 1: update firmware tag
> > 2: backend update firmware tag
> > 3: backend update firmware tag with unipro
> >
> > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>
> From doesn't match Signed-off-by line.
>
> The patch is corrupted and doesn't apply.  Read the two paragraphs of
> Documentation/process/email-clients.rst.
>
> This is a usespace program so I don't think it has a strscpy()
> function.  How did you compile this?

I mistakenly submitted the patch with a mismatched From: and
Signed-off-by: line. I=E2=80=99ll correct the author information from now
onwards patches by following the guidance in
Documentation/process/email-clients.rst.

Also, regarding the use of strscpy():
You're absolutely correct. It's a kernel-space function and not
available in user space. That call shouldn=E2=80=99t have been there. I=E2=
=80=99ll
replace it with a suitable userspace alternative, such as strncpy(),
as earlier it was.

Also I am not able to compile it properly. Will learn it the proper
way, as I have tried to compile it via turning ON the kernel
menuconfig for greybus support and
--- [*]"Greybus Firmware Download Class driver" then compiled it using
make and installed it, Also have not tested via "gcc -o firmware
firmware.c".
If you have any suggestions on how to compile or test this more
effectively, I would really appreciate your guidance.

Thank you so much for the feedback and review. Also sorry for my
delayed response.

regards,
Rujra Bhatt
