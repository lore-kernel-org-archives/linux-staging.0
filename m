Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8059A3F99E1
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304926; cv=none; b=bAyeyOQK3qg0vL+qhX30/57ivq02auat27e1VOGIX45+oRRvbPCDIucfPkq76Uh4ZvrxdRh2p2YfzzHiDK7PYwAezKAYc0W9GUARe2Ti5XzqjBKXnTbJFY70T1rLgtGDOAWPzpEk+fH6bWl2BiZTM42DuJUzxANE4t9X9/G8SYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304926; c=relaxed/simple;
	bh=js5YIZieGNv+BgAxNUwyrtKaeyMj2LAOxYBahnsDeKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qy3XFvmWhgFzUo3Ps8R02YuDYbz8t7x12MzuIbvrxb2uT7OVUhkg/HZwaOYEp0Vps7IbkPFBj7DA1dGZYOzxwygv3tGJ2A1fD/gurdpHUd6hIILDGxHIjrLl1VlR0LZK4UhFXGZ3ee0jDqa0QxLOd7CyW0bmbyv4i8Unak49g5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaJy/gR4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaJy/gR4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-471eeac43bfso7507673f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304921; x=1784909721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eErJ7UsE4vsxkyEFYgLY0h+VSj6DjdtDj9bjmjzedNs=;
        b=MaJy/gR4YHE1vUvSqr4USGyk1FEzWvWzHl+8XJgWkGCviQ6x1iYlQXlmNuX5EKucf3
         vGEZok4e3QV7HHWtH4kTf6H058qtxqp4CHnxkQfP6al0nR6yFszz9UBiXNof/Zt4vCpz
         DI/oskjH4sF9KPymrSglmdxcoS5Wk0PBWzcN1DNcMmFQ+MAbBnNL8SP/MByKZ8R0Zo5l
         SpBJPWQwqm8K1eLJl2XqbN7Nib3s/tuWdDmNfTpOyQYwzD6TET6RizZ4qZFGBMTft7Bt
         pZ2gBLsVozB1ALU4Yqgbzr4viGLpZlTS3nXM5rWUSWl8o3iH1iZeHoCOxNegMuHlkIgx
         Icfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304921; x=1784909721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eErJ7UsE4vsxkyEFYgLY0h+VSj6DjdtDj9bjmjzedNs=;
        b=F3Fx6c7cPJY/+qdrs8yBxqidB2iZd/ajUqfKK43QKHhjY0WqukTUOEVi6Qmm3DIFMQ
         P3HdbAqjPx/znFj+E5Ydq5SyGa6f+RGczuv+/+5OBKIxNLLN4PzfMCi7lK8iFV/siVkB
         +dx+plCqDa0N48DGT1bBcHXHqtSNBomR617HUe49hzlfMgEsO3QJVl9bdgb+6w0iZeBH
         iIp1uu5tNzk3ETaI3QH4d8tzD7JQyKBn+/qyCadm3wtTMnjpxCO+qph4awPUZZLU6d93
         4ekJZRQ9j5PscFKdHbkNd/Z0NwL1wgTwDXqAu+jffAI6bMCdFPlgTUi8PVEx7VhMzprE
         xi5Q==
X-Gm-Message-State: AOJu0Yz3jc1hN/MlNO67ZXo9qo/IYz7PmeMvJopOmaBxEakQq/71aHnN
	uTV9FGJHFAwtQ+ZEhSPkSO+07ns8QRkldvyIE8EtF4BUkriaFfGwazYcyDlxs1oI
X-Gm-Gg: AfdE7cmWBXmvFcZ9I07J57NZU47II/x61oc3irixj8YAWdReVk22fSb5tRBICxXwuz7
	U/UP4mLfk0Q3ds1WlWWf0JyK8f+j0i6l4pLXjEu/6ASjeorNFI4cfgamDWc4bcDGJxfzgIdjIJc
	X8Mg3rh1JgsQkcv14TkJx2Xu5cBmUcKeYVfdtmD7mzAyVEkp1FG8q+zENzphqcwyfPAP9NcOk+/
	HNzD8+YAeboLFHpCAuZBwO8+dGnRB1N+5cWz1lTj1yloZ7FgEp6AZxmNPinVF8WwTuYElu8C4kr
	53i0CnFxec31MSn2QE41zl00AoqtIdsLFVUIUlpYskKlea88CC9pZGcVIixnSysYBGK4nZRJTq0
	OQeLr5kmp/WidQrt5oRAS7xtBVI+RvS6YkueTaKBUCpgojtXQtbshGGt7hQJSoNeXD7+eqMhpNi
	c0ALeOyU9tUXc39lTrbV8DliusxFrPRYQCRhBVrChth9klKZZ7dj7wNFIX4vta9sgD4kUtTaY9N
	i7X2Q==
X-Received: by 2002:a05:6000:2881:b0:47f:48d3:c93f with SMTP id ffacd0b85a97d-47f62303537mr4502559f8f.15.1784304921459;
        Fri, 17 Jul 2026 09:15:21 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f66df025csm3252526f8f.0.2026.07.17.09.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:15:20 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 0/4] staging: rtl8723bs: Changing two struct members
Date: Fri, 17 Jul 2026 16:13:25 +0000
Message-ID: <20260717161329.3400-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715171634.1550-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch changes two members of the struct adapter.
Two additional patches ar made to fix some checkpatch warnings.

Changes in v2:
- Rebased against staging-testing

Dalvin-Ehinoma Noah Aiguobas (4):
  staging: rtl8723bs: change struct member bDriverStopped
  staging: rtl8723bs: wrap line over 100 characters
  staging: rtl8723bs: change struct member bSurpriseRemoved
  staging: rtl8723bs: fix Alignment should match open parenthesis in
    rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 12 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 11 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 85 ++++++++++---------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 16 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 16 ++--
 drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 16 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 +--
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 14 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h | 14 +--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 16 ++--
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  8 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 +++----
 16 files changed, 134 insertions(+), 127 deletions(-)

-- 
2.54.0

