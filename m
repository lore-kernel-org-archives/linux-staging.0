Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98472F34
	for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724602422; cv=none; b=DH3EdgaQA3zRnnb4KCIXge6M33Lb3K/AnJxv+bCbcrxsp3Ok2GGj1ScMBVaBp5VSSRs3pcXgPF/QfnkqdlowFme7ncmdWP3K1KvFSroXp3U/gzMCNIACqAX8i6uMQTfme+Zs/36EO0G6ETZWDROSr8jKLRgiouCKSDJ144bSIOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724602422; c=relaxed/simple;
	bh=/jvCeKfSVXgCuuSol2E+jpEb/J70J+/Kp9rzudHAATs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Wpts/djXc1W5Ig7C3HH/8ggPpSzqfvZy8JmRrQZ6uCudV8m8/AV6jib0LgFycDRacAQMlJLRYQ/JAAw4esGfIrSYkmwvS+wQ4MB8nldS7JIBhrIqjnrnnA8MoeXZFSZKupPD1hdYZUeau2srLS6Bc+b6rVshBXzhTOrLezXWjVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI+Q2F9Y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI+Q2F9Y"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fc611a0f8cso27832365ad.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724602420; x=1725207220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKSCX9vM07YsCHT6bGYskoWhcQrnKZPSMcqcmHFl3Rw=;
        b=jI+Q2F9YDSKGZlC8iyQUHlZQbT2VScI+IMqa7Biq0sZzPNcEroo+0I0tDDtCP+vG3v
         pNy6OE+zhRuEfei63Z9VnQXSN+pS+7xbyrMq7Ai+8FxHiZUEX6AVCvPqZPTh2sy6iUFv
         rYRGdQGM+d6j3y9i62naRh0WnUSR0OzcPJv+kx21C0FTKTn3vmf3hF/ItW/+66hFZI95
         rplvL01jpZHsS8KCBBpNEL8NQkKpiV9SH5BiLq+mKekg16TYrBElZmqhocNdyg+5rstD
         MGe62uSWM2D9DcWRQa7taU9o/UPqp5NrawYRF/UpVhi1b7qvvU8Mz7T9gjnwINIlkYbf
         NT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724602420; x=1725207220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKSCX9vM07YsCHT6bGYskoWhcQrnKZPSMcqcmHFl3Rw=;
        b=Tm1bkKi3S+ZBYujW9k44eCKO7H+BGsLHnP5f4w7FGPZ1o0KNc6nK4MRRgSPyAUJMXj
         w2vk1matj8q7AKyQi4jT3Pjg0MTTkJzu12wS4KLhhQTKr1RDUJuWgr4EZWD0yQvSR9I6
         d5UtOL6hBM4V+GzRQgmfkNBUcBaTPmlSYyR7V2ivydkRrO8bPy0Fd3S++2ZYboaULz1Q
         WQzjE/B2Ruh3eiYjZS9XVWeJLJBqpdOaBGbVOTaM2mDh/kXCDt/zJB0edMbraaQaLeyr
         P818xFWHx+pYd7fp6/8VUW+7pnK6wx1Nf5tJ2gLq+VU3+e01wWLAuEL/OGCyPX5C0uQQ
         KSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE2tdnR6kUeqT8Vsgz4zsyQmVXCGX+JAUaA9Xvu8pEfTRy5kV3CmUxiTPSMOup+vMFq01PwEkIpNsD36m7@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+oJe8y0dP7ZOpoh6T6hxvz0jFHhROF2YtETlID0dqUqDalVTJ
	PJ5KXfzwq3hYtZl8Ft2rc5WVkazxW9v6ZNFi5mzqfp6uHxGXl9+E
X-Google-Smtp-Source: AGHT+IHWvj5k/XDP5QdRApqaybHDJVssK7CDqyPKWf0AgEMYxLyZwmbqdvj9FX7PkTosugvM7nTxBw==
X-Received: by 2002:a17:903:2349:b0:201:f853:3e73 with SMTP id d9443c01a7336-2039e4a900emr81726585ad.11.1724602419937;
        Sun, 25 Aug 2024 09:13:39 -0700 (PDT)
Received: from BASE-20.home ([2804:868:d047:ced3:41fa:c7cf:e733:9f1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385bdd1cesm54980955ad.277.2024.08.25.09.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 09:13:39 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix Assignment operator '=' in rtl_wx.c:681
Date: Sun, 25 Aug 2024 13:13:35 -0300
Message-Id: <20240825161335.21737-1-alienwesley51@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separated assignments for pairwise_key_type and group_key_type
in order to silence the following checkpatch warning.

CHECK: Assignment operator '=' should be on the previous line.

Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 47f1adf30ab4..2d42e7a5bcdb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -677,8 +677,8 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 
 		if ((encoding->flags & IW_ENCODE_DISABLED) ||
 		    ext->alg == IW_ENCODE_ALG_NONE) {
-			ieee->pairwise_key_type = ieee->group_key_type
-						= KEY_TYPE_NA;
+			ieee->pairwise_key_type = KEY_TYPE_NA;
+			ieee->group_key_type = KEY_TYPE_NA;
 			rtl92e_cam_reset(dev);
 			memset(priv->rtllib->swcamtable, 0,
 			       sizeof(struct sw_cam_table) * 32);
-- 
2.34.1

