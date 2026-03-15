Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5A4370D4A
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773612544; cv=none; b=NJIS7kHIlQJ6DJPisALdG6Qw/GfSG2nhvro0KLmt5Dp4W5gYVlyOdpyrPYDCKfW1we/k5SiPN/m/qAVXx+nRV9KduwLIAiEbwjqRmpmd6i3S6eRkd2B6xuUKwfDqk0vNgIrTpU9piekPO9DBMa/qBk4xpDt2nHoBuCX104QDGJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773612544; c=relaxed/simple;
	bh=F32G5v4g0560yjQoUsa9aBcS8+2JCBJIJaqdpIteghg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=t2GQ8eKm+41ljVBuKwgFQoU7Y0yWgVy8A9PKVthxMls+V4lwdFCclfifBnner/LtbmMuiqeIM1Dr+QZkIOqbRthbLFAF1lrdwRJcJgZacyrPNIh5M5kebGxbxaIGdtSGBtKoidfViVp/TUrV2fDD1fFp4t7m+uzSg9r3munSmu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAoHbVRN; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAoHbVRN"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ae222d87dso3574636d50.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773612542; x=1774217342; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwU8AQ17POy7BFOWiGWbigjM58uExMEEnEO1I7uCiJA=;
        b=bAoHbVRNdtGMPsRohzZGU8f9LrY2yd/1UUIJCSJlEnKMSFgUIc/irELU73XgAf+Eih
         cdUks70pxxpW3vBkRJQkZpXQBCm80UuJhLHDpLlXyMAf0HuutDcb26FPAIDWOpXn1wM6
         m7bSS2E2IrfGfoCMQVspj1kosTqwtf+YgGSt02+d4UXZf6v5CK3ACofZeYFz0nK8C0hh
         dXPhtaR2djVg+LgG3tI4s/c8jTX9U+KhZBc2yHon7xw15l5bgIJugmLRg4ETLPyC/axa
         Zm4zzFssISln0UV6aEe50o+OTMitl5ZIvN6nqDZB/q8SEKbKlUdxhlUyyBsrYzOEAFha
         7a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773612542; x=1774217342;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwU8AQ17POy7BFOWiGWbigjM58uExMEEnEO1I7uCiJA=;
        b=M00PWGUav9kz1lgZaRG5VlJmF3EUWWNjYYg64BQwJ+uoYV7q/tUHz/ijb+/J7w29Cy
         tI1uFAd1kH9NUhGwMCf9TIIbuxjDbsa9z1YGCDXxn89r26vHvrsQoL3fMOY7QIPzaLIf
         DiBneF7leYswAECftjSoderhV6wlf+vFgzhoL2mCz2FufQ0PmtcIDrxJJjNzvSmrris4
         JotG+KO6g+NKtaCKu8x9oa21bmVf62RmOvgEowDnCl/WnPrpDzpApiG0VRsKzXcKv/uO
         A8o1GPm0Da/VsNkTzQ8BDP8Ka7yTG9PMRSTvOv2bTFhmv9s++/VZ6ulN4a4yY646pMns
         OukQ==
X-Gm-Message-State: AOJu0Yy/4mjN9uh3kEVr549sX1zSam/rGQfSI5b/HY7VWlfA07Hj0z07
	0qmqSZYjGZ9PxPYKO7aevwghgKWzfofjMzVoELHiGUzJevIRxzBsSyDr
X-Gm-Gg: ATEYQzxUOjAlj4YxR05IItogK/th1AjxNV/ie8xk8AYnZs9p8iSqSDG5x0i/PRKG6YM
	Cj9XFTrgmgcKLLUCEyWJOv2XqC3aa/dSFt3gDXmNtJnQocHYe2RwgWzKtNeEWDmQFU4x2GdZymN
	aDrbzkOAizRQYAsEInq6QgCtbKYizy4MJKqrSq4ifUI/dq2lnrw3EyrPy7xlI3VwTLtNoBRBWJQ
	gLAjSPRHDJPSUFY7XEFXD8QwgsQGf8e5yMQmfJswvB0o4SyXvdqkg2wX5cbBWivxfEDoRf9Kwdf
	feYqgz3IKEkL5QkxTpg9w5oIinPz5PkEy4GLHi7Tn95yD0T/ugM5fmMxYO93yw8hs7wyqEbHY2D
	qIHe8TOEahjnsXeYk1eC8ZVTuJkt5v5LXJ7pI6bBU4rVMa6dtOrgFZjMFlifA0u5NlzUiGTmpjp
	1hRzkmnQl2fXJEeAKMg+JYKg0FHGoBhcWn5aWXqbSQWGpSMaMtFDRpfFv0zOyw6Ze/2MihPGi9U
	exAhJ64S/nJjR2GKIY0YAkz2ybEjiJilJL0T0ETQ5U=
X-Received: by 2002:a05:690e:254b:b0:64c:f14f:8f7e with SMTP id 956f58d0204a3-64e63065d8dmr7604198d50.47.1773612541693;
        Sun, 15 Mar 2026 15:09:01 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65ba7b31sm4640385d50.20.2026.03.15.15.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 15:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 17:08:40 -0500
Message-Id: <DH3P5ZVHB08C.3ACSOF75W3CQ7@gmail.com>
Subject: Re: [PATCH v4 0/2] staging: rtl8723bs: Cleanups for rtw_xmit.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Ethan Tidmore" <ethantidmore06@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260315210550.6058-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260315210550.6058-1-marcosandrade95963@gmail.com>

On Sun Mar 15, 2026 at 4:05 PM CDT, Marcos Andrade wrote:
> This patch series cleans up rtw_xmit.c by replacing magic numbers with
> proper macros and updating the sleep API, as suggested by reviewers.
>
> Patch 1 replaces network magic numbers with EtherType macros.
> Patch 2 updates an msleep() call to the new fsleep() API.
>
> Changes in v4:
>  - Fixed commit message line wrapping in patch 2/2 to comply with=20
>    the 75-column limit, as suggested by Ethan Tidmore.
> Changes in v3:
>  - Grouped the patches into a series because patch 2 depends on the=20
>    include context of patch 1.
> Changes in v2:
>  - Changed include from "" to <> for linux/if_ether.h.
>  - Sorted includes alphabetically.
>
> Marcos Andrade (2):
>   staging: rtl8723bs: Replace network magic numbers with EtherType
>     macros
>   staging: rtl8723bs: Replace msleep() with fsleep()
>
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
