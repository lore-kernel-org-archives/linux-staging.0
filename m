Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E992EC08B
	for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361156; cv=none; b=pJwjqT2AyzvnHMeZkjU7matx1/XtfjJwJUX9UREUYPeSyh5TdEGV7SLYf4DPu+1aOvpV3gzT7mSl5q+k6IolWrf8/jHeonWW9qgu7rIMlprFPbMtFHJEfqRGpvHGrqDmJDEIEkjBsZvEX9x0R3SU8iHpfwTiIzOBDnXYer+uVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361156; c=relaxed/simple;
	bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePtVE8XOJunh2TrJ5c6VVkAxWZhFFTlFqp6RCZSDlh80iy11YZsPmSTEvHL9eFgq9l1dooyGolwHtqFiTBNAIM7voVurOPLsTt49DfUshm2KmbXjM4dgd3muqNIesREa97RdfHIbyIsR0tyiVxP5RESydn7W+tg6ANiKJBRrXZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZV9PiwDf; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZV9PiwDf"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57e36125e8aso732794e87.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Oct 2025 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760361152; x=1760965952; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
        b=ZV9PiwDfM2oulyf15aRAVIFq0xoSEbUHNxVPNuG7Faie0pJ9qeF2w9jhvecicINmux
         oxKb6PZsrTbMWvcSw+s0d9vWZ2OuNhxcBgQOIQGDGiFAFDMW83ry0g1CssbT/1j2Zeyd
         diu6e5PNVV1vYG+RuNT8Jk4Zk9BHoycyTp3Cc5Hwx1ZIEZ8unmAjbArMTXqa8MrhYnps
         0OBEE9ftNoGUqchIOWp/z+cakzViEpDqPewvqTfjVqDFNT2v4W1swlPBmOg0Wea7FgjC
         e7J0MOvMQQ4e+zbpjM5dixkicn2mtbp+AqeDlo0z0iCz0gLe0GsiNw5hi9XtSVMmw80r
         q8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361152; x=1760965952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
        b=sM64u+EAs9Oae5yT/boLRIWYl76B7HGyVp88Kr/vkIGEQrT/49dMRcVeLc97qAcjUq
         vpYM0KLM2IA7RTs/mvxhHBT0ZWogURq34fokoD4oHaFTjDgDD1UhDRF3WvWVFQNvUxc6
         i4t2QtgH3PSB1vnSR4MohL3qoujVG1r6Hb0YZAFPAlMInCdhtlCNV5jgoZ7AbkonmJdE
         bBuZHp4sqp/8Jzum2vS2P+yNnGCdRQYWPca8wF7ymCy8KKN7YDZGHR9JZf8CIevMsA2N
         VZgttKVOwXbddhL7fSk0FfguBRugdDYibi03fArzqwrrZIvcQuE3JBh88jRkkYNxQ5ep
         REkA==
X-Forwarded-Encrypted: i=1; AJvYcCVIGKh3vdeYaNCGmCibL+IxLSeplpbTHOE0gzmprlG0DHqN0BNdymgsq3dfCKsGoHBmCitrD/BSkDEKUwzv@lists.linux.dev
X-Gm-Message-State: AOJu0YwfMopO1zMQfq5CFf8/9e1SUqwTRvFekPC+p2mwwE+AKzjQFDj6
	06yhc8uakAq8veJvi+pg3+ZV02GhWZbYURBTU4WpSVpPct5BmTiFOjwCbGgUn9kD2h9ThwPnrHx
	a/RK3ZtDoeeuO3ghhmG8Kl/+8CzXTk0wDueLoIy59ZA==
X-Gm-Gg: ASbGncu2SBvo2OjGryPIvbHsVOFjkVxo66MbwU2sughIJF/7ju+pXUIEiceVjnCTxjy
	NuxbQk9eyK+L4/kKU48u5la/FQLxlZr/Dw5XUUf8Q8hMURkZUooZRbOBDOzIWhavB8kSp9KRYva
	AECP853ENvZ7iEkPwq3CoKNxo9KuxmNMJzO9lUPok7u607SVm+5sLRE/5Uex6AKq8//qdq0VgMy
	mKZLdhZnsZ7ZWYB5IAo8lDpxz+/c+YGUo9mHfDU
X-Google-Smtp-Source: AGHT+IFy7QQZzDisxgLU7RQiHqmGLbp9GU/ko5TeFOP01cdLTHtzWG4syZZ8PgjrdKymxne7+Wg23WBWjWeGpiwOdDo=
X-Received: by 2002:a05:651c:4394:20b0:376:45a3:27c4 with SMTP id
 38308e7fff4ca-37645a32d2dmr19705401fa.5.1760361151675; Mon, 13 Oct 2025
 06:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:12:20 +0200
X-Gm-Features: AS18NWB0Tr61DfHtPSZqpJT6vjMUO75ud5f5_b3M4zNOdVsqYQjTLusmQxbBsw4
Message-ID: <CACRpkda3o55N2m=H+RA2p0r598KBLv6bbbin76Uu5Sy44qCLig@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
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

This patch looks like it can be applied independently from the rest,
can I get a review from Thierry or someone else at nVidia so I
can just apply it?

Yours,
Linus Walleij
