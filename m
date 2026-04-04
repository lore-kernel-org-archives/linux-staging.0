Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74C2D8378
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 03:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775273232; cv=none; b=SD5igA9KQlGBViPm73PVe9nAArO+gUFS95Dt40xYi9bcRPbQEIIo3ELVL1exgWjBqXrQ0uo/Vu/D/932j58AR97YHpuJi2Np1fWglFGnNHhNpCbHHll5LDtYd7guUMiQ4+3CBvZP9F/wEKZCdrvIN2fYYqY9OfZfVPk6mMiPpMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775273232; c=relaxed/simple;
	bh=t8P9oFzrvzmoFqKADC3i842Osod6cwb+XDj6vtdAgB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=fsI1l3d3rEZEJxacbbAdUQeZnWDaMdzNjD4UeJpyUyvqpbRZv3zPFEcUlnyIVvtXR+2poFKUtFd0G/T/TZB0CKX6PjZUirpRl7VFXrXhgZ2eU9bpFUgnt6bc3UbiChpolF67rLqgM8nS4m+QDLYohp+vX3eXdTG29Up39rYWdmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ji4pENdb; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ji4pENdb"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-650221149e2so2456814d50.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 20:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775273230; x=1775878030; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuurLS1QmZhbLi0SddyBNLAiF9m9iDBUz9B5P3Uixh8=;
        b=ji4pENdbztqPH6PHdrsVUlt7DqNdoM+h5EGBuoaCKn4/aZC/+vLS47gEPq8uOpeZFx
         bw5eeadlph9hV93cVXpn4fbDf+/Jyg5HKx6JtpzcVwdekXjHyNGokRJq8ZmP58IthsJn
         n9Bt7Iw7rLBvk9cOxRBpLj2/CB8PTvepV9FTr2daqluchsF06w9CiQQa3puDZzNa2/Ae
         xPd6bR2fs2WSoglKWj/HgYRhyphrG+LtH17f0phY1ztc9ika1OKxPdk6kfprIqO8B2lp
         a7qrNV9SGI0uVU6OAeBezygQMMLyjiPUcnVZSreCIGXtK+/K3wlLU/6Z9LUJdR7Fw1jA
         /27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775273230; x=1775878030;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuurLS1QmZhbLi0SddyBNLAiF9m9iDBUz9B5P3Uixh8=;
        b=dD+MNXRnAvNlyOFLlrsyHuuCckxr502UnkCuaj64/mktPH97qWqx2QPD9paiHsmzct
         MsAceFlX4ZC1jAEbCgYIwYEwGDrv/osrR6C/FPJ0GvR2+VLKhQxH3zDaRAraWHFF5LyG
         Gh5PmtwSvj0JUMPFYH69oK1h3Fxoe6UtwaYyADpWq1UDQmraD+Tzt8YrTQtxS7y54Z4k
         7pGREb+2QkjrwGW9v6wyRITRJdB16q9xqfYtg59QNupCsleg2jE1ckmbTnfbTpQF3VG9
         g8OUxc5Ja9reKqPmLrMs3XV7OmuHPuC3AP0oEXhXlowDtr8dJ2tdp6mAei5qI68fHBLh
         G8Sg==
X-Gm-Message-State: AOJu0YzAmwWNIjnpZKUV/yzmtx4h8wT8RG7tspxP7SS5ksnwy1AKPC3Y
	eyckjAGEVj0jmoeOfDisKcejK807GJ1RdSNps8MwZ2mcuJ+efc5q9ET5
X-Gm-Gg: AeBDietX+D83sREcNOMjrIuomV36Uw4kghpLTsA+WkRHEH0qPklr+y9kSUlLmy+lApo
	xpodAPQjHohGLhVbhlWE5f9O9FsQT+2B2fldrvatejgfR4VvybzuvXCWvqoMvkmevqQaghE9Ijk
	vkKYywJsRSaAyUIZoOTuoPT4fNWOD5sDuyUJaeql28sIFi/bea64gXwhy1ZX6QNM+uJu13yDI8m
	3f77nVAm5kPpXVlCeT13QDPCQs+8zC1GlFzVAtIjU/ngYQhpOn8LK/qoWIkkpwHzcsShKlDltAz
	8LvIvTIZ6DklOQtL7P50DZBSUfCOrHy7/J5qMFOkyZa+u6q/klzyaPlvPWZfBlo2Y3wt5ZPgQxF
	3/no6l/WBtwRY8f1icwFYoLblZE6LshHTOIlsXeONZ1TrQ+fUmwN+0cKcWiIsxCuCoIGcs3WS1C
	1lENfmikEvgIPJFNYHl4Nht+aBPR1fn93vunWMcomoRTP5re+q11B8cTIttFxiolbvgz8lXf/U/
	eVxtPgHwScWzhevkSprTKkFCZ/rJC/e
X-Received: by 2002:a05:690e:1182:b0:650:1b68:872f with SMTP id 956f58d0204a3-6504870abf7mr5078493d50.18.1775273230193;
        Fri, 03 Apr 2026 20:27:10 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a73d18fsm3144395d50.0.2026.04.03.20.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 20:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 22:27:06 -0500
Message-Id: <DHK1U5HYRLGH.39JHLS935LWF9@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/7] staging: rtl8723bs: rename/remove functions
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403223327.1831215-1-linus.probert@gmail.com>
In-Reply-To: <20260403223327.1831215-1-linus.probert@gmail.com>

On Fri Apr 3, 2026 at 5:33 PM CDT, Linus Probert wrote:
> Renames global functions in rtw_efuse.h (1-5)
> Removes a space before tab in efuse.h (6)
> Removes two unsued functions in efuse.h (7)
>
> Changes in v6:
> 	- Fixed typo in 3
> Changes in v5:
> 	- Reworded subjects in 4 and 6
> Changes in v4:
> 	- Distinct subjects on renaming patches
> Changes in v3:
> 	- Furher split renaming patch into separate patches
> Changes in v2:
> 	- Split patch into series
>
> Linus Probert (7):
>   staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
>   staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
>   staging: rtl8723bs: rename EFUSE_Read1Byte() to
>     rtw_efuse_read_1_byte()
>   staging: rtl8723bs: EFUSE_ShadowMapUpdate ->
>     rtw_efuse_shadow_map_update
>   staging: rtl8723bs: rename EFUSE_ShadowRead() to
>     rtw_efuse_shadow_read()
>   staging: rtl8723bs: remove two unused function prototypes
>   staging: rtl8723bs: remove space before tab
>
>  drivers/staging/rtl8723bs/core/rtw_efuse.c    | 22 ++++++-------
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 +++++++++++--------
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
>  4 files changed, 37 insertions(+), 34 deletions(-)

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
