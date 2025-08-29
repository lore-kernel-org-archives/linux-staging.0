Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D902517B9
	for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756449765; cv=none; b=p/7WhAkQ17e5RldRPpHzpIL2LlV0L8kCkjQAgxQiweTKtRXT2HbAZiaq1onxRyPX3ZaD/9TH4Qf+FZbydE/OKEOT9prtTXoZTS/1kUXQLBRBU4fDAwUYEmqwpcZrv2+6kcJDws/3BFxBruuT01qilxsZ86tJQlG9C6+7f/nE4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756449765; c=relaxed/simple;
	bh=kVuD7W376c6FrZNyHaO5XNEGImOvvlZo36DWNaRRpy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbmgXf/z41UNBUOp6L14IIS9SChQRWsxJVGlJMK4lFX9qQQK7y9PxI3mqQdFYCERIq49pklWnHhbr50JNySf9glzQKhR7Em21HqPNJQgMNaXav/P9nJcgVQfNlhvhSmRpCl/Cc9xQb1YzLZrKfGDSGHY3XOXveHh+nAk+MW45Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDwREi8f; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDwREi8f"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c7ba0f6983so1061044f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756449762; x=1757054562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWSNy/JRqLkLoJxnOEcFDdNep+6HQzRpiS/0aFPTMrQ=;
        b=LDwREi8fEfHcUbFzm5wvA9XpWZP0KsJiLTT8OT0uDHp9jDdDIwM5TUDnTJZoxcyt4W
         AfQrYyNWe4kjKuYNfUlPYClRh1La64OigwLgJqPjIH8FseoRirzDs4FVDg6yu44hUqGA
         lPosxFkLTLWRgv4vY7opgN3KvtDDIuc777mJFadzY/hkJE3SUIwI3OfRTz3L4eAmztKw
         8NlHE9ZnvCFNZF9rmQjqk+BnpGYKUtJUBT3pa0st7ysgaYNGMSP4b6YA5BAEKdL1eKjl
         dHOhWHD/Wfywz+wa+4VFTpDLyORbka8lLNKRZM+SecwisWZDMhy0yGf8dn1dVkRepe9S
         GQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756449762; x=1757054562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWSNy/JRqLkLoJxnOEcFDdNep+6HQzRpiS/0aFPTMrQ=;
        b=f1qHRx9h07XD5crq9LXeA71Q8ds6MQ40LY0vhpnevM/QvtvdWVenGlzpF40r2XyLo8
         4zH5ochTYRWAtYOuC3c6gqoNw9S0pquwMrg6EElxspaInrfpRNeHW9gT9Rvhj9rAB49k
         87YWE0cjQTYkPGr265jDxlp3jJ3Gjkrea/CDihXsX50Bjx0Hgf8SsSgRUH+80dGtK8yV
         70aFWLDM8ipG6p+TySEKITnhy+9fJVgVyHwZwiKUmidwiZnJkVIu8kfHUR59HeccMuSN
         9767M3O4iVOTN6PS8AJM4f2LeBkxEqQchk2iJGzG5OQo1tHkrlSmsFdQ2W+eqnIChlAT
         nF5A==
X-Forwarded-Encrypted: i=1; AJvYcCVIxyYIsijN4wdC1zsizIyKxYzcd2GYUxQPOwsFWBn2J3W/SY6AiDs/WQclGMxwn29mQ47KS8zgP4xsNa+P@lists.linux.dev
X-Gm-Message-State: AOJu0YxdNmuKHw/KmgVkyQ+xg1DT6X4XkulfrF0cpVgUjFMmodiuyrrW
	JrLa9Ck7mrjJ59PmvSZZeP2KeToymzoaJPL3JrEijjOlym7DOGasQW8+fluLj9scOpygEH3KLqn
	HSFKAn9qklfHSvSXy9X2hQDWgHvxZwOo=
X-Gm-Gg: ASbGncvfxZe6Dg3yYD3RpU3owsgzRDEszBIIJQjEWwLsPT3Y5tAbTkPRDleQi/XbYIT
	PmzZIPaDs/Hcbjn7qBAeF/PtqQBLFFltJKZyjEWVISnPcsA8go9aT5I6JuFj0Svkp4j3ZH1nWmN
	KBRO0KOQED7i2seeU4LtVAlYN5fuB61cvUm1fI7T7Ng31/tX72CuN2v048mWFuWGm4SyR57kRFO
	YrkJknh
X-Google-Smtp-Source: AGHT+IHjRL9sOfRC6KlJXM91TuBldUFCTWN+6IKyuNVfAGqivuS+QA4CO7lbMYhZ/89R1DWqkhTaNLnSJ6XXeiMAmew=
X-Received: by 2002:a05:6000:40ca:b0:3d0:c6bf:60c6 with SMTP id
 ffacd0b85a97d-3d0c6bf6478mr507752f8f.13.1756449761912; Thu, 28 Aug 2025
 23:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-5-clamor95@gmail.com>
 <20250819202722.GA1264491-robh@kernel.org>
In-Reply-To: <20250819202722.GA1264491-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 Aug 2025 09:42:30 +0300
X-Gm-Features: Ac12FXxicf5syu3ZrQDe1liim-jpvbuNbb6FjdElmnqfyMSBMVU7aVm-Nae8-uI
Message-ID: <CAPVz0n1CN_rXu6EvgiMBeCvpOK6Ep96pax+naRha-=9THBifZQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
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

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:2=
7 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:16:16PM +0300, Svyatoslav Ryhel wrote:
> > Parallel VI interface found in Tegra30 is exactly the same as Tegra20 h=
as.
>
> That's not what the compatible schema says. 'exactly the same' implies a
> fallback to whatever it is exactly the same as.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml    | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-vip.yaml
> > index 14294edb8d8c..39e9b3297dbd 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
p.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
p.yaml
> > @@ -13,6 +13,7 @@ properties:
> >    compatible:
> >      enum:
> >        - nvidia,tegra20-vip
> > +      - nvidia,tegra30-vip
> >

Rob, may I use this:

properties:
  compatible:
    one0f:
      - const: nvidia,tegra20-vip
      - items:
          - const: nvidia,tegra30-vip
          - const: nvidia,tegra20-vip

Among all Tegra SoC only 2 have VIP support Tegra20 and Tegra30.
Tegra30 is backwards compatible with Tegra20 so we can use fallback.
There should be no new generation added to this schema.

OR should I use enum?

properties:
  compatible:
      one0f:
        - enum:
          - nvidia,tegra20-vip

        - items:
          - const: nvidia,tegra30-vip
          - const: nvidia,tegra20-vip

> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> > --
> > 2.48.1
> >
