Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886967478
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 00:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582606; cv=none; b=WHhAZYq+zXzTA08rq+6IOHgpd3EuRkiedq7FZNY30ftrc9cpBTvxnKN8YmeAOAPdbfn8hmTXshwDqRyODzEM2p0Y7ga0xWSOxjrAjWI4IBRUt79JXCPp7zRCfy3EML+rtFDBaCFvzh/jMPepaDSx/bwa+wDmPsNwji2ccpFbViQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582606; c=relaxed/simple;
	bh=H0UkwDIn/d1uIHupQIPwCcr9BownJUx6Ku43U+Ax1E4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eJy2ExDfSrxSREjX73tqWJJEX0H1KlMkpBiuUtCuRr8XyzW3i1QHW+gxsWEz83mMrUnGGTMqAJU63vMU3iGqFVIVICEF1s0FkSjZ1GZqW3OxgGgMa2SDTZZdHTbffnnQL3vcSOA8q2tOok0dvcz5USR3ikI/FtD6shBfdhJUdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpsom3ly; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpsom3ly"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79881805788so60633337b3.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 16:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772582603; x=1773187403; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0UkwDIn/d1uIHupQIPwCcr9BownJUx6Ku43U+Ax1E4=;
        b=dpsom3ly2kfr6rkQYf5PNXx/+6rrDZfLXpJbyWqSd7QYJnlp2CBQ0tWG2sNdCaA0hw
         ll5fLS6imwknK/BRnry8VYiYXM7Fc4koEcMrlAvnEBah/NLxpQHhVDeK/FWTgM90d5rN
         i6cUUEnW8W0HQTCqDYVyizIH6FKL4hL7s5o1CIvflAHuMT643v4imAh2lEVjDalwL23v
         xpIpNt+6FnJJSpy2i1PGJbyGxvdYcAP50jfuLQNVkGnrZwkwVv2q2leJm4Rbb2W7wkil
         ZW+YNzrG91ecmP4bYYeaFHKctAfWzp2jx1HgwwDLCiCiy1wv19/M5Yudz5Q0ba7q8XYr
         UFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582603; x=1773187403;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0UkwDIn/d1uIHupQIPwCcr9BownJUx6Ku43U+Ax1E4=;
        b=KhZC6Izfb6k4WIIVxInlCEM5TZTK6ltf02UaFzB0N0gNM8aJJNUa23lZGRoIL1i2kO
         Q15RaUMWrTcoY+q7q3T9LxUSZPrHP1+NOLZnpLVF3Gs2LS7yyQVqbrBgu+IfwfcAkpcl
         xAL9+mCJcD/dsZAYLDXtNspXlj1zt/8/ePbmfmGLb6SkWM+NAAiHesxFjigG8T+OIX9e
         Z1fYiv+FLPlo5pLCUj1GdAgmoKzAP+vPWPRtf11QXrmNlYbvNvNlwNT98ceO0WY9ftoZ
         M2OR4tbrXDKs7vegPatOVCfJKXxXMuD1HIQ3S6e6LeCS3KxPNTdOrZ2/DEs0uKX0D09p
         Rvrw==
X-Forwarded-Encrypted: i=1; AJvYcCVLOKoZjqAg1Npcd/pwtRBVmga3RAkbQOCv0cHTEb4RbY3GkiV3UcVpG0oiLiV/mpZz4gtldK6ZlY3LShdo@lists.linux.dev
X-Gm-Message-State: AOJu0YwxqdjEC3+yrnt7wgKtYkTMmc6P8xLjz3wcqNAsmhyxD5gD6GPe
	6DUNu9juNp33d/zKy8E+fh+XPySU1EYh6ozcRZZ+WM9zmhSUMrE7cR2p
X-Gm-Gg: ATEYQzyQ5lJPoNB0aLxTog+zkaZOspJjj7WoxqoZ+zdGUu+8BpQDJvrxavtmgu98TJN
	cM7t6rV96bjEDPa58LqR/ayaj3K+OPXY9ngh3uY5eT1s6buKdHv42oTCGwWV7WlrOyZsEniacyc
	QNRtZVWTJZ3JGaQ7+yf82nh1/mA3Kc2gfaE827gbVbfU7dmJyhZAUm9OklsUvTRs6ppx0AgDpSU
	zV3jbe+42yJqTrlrgoHlMKvXJ+qifbxl6U3W2WViIi7/SN8tMbS8pTb5ZABSQ+qJ9iKZbOr8xc6
	WqvQ7lBtFRMx1btZEOfCM9GVOm5FuL9OUyWWF/K039uhc6hmArbFspX43rmiEUbUzgqEY9uF03+
	2ncGYZPcv+qji1vlHQ4GSIsWT2RalWPXlTmHQbOwrhQ6Cav+Ga1adeYYARJRHIbmEIrLxrknQN5
	DuYq/zzIyDvDEaIkCvdLtTG//TovwAZT6HN6PI0dPbDu+Xwm844DA5G/+BxIHoEWbUL2CcNCpLR
	9EFVu5vsE+KbV3Wa7UFCpo9lsDm8huerjveHpfAoYg=
X-Received: by 2002:a05:690c:3391:b0:798:509c:f79a with SMTP id 00721157ae682-798c6c88222mr1665047b3.36.1772582603416;
        Tue, 03 Mar 2026 16:03:23 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a8fe80sm69614047b3.9.2026.03.03.16.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 16:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 18:03:02 -0600
Message-Id: <DGTK30IDYRW6.DP44X0GFZ1UM@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Khushal Chitturi"
 <khushalchitturi@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Ethan Tidmore" <ethantidmore06@gmail.com>, "Abraham Samuel Adekunle"
 <abrahamadekunle50@gmail.com>, "Ingo Molnar" <mingo@kernel.org>, "Zhuoheng
 Li" <lizhuoheng@kylinos.cn>, "Artur Stupa" <arthur.stupa@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] staging: rtl8723bs: curly brace consistency
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303173844.47975-1-azpijr@gmail.com>
 <20260303173844.47975-4-azpijr@gmail.com>
In-Reply-To: <20260303173844.47975-4-azpijr@gmail.com>

On Tue Mar 3, 2026 at 11:38 AM CST, Jose A. Perez de Azpillaga wrote:
> Fix unbalanced braces and improve readability.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
