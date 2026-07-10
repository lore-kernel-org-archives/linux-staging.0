Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEEA3CC337
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680438; cv=none; b=BpltOpp1Tig5+EIW/ve8osZcK3q/7dCT1FXNU8pKQ8b8MThroZ3VrnlImH9cGlls++9OLuNVLLTIe30VwpaHatTHMql3p50BkmfFZJx6M1QICmBy9x0VTD+WdkLV2BM/D5J10NWg/IRwSEkSLl7pU7eVxgi09VYp0U6as10t7yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680438; c=relaxed/simple;
	bh=MxiRisfwadiWclvmgyyoBSHds8gsgUk4u3TFe+mtFkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSgDqcg2gVTeHa720tnHhznl8N1mSw2eglclTsaNnGFCoZu69HrgcgFgfuR0LJN/OaRe3syXi5ddFJWiPufzD63UELS4jNtkmoY7vEJQG0eI+C0bvFRcCs0PXZUXk1Tjp7o4kRokl2pDgDpsGrv+5G3UUztQQgXKfo+WUgd22Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3n2u6/H; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3n2u6/H"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso4964935e9.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680436; x=1784285236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2YRIvqf248utTGrt/z3Sr4w4/zbrFsLnOT4YJIzAlo=;
        b=P3n2u6/H10JI85+CtBlUSDuTpmXt9pSMuGrQgvFJZRnUMkX0G3qoKmr8NVyNMNzrjd
         skWjrLNFig0lgkLEz+z2R1+zCVVO6FMk7tgKXWYAfLwzyOt3ygiVk5xvGSVvhh+GXvQL
         egiwXBAxhzGnkhIj4ZINNQd3OSNiAktTjtwMeCfpPvNdd4NNyjY2WRwpXd/DFmd5cUfL
         aVOFK/rT2W3fsN0FSavvBQE8TdNZ605OjUyBMhp9xl4BXTNgk4tWDEvTnKByrRa6NNqE
         htwV7lwai3OmVmavgXz93xYCT2OwejI7JeAbwG6AjjJUAvPhIOFbWNttoC53Koi3UaWV
         /WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680436; x=1784285236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2YRIvqf248utTGrt/z3Sr4w4/zbrFsLnOT4YJIzAlo=;
        b=ZtSsvnEsh85N5kzG3dTbsIJejwfV+FQ5a6EUSX50a61a9I5mqiPyoGtQNOCLD3ApaD
         OOKS6Nf09W9NNBtdnGP0eHkkDuRBZO3TF5x9x5qSbtkXIhydTqRHacj3IZpsKvaaDeVQ
         P1R2jY4vb1X19xdUEAChDjXcX8jrEwxiN7hzV4SyOKlW1laFv3adZ+xqX6WrHbgSf+yC
         +I3gaJDBXTSmEbvxt4IRgC698fSs29BdFxQ/82s41U3sTBND3C7Jzh1bspV3WnhQVP5l
         rBB8MtvfflbCU3ME014T301y4fIzfpizjgE9x13nE+olCB3HF+htiGNGaKq5Ih5v4ONo
         iP+w==
X-Forwarded-Encrypted: i=1; AHgh+RqQtC62q68Gy/9iBtjyv/Ah24oL2geRpilLHNba9ApgPuhnplpNsDAfLkMFQcRLZaRa0YVGb/csGguKQpXC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0GrlUL1YdNF7+8qgesCCUWJn7GFQGcIX3NilblmpeuHDDSpgr
	MumAJKQCUbnsnoVu4R11UxqrY419gW9R2pD2LbDq/cbndkgq5BFGBETg
X-Gm-Gg: AfdE7cmuoCErDpPmrH6savGp0QDlm+qTQZunxMy3KsckilxElI8/2/KAFRitbb5Jsej
	YIxOijuDSbJnuy2jgxshscWaIbQWfWcUtpLZHg8v+UnTO3ZcTDE7ERsCnfEWK1PEJeR+/naG5JT
	XVD/12ohEv6gQwK6dRI9XmlR8UfGqquG2lKr2lZhh5mBdVU4HNXC+XJgwVumoZAC1YKUfb61xnK
	I8aiVkM6gXJz1jfOQHhs2NUbiT8h3dCb6JtER4PevDL3IPDCKZzwGVYoz5wHcWPjRW95jPgVrdr
	lzsxLaiJKuFyIOzCfk8Ssq+xjQfuVLGeiSJHE22QNwVMiFJ9VBbCtj+j+6FlLTwxrXD4xsZDy5r
	4lo7iJM9meGQ3OADfSckIkFJOpp7mHVvockiOhlrwmK/LyCDtynhbJRtoxFtxjzxOjlQME/CreJ
	AnWXqAoCVjTdH7gv/eVDsMrgZ1oufAaY8jnMj/WGuQ2iKsPTcT5egfnMoAxDZXEEYcdBAuf+Cq8
	/yAwQ==
X-Received: by 2002:a5d:588a:0:b0:475:cd6f:721e with SMTP id ffacd0b85a97d-47df07a2965mr11743272f8f.44.1783680435665;
        Fri, 10 Jul 2026 03:47:15 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm66551861f8f.17.2026.07.10.03.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:47:15 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3 0/5] Rename camelcase enum values dot11AuthAlgrthm_
Date: Fri, 10 Jul 2026 10:45:24 +0000
Message-ID: <20260710104529.5366-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780343502.git.fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

This patch series renames camelcase enum values in the rtl8723bs driver
to address checkpatch.pl CamelCase warnings. It also replaces spaces
with tabs where required by the kernel coding style.

Changes in v3:
- Dropped v2 2/6 as changes are already in staging tree
  after rebase or unnecessary

Dalvin-Ehinoma Noah Aiguobas (5):
  staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_8021X
  staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Open
  staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Auto
  staging: rtl8723bs: Rename camelcase enum value
    dot11AuthAlgrthm_Shared
  staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_WAPI
    and dot11AuthAlgrthm_MaxNum

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  8 ++---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 ++---
 drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 12 +++----
 .../staging/rtl8723bs/include/rtw_security.h  | 10 +++---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 11 files changed, 53 insertions(+), 53 deletions(-)

-- 
2.54.0

