Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E42BE7C2
	for <linux-staging@lists.linux.dev>; Wed, 20 Aug 2025 05:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755668224; cv=none; b=rIuoYdfCBR75i5lbo5stRtrnPaaGNSOn4YQNw595hK8cFpmzAi0hBhXINw4VPaxSH2OtSFFcWu/SCnIKC59ttwAkkFk2QJf7YbqpaF7NEZuFABZHWmOLTOFVyaQkvjIXu89KZ74NDnC94YoviuTm6RvakB9y/oJ8BpVd2JETlBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755668224; c=relaxed/simple;
	bh=78sK7PM+e6rv0rS1Pp4UQwzdhAWb5ZMXoADM3lH7i0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imTW/agmRluuw2bUQSCY2x2RcGssq9bKLITQky1sPvpLrhV4fsN676vT5M4puYMhz4sRRtBPqJSEnG1vE3YuwLYXlKVcBqrIHg42RWN9fc5gZJjSmZKhGJ3jGFaSfvFIE9rjz/IELvxkbjt2+7rFiYrZ5Imo1QPTN3d38PL8LMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4T78LN1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4T78LN1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9e4148134so3021587f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 22:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755668221; x=1756273021; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78sK7PM+e6rv0rS1Pp4UQwzdhAWb5ZMXoADM3lH7i0g=;
        b=M4T78LN1LvTYKGTsejj5A9d048xjxDdJIu5gqAxMhjM2mM+lg3Sg6iXl9NWy2LxVT3
         ZmpryBkz6NAkM2LtvMI4vdBWhm/Cfl32PkfiZtTpIWh4zxbBtSfqhLemyNB+heZHXZkD
         PcuC8NaIY1tu2GFMDKiTjsxihlNkviGGOHhbe/y8+IXUMy3XgNQmMZNFK6J0wUEyYPRf
         3qDeLSEWf3A4QCeVkROPQDdnRrnGgQPfYOgTAtCaf9K/TTkSMYbc6gbn/OazYcDkrq9X
         e1qEVXoW/XTzMTqaSYfcFbDnd0DfgTCAvUYi13EErwNQyyft/VySyiJ00Y2By81Zge+F
         4TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755668221; x=1756273021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78sK7PM+e6rv0rS1Pp4UQwzdhAWb5ZMXoADM3lH7i0g=;
        b=s30MnHw8gUh0FMVx4WvZG8lYtDjPAl8n/Nh68yzgWjl5i3PoeqcgPnofr7p6c5+MrB
         wbOVx8fzctMsYguDaBH33tNSTa//MIJVeCL/81qpnfPLdSItJtOLJkUYfrFkm+4UKbt3
         srGCBsD18rf9uMhZATOWg8adUujL/Du2R9hYILUa928K7E+9JVEJD+QqbmO50/FHEZhJ
         996A/bzKGNw3JVfGwuKAu/Dx/pdhCliFMq7dVnMGWhQmZZ9LszfuosIcFyYqAvzoP8VF
         vrW5IocL1K+7xW7eKiCrohkm/yYjea5KVq1vdxFklENrCUoHb3neCh3oUPkp7aGtG0+O
         zHfA==
X-Forwarded-Encrypted: i=1; AJvYcCWx/T56QnPDWiagDWsLI1eCjFXlD9AE+f+hJYB1G6iFHHANMypPEU7x3WmbL0GK8iuNXBgY+aRbkJWBAnOP@lists.linux.dev
X-Gm-Message-State: AOJu0YxDDeesMWjZ4uT+vlBUrjTNYhlVgxnMkF90M6uiK5lInU5UD02T
	QnU6tGq3cS6pOtuz/ALLcckTph4pG+i8BE+eZXQo2rPDb6+lowUBtLGd31e8Kq1ANXKPDxd6UF5
	VrPIugiYQnXr9fDWQwODZb8bFW2V6kVg=
X-Gm-Gg: ASbGncs+EkdenBbbLYcQ4YzJ5jSUgpMQJo3zV9UbHq253ggx/TJa8mu0FZNXF4axPR6
	nCGl7LwGxIbQuZDWxAWbYjv3B/7iyD+mOd7EW2C/06N1b6Lydf13Cr4JNkGPvg4dUOCX0T3mARI
	d98+qYZqOPdyHOKUyn4C4ovGyK9LZvvgYoUmpL9yr+JQKKRN2hUAgQKiltXY2TA60ajOXtkUK2m
	4VkgA89HaVd0sGPRck=
X-Google-Smtp-Source: AGHT+IEV4H6vaBjmF9//jxvsy0f2IPX46V6T4SJQdX0TD7nXqj91eKUZEBuSglg4gtxux4A8T7pdQvDuhbFvozPrkmk=
X-Received: by 2002:a05:6000:2f82:b0:3b8:ffd2:6745 with SMTP id
 ffacd0b85a97d-3c32fe1a0f0mr1054185f8f.44.1755668220666; Tue, 19 Aug 2025
 22:37:00 -0700 (PDT)
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
Date: Wed, 20 Aug 2025 08:36:49 +0300
X-Gm-Features: Ac12FXwkyBBfR9rShdkWvufqBh2fUhj3y4r2YpvDmS3nJ98Pel0j9Thm5sQ5jzo
Message-ID: <CAPVz0n2CQ14DDFAhAHsxm_-nkDRTrGbBKVRkwzs_2eo0p+6NVw@mail.gmail.com>
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

I will reword commit message. Thank you.
