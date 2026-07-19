Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C7346E55
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784462206; cv=none; b=cdwnOdnxDB8bvIcPXLKsOMQoHO2iTOnS+1+PyRdROl/aR68aPMM279lc+scSuatrZntSxRi9BQwyLMcW3qpDJVkkZpH37Hh4or97aeF8VebLZfhJek/PtbWPNINBhYIjdL2FASPbrCytxj8kVf+anGPGRdu4wLfk9wnDij4E/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784462206; c=relaxed/simple;
	bh=LL/oZLV9U4zPlxqt0eVcrUcsIvW1uvA1TQ+oZnOAH54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/tYBNhkjlUeW6SqC1MyCklfX96HT1RHAsnu8XVROeErqVbpoamMQBGY4DhyDkDkbEZ5bKVROkcNTq0Ej+tNV8a+VxNt5g1iYQ/Mf/ViFXS2Qcf7dTFjZjQfmrn8fVxaldPkG/M5wr7E7Zx6IjVd3qLyeXqHLSgjm4Ehn/R6ds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/Hm6qhJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/Hm6qhJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955de8797cso328925e9.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784462203; x=1785067003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWLxoYu8g8gmpRY1960tO8sHRap+PtSpnsliL1HMRgA=;
        b=i/Hm6qhJunQItvwcx59sV7XLRRR3JnuVz0VzoBD6R5u3HkMhHJjwEfO1H5HfcF+T2+
         ktmKLkdLp13hMvsAf/SQwm8A++moz7O8Fq3sc31XSAQfsKR8NGAQC245KinCTdbn93JW
         VX/F+vltdWkuTdFm2nMd4fe7J787LGLplyJxg69QDweJf70VbVIWKU0iZyOwE5THZtD2
         +r5foSbqlLTuVHYbqgbzgnmkVY11O28oQl0kIH09Jus35gZc0yhI9ItUY0TjpyY4zkdd
         QZ42JS0u2jQQlGqiBlzsqr1wIXeqaxWGilsJKCiBkjBpl6a5mJb6wy9r/Nmc5ubTUN8H
         zHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784462203; x=1785067003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWLxoYu8g8gmpRY1960tO8sHRap+PtSpnsliL1HMRgA=;
        b=Uus+Sks8h3/vc7pDJwJxuU6uPfR93nlTdvn//Y9g0hwDXECPfWGKAKN3Rb5m88a8BO
         23zheX+WDEN30RCnPY5XkAaReCDW+WNk1JrNrE8bk8+Qcms0JeNDu85VYvby7teaMyLR
         L6PZX4Eh0XvgzwM+P92MM8/4yZxA+abyMx/gjVYrAx9inZ5cbI9qh4mppnh+dm4nMUjW
         um1ywe/HQxqGs++2StTnsOxmlobZ3WpKU9KIPq4NFOr5dr6YOZLe8En072VeWWi69w/E
         FyzgWkWoCVUZoNiNzmtHXcumd330DyIjyETFlaCGrd10UgHnbm+0mF+RbdcTED+YEqkW
         CKqg==
X-Gm-Message-State: AOJu0YzLlJuHVKCBzK1NxHkoDSAtxzEdmSqK7LSGNegptnL4ojjDxayr
	X8EL2ywBPDeBvUlxMmB4q/H9Lv/Fcf+4UkEFSb/yX/YmL81LGCVXN+08
X-Gm-Gg: AfdE7clgwbq1gOKoAPKFczoVT+2r60ki6gr6/SZ/Nsr/Jov2fSEM+RbLIO2YAe11YKs
	MFpjbSB+Pi9pJkvughzPPTEPhuXIHauPdBy0FEnQhr8S5Np8/Jf6111+L87YiN0dm/tbk1mkyYU
	RnB+6tpf8C/MitwUB8s4DVHLxzoL1lztbW0HhnBOo2Z6gKstCKfI9wblVq8djz/eFooA1fwRNoP
	Y0sMntF+wTYYkCGM1hRlW1UqWTRlXUZChM0ajY5w/k2HqYL5Gl/GkhadE6HrwvAorKFAuz+XdiF
	nzjz0zsm0jt0dYOtFng1k05iTAE+BMjJGc/rfpAt3i2cVlBcIoLs6jiSKP1q/MLuxcOH9UE0nHS
	ftbwVxPCw/akNpEn6bny5m6O38UpAzY1mKNAHc0/DpAL8k1FjQkiLvJwuEjqgVtfSfV8eaR6VN6
	riN9psiEM64E5QjsqPJKHi5p+XvB6YhrgZ4BuP9Oypr+bqiGc/lcFJXZIPulj5u39VetE=
X-Received: by 2002:a05:600c:4755:b0:495:4a34:16e3 with SMTP id 5b1f17b1804b1-4954a3d0d04mr112766685e9.1.1784462202955;
        Sun, 19 Jul 2026 04:56:42 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a35830sm199719265e9.3.2026.07.19.04.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 04:56:42 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: Remove whitespaces
Date: Sun, 19 Jul 2026 11:54:48 +0000
Message-ID: <20260719115451.4401-1-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch mainly removes whitespaces but also includes coding style
fixes.

No functional changes are intended with this patchset.

Dalvin-Ehinoma Noah Aiguobas (3):
  staging: rtl8723bs: remove unnecessary whitespace
  staging: rtl8723bs: wrap line over 100 characters
  staging: rtl8723bs: Renaming variables with type prefix

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 300 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  56 ++--
 3 files changed, 181 insertions(+), 177 deletions(-)

-- 
2.54.0

