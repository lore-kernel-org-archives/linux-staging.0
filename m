Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92813D69;
	Tue,  1 Jul 2025 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384730; cv=none; b=PVhFm3CtUYkFRalWtStb632sMLrgasH/9DM3j6d3naVPn55dRKJlHw4w/Xu5MLErtgLKUhvNhpRibNj44EMGFDmpq3LtXU3PuAalLk4pfeB1HWaMsgp8hCkjRjalddo7uVIHygdP7x/FapBqSt1iL0Rt8W61FbnsflcyJy0crt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384730; c=relaxed/simple;
	bh=x9UpfN7Aq8UZdSHf7F0rSBCPNJyoVIdHkPVTWuIsxV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ0gpoR1oNF8Tlv4IfDl4GHtOsCvNsklb8CMSjv/9hDZ575C+PXPDLZXog1Ty7LQATLlQq9cl1DlH4tkP4J+09TUFFKtOFarvHPIUZ94HIH2vse19ZKDbhxTLOwjSJM3e93CLam8OkL8wRWpWzERpS67d+yS0M8MRY+7aGWNFEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbPye4gV; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbPye4gV"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8437669cf1so545806276.2;
        Tue, 01 Jul 2025 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751384728; x=1751989528; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9UpfN7Aq8UZdSHf7F0rSBCPNJyoVIdHkPVTWuIsxV0=;
        b=IbPye4gVHp29k3KJcctyVerorVw5aXYbO0DEQ+AcsX2lYdSRYTcfZqFcWwxptiKSGG
         95LaCmy9A0P+J8iGg0yXhOFR8O7kBkZWBkjAD6fTkC5bM+4p50tCifeD5qBpqll6sa6G
         ogO0eGO2enx3oNkzLYZ+YE1BsEFPmr6aebHFQEaCJwPWuvyQPpwjsCouoa/PIuLFDRmC
         xRdzGYmAi5sObF7Gqq1hbBbZxeuoRVx9NmZ8dC3qdhKuWSFuVtjZQRxTu7HL0z5tV1o+
         D++ZTXDOF5irdSvtcnMUZeWS6FSjBiYtAsv+T5Eowzc6ekMNmk8EIoS2r2UCh0SAP1zp
         +09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384728; x=1751989528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9UpfN7Aq8UZdSHf7F0rSBCPNJyoVIdHkPVTWuIsxV0=;
        b=dNUf1vCEvoCh5mRcLnNoeL0CAeXOS7vCmtNX/7J/q5c7/J7UMUZM29hI0YFx4yxUUC
         oYgOP/wMLXhiaebT17dm5rnh3mUr6IgkT6oMdDAAuq0wNey5fjTUaLBNhkh+dlM/gL85
         MXlVK7baP1518wvKhaUBMLb2u03+f32jdzNopMuyr7JgmtX8J2r61wAYOUPMjQCL+08l
         y+IvLSIyli8Sof0z17bEW+PzrvVwqFnf1SKjAe6nrmiveQ/rQBwEo4AX4euQ7Utl3/BD
         MA3lOwUa6aTAIOur8tahT/ztS9h7fSG/XYmH3dPKZ3t4l8Y6RvC3kkLc1ivjnZkl4IcX
         /6CA==
X-Forwarded-Encrypted: i=1; AJvYcCXGfxnpTDKC77II6C05MzMuxeFR5+DXUlxE3FjLS/ZlweZba8h5PY5s4t5RXL8s0KYiQs++OVb7D25Dae6c283b0Fe81Q==@lists.linux.dev, AJvYcCXQ4DeezzZ80nmDemrVYNHTU4iPVBJs9wZT5IsMza67o4EH27HNKinPlaARhaj/3edAWPftUWR36DymrK2bwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKUj5K/7ty5JVLe28f4XXVylcGi5C/XNABDtJOGjBGVJT25SIo
	hg5rUDTkb/PCrtd5sFDwvDQnJ6vEDkPQQz8m1Ephluz4g/PC5fNIho7k17hp5zBWJ7bBgLGtvkT
	poDjuHsp/MPbajgjgzLJrUK92guCvWGY=
X-Gm-Gg: ASbGnctXSwPXvMzFsKOMXTRSw62aZNdS8Z/HjgSgp34wdCOmAK74mO9d9RdHKEZisYI
	RORbY94x2HyRjbmYX+UVucFHuRCgRluCKL4jhacuukKPLygkMdXD9ifHk+8QswTIw55JmnKLu+x
	jQc5JY5LkaSIezfqYI4qShapZozJbR13sUAvQdbVzRXGxcxQ==
X-Google-Smtp-Source: AGHT+IEfooipUFL2hwnUaoiTlhqVT7e1uGaoiDCZiaLgdwxC88RJN/MSRFR0b9VJBIvYPuc+Lc6i8b7iBiCtDQ3VEyM=
X-Received: by 2002:a05:690c:ec5:b0:712:c5f7:1f02 with SMTP id
 00721157ae682-7163f69edf5mr25050887b3.1.1751384727157; Tue, 01 Jul 2025
 08:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com> <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
In-Reply-To: <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 1 Jul 2025 18:45:15 +0300
X-Gm-Features: Ac12FXz3IpBR6q2hIzNGykMqRbSsh_DeKPnVlA58PidL1Fnwp7Pc6_6q4_-K5EU
Message-ID: <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Jul 1, 2025 at 4:54=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi,
>
> On 1-Jul-25 2:45 PM, Andy Shevchenko wrote:
> > On Tue, Jul 01, 2025 at 02:58:43PM +0300, Abdelrahman Fekry wrote:
> >> Hello Andy,
> >> On Sat, Jun 28, 2025 at 10:52=E2=80=AFPM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >>> On Sat, Jun 28, 2025 at 8:26=E2=80=AFAM Abdelrahman Fekry
> >>> <abdelrahmanfekry375@gmail.com> wrote:
> >
> >>>> The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> >>>> before key initialization steps like kmem_cache_create(),
> >>>> kmem_cache_alloc(), and __bo_init().
> >>>>
> >>>> This means that if any of these steps fail, the flag remains set,
> >>>> misleading other parts of the driver (e.g. hmm_bo_alloc())
> >>>> into thinking the device is initialized. This could lead
> >>>> to undefined behavior or invalid memory use.
> >>>
> >>> Nice. Can you make some fault injection (temporary by modifying the
> >>> code to always fail, for example) and actually prove this in practice=
?
> >>> If so, the few (important) lines from the given Oops would be nice to
> >>> have here.
> >
> >> I have been trying to test it without having any intel atomisp
> >> hardware and failed continuously, do you have any tips or maybe some
> >> resources on how i can test this driver.
> >
> > So, the easiest way as I can see it is to ask people who possess the HW=
 to
> > test, but you need to provide a testing patch (which can be applied on =
top
> > of this one, for example).
>
> I don't think it is worth testing the error path here,
> the old code is obviously wrong.
>
> What is interesting here is to see if the extra call to hmm_init()
> in __hmm_alloc() is necessary at all.
>
i think its redundant because in all scenarios hmm_init() should
be called before hmm_alloc()

> And obviously hmm_init() needs to propagate the error return
> from hmm_bo_init() right away instead of continuing if nothing
> was wrong and then only returning the error at the end.
>
> So it seems that there plenty of cleanup to do around this
> without needing error injection to test all paths.
>
> Actually I'm pretty sure that there will be quite a few
> error-handling paths with bugs in the atomisp code given
> its overall quality. But lets clean things up first, that
> should make addressing any such cases easier.
>
I totally agree with this , i have submitted a patch that cleans the
custom sysfs atrributes
as you suggested as a beginning , the patch got reviewed by andy and dan
here is the link
https://lore.kernel.org/all/20250627100604.29061-1-abdelrahmanfekry375@gmai=
l.com/

What do you think I should work on next after these two patches, do
you have any suggestions?

> Regards,
>
> Hans
>
Best Regards,
Abdelrahman Fekry
