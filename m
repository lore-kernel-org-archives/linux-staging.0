Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446613ADB97
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242201; cv=none; b=mdfb4aRnD5iDhwJhKXgdPLm4dbudx4GpB+f/ne9g6NYmjxSpKXHKiQ1rVe/+P9mjq7KL0Ia7+qlhgll66RIPtANoFuLoPdJEDp3wKxILvrLYghoJmV62ahn+2CEynwkaQ0wVBrKFdTiwiUSIuT25pmeXnpZukPLjxDHUBDif5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242201; c=relaxed/simple;
	bh=GC/20lUMiv5zWeIvVU2NUR93Kus1Ecga3Px16NnJAaE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G0xsueB6TNYkbs9Mo+JrKUmMWOxW4o7ZIvuxU5AqLRlSxgl7T464QwQi6qgqjVStW1rWwuG76CKZ8CzPGPHxSsBrAf0Z3T9ANgb9IjlwvuQT1GYx9Udtoypgs5WRlMh3oEk/WCecQR1AVVwl/8tWh/XEJK07qBA/GNNupEk/FNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJWNRx/y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJWNRx/y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso28713085e9.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785242197; x=1785846997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvjW0eLI9MfIbUJux5+lw/h1l+DunCU7tCxfmqs+MTg=;
        b=kJWNRx/y2qu+LCNNh3UkIes5e1ZKQvlWBR0WxqOuqjXZk1D0QpAzUGSXnpUanxzx4s
         jzj2pgpeiAaAst+2ucSeFbIaXksdFaLk+poqvz7TLQhQKKZEXW7hOSAk09gBVOaGYIQu
         rqNVT+UNAvGk0mXqdb2l9Nrk3YpM7dxvis1H58tNaIVYYpfshC3c0ZgwodSMEUxacMkQ
         eVznAY6HYrR5xcgO2a2J1VyhupFn0rIKgGuMUJ17OQkZJhhXd0x/cKZJqrUXUogbsKsq
         FZHP5vr/L+uwoX3fCUpMNPXNjDUCYH7xm6RgNm5Xf84WvrZLBxGA0kDnx1V5HgqspP4b
         xung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242197; x=1785846997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GvjW0eLI9MfIbUJux5+lw/h1l+DunCU7tCxfmqs+MTg=;
        b=Iy8O/Qz4Z246lcN5gkVdSNWkUbJuzrsbB+LVKjSXdPNGOAACaPKAD+isulGhQfthUl
         tHIM4GN9ijHA+qOgDXQaxDwIpjQsH2sL9w7C9DuqqkvFZBQFxG4ZXnOI+DSD/VTeB4CY
         4nXYnnlPOK64trfO5JqWyFsGsalNNgcJQAT/M4KbkR87fsalmE1Tf8TxyQVY+H2JVuDo
         sGYPyfpTpyNCn7Ay8WJVfhGHsyi7l0yN3Vh1BS2eiD7AU0CQPewYjHH/UlOugbfF9Xu6
         KJgTlvZt646owhIpDdpLfdih2eQKlqnTbth0QEGD1/wAUGMrua4ArjGBqDtCU8Iz5wg7
         LgOQ==
X-Gm-Message-State: AOJu0YzClNRhL33qdlm6vgw1PL5SkHc8I0xaqRvgxgkxpxxd/RJ0gpy+
	9wTIw6NDWZJ3qsRyz8QNAapuz+CQd1BzAo/rLpf2Odd0aaUYZB9+2HXwbFZWdXYhCqk=
X-Gm-Gg: AR+sD13JV5D/btTkgBZfTze9bVZQRWx4lqSdHVodi0o7t2d2QN1SA23adFeJbihghD7
	jWRcWHtejwgnL3O6NUfFtADuXBWxAzwgs4zzowLqTpKfizhD39UKl94tYzlgoZvStpOSTw+jHC0
	pHGUNWQ2SvqD4SpombLLeII9iOcLpAU6DkW1Gkw3d75JtuHcA1Hx3V1bBYAJEKryFfV3hWecNN4
	CmU3jFmmBJRQfLjeebHQNqSft5HpxlSmpD72otAiW9jC+uxCY7Sy1MeM4OXtObW5QswZukW2IYo
	ZYa07hLIVNmLanSoBgmxgt/QfTx7cOGm+JNjqba5hU/xCi9gjquvw4nYqSSNdtuuwv3LDH9EHfo
	mQgp7kpAoTunGm1Nf7OV65CAo/IeYRKsFLr5BVEuhgPZmx2+rLCCg4pS4I9UYffo50qGqAj38KO
	d6DmscEoKo3YtqZ7j0+HM/IkcNTRhDYLXP2eddsjhkY23EgS+l12uXObKDH5EJoIYlnYmIW76QV
	txdJOU8
X-Received: by 2002:a05:600c:45d2:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-496c642c71bmr25828835e9.9.1785242197343;
        Tue, 28 Jul 2026 05:36:37 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4c8d6b5sm216356045e9.2.2026.07.28.05.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:36:36 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: fix coding style issues (CamelCase)
Date: Tue, 28 Jul 2026 14:36:30 +0200
Message-Id: <20260728123633.79735-1-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026072851-foil-womanly-4837@gregkh>
References: <2026072851-foil-womanly-4837@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes CamelCase checkpatch warnings in rtl8723bs.

Changes in v2:
- Patch 1: rename to basic_rates instead of mb_rates_os, dropping
  the Hungarian notation prefixes as suggested by Greg KH.
- Patches 2 and 3: unchanged.

Olivier Tanoh (3):
  staging: rtl8723bs: rename mBratesOS to avoid CamelCase
  staging: rtl8723bs: rename Save_DM_Func_Flag  functions to avoid
    CamelCase
  staging: rtl8723bs: rename Restore_DM_Func_Flag functions to avoid
    CamelCase

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 10 +++++-----
 drivers/staging/rtl8723bs/hal/hal_com.c          |  6 +++---
 drivers/staging/rtl8723bs/include/hal_com.h      |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.34.1

