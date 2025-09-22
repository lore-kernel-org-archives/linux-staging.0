Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE19B19E97A
	for <linux-staging@lists.linux.dev>; Mon, 22 Sep 2025 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758517124; cv=none; b=pJx4EMTsilcUHWdfHEhaSUwzZUCh0TdUe+rbCSTgMQyl+yncajiZx4geBUnjKwUu1g09k1Woi+fQGCTbAXpA9l5oJnf/MzObZt972PsnDfe6kVTN2LT68vamQJo6hS+IJmMYr/x278erCCGjcAf06EqcJvw7kv8wFLqRNjRx3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758517124; c=relaxed/simple;
	bh=gkSr/k2qBC7NL/bwKC6Jo0OE761W8V3Gi8qHsc2TEio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5MAeEFgehVwHWkgrXgT7AC73ux140fV2AKRMTeHeu0ERM6eNT3+jjytS/+UugPcgUqztPZdjsiAuI/sHAyTMiNnw8zWrJXtORrJ9z4BRqjRcmTlutJnt1/dSwBRQl0fLu6Tn48+SbrF9YCP12AFoTzTNb7TldFnzPVwrZKJgug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaenhlaG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaenhlaG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45e03730f83so15471415e9.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Sep 2025 21:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758517121; x=1759121921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAvsa2EzVq4+dzbR4C+qjrwq8bLpvzRB2OJRPqfQHYU=;
        b=YaenhlaGGGSBQlo6rZotKoNO+BDxmqfYWMWG7Joez2cS0wtkhKjcoBCh5dL7ncyvFB
         y4L9cba0m9pa4jCVn1vw25b4eJpFgrsSR6ACYEZobzKgrECHQA7v2gVC91wtcyM5aG+e
         vll+g2eccs0Wh0/+nrkLLILpDYPIPd9pyHA60BUAocDBK+/Gk7pnxcwd0bx3kTu9BIYc
         luncAlfj3coFeV43BpkQBwQwYEauYGbocfxfHbyfCrXUDi7qCH7mpY8jM8mE5k5Pu9IF
         qvOvWtA+/Z/nRyMSVQBpjg8WhT++7NTR2E39zd9dIaYiHRBCXPVq6aYqJAS0lYZjeSI6
         3dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758517121; x=1759121921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAvsa2EzVq4+dzbR4C+qjrwq8bLpvzRB2OJRPqfQHYU=;
        b=G9jbHbowM4I238k2xZ0cA+3/79gcGiZo4+KlrkNk6FSbJyDDp5cwVPLTKNh+OiL1cY
         tSDxjZAPvKTuWkqTPg0bXuA5tttE4s9tl5ZNMHHS8fEiFCvNj0pH5ZWqPLmsaQvGgHN3
         Sl7Cf+axWo3gvAZj3gtQcijiierQop3JlaDhht7OFbHs/p39yxDhDFTNcgnYyf28hbJ9
         jLWdT2OG25r3XeovMn2nog/VC8HHCZ396hmVJkcAEPofrIzBpQKakOR+Z2cKLHkAw5nf
         DVJuSh4Crs9pJwJ6XNDBwMCubKTEMux+sY8kkBLnQa3MaDtaNX8eEIgxWlco/3FyQTQ2
         AGUg==
X-Forwarded-Encrypted: i=1; AJvYcCXx39+PlD0HtWcUf9IEjJ/iocOWlXBBgV/uGcmv6jqvfYdN4FRfswdiYOpFmP2RaNNoMnuPobH0+Dqa3JkJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwvI9Xa0oqoWTAxUUNjC43alYCbPlEc8s8iyBSZpqpnz2eK/+5V
	Ve/Gj2+/QrDskp7OUBmkYvottUtsI4u3FPcXKMXsmUOVpnoLu/iTF6HUzIKn/qSAHGnmjf3O1+D
	qxm16GqcjsQ/fwuJSWgfgXY4C+J+VRF4=
X-Gm-Gg: ASbGncu180hjUdFefwP1ww8FVcswOcR3nmNL9SFCVsZG7RoI/bGMlvStIgMgaf/04l1
	UTF4GSiYnMsa8688hAicSoQD7WllGjatAmoYGaGbNmkaVfycWYScYbgUthV4PjLzlnriEA5i9mV
	kCY/wBED1SwczOlQYoSWfWtpOZU3HE1SU6xT2ULse3WUHKrnLh7Pf0NGp7oTM7bk+HVuzCbYitw
	x7OaAu3
X-Google-Smtp-Source: AGHT+IEqpf+fahmlNxfcBD+gdZTresTyKx8zIRWfM243PFo4NiJuTkwOy4u6cIIp5K/YP1nuLHVN24tHIMe3nvhD4kQ=
X-Received: by 2002:a05:600c:1f90:b0:45d:d609:1199 with SMTP id
 5b1f17b1804b1-467f06887b5mr105306365e9.30.1758517120934; Sun, 21 Sep 2025
 21:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-19-clamor95@gmail.com>
 <2331830.3VsfAaAtOV@senjougahara>
In-Reply-To: <2331830.3VsfAaAtOV@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 22 Sep 2025 07:58:28 +0300
X-Gm-Features: AS18NWAi5iIH6gMmyrHteYV1m4FMyO6_CjTfEQzBzZCFo1CBmqpAnZAs7VssVwE
Message-ID: <CAPVz0n2AjRPMuZbLAnc=9TriPHDLOFok+Qz3zoSpQSKX1R=cqg@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:54 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Increase maximum VI clock frequency to 450MHz to allow correct work wit=
h
> > high resolution camera sensors.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index e0da496bb50f..3c5bafebfcd8 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -590,7 +590,7 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> >       .ops =3D &tegra20_vi_ops,
> >       .hw_revision =3D 1,
> >       .vi_max_channels =3D 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
> > -     .vi_max_clk_hz =3D 150000000,
> > +     .vi_max_clk_hz =3D 450000000,
> >       .has_h_v_flip =3D true,
> >  };
> >
> >
>
> Where does the 450MHz come from? Instead of hardcoding this value for eac=
h SoC, could we just clk_set_rate(ULONG_MAX) like e.g. the vic driver does,=
 or does that get a too high rate?
>

This values comes from downstream 3.1 tegra30 sources and setting it
higher breaks VI, I have tried. If it is set lower (150MHz as it was)
it breaks VI for cameras with resolution higher then 2MP

>
