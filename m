Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DED32ED34
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 06:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778394556; cv=none; b=mcy5hTBiDJI1ecyn5hwl5H/LlOC16pEKVEW0xI4diRtfkUmPH98G+TsnKDBiYoY7HSYvbVx0Q0KcvUvPZdfe+4jQ9j1yIc6sJR76gABXZvyjK1zhuRiak0j/5isGLSoSvLjntLeHODTX6oeXI4B8+wv8uDxipfykzVjijPOvExk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778394556; c=relaxed/simple;
	bh=shkQVw0TxU4H78NOAsGglz2LqBeC2nlQUQ8slzRBTRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gxFv59scFK6Rl9zJUIKxUsUT8vLCfIBbsTBQNyLKrbwjZ/b3ITF/zF+o7tpHQbMTjznMX9GDmmyzK0Z2qbZcEN0pJohAyQCptWuRJW81QDTLyhjz2YhnqE2vSxk3NPwiXkrWK18rC5tNs3vthX+yxlPPokX5hb8GZDiMlEQbV9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkFjw3rF; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkFjw3rF"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f3c623322bso5438273eec.0
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 23:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778394553; x=1778999353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IBAR9o4RYlsAYB8SjeWJiNlDzLB64t1zWjcdLdzb2HE=;
        b=GkFjw3rFmtfzMKkCVCpNpwX2nCVkrc3ho98ULtBcz6D3BS84O1WHkbmTS5p7YDsb/W
         0L5IdQaBR4V0nBs2RC5rwGJ6/yDdLZJi32dAuc7ln5NLtVpXY6j5dDvgc98qUOlMSD8F
         7o/DsLFrUBhHf1nfMkE81/wgEaszIV056WxZRxf91WsSE0yTpS0huik7AeeclJwisZsS
         oGs7n+To/D6yfJ/VDcmeCUAgIuEbgeRag2pB6xep4OIAynT06c8ou2qMPgSaKw6AlbGD
         T7Gxmb2OM7MVi3+BBRMMu/Nwpy29JhnUa/1/hMA7Ph6bYE7gR8drZDUBToivEc07XxUl
         utsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778394553; x=1778999353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBAR9o4RYlsAYB8SjeWJiNlDzLB64t1zWjcdLdzb2HE=;
        b=ZrXBqSacbnh3foVFWuH5+xCvyAiEoWI6BTb8Gs0p6EeiY8fmRmOHoTvWxJFvjDi8Jz
         4RW0l0/gotEuAsf8jasfkC1fRKlW99ypqCD7yjoc1oZdPzJfNvk1wiSkAtgC51M7RQgA
         DPxTCSEp6Gomlokk2F5Y5lzF8bPI3whkv35gffjM0BGbNjGrI6WUC2oB1zWgr3zSzSA1
         2+vnb/E1L7Mt2DdkqhNaiJh1gJvjGTajwFgF6L8xw1MNTlv52YkYgUYVI8C1eYE9+ZUz
         6iCLBhh4eiFpwVOJtosn0p+C6hRwTvf0gDtQRCddD2hsAkhMF9ez12THPBXow8/2Vzzy
         hjhg==
X-Gm-Message-State: AOJu0YxAAmh9mOlITxFIO1/I/mx+nL/RK8iww1wpg6wNDtyZQALqxHe1
	77VCB9qF3tz99YiR++XGhuKr/QjlwHxECfbc6jBspBtf85algdvEJiecDpQfHQ==
X-Gm-Gg: Acq92OECp2Yk7YPjSEfknrTLJB8OD6w75v7FuVYIK0kW1eIj6cQOo5tJ1a3MD7i+QfV
	ZrQmVbmE565yCjwj6hYQc+P5bKJMfASieMBemWpQGmVTQtxtScvapQG6WF2G5+3R99ESvAhuwnf
	Av1ZPe8xF4MjEqwBKAKt/GhL0qVr/rJ7MMujVVYNOm0WZontq5R952OSMbkIQmbmdq70HhrYiur
	BvhZllvOSR1EDBnFNV0QExXtKwY2bQsz2c7qtLKH4LIeI7cbVlzLqzUqP+jxJwyNUPi500TSarj
	yxfXv0kWzh5cpVr32SnrBC3AFUic0t+RFqkQ0M3O468/tfSAOPa486/YPHuP2lGkVsGrj2yw1sD
	ZqLYg38SN/8zzwOl36GvCkL77+gz1Y6lBQl+k7Wllbyfcb/Ags5YIFB6CN/HieD3JL/+ubv/qPx
	h6EZDcVdynxsQ/ZW8eEmTR0sPB27EmtjPo
X-Received: by 2002:a05:7301:e0b:b0:2e6:e504:5431 with SMTP id 5a478bee46e88-2f54cc681b9mr9967630eec.22.1778394553235;
        Sat, 09 May 2026 23:29:13 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f8893441absm11666347eec.31.2026.05.09.23.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 23:29:12 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 0/2] staging: sm750fb: fix 3 CamelCase variables
Date: Sat,  9 May 2026 23:29:06 -0700
Message-Id: <20260510062908.67848-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset renames 3 CamelCase variables in the sm750fb driver.
- pvMem -> vmem
- powerMode -> power_mode
- resetMemory -> reset_memory

No functional changes.

Jennifer Guo (2):
  staging: sm750fb: rename CamelCase variable and drop prefix
  staging: sm750fb: change 2 CamelCase variables to snake_case

 drivers/staging/sm750fb/sm750.c    | 22 +++++++++++-----------
 drivers/staging/sm750fb/sm750.h    |  6 +++---
 drivers/staging/sm750fb/sm750_hw.c |  4 ++--
 3 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.34.1

