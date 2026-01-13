Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227022FDC35
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338870; cv=none; b=bob7jmDj4BVJidK0w+VupJ4MIjASVW9sHe2FZMoS8a9hmifRnRpmDbPhJbPfQ7ZRjiIrvM1F2vIPCdvp7mz4TZM/bPLaiXBIEUOVfT1+oQOp9fagnnHyrdPYQltno+dyMzp4LpiDh7IV/ByjOptS0kfh3ipIuVgASFYWnPVEl5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338870; c=relaxed/simple;
	bh=pQigQI/8admlpIuls6ZhRKbo+cO5u2/w2RF0qKuRaZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADfEGbgwS6bPtIertlCeTJPCgpr16kUOW82jSuGO6tJy2EAW7P+7u0w0CpEEcUrCyN/Idzkiz3LahZ+9c/8be0qYXp1o2sJb7ihJLjONCmSzw2jHM8biBDJTukqs7z6//isBVXmH65N3iV8GIy78D6EiYYZcJ24ljheApX6Gz3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVOb7TJT; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVOb7TJT"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8010b8f078so1336409566b.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 13:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768338867; x=1768943667; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQigQI/8admlpIuls6ZhRKbo+cO5u2/w2RF0qKuRaZQ=;
        b=hVOb7TJT5IXjtJwOzVYrasON/xMMeoLHcBu2tZA4Y0ylHSNGxFAfgOtKhhB6bk0Iar
         bsBDwqC250w9p9swcPoYSRjdweC4XchHH784nWr4ay8z72nYYvaOgdEY+tIyPs6/KnEu
         D7exc5zziuivfySp00pe8i0Kb3jOH68MiSp6pYZbH0e8GPMCASXQOhEuMFekvg3Hn/O1
         WAxCnT0JfOVtQGb7ylVVIq0jR+0Svr3mysEPrdK49TKhYDYDZzEAasUdjyIe6a7Jj5Tt
         LG4Xi+UkUBAVTUJ2+bdcBb03uBkc6ex7GGydJ0UvGNKEoKiuTXZDjDemR52Wo+92poRg
         wpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338867; x=1768943667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQigQI/8admlpIuls6ZhRKbo+cO5u2/w2RF0qKuRaZQ=;
        b=nR7H3qRfcBAhSaBYtLovMgNRoivE+DZdshhZ+7JsQsfytuQscWtp4PMCA4VFFQoVoF
         e5r76sCl56ZeO+ukKifWG/fds8ewooPG9qWcxCaXffjLmvZULFP/GUSsJPYsJsDucwta
         tz/IIGCHYYgFMYRdm6+Dr2azNZXJUFiBqIWoapVVAaxSVSBOUhP8od+3BVt7gV2llDRr
         tIduD1QW/pgxh3hSqMq++4khk+woIgVvTVds/Sk53FpZJs7yYO7PGU8LEZpNshMO+Yc9
         1Yg/09CoYG95xWlPNJFLQGag0wWnZQpZ35DEhIecPFEr/t4gABgJgyTc0H314FdsQ563
         BdVg==
X-Forwarded-Encrypted: i=1; AJvYcCV71hzLXADOvVqHOWOOwHQM9aWlONf1aZBeYdxPBD3qhenfpL1tWmGs8QnU/JJHHmgT2CZhtrXs76LACbra@lists.linux.dev
X-Gm-Message-State: AOJu0YyHx/56Athv+3Y5RRT+7dcSXFplUhRZyo8N9Z0+yZfGgZnveFPi
	pKfNK9XxbSIpndz1Q6s2RvRx3FHSUJIZgoIXBKhBwSpwLV+b8oEY/OlVVh9hWn26/dsE3UHjogY
	n2vxY4jrHI0R2X2jHKtDqfwvF01/3ZPM=
X-Gm-Gg: AY/fxX6PdXsvVXmv3++FbkrDNAXvQw4Idn39Joghp6BoGDAK07ugobYReuuPSdpGOxZ
	mx5m4FePL6YiWm1FnYKJcXjJKOiYNpntSowjVQd1Wg6cEhXJHLX3Bv/Fj0/L3ly1gsQOHCFFRaB
	o3cdlPXmTb3l9ZfsMe/5aN/2KXUbZhImlWUAgyVxFzw0yZfW59MaVXWfxAjxMGN+3KI0f/e01N4
	ehlVwCmoiaK5/1QiRSSbKLTnWgi3wZrRfuRmR81X3U20pgTZHODwXpnp1TMGsWBWo1IRHqG7oy2
	i5PL5RNFj5PQ7aDDMyNv7nK/nH1kgL6+k2ty0jZy3sJR3jOhmmaTkyrBHqlq7wWY4CJ6alw=
X-Received: by 2002:a17:907:6ea5:b0:b79:f4e4:b544 with SMTP id
 a640c23a62f3a-b876103e568mr44161266b.21.1768338867286; Tue, 13 Jan 2026
 13:14:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113210559.3020-1-gideonadjei.dev@gmail.com>
In-Reply-To: <20260113210559.3020-1-gideonadjei.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Jan 2026 23:13:51 +0200
X-Gm-Features: AZwV_QjOLtUncA12ujRVp-N3ahqpmevsE8icLNdM6IvrWboaeofcQ5aBk58-iqo
Message-ID: <CAHp75VcGTgd6T4p-5ceE61Y3CGQ4qriXh=VV3kBi=hEF9hNPWw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Change udelay() to usleep_range()
To: Gideon Adjei <gideonadjei.dev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Abdun Nihaal <abdun.nihaal@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Jianglei Nie <niejianglei2021@163.com>, Matthew Wilcox <willy@infradead.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:06=E2=80=AFPM Gideon Adjei <gideonadjei.dev@gmai=
l.com> wrote:
>
> Replace udelay() calls >=3D 100us with usleep_range() to avoid busy-waiti=
ng.
>
> The delays are used in init_display() callbacks. These callbacks are
> invoked by fbtft_probe_common() during the driver's probe path. the
> probe path runs in process context which already uses sleeping APIs.
> This makes usleep_range() safe to use in these situations.

Nice, now can we switch to modern API, i.e. fsleep()?


--=20
With Best Regards,
Andy Shevchenko
