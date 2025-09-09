Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F441FFC7B
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757394019; cv=none; b=oRximAkmE68qyDuzGeSXvxhCg1I0mXZSvi1QY9tKojt6R5yNcKjk9oWiRIa1luFgNeLaONWAzsDS7+sznSRzqi5JMzSz7W/8fA1X1lSXUZLJGlMlMEP4ofFpvbZgmG9dll5cXK7DYpyg9mU7z/C/HdeFtqMGkpHuflrE2Nx8m7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757394019; c=relaxed/simple;
	bh=3XIAo2qpHvA4WmYscSECteBG0QYxRHh63STV9gp+gFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8LRlXch2HnVVlNkGMURdi0wvNV9J86CI6EBnRIGGLQ/fdIgBZtYbS0aQSrc+I97EpqVR6/mrrLC1vftcp01MtFFSVGYrxkTMumysTMviU2TNHTTLhMCW9J6Xk7GlXOwyGNC67czJ+6scH2NviKVizuQdLveQJ6x7MJgwdp03oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFm35aol; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFm35aol"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e249a4d605so4096501f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 08 Sep 2025 22:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757394016; x=1757998816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvWoQumFNTmdVD16AHMfCOQayYv4kB4ZtuuQ9k6C1e0=;
        b=EFm35aolbNld2NzE7cgQgfC/ertMNgDzXE96OzieQCnXQ7lxRnmkD8GOGCJykWekhb
         GQhuYxYzTlSgeiSZnODzU8rYw/JPhFz/ozaDn928lCmLcTEHgJastrorgZ4V/A3utTry
         OhBpyjhQm6GPP3lDpKDj6jrPjkm7TaXImq63ULyYvBQ4xi25vZ60Vd5bgl046wCzC5uF
         4TUwXgLeOxlNGj18gqx3Myo59M7udvW3BsRc/WQNKqjQGWZtaaqNg68qCH2YIOO5FJ3f
         VLJDamyK6v1nifASXl3j1/TSaiesPDWWgkq9ma2ercDJMS9GehEJeo1H4psdtsYGOSt0
         4OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757394016; x=1757998816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvWoQumFNTmdVD16AHMfCOQayYv4kB4ZtuuQ9k6C1e0=;
        b=KPN0mss3uoOYsdK9jkqdzgJk0xacqNL7XZlML3g9jW2aYkoDXoJMjnr26MLrLssT/R
         HX5v+9F+D/gUzxa7xYuznj4eBOdLN7n574sLmxOrssSIW2mFZcxMV1oyog/Gb5b+0lGe
         oSzj4HJ63Fi4tmwJJdg6FsXbSCle9Ly6KcwH0L1i/8HbmbSpnRs0QeMlVg8uWZLf1uec
         jA3+2U/zayyWcAuKaZyOvSNCRgEteGANdVIXtowPg+sxoCjYfef+ZUJh+612QZ4bUtuJ
         xQW+dp+FQT+d3v8FbRt1KULT86pWC3etDNAc+rwcX3gLL/VL85FkX9VOWLQuX6eY+gC2
         N/CA==
X-Forwarded-Encrypted: i=1; AJvYcCXc+S3s3IcaWd/AMWSpgy9WOMAPJ9VszunvgZJegx0sIwME8FLNhNYu5E4wXTaYJPvo/mqwQlUGZ0bSzfOq@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd9/btUzxNzC4g+bF3iucpPp3LLd3cB5hNC/UozCe1R3kQXKfS
	XwVgNcnWSZ7XxMq4wWwNwg6e4w+JS1RK1R70a119fFSKSHg36bo98pImDgJkwq5brI8ux0qmq+d
	PiKHWjx2P/coF4a7z8Mu/Xmy2Q5AQ/5g=
X-Gm-Gg: ASbGncsC6veL2JFwPTEfzA6xYW/RSXhn2rtjRPnpnApjwaS7CTOC2nhcyU9q4n7bsLU
	ZvfNAmOJesGM3VHVoF9hibEIkFwwI7T4ZhMldpir8fReQmFG8MJF68JWFI0tT3iJiDzA9BUVcVC
	rYkb7EDHUCXctqmCWKwVjT7TOgh47Np8SiTKPD7RuRbY4VsxngCVZ5oyURdZ20C5a7qyBGWqK2l
	SqkOSwOEsfvx3ARsyg=
X-Google-Smtp-Source: AGHT+IG2zjYHyHxDrSFyGdWaycUP0DnV1hIepEsmw6nSgmsn9ogr9jjPFRCaYQPTy+roxHGLBD5nuBqHvVP9q4sOQgU=
X-Received: by 2002:a05:6000:26ce:b0:3cb:3ca5:870b with SMTP id
 ffacd0b85a97d-3e64c1c2b58mr9289210f8f.44.1757394015848; Mon, 08 Sep 2025
 22:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-13-clamor95@gmail.com>
 <20250909005729.GA2330015-robh@kernel.org>
In-Reply-To: <20250909005729.GA2330015-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 9 Sep 2025 08:00:04 +0300
X-Gm-Features: AS18NWBubeuZYVIrBS9Y3gvos_QkcU48-UEb6DN0-0PA-mnw9dcMiO5insdn20M
Message-ID: <CAPVz0n0PhzjsJSKp9P7amG36V+E_dLFXAgJqtTPx4cfH0m5BXQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 03:57 Rob H=
erring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Sep 06, 2025 at 04:53:33PM +0300, Svyatoslav Ryhel wrote:
> > The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with =
VI,
> > like same supply is used with DSI and has nothing to do with DC. Move i=
t
> > to correct place.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-vi.yaml
> > index dd67d4162884..bb138277d5e8 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
.yaml
> > @@ -75,9 +75,6 @@ properties:
> >    ranges:
> >      maxItems: 1
> >
> > -  avdd-dsi-csi-supply:
> > -    description: DSI/CSI power supply. Must supply 1.2 V.
> > -
> >    vip:
> >      $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml
> > index fa07a40d1004..37f6129c9c92 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > @@ -37,6 +37,9 @@ properties:
> >        - const: cile
> >        - const: csi_tpg
> >
> > +  avdd-dsi-csi-supply:
> > +    description: DSI/CSI power supply. Must supply 1.2 V.
>
> On further thought, why does this have 'dsi' in the name at all. If it
> happens to be the same supply for DSI and CSI, that's an SoC integration
> detail. The name here should be local to the module. Perhaps
> 'avdd-supply' is enough? Fine to rename it as you are breaking the ABI
> moving it anyways.
>

Not only this supply is common for DSI and CSI, on all schematics I
have seem so far input for this supply on CSI block is always called
avdd-dsi-csi and supply is named accordingly. This patch aims not to
rename supply, which has correct naming IMHO, but to place it in
correct place - CSI, not VI as it is ATM.

> Rob
