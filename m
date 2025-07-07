Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8EC2C326F;
	Mon,  7 Jul 2025 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897734; cv=none; b=uLgzUnnvNDvjMRcFFl0wPtaC0FR5aC3ehNVJFSNhyT8W+UGYSSaxbXYKCRErC0TVerUuBJXtlTsY8z8wJqM06kf2iw7HtlyEIK3PgNJr45DVF3MfZ5rsCOyklLbDXVAkERfgT70i19TyM6lCi/jWMLPX8R1kG73/Mqwfd1PuHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897734; c=relaxed/simple;
	bh=3LfLU8OtGsYshHZLrDfPMhhXu/3AExSDQWcIRL1i2oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TX65lpaL/tn4FBXC3ZG/ZUgLHGI2s/tU9bLhXPn/gQpLh6w2K6zBgmaPcCj39zjf0yzvYPb2jVpq63P7yLr7sW4i8v3oZSixUcWpe882SuPZZDvaLzneRcoJHrAOt8VC6YAQLC9EIFnbnBbI4bW3Z1739VihcJVv/3n9Vk7qs4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5aL3fqB; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5aL3fqB"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e80ba7039so1038507b3.3;
        Mon, 07 Jul 2025 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897732; x=1752502532; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AErYOjPJpnpZ+PP+YqlZmcpAxpjfggGYTXiGQfIvip8=;
        b=f5aL3fqBvcma1AtdGW8ukxQacP7wYaj41lJWsU8qzh4XegQR26tw+b9gOBsCkPR1aK
         aXgfwt3zA2XCm8pZ9FRIanQujw/OfE/tcpSOcK/MTx3wtggfM1nqb6fYu+emAI8yQ2/Y
         Btzi7HJniNVV628lEKRmIzqB7ILU1LS6GdcntTk/hJXA3s3Epoifp/+ElXdrg91Yk4wN
         Phyg/tMhXCiG/ZFHBFURSm3Zuch4gQya9+yxY+ZCmb0wwItmR2997jxuTtOGi0M8wc5t
         ZuOZyoHbwf6mQ5hUFzoHLqn0+dMEuYjXysAhj/cz+/XfzHJRQRGlWIurv+XWfXBP3shs
         a5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897732; x=1752502532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AErYOjPJpnpZ+PP+YqlZmcpAxpjfggGYTXiGQfIvip8=;
        b=pb3rbT511c07g8v+RAOyXGMyrY/V3GVmoFPp6bdvTokR2AlYSQsUssCZkBBM92weri
         4OsFU71z22CnTCp9HkuMWOr1vOLt4k38XKE+368kqWCn0/3UkLS0MooHWgVjFsdXGlRE
         /HP+fwGMAjXvA7zxI/ssOEqrPwAJVrzH/KtUrmy8KfVwxfa7M7JIAZPZ3fLtoB666zlY
         qLeBf1b/vqU/eZsDbjvbwCUzYilPop48X2mUS622gZWrGHWoKaz/0YYR7HNAVZUCQ+YV
         GJRmrFvYndJWt7Ad3W2M6j2y5R21WVObRS8rOBh7En9qNK8k63krUG25NeRN3pLqriKM
         KfCA==
X-Forwarded-Encrypted: i=1; AJvYcCUZL+aF+ODJ1U9OTPgb0NwqnDowZ9/jQyRw6WIpM7aKN5d1Nx6vdR0GPQl/jjtmk/Sv426c9IBb3BYnC+hGUbZb//qavw==@lists.linux.dev, AJvYcCV5ndmzXeXp0AoxCuOnJCwowWgDs1CKEETH5aonCEu2YJFbiO9pcM11vuzdNz38QTo4wLnnUThga/Z6xsFFYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIBkFAw0zAKxUGiuvRdmEpQS7cmt6tCOTwp9ij6F7DYjr2XceM
	KWx94jSVV1vN7UoF56NNBIvXgNZPbSLdsV3DizZRUNjeIWk/fhFvfnhGrPz8cldTHVzoVEpcrI/
	H2meK+QxomVtEK9FR+w0lSsYdjRaCkFk=
X-Gm-Gg: ASbGncttTrZx1wnoE2CJMlc4GOZn5dBzdVvQAExWiD+gRV05PbSbEbbOSt54OVNPUR9
	pM/8SbrNbRU2QnZXP3nbonl5FEu+vsLnHfx801aGYih20GonT0CHO0QABfnwP5seJyaWGr42PWa
	jMAaXlJyhYrdgqkj4dTRPctUj+R7fHhvblvDkxDKK9FonyCdYAZmxugg==
X-Google-Smtp-Source: AGHT+IHnDuLvLfejqboRjI3Nimbpls7hnKoDbyNe7W42pgoxHL6wBP7zDxd/XlXHmJNNt9Ix9KPSr9YZn5dvzzlvalc=
X-Received: by 2002:a05:690c:6485:b0:712:c295:d023 with SMTP id
 00721157ae682-7166a18c8e1mr83477087b3.6.1751897731678; Mon, 07 Jul 2025
 07:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-2-abdelrahmanfekry375@gmail.com> <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
In-Reply-To: <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 7 Jul 2025 17:15:20 +0300
X-Gm-Features: Ac12FXzR3h8Pxd-1k676hKF77K5klKtgO3uH2HtIeCoP5FJR4Aai-4e9y3wGygk
Message-ID: <CAGn2d8PjT+gE2EH0+YT_-ivfcXBuBM1OxTLEAvy+sFctpc66Aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: return early on
 hmm_bo_device_init() failure
To: Hans de Goede <hansg@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans.
On Mon, Jul 7, 2025 at 5:12=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi Abdelrahman,
>
> On 7-Jul-25 16:09, Abdelrahman Fekry wrote:
> > hmm_init() would continue execution even if hmm_bo_device_init() failed=
,
> > potentially leading to bad behaviour when calling hmm_alloc().
> >
> > - returns the error immediately if hmm_bo_device_init() fails.
> >
> > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/stag=
ing/media/atomisp/pci/hmm/hmm.c
> > index f998b57f90c4..c2ee9d2ec0d5 100644
> > --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > @@ -36,6 +36,7 @@ int hmm_init(void)
> >                                ISP_VM_START, ISP_VM_SIZE);
> >       if (ret)
> >               dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
> > +             return ret;
>
> You need to add { } here otherwise the "return ret;" will
> always get executed since it is not part of the code block
> guarded by the if (despite the indentation).
>
Yes , sorry for this dumb mistake. I will send v2.

> Regards,
>
> Hans
>
>
>
> >
> >       hmm_initialized =3D true;
> >
> > @@ -48,7 +49,7 @@ int hmm_init(void)
> >        */
> >       dummy_ptr =3D hmm_alloc(1);
> >
> > -     return ret;
> > +     return 0;
> >  }
> >
> >  void hmm_cleanup(void)
>
