Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E84C1A239E;
	Thu,  3 Apr 2025 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664270; cv=none; b=FTw1uUNsw1cFzFnFykXTLZLGOnqLlq6Rgb9S0Ka/SiXMMnZ+hsq3UFdRDpcNhBmRDTNs7GSeqYv0ZOWQIxIHVZwkdvaT81C5cvn3jywxZoFAWFOLgtoX22mcUJxi9YOHHwhWITFp9/GQYTThdmLNk6k3Vkdlt2bX6hfkNUYLnZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664270; c=relaxed/simple;
	bh=nNEojZgXwHTA6iMCyGgj9QMJPGIDSyQ4Bji0m/IGoIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3DoXo8CESf2/ooQx+XS1leYXNICXm0i2q6zLC2ZYz2YEn8cZbje1JDM6H+pbP7LXiXvOKjwLGNj/QaaqkGx3d7q3akexb0zfKQCGgLRtxSowH+PyKLzLyUCw4Ssu6IO663pt9jyB40j/72Fb3bG2dqS+LDS3TlDkGIBHjEZbBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP8TMTAV; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP8TMTAV"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523dc366e42so303858e0c.2;
        Thu, 03 Apr 2025 00:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743664268; x=1744269068; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaV5irKzB8BTG4VmEVwkCDqvoExYXKgjyGLGtsXXpO8=;
        b=UP8TMTAVswbom7SQ6upTxwRHr/Snm1zXQkbJc8QKbct+qKSWQF1MlyetojshOCMnLZ
         ir4fG6rUWN+IZ2eTxlTlhfdR6T7k9rWDFMavc+ZEMdJi+WVYyIW1geNbKkDTu3WxmBkp
         pfDwQ/JM15kzZlt+05ucFPBr09PxbKHTmMtzpXIrKA3mQ3eEcV+sUIHPCYV5hKTeo2RV
         OqwQp/Vk5Dhiz5FscyzdKiIJES7kRpj0cNkS/FwUZAIv/cVf1CFw2hAJK8+nVhKLnrTb
         tpSXaHJhtJC55IdMpnAo5aDVPZSeEJ3OHV4ROwO7rSCzNEYOY8xlwhCU5wQS5xUQgxNW
         F4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664268; x=1744269068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaV5irKzB8BTG4VmEVwkCDqvoExYXKgjyGLGtsXXpO8=;
        b=rzKc5Bb907GpmZaooE6qOuhpUFX51khvmv8z7EpXhsVzvKsWL6mOGkxiDF9+uTrKdY
         GbozLVbUm61mcErMiIIWBnG0FU3kLueS5AmRpVedH1xrR8LD92xPRJGauRis/QfjAzyR
         A3nMdehSvglAlTBwGLL51uSybuFWhYgNeax2H9jvKGHDCai5DjMKfK+zSdsOLyd2kKyL
         tgi8WzgUaGo/LsLZnipWQpcyWoBxyuWBxc3AWaJpAxRHgcEukmPF/M4KOkqGaBLmM/0H
         9EYQSHvtTyZ14ovX99Q2TMXQS+wHZBGKLRz/wYN3+4V6WyjpkX4oyoliNbYGLSclcOCj
         4c3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhJ9BnItNk0ckBXarpCdoIwRzTvP3eUnZ7hpg2amxetqEs87RGwxl1X+QRPyOhSzxwiCXsmUoAq/Rhd8ew@lists.linux.dev
X-Gm-Message-State: AOJu0YwKn4epYGQny3tcs/1lUAfO9GU7Au7KPEd6YdeBAbT53S31XFip
	B9lNXhEhOq1m5pN+49EnsZdlhusK6K2q4Ll47a1JXfslV6eXIKPTaoJYGH9SO7yoffeqKVUQw4Z
	l/w/uYpEus3gx4BuVY/tSWUYf2mw=
X-Gm-Gg: ASbGncs3mbEO1t2uCcwoyXc8aw9xzigrxTwDbsABUsvWunDQKjSwDCIjRTliCFy56bn
	9fauIWmVARt0tMrRSZ8Vys+5mv2iqlRUzrM3fcf+woOCCRgetjE7of5TQDvMlcs6r69FEorn3jo
	1+hJB4bdyBvbWe50YoL7s/pHn47wcJ
X-Google-Smtp-Source: AGHT+IEFtq3RywPNdwWjkvGe9eVUznDe+xyDkg1iSC1HqRGKAOJRt2mkytbKTwyDbxJvXUWhOqWMKxHqw+X8CqnNESg=
X-Received: by 2002:a05:6122:2502:b0:523:a88b:9bfd with SMTP id
 71dfb90a1353d-5274cf62070mr3679907e0c.7.1743664267846; Thu, 03 Apr 2025
 00:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743635480.git.abrahamadekunle50@gmail.com>
 <9ce32e62672197f63448e98a41902fdf6b40a79e.1743635480.git.abrahamadekunle50@gmail.com>
 <CAHp75VcT5OBxo2jMTYK6Vw8MB+h+jBWT42GVtS27YTkq-JZoLA@mail.gmail.com>
In-Reply-To: <CAHp75VcT5OBxo2jMTYK6Vw8MB+h+jBWT42GVtS27YTkq-JZoLA@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Thu, 3 Apr 2025 08:10:59 +0100
X-Gm-Features: AQ5f1JrdIw9HQ4TSfs7WivtPCCN0nofQeoT22ynNGA9vi8Iq5s2F2H8gzyFXZn8
Message-ID: <CADYq+fY2mOHortr_K+9OwXRP3n6TRZB-ZUu9RytXnWObNDSM1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: Remove NULL test on an already tested value
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 6:19=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 3, 2025 at 2:30=E2=80=AFAM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
>
> >  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
> >  drivers/staging/media/av7110/sp8870.c                     | 2 +-
>
> Please, split this on per driver basis, as they have different
> maintainers and trees to go through.

Thank you for your review.
I will do that.
>
> ...
>
> > --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> > @@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device =
*dev,
> >          * if it founds something different than string, letting it
> >          * to fall back to the old code.
> >          */
> > -       if (cur && cur->type !=3D ACPI_TYPE_STRING) {
> > +       if (cur->type !=3D ACPI_TYPE_STRING) {
> >                 dev_info(dev, "found non-string _DSM entry for '%s'\n",=
 var);
> >                 ACPI_FREE(obj);
> >                 return -EINVAL;
>
> This change is good.
>
> ...
>
> > diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/me=
dia/av7110/sp8870.c
> > index 0c813860f5b2..8c5fa5ed5340 100644
> > --- a/drivers/staging/media/av7110/sp8870.c
> > +++ b/drivers/staging/media/av7110/sp8870.c
> > @@ -508,7 +508,7 @@ static int sp8870_set_frontend(struct dvb_frontend =
*fe)
> >         }
> >
> >         if (debug) {
> > -               if (valid) {
> > +               {
> >                         if (trials > 1) {
> >                                 pr_info("%s(): firmware lockup!!!\n", _=
_func__);
> >                                 pr_info("%s(): recovered after %i trial=
(s))\n",  __func__, trials - 1);
>
> But this is not fully done. Why do we need to keep {}? Just shift left
> the code and remove those {} altogether.

Okay I will effect the change.
Thanks

Adekunle
