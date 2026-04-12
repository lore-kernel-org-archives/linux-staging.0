Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F101A6808
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776009966; cv=none; b=hhZZ4f7HKf6Sfjq5h/VIYPmRILzGAln7IQmn7jK6HOH0uOrNRHEuUfI3FUQPl+NJIT2iw8CQxX0rOfLN/pFtVzdYmi2gcd949/jMCovmNZlmnG2mOsjt6ju6fzponAxAoRWY8EyolfKJA1UjC7SBovMPl9beh1lYMwq0p3fgzwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776009966; c=relaxed/simple;
	bh=NDKr9QdUyNc666EXNPZZTTRT8Fp3Utw5Fsw1pz5zNCY=;
	h=From:Date:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oVVJxeNYHsLhNH0lAQq5VHoy73EBt2aWqSwR05p58Yw3N8fNu3pKicycriJqgSwH8dPt7pgAFHodMa1ne/LUUQxO/P/CWoj6dW1t37ifrOD4TXz7cyMSZis+7JO0bTyShO8hSf1nn1PR2/Q0+WVeSbge6H/FBNw1dQbtg4dHbGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFx4dqnx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFx4dqnx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a29e6110so39818735e9.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776009964; x=1776614764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YNqyYozPV+H8H8mQnpyUjNzrBoRXycgD4jouK+hqsBk=;
        b=RFx4dqnxtCoVNE7LlKcAfq3qLMtNLooZ9NRbQxT0/UVSQmAWoE5GSD6ku2Kr1HZccz
         bXAz7/76tk9EqU+4Kd0Li7fFmZ3nCGI8g5b1RpYBdKS06RYDVPAJ1v2h/MVyQmz5QZYN
         w54dvHbXCACwQfGpr0sCE9Gl7JrAfsmuDk7PVFdlWIfCXxgYzz15LoWQl7WXx1jYCzfo
         mz8ie5fvp5Wv7KdrcCzwsVqnRxzu7Al40Yjyte0hG56y7S2efzyRZsmqgsRIGNK8C4Tz
         6Y/NhLldpBE/IM0Tt9aQ703eUbGibR8HfKEA3Fr9tyxh2GbGDeCbtoAWL1XGovtw9q8S
         M+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776009964; x=1776614764;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNqyYozPV+H8H8mQnpyUjNzrBoRXycgD4jouK+hqsBk=;
        b=m2stk5wEMgqlteyqbFmfjZM4IwoiOHzqCtoSbuBP9y/d5+AA3GlPlViW5qfe1rk9WY
         +AqfrBWBaVJoosuLfKK/ooKUWxzkfvxS+2TWSKnQjY1BsbUwf3LWEZ54tQMOTvrS9AH4
         pD5H7N/C7ZOZ/mL2LoXnR9a4stWjNsBwM/UG9iFy8SMz7+CxXoQ1OwZN7m8sFSG6uquZ
         HXwFT01C/Igt9Pa6nKcm2tgL6uiUjH273hlh1/wCeKOFOyCtai6qZYEYAaEvCdJ/Dhmg
         h1KhH6CwHH2ElA/HmVJ2+yqAdg+En9d3bro/ImDtpVXXU2n+X5HRriHwBhpHcFT0GvEW
         5iGw==
X-Forwarded-Encrypted: i=1; AJvYcCWnwWnY7BsgxYmtaoJ7vvcyHbj3tMTgPNWGRuemzDv4Kz+GYBOaaeb5m+g48cn4KXvDH5bwMDmicTfNrjwr@lists.linux.dev
X-Gm-Message-State: AOJu0YyhBEbutoR9Dm5kt52WSOpgssQyLSXllAximJWzxAdC2SgE4V2G
	voL98b8ZuAGw7CGJSvTXqvs0qctignERhjF2yUtVfcZq9NwVph1DNiazfCUz
X-Gm-Gg: AeBDietEurHiNiFu9spWnl06o0pKtyurbkdqH/C6MIDuXWn6EGbBxgmgkbgph3kuTSt
	8LgMkoahsCGUKRYLvFVTK/VRzScfx0UYsrbG3mE2YlykUtwD7t9SHdCgGGJSTQrad/Ff7+ExsaF
	0tUB6OykQ6vkeTXFvkNp2AWSeAhNXFL5BrAby9/fYueYhQGiStNMAL5BkE9cFElk26W95cnvc2w
	8HIgXTWkRmk4LgK8Df2aQuD7ouZcLsUhBCX+ZWxGDetswIfmjcErOa4cFoJtK50afXYCd+X/nAZ
	GT0Um3j8Eq2D23F5Ozl1ce/4QAhP2hLMrsg+Z/4Sdo1kQpiFb7GODb/mT3B1jUiKrdP/Vfnvpjk
	AZYSh4EbThCIhMzXSLOrX9UNdVO3rco8Qsp7jRkviTVp27NIPE7SDulQOmtI38zjl/xemKy7EHW
	rTZ5zDYo3GqaRO0r/NzIvqmFSQgCtKxKh1N/faXjgc/YRWq49z0+sF0yaq2HDdE1tNgJO+RB4LH
	XRM6O2rD39rRknpiUj/nyQ=
X-Received: by 2002:a05:600c:474c:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-488d68101edmr127318045e9.10.1776009963842;
        Sun, 12 Apr 2026 09:06:03 -0700 (PDT)
Received: from ehlo.thunderbird.net ([31.223.145.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm26507849f8f.33.2026.04.12.09.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 09:06:03 -0700 (PDT)
From: Luka Gejak <lukagejak5@gmail.com>
X-Google-Original-From: Luka Gejak <luka.gejak@linux.dev>
Date: Sun, 12 Apr 2026 18:06:00 +0200
To: Josh Hesketh <josh.hesketh@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/3=5D_staging=3A_rtl8723bs=3A_remove_?=
 =?US-ASCII?Q?unnecessary_else_after_return_in_sdio=5Fhalinit=2Ec?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260412150633.12071-3-josh.hesketh@gmail.com>
References: <20260412150633.12071-1-josh.hesketh@gmail.com> <20260412150633.12071-3-josh.hesketh@gmail.com>
Message-ID: <95E8D91D-326D-4972-90BF-098F3EB556DE@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

LGTM=2E
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

On April 12, 2026 5:06:33 PM GMT+02:00, Josh Hesketh <josh=2Ehesketh@gmail=
=2Ecom> wrote:
>Remove else branch following a conditional return statement
>
>Signed-off-by: Josh Hesketh <josh=2Ehesketh@gmail=2Ecom>
>---
>v2:
> - Rebased on staging-next
> - Split from original patch 1/2
> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/sta=
ging/rtl8723bs/hal/sdio_halinit=2Ec
>index 4a4f6b03253a=2E=2Eed82860ae9b6 100644
>--- a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>@@ -641,11 +641,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
> 		padapter->bFWReady =3D false;
> 		pHalData->fw_ractrl =3D false;
> 		return ret;
>-	} else {
>-		padapter->bFWReady =3D true;
>-		pHalData->fw_ractrl =3D true;
> 	}
>=20
>+	padapter->bFWReady =3D true;
>+	pHalData->fw_ractrl =3D true;
>+
> 	rtl8723b_InitializeFirmwareVars(padapter);
>=20
> 	if (pwrctrlpriv->reg_rfoff)
