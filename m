Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E77243367
	for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 05:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755668391; cv=none; b=sop35sV0YG8PrGLuK2lgnIl23q9lneIDjqKf1k0na+ZF+NqCs42Mi2KccylFCLGCIAQFDBvJFScTb/Oydz14NI8LOiC0uJpVkyH0yML9tM2CFq0eRA1zcwArSjXT27XwOm93ODRAIXHduKq8OT/zKxr9sgkmefsHr9e9aFt+va4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755668391; c=relaxed/simple;
	bh=N7yVpy7/MX023VQgG6ZBBN+wGnFtCu8u02qmP0x1N7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uknse6vRHQKUmQpSLBl/+V8SwFcQx3TYDIZGeVDEFWCnjNwe5TCas3cpAfLC2fcjFwHnTZfbCwtEUqCPVicrV/K7cryFbn5OxYELYtQ1SrbR7RpyQyUwGNpfrNXT99ESCHVXIM/pls9etLUPsqTM4CzLe2otzun5cPyVAyPmVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKzc0e8L; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKzc0e8L"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso332911f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 22:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755668388; x=1756273188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccknhVRPHaFFv1IUxfvlWqkKeJThBY2h9VPsCt/mOXA=;
        b=lKzc0e8LTmbjSouboZcgiE+6OnEDZSvL2wjnAQhI1Dl7hOmKxj5/fijgYatJ3fBwzc
         RDLXL5Kd1uKlYofInJkVNBSml6DCDt345v/xTXqqME7YF3bU23/p+GLX6cFxliyS5FBm
         Hp/9v++sqLe5M3fcXkLJeiAUac0B2Ty1EzjLM0yiKUbXXaeYxZK5hDUCyw7XzIsyrUvW
         RwkvqEaDJmqRpmti6+a9ySYeQ7bqy/eg3K+fkeuTGky0ywn0sdEGkivFLbSZtbwzxyyL
         XiPzwBEfV01njmGqjjsNsf1/G/GxdPU4hRLwQ2V21ruCqS/fq3el/NROSpBn04LwRUOI
         2jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755668388; x=1756273188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccknhVRPHaFFv1IUxfvlWqkKeJThBY2h9VPsCt/mOXA=;
        b=aL2pQsnA2fcEmEuOAL4qPaKm17W9Zu7Ef/KIfxkaqao5sNi4dk5IrIMK4bqhRZk4lO
         pgvboMPNyImad/hitLwHEdaZjyOLyeD6V4R87yf6vZSur/LB0wgQiOI3Gw1613aydKVw
         VMFsp49I5QsfYD5sa2AE9iaA41pDnYCwPIf20+fxlpC6qw0OM66tC+ZyqZCruDFM6p14
         FoC34P8t3QyKiAgG5mSY/QAHgXWmiVJioWg7Mzt168ueCpD+nwakRMCMaHWyrpf4vEsk
         XJ+Qr0VYYHqJtoqDFldtAYkSNO9DUfpDpsa8MmkulR/ZardAzOTUVdPRvNl0RkKy80Z3
         5TDA==
X-Forwarded-Encrypted: i=1; AJvYcCUYBQ8QgQg2DDukRxLLHTPADfZHfnSG+L8VxqKcjN09Gyr/YtgP0nggBOjOeM5ijZQ5d+ggDzx1uHGChIn6@lists.linux.dev
X-Gm-Message-State: AOJu0YwU6EOhIZNj6kr2gr9w0IeX3SycUNRpl44J3h2BHCehKk9WJ4PO
	TdlAV19O6gaccdTjwFEs7ugAPqeAOUvlVZAbaPcb8qWLcYt95plKP6FVCArjaOsqLMCxkQxtlbS
	heQocBr4cTFPKSAlbjFMOXJ3keMZ1ej8=
X-Gm-Gg: ASbGncuaHuzJXDJIGOSn2eNQ1e+6dEaUu7rkuUCJUHaYxR7zwOj+ORfL0AulRsEzaF4
	aS45DhfRGJ2HROK4GZ0wAK5HW81fWBtXC1mtY0TuwYPhKh5P0xACYN7gdeUN204dLLKtvvy+/D9
	t2iZofDCDSm80hYhmKzPtVrUBuyIrrih0E6H5YSzvMPKEb4PwC883QA3w6tLW9h24M1Grk+r1N7
	vcALBa7
X-Google-Smtp-Source: AGHT+IHwCiiCNR7psLFhYIIVfqt8gU87v84Q5qmwWq0pKLvUVOdRq92tkYNwCIUAaI04l/H3wpVbXTn8JTp3UCxiUZw=
X-Received: by 2002:adf:8b05:0:b0:3c3:ae31:717e with SMTP id
 ffacd0b85a97d-3c3ae317631mr152960f8f.4.1755668387612; Tue, 19 Aug 2025
 22:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-18-clamor95@gmail.com>
 <20250819203007.GA1266319-robh@kernel.org>
In-Reply-To: <20250819203007.GA1266319-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 Aug 2025 08:39:36 +0300
X-Gm-Features: Ac12FXzWZ_Nd9h62ySrEyXbVbvxJKlW0WeyZsHY-B28WzAACkjTJONuBotQYEIA
Message-ID: <CAPVz0n2tsE3FHAz7sbdwkWaRQtmXJ5wNg8vvb2B9k8iYuyvUQQ@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org, 
	linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:3=
0 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:16:29PM +0300, Svyatoslav Ryhel wrote:
> > Document CSI hw block found in Tegra20 and Tegra30 SoC.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
> >  1 file changed, 63 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml
> > index fa07a40d1004..a5669447a33b 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > @@ -16,30 +16,78 @@ properties:
> >
> >    compatible:
> >      enum:
> > +      - nvidia,tegra20-csi
> > +      - nvidia,tegra30-csi
> >        - nvidia,tegra210-csi
> >
> >    reg:
> >      maxItems: 1
> >
> > -  clocks:
> > -    items:
> > -      - description: module clock
> > -      - description: A/B lanes clock
> > -      - description: C/D lanes clock
> > -      - description: E lane clock
> > -      - description: test pattern generator clock
> > -
> > -  clock-names:
> > -    items:
> > -      - const: csi
> > -      - const: cilab
> > -      - const: cilcd
> > -      - const: cile
> > -      - const: csi_tpg
> > +  clocks: true
> > +  clock-names: true
> >
> >    power-domains:
> >      maxItems: 1
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra20-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra30-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +            - description: PAD A clock
> > +            - description: PAD B clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +            - const: csia_pad
> > +            - const: csib_pad
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra210-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +            - description: A/B lanes clock
> > +            - description: C/D lanes clock
> > +            - description: E lane clock
> > +            - description: test pattern generator clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +            - const: cilab
> > +            - const: cilcd
> > +            - const: cile
> > +            - const: csi_tpg
> > +
>
> This is longer that what's the same. I think this should be a separate
> schema doc.
>

CSI hw block configuration is similar between generations, the main
difference is the amount of clocks routed. Not sure if it is worth it
to create duplicates with sole difference in number of clocks used.

> Rob
