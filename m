Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7A2FE053
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443428; cv=none; b=mYNh6uIBLkLjFRdb5hyk8tR2digU/FKLjTO8+O1Xgu/+VVMNkpOhPN0cbZV915gP7PizwZKcqLnWqqVtOGlH0iU81OlD/blZWGCefxpclvkAEGZCviuT6oOQ2EFG2suWtcN+ralzJQTlLmnIED7frghH+8ouQk+tnptMMJJIxBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443428; c=relaxed/simple;
	bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLUhknPLeCnDHlma/nxXXvZ8QX7bn36xN31mZ2SAbZK/C4bAJLMnR2GvVUGmgt/h6iLRPBBpxboWLJzTjBWrEZSBA7y7ntKQqpL2BgT9NjxquJYSIH5iGmdfHwtm6Mkt2OX26/2w7bmptS0XK7ecL7NmIWz9dY7vu/CguIlEpwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJfWNGeV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJfWNGeV"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-579d7104c37so6346302e87.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760443425; x=1761048225; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
        b=dJfWNGeVOZdloag5lQ5ZKtIcjr9w1NvWQ7aSev3lYZO7u4DawTaQqTY9NqAEepGFdb
         N+RGSeyjrdDUad7grqVpqY1n5yWJ3HRvkd5SDosNJZJz1I0nhZtS/IFesgAdcYC5kQIh
         CSqZd25vLRRJccOjljOU4Jh+ERIQIg3smNIid7ZkTAu9VaHH/BrPr9D7jb5XqeW861Yl
         Up90ffSEQYw0lwtNhzoqj3kCnHgSRpEUvL158iTBukRVmw90CAvPvdXU4CTU1xq6ubpg
         Iqnd3slZpm2tFLVvgxmixUBNh8WXHHdOdUM58ssZWsyLjYLYUpqXcqGB0Rd39wbTDg3q
         Hdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443425; x=1761048225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NzeDm4YRr+qmfFJMboOlJS287Q0PmtLlAQtT9HyscU=;
        b=XiOQZMIngHYSuGGNHpg6ZYZ0YoQWw220lXGLKzBUtE5kVa4VYMFcbriUbQUZIqY5Ob
         4Y2XW+rWBLmaz3FUQXll6kgj2ad1CN2xN+SXnlWspkQJFinwkaQ/Yj2q8rnO/AvWZ8p0
         LehH5fZalfmgn+bL9bi0thEcfV0spI4p2EXEboY+QnnzlIty0XZQlEu+MToXZp4VadEV
         lrv02hGGPGLII7nM0XpcOZMYd6o2QHVjiwWKCCHbrO9S80D0v+zvqfimpqGflZyDA2yL
         GpntSPn6MVe02uCP/LbzWRYL9e3I3idFkHe9kDzkCeiOaqkKbrVvuoD2tJVp171UuoVp
         8xcg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5bqEgC1+N4SFhyIiJN7AuoAnkIx1WeS5gfSYOxf0YbT6whrcx6UhKZnS/dflILoJmARi1o07ePYVIg3G@lists.linux.dev
X-Gm-Message-State: AOJu0YwDO+EbVvZIICvzEYuqCRAZjCu43cometb5GQkIqEVr9K+u+cuC
	6fHXTM3Jk5DlCzH78UsAq54XViZsHDBPzO+gGITozFKFzHBtI2i7rnod8kcuU9Zuod2gqERQUNz
	g8dKSPH3hkaacDkvgLQmF1B+TwL+jrC+W1AK6WAqQHA==
X-Gm-Gg: ASbGncuiXKw6oTcl0BgEiqmmBQc1IHzNQovI2KiGyr1aGdvt2vyc6LeEbshJagf3mHo
	FDYuFbtz//dq6Dt17WcXodVIJeVUR9Z3impXKdGDfQoqS6F2ujL9TKndgRkWyeeTADD2loKHLH1
	Xr3zWu0zX1WCca2viQtsoHmLAlef66n4C7EBCo1YRaHDQsHFBm7v1J4irPWzf0+wzzsCkAD3M/a
	SidRYGn3qQSYheD87OdMNb0ZrPGks7blVpQ5JEb
X-Google-Smtp-Source: AGHT+IFD0BB7RH2Ep9aDetjvf52TraFr1nZFUAFZVtaRLq2brbGFG6VPJ0RQdb2vqcIUZBE6o0FGikD6X+TXoiS5UhI=
X-Received: by 2002:a05:6512:3d10:b0:58b:26:11da with SMTP id
 2adb3069b0e04-5906d8ef684mr6189769e87.29.1760443425099; Tue, 14 Oct 2025
 05:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 14:03:32 +0200
X-Gm-Features: AS18NWCj_bKF0VIZCo40xgE2nZcym7DwrLVXQ08YjlTg5hV9lzx6rx-fa2x4Vss
Message-ID: <CACRpkdb74fh_eFCd0MM4RK1_KtNRugLPp2yMA20FrpHq+-o6YA@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch 1/24 applied to the pinctrl tree!

Yours,
Linus Walleij
