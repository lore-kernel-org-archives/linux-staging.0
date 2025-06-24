Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6802E2F0D;
	Tue, 24 Jun 2025 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750783887; cv=none; b=hNOEvh0C7WTYDxNQxEbuAA+Ikm7qS/5c+RAsof7o76wK98JtzIlZIdzg/awWw0A4er8mVDqtbKhooQSHmz2n6WsGDVksDD8m0S7U8R3fQBPDRyVFJUy0y5WpUy3XtYqL4NRJrRnqltFXtqMFb0AWSk8f/E6LuGvxx9SOfM3Fnak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750783887; c=relaxed/simple;
	bh=AiSxuv5HxZMNtApOoLbB35JJtKGcdtw9e0HZIZ/TyZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAbkYjn6CM8TZsKTwHp5NL6iFZok6dHiBsy/sKZLmWXCyEinWGxg0zryekbv+KeZqaR5zyTR62x4Fl+zwMwqPHvgzLrZ9Sy7DrEdPVIy7jnTOB38IgSRSRm4Lr8tFozElL/INb6c6qoANMYFYeWek94NXrL3vw7lSCGmA9D1+AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awlehetP; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awlehetP"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e82492d2b38so448729276.1;
        Tue, 24 Jun 2025 09:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750783884; x=1751388684; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aNMblES8+W9zguUJXcCu5sB/4LcjKP0kbkG8Rw2PGQ=;
        b=awlehetPx0KTLi7YDfysx5Gxak+uiLe2+vTt3PRd8eG2bMvf1FdzHeXvMuz8Bv600c
         CgYOHE6LFrF0kGwEnfM/nFBeTKxF83yAzAfnSHrBwrEb5CTyBy6NeJEEBqY8q6AznJ7A
         jGxvY2/hcwntTl9+g7q9Q4vfbhEbqhhSqoJIGp+ADyyyWrv8u9DY28texbpqIugTB36T
         8rtUj08z3DzYyIVmqy1suWAb/0cKLlb/8qQ5n9EvLbfMg4mxml5+S0L+fwf+ULCXwwkT
         xvjw2Jw4WkpeqcxMk+iSfsXKU8UUsShBIwWXcR7UYm2yNT1TuJYswCaqjDTDXkUgOIov
         hPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783884; x=1751388684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aNMblES8+W9zguUJXcCu5sB/4LcjKP0kbkG8Rw2PGQ=;
        b=G9EgWhwgqRlbYV00EjNS5yqacXpcRaYfNF5gLjHmnsRv61O9zQdTU2uT9HnncK+8gY
         Vhz1PXIVEBjoRUjnbFvqHk5JyQwX83/uhKYYrdIV+zQXkmvt95z9sGIwfcmSLX7q1bCH
         iwUBJT7QXI0x5HfZ5ucT27fOQcdNaHJy2dwQlJf9WGtL6bdTZb8EDwnQIoKe3zHKazSx
         JT8x4Abo/UXo2TlGkIpX5JOuVp55yJ9w+xCy/8MZuiXiM/NBoUdKtxdF4kHMZVKQV9bK
         dGnN8iBSR+xwRxDlFOs8kai1fXKcCMFQ6UKm5+r2feoCBat5HKKUb8wv3ojrrFKQK+rz
         23FA==
X-Forwarded-Encrypted: i=1; AJvYcCU5A4na6wKSi1y2YjRfg4zF19wmayypNxChXjbkVyAuiEp4DGSQEEMtaEF0GxVCzWdbgzR8uich+Ryc3lD/Dw==@lists.linux.dev, AJvYcCXhtzEl2tFWnESDkmshCLVQ814cS94uF5PE7rF8SFDEKF3dUWlJnR9un9Poz2pHDDFuTHn0jVzMu1ANAzrtZ5bYl/yMlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5phn/MSDwhyt3enhPoxkBBYJ6v8NRjC0c6WjJCSLknPqIt27H
	AXkpYitmnJ87srM6L/ob8kApwWCt4NxsFdjEOdlnWDRC2PsGMCVOO+/ad7C/cLlzGptUAdeAQMr
	AujxSG41DN/MYhiC/1xwDI4APxWS3R9g=
X-Gm-Gg: ASbGncvHV4QEj70DWGfor4SNdUeM0jx7RARQ9dTtY5r8gRo/7y58ke/JqGHh+dnRapV
	H8THAvQrWXO/LjbQ2DQ9yjYoimlm2D4TYLCjpt2XIGANclc9ZewcT8Re/MNY1iSZXR6DmcQVaG0
	/gUT41rGHyOlHnEQvHLO/FkJDWVTlUGdhtONfttFUH1jok
X-Google-Smtp-Source: AGHT+IFvySyYmmprnpyVyhwpIu4WBOO54IkG3q4Wj4yrofJybtMktjxvro9rxh6SNN1fBpdkveNbK2qrkNRqB/JNu0o=
X-Received: by 2002:a05:690c:9418:10b0:713:fff3:62ad with SMTP id
 00721157ae682-713fff363abmr9550197b3.8.1750783884004; Tue, 24 Jun 2025
 09:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com> <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
In-Reply-To: <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 24 Jun 2025 19:51:10 +0300
X-Gm-Features: Ac12FXxABhb6t8CKkGLO-NpOFkS7LjmlrS7vwFTKrrjOeRsEPArjRkBlf_f3hNI
Message-ID: <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 7:31=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> >  int hmm_init(void)
> >  {
> >       int ret;
> > @@ -130,14 +48,6 @@ int hmm_init(void)
> >        */
> >       dummy_ptr =3D hmm_alloc(1);
> >
> > -     if (!ret) {
> > -             ret =3D sysfs_create_group(&atomisp_dev->kobj,
> > -                                      atomisp_attribute_group);
> > -             if (ret)
> > -                     dev_err(atomisp_dev,
> > -                             "%s Failed to create sysfs\n", __func__);
> > -     }
> > -
> >       return ret;
>
>
> It's really unclear how this "return ret;" is supposed to work.  Was
> that part of the sysfs_create_group()?
>
yes , but still it can be set by hmm_bo_device_init so even after removing
sysfs_create_group , ret value depends on another function.


> >  }
> >
> > @@ -145,7 +55,7 @@ void hmm_cleanup(void)
> >  {
> >       if (dummy_ptr =3D=3D mmgr_EXCEPTION)
> >               return;
> > -     sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
> > +
> >
>
> You've introduced two blank lines in a row here.  (checkpatch.pl -f
> will complain).
>
noted , will fix it , and send v3
> regards,
> dan carpenter
>
> >       /* free dummy memory first */
> >       hmm_free(dummy_ptr);
> > --
> > 2.25.1
> >
