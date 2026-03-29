Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB0A270ED7
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774767909; cv=pass; b=puUx5UNPquEB7w4iAe7Q+65OwyXLEOoS1+tIYFY8M5KUMwDFc3NVv2/rNBUXTUbvr2Veanpalyy4mCVUKqvcDhXa9sKYewJqQXxGk0xJHmKEuXMvn/fQZzsZqPfWD5idU99jO2VF3pyYYdeTAhdEVwzO93EcTRIdom1X8Gwovxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774767909; c=relaxed/simple;
	bh=ZQT6Kizl/MAdRDmlo8g1vwa1v+mwQDo844KPSUwwEqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYyLhc2TnaEad53XYfpLvs0pLZUuy5Gwc/8ivc77/A3pMhk0lSqdaIiwFsn7mNaxYFsWP4NZhH/kJfbHecGAPAYZRO+d3miEN0lxtWDaW4DnLdApJ1pfEBtSDNlB8b+gzfDRS0GtE1L3SGt5w6ST9S0g4KaUECRhUXHLPpmnNZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRKTJamx; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRKTJamx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66a5d76d9e2so5578032a12.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 00:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774767907; cv=none;
        d=google.com; s=arc-20240605;
        b=C3SeTJ5yBfNDcZxOmoJqSX6kHeGFBuwKxSu3MfLyD/QqPblYaF5Zy0YAKiaW3Tr6jt
         zSpd/8K3EJn7W0YrwqhOoEl/1lhQ/XHU9rAS4Iql7vTaUDCgk8uIozf8SsOVo5tE/eGY
         UKbwC6PlJQ14amULMqrqDFkp4MNXk/GdTCmmQ1wAZZy18gSR8+aI6fIYSVHdWwUiL16e
         g8R0JFEd0OGwO7lS5l3PSwye66pQGhzHSfxsrY4jaBJc21bkjBJPSmXLEeD3IthcSkPb
         dv6BtnifLXb3n5vmwCj1DV7wbTp+Z+eVjKjtFjaPiqzCk98HTrE0Y1682PoP0Z1elPxr
         W4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZQT6Kizl/MAdRDmlo8g1vwa1v+mwQDo844KPSUwwEqg=;
        fh=aZM+fTlQbNJ68xuXX2yPfXQcFzrYHtLTWutLLlKow2s=;
        b=F+uB4N326SpmwFg5CPpxjXOGRDdycxLML8Z8Bl5k0M6ZTx7kK2fkvT2w9gN0NPDNIf
         l7AUoW/HIz/u7mPj18VwCYNVoaf5cparSiMpNwLpeFfMA07IiCq2sAEx6Zky/UA4B5A8
         bomMp1GwyrF4rAkETY0G8bWv1DR2kEQANv+DEzuJCdZ+8S7pshOjy2Kyq0hbsVzk9mzN
         CSAkJXSAHfMrKB2HErT6GzAJGY6ygXAdeczCES9hF8luHwNVBitz5UHdPYQAC74nIJtT
         Z+373FSRyzOFE8Dus+qVme+ihyL33kn6X1Sjs0H/unxXZmirZTNleVPtApm9bMHLaeuX
         rmMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774767907; x=1775372707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQT6Kizl/MAdRDmlo8g1vwa1v+mwQDo844KPSUwwEqg=;
        b=GRKTJamxMoOacE8DfVTEyiOMdBCD7tX+OyqaZ0tkieR+HcmPSMvB0Tv80KC4QMzBqK
         9yY8TZl4X7v9ui+9nKjmMrLdswx9urwAj1fqApz0S99eM2NTCLAAuDBKuetuRvqtXRgg
         tKZhejWSHzRpx9U+0k024hkvatLghW3CVPF1iozxHTu3qqTYNbSpG3JnlivN9hMd/Rev
         6QK0zHnNj7XW829ded1iqLAaA9isQapgAfyfTM0VAb4OTkGVtO/Pf27+fDk76oKJgZME
         I734Z0+buse59HVajgNBTWgX89QR0Xb1m/2nOp6Cgz1zYrHn7a2MmU7l943Pr82QkurE
         DpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774767907; x=1775372707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQT6Kizl/MAdRDmlo8g1vwa1v+mwQDo844KPSUwwEqg=;
        b=eZO1XPMAzje6SxL3abnuhdA5pMm9RTFNkwtDjMTd5/RRy1l8NrQSJIo44BdVFTDJG/
         o4OtOqbfYSebTNJYHtaObmALvYRrQmeNs2Wqj8Kp7nhSRNe/UemHHF0IdkuzKA6WlSPl
         YsEKshdSwn/MPKwPtbHwUfdP+oyOpWSt0bl5aJ61GACK0TJmfStd2T7RO2SNs0J0+y8x
         lnJjwYcW2hh0pu0ZkMV7UQ5I/T0PsxQzgOZ4aY0xr7Gfz7j3lGPZmItodDHQ44kpWSH8
         X5UR7dqpEr+60xPMDK/8RZsX311kzEZ9yC0af60sWufWexDTeStaLih1cj9xpR+vD7RF
         XtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZhq3J66/6HVMhnJOCmJAl4TIOkiiP4lXigNOy/CbCvmxoUywaDc/vFxg/F6PwiqYzWEfZP/Pb9QlyGeFk@lists.linux.dev
X-Gm-Message-State: AOJu0YzLpypazrHWS04AUjVFuEhV/TVjo1EgcR7IH8XHsamfokJcVpLI
	mYtPZbYhJd6u/bEiAIsk3YVIKM5pdbxe/W80w0XP+SkxItSvfXj6SgNsZ+UAH57Hg+iFQzxLQUO
	528UWfxqhrWS4ycbapO359i4/0S872xg=
X-Gm-Gg: ATEYQzxDSpwDcq9hnE129UoWZ+x7md3saYkSdyX9KEWi/j62zpBgrKN2G40W0cAAO3D
	UkBk5+D5T9vIxqWqHYU3Y3XE448XXw5cZPsMrHdvh5LL4nRBD3RVCGZRFxTSLy7Zvq/zNYDs5tk
	KrH+zLB7McEJP2vhLHJhfMIPSVgQaDlKn5BF4fTKP16Rfk2SFKO+WGdjzuB7LPdjt3SNaVm7/47
	OkzI91vGiBJxRscEAa6vah2jY5H7j6Mx+42kxzIJxJUY5gPBgQ/UU4qcI4B8Rh+f/QRLjIBec1v
	GuY3vkNt
X-Received: by 2002:a05:6402:a0cb:b0:66a:819b:e8dc with SMTP id
 4fb4d7f45d1cf-66b28465b36mr3746313a12.3.1774767906504; Sun, 29 Mar 2026
 00:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
 <20260329062004.492812-2-sebasjosue84@gmail.com> <2026032956-railroad-renewable-3328@gregkh>
In-Reply-To: <2026032956-railroad-renewable-3328@gregkh>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Sun, 29 Mar 2026 01:04:54 -0600
X-Gm-Features: AQROBzDDMTtjJGX-Ei2KRlMZgardjumAcGM8vxjU_47sejUGt_kSXM7RX7DEcp4
Message-ID: <CAJD=UNdEqLW_CGpq0=p+DwJraiHTus+t-bPRW9wi2wh8B8C-rw@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer
 overflow in vc_sm_cma_clean_invalid2()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, Thanks for the quick review.

Regarding kmalloc_array(): the patch does replace kmalloc() with
kmalloc_array() - perhaps the question is about the remaining
ioparam.op_count * sizeof(*block) in the copy_from_user() call below?
That multiplication is now safe because kmalloc_array() already
verified that op_count * sizeof(*block) does not overflow(if it did,
kmalloc_array would have returned NULL and we'd have exited). Happy to
add a comment clarifying this if you prefer.

Regarding the Fixes tag: the commit dfdc7a773374 is from the
raspberrypi/linux tree (branch rpi-6.6.y). This driver (vc-sm-cma)
appears to only exist in the Raspberry Pi kernel fork and has not been
merged into mainline staging.

I apologize for sending this to the wrong tree. Should these patches
go directly to the Raspberry Pi kernel maintainers
(kernel-list@raspberrypi.com) instead?


El dom, 29 mar 2026 a las 0:33, Greg Kroah-Hartman
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Sun, Mar 29, 2026 at 12:18:45AM -0600, Sebastian Josue Alba Vives wrot=
e:
> > From: Sebasti=C3=A1n Alba Vives <sebasjosue84@gmail.com>
> >
> > vc_sm_cma_clean_invalid2() uses 'ioparam.op_count * sizeof(*block)' to
> > compute the allocation size passed to kmalloc(). Since ioparam.op_count
> > is a __u32 supplied directly by userspace via ioctl, an attacker can
> > choose a value that causes the multiplication to overflow on 32-bit
> > platforms, resulting in a small allocation followed by a large
> > copy_from_user() and out-of-bounds heap reads in the subsequent loop.
> >
> > Replace kmalloc() with kmalloc_array(), which returns NULL on overflow.
> > Also add an early return for op_count =3D=3D 0 to avoid a zero-size
> > allocation, and return -ENOMEM (not -EFAULT) on allocation failure to
> > correctly indicate out of memory.
>
> Why not use kmalloc_array() instead?
>
> >
> > The /dev/vc-sm-cma device is world-accessible (mode 0666), so this is
> > reachable by any unprivileged local user.
> >
> > Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driver"=
)
>
> I do not see that git id anywhere, what tree is it in?
>
> thanks,
>
> greg k-h



--=20
Sebasti=C3=A1n Alba
