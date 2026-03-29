Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A70314A73
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774787720; cv=pass; b=oKwi6I3Eri/Jh0fgZOYW9+KcyohHFPguX/pcMrzg1DOA2Xqh2uKYG59py0Nf28xKc61BjesHi5Dvg1au/5M8mA3Wd6QAklHoTKWW8JBF6oT9gC4iNrSbf8bGw1zeb416XB36cw2c8LBJpdpcKzHKRyQw7DWOfSncKBGKgtb0LKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774787720; c=relaxed/simple;
	bh=nDn3DrkMDCpaWDQpNGLLxPCXteWRJp5QwTlOtMUyyhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9QnJ/cEU396fSMG7JVvug8zUe3nvuqwlXQZmU/D7eAtWfoOBEJ2plO7Q8MA3NO+2RPKybPAT5QpNt8eqiq7iu1avOnmESz7ndQIX2xPZjAPfxoXpXBOn16rqGr3ThIaErHNOl1UkyZbyhWOg0f0uyqZ4BU9NBgse9dxK6UvhcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohEl7noy; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohEl7noy"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso5199126a12.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 05:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774787717; cv=none;
        d=google.com; s=arc-20240605;
        b=aRJL4QC5NqQf4KcQeaCYvoaKMTtjPRCrPXT6LDalgJ6NA/bYxsA/byDu9TuCRW1ctE
         jLTDIjd4BMkNW8faRi9qyuQXR7UugJ5qWPxbqm2wQX1YHWszQBu3TISYk1meUEZ5ahIk
         dsHq3VUKwlV0tf540tdge3cGF7ncGeRU006cTk2+mWjjEii+985SpYcPIfhyGFyWhsiD
         ePKb/zZqGGBzFxTU73LMgpOLnKTedWLKuSAFKH351FFtEJOZdtMuFHidLwKr25ywpWQR
         SCPnNqH/Ue21cNyP/aF+TxOzdbCBF7gEK3JicZADRqjKHoQ60OZP5Qpps8K9PxYn8pkZ
         QNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nDn3DrkMDCpaWDQpNGLLxPCXteWRJp5QwTlOtMUyyhM=;
        fh=+1doYgL5e9LH+tJR44SggMIjqEWjqfS3lVsb8+QtLCc=;
        b=C6hPVahhVlHtItko9MxOGtcPZqtjnESyPn1SpemtBkyUnsOCdXyROdQ2Sbp/73fvhb
         uB54MazU2QcLFBHd1JHR8v/M1S0XJVP0zFWVXNGoFbgYAtS9E+HQjkPKlO00MJ78MHZ4
         ZxKKXD8FefFQhHaNXRuDyTFNYfcLbbC6j7fuCXoXjpnJMBVmEFMMZ91ALhAaASfKtflo
         lUZTLoL1zCU4uB7woLiog0Nc7DIz4O+e6/mRW6LEz0DW5AblP/68WiteaZw4/vFVidBQ
         jLbSMXkWt4BAeeEr5o5++o46DEr9iToHnFh/xEpsoIzoCSKcY6NBiX+dQH+lZThZJan8
         Dc/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787717; x=1775392517; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDn3DrkMDCpaWDQpNGLLxPCXteWRJp5QwTlOtMUyyhM=;
        b=ohEl7noyjEh9YHjzCqKz0EnDHqiF9ypeDzoluSCaab+tNq1m56kCVs9GcsyY3HE3Gm
         xX7vUHzr3DbtleDsqZvJY8dO/YA8b7FoPwdwVT6ZmhqCH6m6LaJUHp/PtOFcjuVBUFyg
         XQGOT3SS7KuzJoiNlJAD0rq3xj8PT5Og/IlM+dvLFb1iKoSebmn6Ck1EEvQ33X/cMJT3
         iDRc9CtVPgp1I+HuEOg2pLHEcbL1/9FdLHqkY9sXsElhwtQ5LfVhVlqPaSHtYn9kpINi
         NqkCRBXLOVFKn5eB89KbZqEhQalV49I6PuF2yo5nPWE9/RgX9ZwZhnKp/nS181DvgjnL
         uJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787717; x=1775392517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nDn3DrkMDCpaWDQpNGLLxPCXteWRJp5QwTlOtMUyyhM=;
        b=fyvEPWxQf9V7CpUaZ/SWk3jnJGAnXDhX6an2bILZ4cvmzMCYjqVnLDr/+E4fd65t0/
         YszhNEKKWbH3JrmJPDSecl5r0sk2D4bsgQF96WdJVjxZrt6LUDicNctBV0x/b7gOb/tf
         0NShogsWA/5q2ZxeTUeJxp2ZF2GoRGJQ97nQY/sGMU40qOa6U5tzvzaCPguIJDBhNi3Y
         lq+fTYCeXAZVLfDQGrQbUBf5i42hYio+JhbSGPBOSeGbaEH6o//tYhlQn9WMko6FieUH
         vAVWIpwL91gG4Qoj9M5imKmuOJ6GRbQCIH5KBKJSxhQ0Ny0sKg7dCFIiV9DAD4ghPz2Y
         bypA==
X-Forwarded-Encrypted: i=1; AJvYcCVbWqOynVUfWVmmUiuWZ7ydcvrAWRryqtRasjT6uefxFq2BUDYwwajESImx18uDwgQtb8pHw2mFAvXFqhu1@lists.linux.dev
X-Gm-Message-State: AOJu0YzOcDJpOTlOcInu21oqFE1nY6gKfO/158P+OgO3Qk+Hc+Ls22zj
	TJcdjz5yGm/woMqey876QNb3fMpKFF6elFSN3ZyJalsO4mZy7C+04a59RzZyXBuL7d/2puLpJeI
	6a2nv3BTuggp1FeNmdYmxLjW5h/x6lns=
X-Gm-Gg: ATEYQzx1RYoXoBKO7K9HzWv2iInBUfEFXa8xOUoSauTK7/uVKoNNx1YWBO7rBXMomYD
	dBR+PVxQwwgzV54tCx2JoiRZQZ6nOOzZYGtpfH5SMId6LONu2gEq93HhqafWarrM6iQHkv2b87X
	6Z8kfy1XvYWG+eCS1xLDfPMTJ0R2zzOGGGBgtI0rd6zVAAcN9/RtNyQAQt6XI2kmF+YwPJsGPr7
	WCQHKbBQbOCWhFAmQRYJBHNb2Ev67XXySehjF4Wrbr5NWUczE4Tt2WpZ2gKoyJbBnyMzd5ypKTE
	dbAMvoRK
X-Received: by 2002:a05:6402:5386:b0:66a:27ae:114f with SMTP id
 4fb4d7f45d1cf-66b28266438mr4329883a12.6.1774787716954; Sun, 29 Mar 2026
 05:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
 <20260329062004.492812-2-sebasjosue84@gmail.com> <2026032956-railroad-renewable-3328@gregkh>
 <CAJD=UNdEqLW_CGpq0=p+DwJraiHTus+t-bPRW9wi2wh8B8C-rw@mail.gmail.com> <CAMEGJJ0zgab3WN=rb2o+UgEq_coX5LnkyPj3UNrBSMQbTGU7Zw@mail.gmail.com>
In-Reply-To: <CAMEGJJ0zgab3WN=rb2o+UgEq_coX5LnkyPj3UNrBSMQbTGU7Zw@mail.gmail.com>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Sun, 29 Mar 2026 06:35:04 -0600
X-Gm-Features: AQROBzAKKVwQdtdUih-AH2iidcNJRTvmk1rpyf99lT2fFxFMoEb2HB3wguQOMzU
Message-ID: <CAJD=UNdoyWg62YwA+m3Ku2OVQ9JMLdVbiBuJ5vu7-ahQ-0+DkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer
 overflow in vc_sm_cma_clean_invalid2()
To: Phil Elwell <phil@raspberrypi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, linux-staging@lists.linux.dev, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Phil,

Thanks for the pointer. I've opened PR #7294 against rpi-6.6.y:
https://github.com/raspberrypi/linux/pull/7294

Sebasti=C3=A1n

El dom, 29 mar 2026 a las 2:51, Phil Elwell (<phil@raspberrypi.com>) escrib=
i=C3=B3:
>
>
>
> On Sun, 29 Mar 2026, 08:05 Sebasti=C3=A1n Alba, <sebasjosue84@gmail.com> =
wrote:
>>
>> Hi Greg, Thanks for the quick review.
>>
>> Regarding kmalloc_array(): the patch does replace kmalloc() with
>> kmalloc_array() - perhaps the question is about the remaining
>> ioparam.op_count * sizeof(*block) in the copy_from_user() call below?
>> That multiplication is now safe because kmalloc_array() already
>> verified that op_count * sizeof(*block) does not overflow(if it did,
>> kmalloc_array would have returned NULL and we'd have exited). Happy to
>> add a comment clarifying this if you prefer.
>>
>> Regarding the Fixes tag: the commit dfdc7a773374 is from the
>> raspberrypi/linux tree (branch rpi-6.6.y). This driver (vc-sm-cma)
>> appears to only exist in the Raspberry Pi kernel fork and has not been
>> merged into mainline staging.
>>
>> I apologize for sending this to the wrong tree. Should these patches
>> go directly to the Raspberry Pi kernel maintainers
>> (kernel-list@raspberrypi.com) instead?
>
>
> Open a Pull Request at our Linux repo:
>
> https://github com/raspberrypi/linux/
>
> Phil
>
>> El dom, 29 mar 2026 a las 0:33, Greg Kroah-Hartman
>> (<gregkh@linuxfoundation.org>) escribi=C3=B3:
>> >
>> > On Sun, Mar 29, 2026 at 12:18:45AM -0600, Sebastian Josue Alba Vives w=
rote:
>> > > From: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
>> > >
>> > > vc_sm_cma_clean_invalid2() uses 'ioparam.op_count * sizeof(*block)' =
to
>> > > compute the allocation size passed to kmalloc(). Since ioparam.op_co=
unt
>> > > is a __u32 supplied directly by userspace via ioctl, an attacker can
>> > > choose a value that causes the multiplication to overflow on 32-bit
>> > > platforms, resulting in a small allocation followed by a large
>> > > copy_from_user() and out-of-bounds heap reads in the subsequent loop=
.
>> > >
>> > > Replace kmalloc() with kmalloc_array(), which returns NULL on overfl=
ow.
>> > > Also add an early return for op_count =3D=3D 0 to avoid a zero-size
>> > > allocation, and return -ENOMEM (not -EFAULT) on allocation failure t=
o
>> > > correctly indicate out of memory.
>> >
>> > Why not use kmalloc_array() instead?
>> >
>> > >
>> > > The /dev/vc-sm-cma device is world-accessible (mode 0666), so this i=
s
>> > > reachable by any unprivileged local user.
>> > >
>> > > Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driv=
er")
>> >
>> > I do not see that git id anywhere, what tree is it in?
>> >
>> > thanks,
>> >
>> > greg k-h
>>
>>
>>
>> --
>> Sebasti=C3=A1n Alba



--=20
Sebasti=C3=A1n Alba
