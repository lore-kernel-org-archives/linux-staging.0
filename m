Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3530A4A5C28
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105960; cv=none; b=AHOtMYMRsYPSrDWoDxvzSHxr5N7g+kKD+cI+a32vTIb/Mxw9ZGXh1WxKZj3rfBY7PB+qiX8NT08WchLvO0iFYIe32TS5AI2QU5LOtuawhgT3Ab6D7ymMvFcx2TnzaeUo6GPWBq/PPoQVJzJm3O779ZVEv9Fh3wBVyk4h0Fs1RTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105960; c=relaxed/simple;
	bh=K4wKYbY7lU8zUdU+RI5QB9tTpmwS75+tA5THD4vU4oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrzB/9gO39KhsDRJBBS0E4w88jwUQxiBbCh8SMmjuXUpJdVxzZf7uwWP6SgJPLlBx9Ly491j1Y6dGUsPwH+KSQTmM0CzhJfZ64HOszWA7hC2KnPGiOrPrlNm2gEE+z17EKuwakuHuoXTqx1384Cf4R6lX4XPdFO1G1x4iMXr4Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knr0S0Mp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knr0S0Mp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso1009395e9.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 12:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790105957; x=1790710757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nL0RZ42dVFFkNwcOaBBBW2RIorolWqyGdNFfDoBAeZI=;
        b=knr0S0Mpt/OsQTtIKGoNs8QC9e5EkSt3uswhbNOZv16ZMyKxoyNEgvMwtcqyCAqE39
         E8rTAfmmzfig+s4Wr57/gWGTcKyISoxk8+dG1TNuZEjLYghA1LxEWanYFDJ6BlxRW02e
         PmO/iqNT4QML5kGx+nev2HvMhLsLFdN+hD+hDlq6cZU8TiArTFzxFYwNZVCUQvVfWM+m
         3HqEHNFazE3Qc9611p8uCkzwRgp3bzRITBRWgaWRaocfFKyGNy5flC4pEs+KP2xGS40z
         HvrrcyIi5zjYX/j8q2nQRG1IGTcsh+z9k3us0spxsz1nNuLUKieTdv6kiKEsPZB6aDFK
         cDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790105957; x=1790710757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nL0RZ42dVFFkNwcOaBBBW2RIorolWqyGdNFfDoBAeZI=;
        b=MS6pJrN99uLDBHVMRlx6gso8ww7nVxlsq2YmW5O3fGpq+wulp+tG/wgtaSocXBqp0g
         2UufSbNnVMauuJiGpSw3zx0987mqwC9QllaRCjEu7fb3EQJdJEJEXIpwYc4vk8DMtaR9
         YIQbuXux1bn3l4RrUjhusXnhGX5w4BhfutrmTepUnADXIp6ZRdgxp34wud1zbiFqanHy
         aDILKT5gE/mX9eyNq7hLGpcWI79A04bhS0k92SUaU8NdgeNJ7zhLZq6hNxTyrr/I7Sgv
         Np4MOekgiwHAiAiYjZYeqUqldIlRYu2+5bs4dBTy4HlvLJ8aiZJf0QWYEEbZStjNEA9B
         xDRg==
X-Forwarded-Encrypted: i=1; AKwUvBztV/j189KoOTuQlBSmFlaXZiu/ufHFO94uYf1Sjm4TVnzE9wtI7N/vuPDOMe9sqaDOHk0v9ug6sauu1Ehb@lists.linux.dev
X-Gm-Message-State: AFuF++ldJCL3irrklexr2ew0GE/wMMezib9wOVOOmwBikaefDMFrYC4M
	dzOzBCTR35U9hAimsBtbOWUgx9cSFuJKV2xIh2adrrHTZOfltsDOpbu/
X-Gm-Gg: AYBFou1nBXnaRKAJZpi4Chv3U4A2FuJkTwcyAREFXVnX9PPmpkqR7X4Zlcuf9V1Xwej
	hv4k57EFIfqnTE5decGnqd7Pvud47VkQL1iLcQhTSlrb6sDZ86OUb2EVNGPyEOySIdeADJ0/zT9
	tNufRe5GBLwLnAGri3Eq38kdMjDvQ+yo5SyRu4zymjrpkfsp/zyHU6xR3mqfl7lGlpFGdcYFKC9
	scosl0BbV0bQNK8xchdNlSfqlnGiO/H3647gyWY1GkHXzhWve2E7/Uf4uhn4wQJ2xTAJhN/7BFk
	kbR6eVdczmCBxz6VecRxyLDasKo1XJMyRxbnHpU5Vl9VoeJVGu7ottFhnTvs/XbmuzF0dEfEa9V
	EtdsQBoRKtaaasCHydsoBFsLgG4GI4K8EaWKrBHR5RxGfC9uYwgSkshyc5j2/8opO/vYKOnxNsV
	7Ft1pn0BnFrohO6mail6e8ezypZBBxmszuKlqJ6de/8d+QWYnWxGOttC49083H4c5PN9O1dVidX
	tD0qoJxF8fmuCpJRn9jcQ==
X-Received: by 2002:a05:600c:8b64:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49fdee0a0ebmr2558085e9.4.1790105957383;
        Tue, 22 Sep 2026 12:39:17 -0700 (PDT)
Received: from localhost.localdomain ([149.7.5.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf157cdfsm2494235e9.0.2026.09.22.12.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:39:17 -0700 (PDT)
From: Vladan Kalaba <vladan.kalaba@gmail.com>
To: gregkh@linuxfoundation.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: vladan.kalaba@gmail.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: fix const pointer declaration in sm750.c
Date: Tue, 22 Sep 2026 21:36:53 +0200
Message-ID: <20260922193653.16086-1-vladan.kalaba@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix static const char * declaration for g_fbmode[] to static const
char * const as reported by checkpatch to cohere to Linux kernel
coding standards.

Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1ea3dd8b8f28..79d0221cdeae 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -12,7 +12,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char * const g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.53.0

