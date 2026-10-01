Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6798E401A14
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863380; cv=pass; b=ablN7lCGzL9/a0Pq/Or6fAh+224aBYnHORhah8cXoQy7HkMJ5PBZLQ9XKyyuUszlN8t8JnEVg7AUisTkmLSmMgNEprZAYyEkiJi4OifpgQ30btif2+GsB0ZL1HejNLX/iECzvSKxMdztnj0lK2gtvo5+CQdpUvQq6r0s11GrLuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863380; c=relaxed/simple;
	bh=d6FEHjro//70G/l/gSUyI1rn/GjbHT4yliKB3BRSvoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvkIJSn4i3U4ULLNwVdhyZgLIlhZHirx0ZH6kJ4SEH9A2v1pB2W8CXzB2QA84bfNXLLobXdXn8b1ymp3ODEY3bmW/5K9K2bz46cVJot2YvIqMgDh5LCXn6dt4U1QEuXcCumI/t3t7cH5vXSqBXHodCHUKk6k6GwBSfpFm/iXJBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Df1HSgf3; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Df1HSgf3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c294ad260fdso486562766b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 07:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790863377; cv=none;
        d=google.com; s=arc-20260327;
        b=GBjQ/uw3B2/QYHdpXFKCp+MstAm50NkFI8qPBzvnKpFHHsN/JRtzfziB+EFdJNly6L
         try28vYEAKM1oD4Pjh6CZLK6FvjEq+RaU7geJ7sjah9PxAXOlh2bw9d4k/Dlbi00mFAz
         n720M0dqvUBP+W1GJzFaAR1wGqOXNqe9VQ2QHlFwnE9r4oFAyAPZN46os3adSvo4g7bo
         hPxe//reqbghI6F1KFDbTyTliEjFH7x/hb/EPC09O6YC0LaQoAcrsPf2GeJNXKfoTvpQ
         b9QMHL088BDymYG7qffEB1pfFHp0l2xFhdopxxPkFfg4dGLhEq7fYhWpnzmZkt2cxW13
         h2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        fh=nePH3wywWzMgg1OvZ6AktVXQxU1UqjQ/xhIDmHahGHw=;
        b=jfWQ47WALvNcLyq6TdMpKkA3uPzjmImlk5hDWrEpzGJ4VxyqDfNY2P8OFggXNopjOc
         +glhZ7ZTidbIu/0aNBBiO355SnP0rsMdqqL0vZI1OJz1zLSR3pdbFg4dH3hfFYxo7SWu
         U1f9cMN34a6ilGo3T2PCyEpN8tQFpRrBEnBp/KpVPIF5gsgS3H2OKwt+c216b8Lzmr8t
         R3JNTg1qKH8NfkVsNVKIaG5HsrHrD75huHlSZxJhhUC5EYiuVEjqNjLUkBkAvamHVe6a
         SCTUyfS6AC0hQMT53arK8yduY2fPSyhsAmrqZRK2DqcqMs0QWuYG4CWXOR6VBkjdDqCe
         Hk8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863377; x=1791468177; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        b=Df1HSgf3KQCjom1egdFfT6tkH73TcRtxeLNF+Sc0NmRU+YuMaQQZd4h5/Gk23r6xor
         RQ9qpLPc7bcAPVZzeOFfWPKhZgGWc8hKXgSn8K3RIlnH/aYhgzvlAi7H54IWTgtOiTmL
         czQc6XbVOvuw872Bq+0oFqrI704RPbCnQCd4B9qSnP0lt4RhXrd5wS8nPFmfQwlt30ye
         3Voh8CM0+E6vZWU35tl1bIgPEi09AJyOdBiWENOH2lp7cs5dvtA19chR4cfepGlu9j/D
         hpJ4mNZtOCEVZsoxYcVdIiFXGHk7x3l0mBrtpSmiFaECSF+xhaGVLhf4Zc924HZlvfEP
         nXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863377; x=1791468177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8/7CE4ZuKqaD2pkivrDjqtKal/kq71Tiz2qeo/N8RI=;
        b=YxBQrUvU2crF5CHVz2Jb9KBPGxuhQSrZ5W4wbcUC/SgpSUSGZLiyMGypNBuu39u44E
         /73BeYLr1CDiBu7aNhtX5hXLOCrSqm5IPh61hHByHMn9YQZEDc5FMviz3IDUMwXZMVvF
         PjQ7GlpVpclT/PxD45bElq7Iy6f+7nAWR9cjrbqwTZr1AFYZTP/HnmWPgxtaeQ8QfQfw
         knBT/QtB1fJ7nMfW06japyBu1cHOoi5ynBhQluFG6WzVPVxVLoh2jOdwptws2ZewrrHK
         R3VV6afzBucM7t5ukf7J85vjhjcHPLy5q3ShbQAaqNudWX+KhWoUybCViTvX5yWpVe1X
         4AUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6v2Z4MGcu6YQfGme6Cl67hx69gMjTDJN4QmwHHog0KJPsToQEOY/Q4/AZQw4tJ5+Lrz46xD0Z5DEFbJh4@lists.linux.dev
X-Gm-Message-State: AFuF++nDr7uthCZAbwtvpNUFFH+mWR2OcXMkI23IYRmHdmxkX0acov15
	lwPCP9BWmk8Xo7Pk4isn++MQ7dMAVVUukaoGgjmo6qSYsJ0Ietz9LumrjsU+R3PVZcST5c1KiwP
	f4Qe6f3wRWf09gyc1Xl8JpmMIpmKy+RM=
X-Gm-Gg: AYBFou35Wf+Vg9FViY3AArsXtUefyTI6LBV2I9F/SWArgSKGyxHXlhoiy0JMbs3cx1Y
	Svns+WkF3lsDW3OhphgyCElXT1xYQ6Nad8qWkq67on6bTHRn7vvknwDiWGJPsObiFI4CZ9dspaw
	PtmEBku5Z1BjnQGtfSl2AHuBMmIVjUjQv5LFSTFQTt+XYPSZrwJeUHcSFXt1A4NISlWlfWbU6i2
	Y1PqFFOZ383dtctO9uzln1wRtPfzfx9LyO+PPJ2BcXjFuAdbzGC/KoIdGRmHSEyWV19Dw9YpAkb
	gpkSSlAP1JQ7i6ojdfmw8c94pm45gaUyUWEUzuYM5TN9fe3Jo+1hSQYUFGDgNc2DLFKMHUXmKta
	NHu0fZD2nVR3q86MOmONGsLGznT7F/+jCN4M39a+WGTIryOD5ueWk/1qyO9/y12L38n5pzhi3NL
	W6QE9Uyspa20g2dsWEfMhCLoyocCqJzoip5sP4tciZ
X-Received: by 2002:a17:907:9625:b0:c2e:2275:1168 with SMTP id
 a640c23a62f3a-c2e33fa28d3mr242508666b.19.1790863377337; Thu, 01 Oct 2026
 07:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001133736.802604-1-tzimmermann@suse.de> <20261001133736.802604-3-tzimmermann@suse.de>
In-Reply-To: <20261001133736.802604-3-tzimmermann@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 Oct 2026 17:02:20 +0300
X-Gm-Features: AclHuK-Ck5Qo38vd623LvGwdR2qBOOVXPJ98wewQWMKyHiuuGCBfZRXpFz9rHO4
Message-ID: <CAHp75Ve1-LhMaLczyOyLYhXaHzhRVOTsG4Wi6c-KPT1VQJ-nKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/kms-helper: Remove struct drm_simple_display_pipe
 and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com, 
	ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 4:38=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> There are no drivers using struct drm_simple_display_pipe. Remove
> the data type and all related helpers.
>
> The idea behind struct drm_simple_display_pipe was to provide an
> easier way for writing DRM drivers besides regular atomic helpers.
> It turned out to be more complicated. With all drivers being updated
> to use atomic helpers, it's time to remove simple-pipe. Also clean
> up the related TODO items.

...

> +++ b/drivers/staging/fbtft/TODO
> @@ -1,3 +1,3 @@
> -* convert all these over to drm_simple_display_pipe and submit for inclu=
sion
> -  into the DRM subsystem under drivers/gpu/drm - fbdev doesn't take any =
new
> -  drivers anymore.
> +* convert all these over to DRM and submit thme for inclusion into

them

(spell checking?)

> +  the DRM subsystem under drivers/gpu/drm - fbdev doesn't take any
> +  new drivers anymore.

--=20
With Best Regards,
Andy Shevchenko
