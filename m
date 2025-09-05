Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93120306B1F
	for <linux-staging@lists.linux.dev>; Fri,  5 Sep 2025 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757088682; cv=none; b=GZ+zHw0myNK5EmBCo7zPSQQMnVkZNdiZc2R3C8WtN7KOY9ptb10XLwduWbXpTzPB2VYBwzB8VB3CXJa2/n8+ZdPxmVVyO0Cvq63jKCvvAL9wmIn44f96pybWDm2PxI0XP9otS+QfjdgbMDjQWx0xK4tAPxfvbOHoEpSGNYEzxZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757088682; c=relaxed/simple;
	bh=AfRVaKjiP1EmsioqgdJeE1b+4oCBXAacMNkvC2Ja/Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+skeeng86t6kEbXEpMOGQsG8SQ0KMCPieCBBT1Whk8jGcyA3uC+L5SlVX5B/H9ZG7rUWoSybPJF7cBQtYI/TUakBIblUtREVRDWALxxi49JLjDz707hjGM5YQaWWXWqiWVCm/HBW4t95M43QYoEQZ9uK1v6tvrEv6dP0d6I+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGllx3w5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGllx3w5"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3df3be0e098so1274930f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Sep 2025 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088679; x=1757693479; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfRVaKjiP1EmsioqgdJeE1b+4oCBXAacMNkvC2Ja/Po=;
        b=dGllx3w5XRIaVezeTIIK9qVAHdZhkwDxtPblDwYzH3gZWcA+yWWB69HYEpCBLXeU++
         C2uM3CsKmuDoJglRWDt+gjV/wA9OoP6qWo9iaZpaxsW46WIa7sImNAxwmuJ1r40DyyZb
         DD+wvPbPivWZGwkv0Gwq2Fz6kGdbmNDmYI5ouBPJeSIz6Jgm5sAYjlVQpj1Q9KXMDPgm
         daIOR5/D1jk2PVPdjgWVPo2PZqUOKMcXdkvGBUZ3/X9DlpW2VF1kWqg1kMIYCouZ/0Lv
         hy3PUF3QkA/lhpAbORP9aunIWH1FlBqEpjhlK8HF73R6RcEtJAQLRl9wcyC1y4/aQ+oL
         8HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088679; x=1757693479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfRVaKjiP1EmsioqgdJeE1b+4oCBXAacMNkvC2Ja/Po=;
        b=h7hUDHtrvBkOI6Esknm6A60vvVPGAvL8FE0KYRWlE2z6wixESMVMNo5/z1aFdjX2vj
         CB+B4zI+7DzseFbzoOouqCWkkmKPwHBVmrawlu1LxvbLnGn27Ymq5ts0Y0Y9kr9FWjiD
         yMgJm/MeBntDeaV1oj0cYdVkuKkMaRcPrm/k/FvnVCpEzKgKSrmhJ8PXlLCoh2vQGrgo
         653jVeOHnS6nT+jQsb6fW7OPv1e8fbHzaraxlVGEoi/2S6PlHVqqBektpwzQDTOKvWiZ
         GbiQTfM8qsc89tzP7C34lx75XYXPlN8QLRiv22U1F8XJAb4YDXDVoU/08+0KZvlSskzW
         XnRA==
X-Forwarded-Encrypted: i=1; AJvYcCXUJqMl6xNCc1AVfK9hJ6fvNCLMV8e2hbw5n2FzvXw/XqN4mKQn10AbgaGkJlaaexIg6V7LBXR/2CR0Af0x@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6YSpC0dKWhtn4CpmOzzboeoLEeO2x4T6tgMt/OFtcYTtqA9qT
	fTz/U4lXfyUHgLOYGv98Pej53mW8kc5PJvrSxraSHbF8X4xpF2fvIcrG0SdYdByBynazMTyI8E3
	jktKiWv9jybj8yOoiYPvuTz0HvRPqB54=
X-Gm-Gg: ASbGncuC0NN+gInK4gNtcwQPC5V6cOjtr3hPz/q7Hf6gqEIoiX/6pCoWtG7nDyb1DlV
	1wDqPKz/zooGeBnz7Mvx9TfH4UWI2EBUwkJVzmaNcU8Jz4ekcXMBEDulFbtIXB+x11lPb+jcXxT
	xtE/rJIaZzvt12jSGbV+LKPM+G0QY9fAUwhkU5Y1LkkRmoE4rPVRkpxuZlXg3qujXgy47RcYrYp
	iJN0OUk8DRA5VA2KYphWc5YGVkQ4w==
X-Google-Smtp-Source: AGHT+IH51v+ciKEEvcas7KruyEl9MpeeesNqdypPE/z9vKPInzfIea4uW80byqjYo8CWqBN/jvW/WkCZ27XkQSvaQPQ=
X-Received: by 2002:a05:6000:2f87:b0:3d4:d572:b8eb with SMTP id
 ffacd0b85a97d-3d4d5820387mr17089464f8f.45.1757088678552; Fri, 05 Sep 2025
 09:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-14-clamor95@gmail.com>
 <20250905180837.35547304@booty>
In-Reply-To: <20250905180837.35547304@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 5 Sep 2025 19:11:06 +0300
X-Gm-Features: Ac12FXzeydZMbzruj0x2TMb09dNVozbOPlP5vr1tYKJLv-xNj-t8FjVS8o5nQcs
Message-ID: <CAPVz0n2m4U-7G14Jhnsm41qsj0FVo39bdJ=f8kAm=+uxZyM0xw@mail.gmail.com>
Subject: Re: [PATCH v1 13/19] staging: media: tegra-video: tegra20: set VI HW revision
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 5 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:08 Luca =
Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 19 Aug 2025 15:16:25 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Tegra20, Tegra30 and Tegra114 have VI revision 1.
>
> Why? You should mention the reason in the commit message.
>

Because TRM states that Tegra20, Tegra30 and Tegra114 have VI revision
1, Tegra124 has VI revision 2 and Tegra210 has VI revision 3 (which is
set in tegra210.c btw).

> But I don't see hw_revision used in the series, so unless I missed
> something you should drop this patch.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
