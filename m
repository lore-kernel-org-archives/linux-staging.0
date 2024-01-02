Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330AA36F
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxZU1ppB"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-680b1335af6so7332376d6.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154968; x=1704759768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW52z5r4n+LGvICG8nTn+MMpQ4/ivy77JIAEZwyx8RM=;
        b=TxZU1ppBIOfYg4w7YSCH5saznV74pJiJo+PpyVCjN+Gs8eZhepnD8pyF0D8CU7vvCF
         wuppLWUIiQ2nlDdb1u2qFxmmRD295GTagrMXfmi2SSmBCFTbzIBvw31TT+0GJNlsdKCP
         7r73NEhIf7u3TihKYgAjvrHOYQr4bEa04kSLBeuB0tsdpmW6EII7RrciiTDPh8KOuF3w
         T/PXjDLeVYOI85gGcvmXzI7wNXkLBpB7d2oG8jsrekZ4dk5dvcmIEJ9qTIgtpVlMjRSi
         vfq2jwZqOr/T6ootzlvMvFXjmeT9xc7XDNBPbVduIbJoVxSQjoy81DVOEydPvKcgPend
         7WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154968; x=1704759768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW52z5r4n+LGvICG8nTn+MMpQ4/ivy77JIAEZwyx8RM=;
        b=W4znzh6w3MEWfCizew8LnR81j8yRVXHpmxFKG0M9bDOqLrUyYpT6nC+nyAWz0v5LFN
         XEdjXT8dusEChwjuMV9ebtZFtI+m/oUg2wgb2LZ0DnZFigYbDN5lLmvDuYdlNEL8EOjY
         xPaZsJ+0zB2NMoefhlLvcdsLFMwDIsVWz1GBGTtr0c+SHa/yRi9IrERP3d4742hIujEW
         gc0yX4eIoT/nPhOYIa7VuU3uM67ur5x02uAs7yDD7akAWvUKA3RI/jaCf5E8Jx/VmjZx
         7J2yP29NS0676Pf8OM5MGgPxDfnLs5HzrTK8ePuinb5PzR2OKfkbcoHfcDrm9g+xiBYP
         nSAw==
X-Gm-Message-State: AOJu0YzT2GbNOYXfxD4cj8WUuc6kp4DjX5/2xdYCNT6hoQi0w71bf5Of
	WDnAGFnSpgIx4sQrwTyHnDSVF+Xii6yxsWil7u0=
X-Google-Smtp-Source: AGHT+IHZLfgCExJorugA2fJndb8mlKl1+np2mwUWGPpV92JEdmDVbXL3egn1ByENf1kxiLnhkDouGsqcLSoZUqCyK/Q=
X-Received: by 2002:a05:6214:258a:b0:67a:d843:e0d8 with SMTP id
 fq10-20020a056214258a00b0067ad843e0d8mr23674169qvb.18.1704154968115; Mon, 01
 Jan 2024 16:22:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-7-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:22:12 +0200
Message-ID: <CAHp75Vf6tpsJFO1Ds=SEUkuDi8gf2sk04oZTjCYgvOtt4JdG7g@mail.gmail.com>
Subject: Re: [PATCH 06/15] media: atomisp: Call pcim_enable_device() and
 pcim_iomap_regions() later
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> ATM the atomisp firmware is not available in linux-firmware,
> so most users will not have it installed.
>
> Move pcim_enable_device() and pcim_iomap_regions() down in
> atomisp_pci_probe() so that they are never called when the firmware
> is not there.
>
> This is a preparation patch for making the atomisp driver handle
> missing firmware better.

...

> -atomisp_dev_alloc_fail:
> -       pcim_iounmap_regions(pdev, BIT(ATOM_ISP_PCI_BAR));
> -
> -ioremap_fail:
>         return err;

Before this patch, can you drop these two labels as one is not doing
anything useful and the other diminishes the idea behind "m" (for
managed)?

--=20
With Best Regards,
Andy Shevchenko
