Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4912C499
	for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274525; cv=none; b=MMJNISFvN1jaHhflLJjudBylawu+7DmJjl3DXOTwMIO9JzZ3gyFa5qe3d/b/gLwco5AWiBZpFGEMa3HCCDmYVJQu7sXROkRYeILMXtQdUUrpHdAoxO79rLPJOACfiOx7orXIWS/R9QjcfROZjGPalLrkpjwiFNg1ZW7B4FadGyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274525; c=relaxed/simple;
	bh=y+g0z3zxFZxLp0z5QxoMl9zaVkT4hRiFtrf0ogeyKh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bbE0WKHTl3eb/IegSN3Rg+0kfItYcnAgpTTeo/e5Frs4XxVLlLcD90LgFLRkoXo54Gz1kzy/7HZbKai5c7YiAMZ0CeOGMrf8/kTTm+Otq0xmUFX/63aaO8Gebv7GRaW+RC/3p69yYS5LvX59eZKk2LcMvELG/GB1ADrFlOScHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0tnNtop; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0tnNtop"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5176f217b7bso7639628e87.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713274522; x=1713879322; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK/T7s8p/J0tu3z/h2XGg5wnqrBObLuxU45NTGwIAWI=;
        b=Q0tnNtopAn+/dqIXbPBbBiOYxG+RU3tigeKT8Kyl7XuF1z52yg/40s48vy5xzhfAbO
         2aMvIm9GoHHbamlLO2tEbdhnD0+1doagEQTu2QfKt4JldQtFla9iDQmYWjKxvlGhnb9Y
         AokhxI0+lRYEEZ8GOhp4qD6CQTWTidew+XbgUsSOLp9zGriz9dV++Qz28toLvJWU+GKG
         fEzBvxzBURn83v+2y0oO6FsBZGgJBfkQAxlafNUMggsL2nPVDYUDJia6LXhvzxtEXfBF
         rcsm7gh7gBDClrbZ4pskbxQ+k7dz9ISGX6Z8DlOr3jV1MD2UGIWi7ct78cYnntqylqlr
         b0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713274522; x=1713879322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iK/T7s8p/J0tu3z/h2XGg5wnqrBObLuxU45NTGwIAWI=;
        b=J6aYFo3CPR+4SiupmXit7UrHvwMYrlH9ROZ7FClv3UFJ9grIABBbXWxfUcMdmEu4+O
         wHrF0TeUpU2bD8L2Nh7v3RiMs+zvWcIt06YHtNfUeB2HdW9olLXFvyH1O0r0JWu16M1L
         fO97I/0ufl31O8iMK1Orz0W0fhEdBlXnIYFGO/znqF/tUTBxG2Co6vDvSFz7/Chaccjt
         LRm4RbWs2EQO/JtxE3ObCnEM+KZWDFBV06wAN4eyiexewxii5F0znXxd2AOpZJdbNscs
         CTw40dG7zHdQg6jXgGpzxkGLnvmVrhMgZGdTe933rxBl3cBJT7FpxO/GvBwilcVPrTsn
         F86A==
X-Forwarded-Encrypted: i=1; AJvYcCVWyJJWJzXhKcRpGSqkX+tGljCIGmaf0d1gZl5KwEFstS5WodkL4B9+TDa/WD46a75JSKiNKL5cnh3PgVc+WDpH36aMDN93ARpI0f9n7w==
X-Gm-Message-State: AOJu0YyaykzcO8/uAnuXPQjf/EZx+jk33HhngmX27q5CVhOMdSSbM4B2
	zq4sKhTIQ2UzmXzmnmKmPF4RlUE/DAkJD2kf3bdRxEyOWwG2qxB8wrwgfCKUXwUU+JVe6P7Q7Vy
	pSuTM/x+vEewZqX1frSqfnhhZuwQ=
X-Google-Smtp-Source: AGHT+IFLiUPfBwTtuyUr7Nvw85J0Jz0AtFa2fGp3hfYUPqnHfo0TiAlwEmXX1j5BN2GT9YFe4fi97wxIyBC9mrq60+8=
X-Received: by 2002:a05:6512:48c8:b0:515:acda:77f0 with SMTP id
 er8-20020a05651248c800b00515acda77f0mr10269158lfb.29.1713274522065; Tue, 16
 Apr 2024 06:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415120220.219480-1-hdegoede@redhat.com> <20240415120220.219480-12-hdegoede@redhat.com>
 <Zh08SP60QytSz3aQ@smile.fi.intel.com> <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com>
In-Reply-To: <294058a6-72dd-4973-95ee-eaed0c908131@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Apr 2024 16:34:45 +0300
Message-ID: <CAHp75Ve2tyqYM0ChjW=ETjJ27xNmtJ3dDK-2pneanuQEwyFRxg@mail.gmail.com>
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator (TPG) support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 12:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 4/15/24 4:40 PM, Andy Shevchenko wrote:
> > On Mon, Apr 15, 2024 at 02:02:08PM +0200, Hans de Goede wrote:

...

> >>              unsigned int hblank_cycles =3D 100,
> >>              vblank_lines =3D 6,
> >>              width,
> >
> > Urgh... These comma operators probably is subject to replace with separ=
ate
> > definitions or being grouped on a single line (as it suppose to be in t=
his
> > case).
>
> That indeed is ugly, but fixing this is out of scope for this patch,
> so I've added an extra patch to the set to address this:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=
=3Dmedia-atomisp&id=3D48d93af9d9b0fd40a21a656cb8cd8e25700bfed5

WFM, thanks!

Btw (yes, I see you tagged that already, so just FYI then)
(1 + (stream->config.pixels_per_clock =3D=3D 2));
is an interesting way of using

 (stream->config.pixels_per_clock =3D=3D 2) ? 2 : 1);

which likely can produce slightly better code (due to use of constant
2 twice), although it is a pure speculation by me.

--=20
With Best Regards,
Andy Shevchenko
