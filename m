Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3BB1FF603;
	Wed, 18 Jun 2025 06:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228067; cv=none; b=Ns1bNIBwnVp0nfWOaBubKKkLP/GQiZId4Z559OpJESEQ8MNOTmbZsor+b3LBN+tUAggN92KQNvmQ0ASohTxyqMDXfFH91G4+aPO3i7BJGxL/jsQsS25p7p15DuVg5qu90HcOuNEjVbUsekwWRUT6k37Sid5nibH7aHgREpdhgl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228067; c=relaxed/simple;
	bh=24JbFpK4Q6COoTNi1FMttPX5eqGw28gxzN4SKfcTTcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIZQwc3SAilJIZyS/wg4NTIA4AGJjiOSkXyez94Zlr1ygRhH9+7yRRSgvXFEgg7/rIPr3nk/NbT2qYmV6cQfuU9KT1exdB6rnvVT3zdnJwhHplVZALpHRlQiWVOeUoXLn7OAu7vGc2VxgH3IupvGvS6hPiwbuuoPO1OwI6W0+lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RX2ouy69; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RX2ouy69"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32aabfd3813so57289971fa.3;
        Tue, 17 Jun 2025 23:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750228062; x=1750832862; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UK3zIT17fxpiOCoUtOLwH3cyUrlx/S+uNQT2nYw/j7Q=;
        b=RX2ouy69DQueD09yS8YJL5xfgxKkFJeskbXlEicaWNfF+UmjnkHIxUS/+gDrg9B2ba
         UyMOmi8q4ekbICj81vQRn+6yJ+KIXTMK9I1Qv5OlXx+t/YDPtsi4DItom7OKw2v7ekeu
         HMIm8sLaejeZmPlnGZ2P7f155c69SseSKhnvK/ecsctEuYc1q2iUaKinRtlqq8/7d8yH
         BENPsenWOPzzg1WjVDgkvMwGPqix51Vr4Siu4/9wuhqv2Sqr0RMMA6fGHkVHs8j7cAZV
         z6ur5p9FJhwUUQxm+Rys4EtN8Yhk305zsSjiwEkJzId32DPBIN1+DWausepxt8aM3Fyl
         FA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750228062; x=1750832862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UK3zIT17fxpiOCoUtOLwH3cyUrlx/S+uNQT2nYw/j7Q=;
        b=YtYwDDUltnzrADncmF9aOnudNVlM4xY2WSqhTR6YJRISbg2mPEfEXkNQsyNhqgbJ3u
         2VqV4YDPVphOXTnfY0invkBvQlzmrMUq/+hxfBfu2T8MrT+sc9P3CEdVtUC1yPWdGZyU
         A5OrL1vDjb4KqnzynYd2W/H4SB5QcYkmdSs2yCvzR42rvzgPVESoUYvVgS7MAtn7rId4
         drnU8GVV+H4mQIZEewLGCM1DNKBaD2rwbgH4Kj1UCcg2TcCg60l+BF7cDH7lLctQiejG
         F4lg5ZTzSVJnZ2zSMHtuXorNhzUnO/08Ix7dh+zfrBs6O/W1HLR3NR6ir5M+gbV2K1UQ
         aMyw==
X-Forwarded-Encrypted: i=1; AJvYcCVv5ELe7Gz4QKIMs2w02pmnNa/fI8HO7SGvE1or3PE7XWouvx0HFlxsr5ZQZXnJi2BhKNk9dAeCh5T8Azz2+wXAzazVYw==@lists.linux.dev, AJvYcCW3wGiN54cylwBTdjNmviNLeOlO8ZH1LFOi66xvNWjn+hNYIoMCggdUVCS+q39JMWNHBqZedARyAZ88/BYSzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJjFeNj4eghMooZkExREiii47/5uBTEqzsPJs38yAveCdyOsAC
	7ttAa0Xcb58+nkBQm+bzuQRHYijr2f1hIopG9QuoHTzORDYJdfHLRWBEjLDXCA/+4m9wegxlYvE
	b+VQHSGrQ7ZK/rPPjoMArxEQaHMttipo=
X-Gm-Gg: ASbGnctrJZvynQADqjvk8KrsvnlckKpm+T8NYIvbjNF47GLieVJRGnKwHyZglohc4kr
	DW723SaGJsv0oA4HSwlqk/EkxCU+HFsxYGcS1wagnivNuHD7gE1EhoGofHJNx2LBACDQ5+w9Mcw
	ixSX3ugb1gknssq3mbVDjR6YPW0PbfDx5w6jzY9hoENKJEqWxt8P561MRf58SMK53Zyv50pLMrd
	ybNcQ==
X-Google-Smtp-Source: AGHT+IFzclqmdVYnh9bn5OftmS6r65aUYN8NNKEj6r9Iyg5dqC68jtjtrYT2lTnS+3l/ASSE53QIq5/5axxl6L75mvY=
X-Received: by 2002:a05:6512:6ca:b0:553:6488:fa56 with SMTP id
 2adb3069b0e04-553b6f42225mr4348650e87.43.1750228062258; Tue, 17 Jun 2025
 23:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250617125137.24503-1-pranav.tyagi03@gmail.com> <2025061743-surging-legwarmer-b3a9@gregkh>
In-Reply-To: <2025061743-surging-legwarmer-b3a9@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 18 Jun 2025 11:57:30 +0530
X-Gm-Features: Ac12FXxz57hTn__qDBfgtwWqrWJFimTpv9FC7DveT5JsGtxfM3_WuWsO6gHWEyQ
Message-ID: <CAH4c4jJZ_CNwPpYVx1pMU2U26PDOFzsjcd+qr2-PHfgF47ywAg@mail.gmail.com>
Subject: Re: [PATCH] greybus: firmware: use strscpy, fix tag size
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, elder@kernel.org, vireshk@kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 6:46=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Jun 17, 2025 at 06:21:37PM +0530, Pranav Tyagi wrote:
> > Increase the size of firmware_tag arrays in the following structs from
> > GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
> > accommodate null termination:
> >       - fw_mgmt_ioc_intf_load_and_validate
> >       - fw_mgmt_ioc_get_backend_version
> >       - fw_mgmt_ioc_backend_fw_update
> >       - fw_mgmt_ioc_get_intf_version
> >
> > Replace strncpy() with strscpy() to ensure proper null termination as
> > firmware_tag is interpreted as a null-terminated string
> > and printed with %s.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
> >  drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
> >  2 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c =
b/drivers/staging/greybus/Documentation/firmware/firmware.c
> > index 765d69faa9cc..3b4061f4b34a 100644
> > --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> > +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> > @@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
> >       intf_load.major =3D 0;
> >       intf_load.minor =3D 0;
> >
> > -     strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> > -             GB_FIRMWARE_U_TAG_MAX_SIZE);
> > +     strscpy((char *)&intf_load.firmware_tag, firmware_tag,
> > +             GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
> >
> >       ret =3D ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load)=
;
> >       if (ret < 0) {
> > @@ -101,8 +101,8 @@ static int update_backend_firmware(int fd)
> >       /* Get Backend Firmware Version */
> >       printf("Getting Backend Firmware Version\n");
> >
> > -     strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
> > -             GB_FIRMWARE_U_TAG_MAX_SIZE);
> > +     strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
> > +             GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
> >
> >  retry_fw_version:
> >       ret =3D ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
> > @@ -129,8 +129,8 @@ static int update_backend_firmware(int fd)
> >       /* Try Backend Firmware Update over Unipro */
> >       printf("Updating Backend Firmware\n");
> >
> > -     strncpy((char *)&backend_update.firmware_tag, firmware_tag,
> > -             GB_FIRMWARE_U_TAG_MAX_SIZE);
> > +     strscpy((char *)&backend_update.firmware_tag, firmware_tag,
> > +             GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
> >
> >  retry_fw_update:
> >       backend_update.status =3D 0;
> > diff --git a/drivers/staging/greybus/greybus_firmware.h b/drivers/stagi=
ng/greybus/greybus_firmware.h
> > index b6042a82ada4..ad5b2c8a6461 100644
> > --- a/drivers/staging/greybus/greybus_firmware.h
> > +++ b/drivers/staging/greybus/greybus_firmware.h
> > @@ -38,20 +38,20 @@
> >
> >  /* IOCTL support */
> >  struct fw_mgmt_ioc_get_intf_version {
> > -     __u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> > +     __u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
> >       __u16 major;
> >       __u16 minor;
> >  } __packed;
> >
> >  struct fw_mgmt_ioc_get_backend_version {
> > -     __u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> > +     __u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
> >       __u16 major;
> >       __u16 minor;
> >       __u8 status;
> >  } __packed;
> >
> >  struct fw_mgmt_ioc_intf_load_and_validate {
> > -     __u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> > +     __u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
> >       __u8 load_method;
> >       __u8 status;
> >       __u16 major;
> > @@ -59,7 +59,7 @@ struct fw_mgmt_ioc_intf_load_and_validate {
> >  } __packed;
> >
> >  struct fw_mgmt_ioc_backend_fw_update {
> > -     __u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> > +     __u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
> >       __u8 status;
> >  } __packed;
> >
>
> You are changing the size of a userspace structure here, are you SURE
> this is allowed?
>
> How was this tested?
>
> thanks,
>
> greg k-h

Hi,

You're absolutely right =E2=80=94 changing the size of a userspace-visible
structure like this is not allowed and I apologize for the oversight.

I did compile and boot the kernel with the patch applied, but I now
realize that I should have also tested it against the actual userspace
tooling to validate ABI compatibility =E2=80=94 which I didn=E2=80=99t do. =
That was a
miss on my part.

Thanks for the review and the guidance. I=E2=80=99ll fix the patch to prese=
rve
structure sizes and ensure safe null termination without breaking the
ABI =E2=80=94 likely by using strscpy() with size - 1 and setting the last
byte explicitly if needed.

Apologies for the oversight.

Regards
Pranav Tyagi
