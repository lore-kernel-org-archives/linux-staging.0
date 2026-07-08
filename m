Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A204252C6
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513115; cv=none; b=CKtvWnhU/mCMViM2yNZdB3NdzSDyPGMwbBK3ALkDGBkqTx5BXRDZtW3y3o9RIYhLLODjp0McnYh4i/7Gt+n2F723XOTbI6NYUshTAf63GNXJZ9Vx68/xYNocss8bmGfwwU3v6cxIfJbaOlZ1xE8BQoKcyHmyrL4ZJJXPTwXg/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513115; c=relaxed/simple;
	bh=0DT6+nBbiHwYrqCRCt3sRc+wEt54Asr0ltfvB5YuZFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gp4muC0b28ZLRGdAOdzyXqmfWvYXItk4tPoq1j5FD+TWCPbk04IVDVJlsRhZSPVmySPiVjEh5GACCZBaB1X75uRXyvCnYFqEkAj86JCpDoVhKvSVP/97o3QR8rhqjKBweaL6aL9Fh6zB2H+DOVqa7dpRRryHhVKwKwNhcTriW+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxGlvqW7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxGlvqW7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so3366845e9.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513112; x=1784117912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+MdgcEGeJysSuzvsTrS+7TyWDxT0U/H/2Nlys02W94=;
        b=cxGlvqW74o2w/k0BZYu2BO73lOjr0QXDhUxq2aqMlFtKQQIkrED9QbxIFcHmvhJMb5
         uCFMakAYaCuvXDf8zD4B6Q9dT5VHtq0EAPjcqdUKSBJ+qxZCDPVV7zFw1+vFmqjzXni2
         P+x09pnmx4JI2Tqm6FO8+c5hIGLGTiwyqUy1ZU/8fg0JVtu9RSxcCEHjoGI66tlbBqNd
         V+zwpxLvcXAC2mVnphrE6qpN1nX/3XsemBMJFLDiWCqTpRYkkFBAs40c6cFZ/VBrvXjm
         zrYcVP88bpMcBBPgNUjjBJYgmmyI4+QYrkkHUFZiVZd/YzWqvau5KG28JANyLQvaeyZ1
         GPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513112; x=1784117912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+MdgcEGeJysSuzvsTrS+7TyWDxT0U/H/2Nlys02W94=;
        b=JarzEPftnWPoZrHXH2XrlS9Xih+ZC3aqQn13jxrj5jHA1d4+/HN92fYg5h6p3kiZEy
         tZvuqoL/DGHgI0Rlkou1aH+c+mhk+tc9wgxkNT5OLJnUov49UQvPWSwBU60oMKN3FZUF
         oXsMrUMstkAengAJnNKuGdg9MeZD5tfHtBqwrfpjHyxTcwXoVdcJC81VGiolapVP8ViT
         wpWbgECgu3NjTOLvU5OUAtkK+xR64SV7fpCHFxaNgkfO3JqNgghx3V+x5mQO3M1GMciQ
         N9sUFAdMGQF0q9lb1iVmedyyxLdvi72gu4YaF3HpI3CukYVY6GkOL64LaVQTy6hdROeP
         SWcg==
X-Forwarded-Encrypted: i=1; AHgh+RpuiP2JFlfdkJ+li4gRHrn9AsN/g3x6aW0b5frIzq3Q/gAf3qLsJ6W/BTwsBnkBsngPecsKo0wWS6SXDJK9@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyela86IgTdm/D4+Mox8B0/CNI+yobRPskyHNacCp79Yu4vuph
	lZon53jJHhI7mTRLwcs7aU/WND/uC+kn4gBjjik74h+XuC4U6QP1dlm8OFYlHoZd
X-Gm-Gg: AfdE7cnbQhjXMDLxoxfv9RbJZ/P8TIQCKUCwK8JurFQnoTDyLpIddPclo/YiGr3WpGA
	EzZUqNitgT7Y0+vDUv6oc+WaSio2iWPkH75xVrx8pD3AVfv59a3fa38S0ND+lUAdGNJN9REcna+
	T7G/fmnzramHzTaeaov3ZPeeGKkV1hZ+nlFXxiuJ0QdzZG0xiJNbXklbht6egdtuqf9K6Lj7Fue
	mYClWVtiR4g//woGON+0KvBg9bGmUYhrdjbvByE0gNSePAMgyBMi6Cjk2qyrints8dc3VtFMDDw
	SwfjTMYe3KLRKePoFAPDYIXWyemYniC1zTuiTA2yadoIsP0B/twaJps6UoAKAL0PbPedV63kTLk
	SMK3tcGahTWj1UIxc6zRTkRuXpZ+EmBBwKQydchXkwsR1hGUCTSusrYNeetj6RIcUu3czpvBgyG
	ZHMZvOI+WAitoXnKvn0sBDiXlExFg/rWARC7ZwuftJHnHbi4lnFF73uyXKnru2JqdLq/kHL0NC1
	tcHqg==
X-Received: by 2002:a05:600c:6d0d:b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493e68c40dbmr14026105e9.23.1783513112206;
        Wed, 08 Jul 2026 05:18:32 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f50418sm122571205e9.11.2026.07.08.05.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:18:31 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 0/6] Rename camelcase enum values dot11AuthAlgrthm_
Date: Wed,  8 Jul 2026 12:15:57 +0000
Message-ID: <20260708121603.2393-1-fliegbert2@gmail.com>
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

Changes in v2:
- Correct commit descriptions to refer to enum values instead of
variables as pointed out by the reviewer.
- Rebased onto latest staging-testing.

Dalvin-Ehinoma Noah Aiguobas (6):
  staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_8021X
  staging: rtl8723bs: Replace spaces for tab
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
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 16 +++++-----
 .../staging/rtl8723bs/include/rtw_security.h  | 10 +++---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 11 files changed, 55 insertions(+), 55 deletions(-)

-- 
2.54.0

