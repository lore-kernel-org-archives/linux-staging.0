Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9286B33C1B7
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778409414; cv=none; b=FlCyYlqOeI2dfu3ftl3UaW2pp2MWYrc92xuYdImCIVQczpITiAx+GqVInvExNwKn9oou28gZw0ZztPfg5HM+kRIQLdWBb4hS7vL1W0immNbbMe6Uf4Nj+UHLwzQXUAMZEG6ejOR/64Cbqz0e0xwwfGN4/PCEwoydai0W5IXkvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778409414; c=relaxed/simple;
	bh=DGZ360QX4JFJObfiCDeaHeeXBKEeLVQuQp+YcYf6CE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=db3UChH2NdoB9CDgKx4QSc8BmpEEO/jQvRTOL5ZWDaO1EqVc/vU27ZJKvNxET7btZLPEXRKmU4ORIBLl5oNOIRHkILnMqQI0yFZl0tyCsGIp17ud8MezdTI13HwtcaHrThxcWiXJoFB8np62ffazj4/InS0YxiSwS7FJSR3l2qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXsg1kf3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXsg1kf3"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c80170db7d6so1179743a12.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778409413; x=1779014213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/6h6AsAEgutksGpeOYMdYrNk9FftNMj8nlv/ZbmmlY=;
        b=nXsg1kf3D2NRouIyb+gTLlnurT0n1rvNBt91qEBVi3LvFE6DU/7TGS9CelLXvrpXVx
         jTAjv7yw4oCM5Yyd1rwUgycanwM1SQjYPuc2funnw8UefSz7Z2cFQVye2Gagc1sC5uVw
         atmEm5BfvGpfAe2Euf+ImTlWOnoDrv6ZsMA2VPn3qnjwxgV6kPM6VRKaVxiIkskfrNR1
         e/UpDfRFS1rG8B8AEdnV4m39DMLEhk2y3GzatKyWU+rJstfp3NjyQrslCHLQIlffuCMv
         6c/Fy4HXPapFLlKaoc5p2z1ePgIt/0zll9ZkZq6i3Lg7i71d9teMatomRievwf+OwP4y
         yLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778409413; x=1779014213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/6h6AsAEgutksGpeOYMdYrNk9FftNMj8nlv/ZbmmlY=;
        b=VXAGJLcP7OmpChOQG+hzg9uc6hNdRJixHnH7TIK5d+iImcvw0R6/k4j+1JJXh0Agqn
         yQarL6XFL22/iYgLYU2uVkMp9ZKPRwCVyVub0GdzMFYbcSIkutQvxn0gs7QtVAPZs5J6
         bSbHjYEGs/qu9KqFn15zifG3kazMBJ/MTIa+IsM0Qf3tqCPxDBAnJ4FBCewvapXq/qD3
         hBqsj4kS9EMUU7oNFNqYk3pFY3GBX9N1FomaHXkjP8q3qc741lEwq5+SuTKDi0k0/wMK
         Hepm31G37zk4AE+G9q2+zwE4e2Vo/toZNfK1e6BRycuug3smAet8mEbWHz1NQ9c2u5n9
         wEwg==
X-Gm-Message-State: AOJu0YwdEUMmjzMWYmu+XzAxPqDsVMjyNT3X+iHdnZ9TMliVLOf5HXTh
	EdRcODVtwRyBgS4c0xFbJyU8f4wdPcu1cstKHK20Uq8HhK7brI3RLxlD
X-Gm-Gg: Acq92OHWyKr3rgH6v3v+jxvHxSMGuCXYijhb39Tgl9BXqedsLkEaCV8hbe5xOmALITm
	6v3PjQIAQ2gC5fZWoj9l/13Q2T5Ji1R/vdm9VGNIXr8ESFv3RvOCPe4OQauVx20dwmC5PZ+pvkX
	XBlYm+EzgPTPWRpUhDEpy5yvjPGHJ11tLdOS1Ab5F2j1UDPq5LSAkBywfyc1FSclIOAEapHM15r
	taauaVjL+w4sLfZ4J3asPqXI4BuZI4oquoEpB5l4gJPhqDUfrAXPQrw1bgmBGqpKlY8hkhwqrOZ
	T6dRWXzdKnHo/CBgWtt6hG2QwlH/vXRm3k1aPgzJWwe/nwPUnPfmkJ9/64rNNdhrw47mwaMkla8
	Bhw7Xw7Nx70VECHNB/LHfliKnsCOI+nnQJ+n2fqiPwQA5sdytocJv/0rX4Qt6rahCdOVeKj6G2t
	bAOYzdCG5Voedl5f6/fmoN5oMnilfGRD+djcN6s4Jb
X-Received: by 2002:a17:902:fc85:b0:2ba:c453:ed3a with SMTP id d9443c01a7336-2bac453ef9fmr155957445ad.16.1778409412700;
        Sun, 10 May 2026 03:36:52 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ecc4bbsm70136085ad.84.2026.05.10.03.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 03:36:52 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pramod.nexgen@gmail.com
Subject: [PATCH] staging: rtl8723bs: Replace __attribute__((packed)) with __packed in wifi.h
Date: Sun, 10 May 2026 06:36:26 -0400
Message-ID: <20260510103630.80917-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all occurrences of __attribute__((packed)) with the preferred
__packed macro in wifi.h to fix checkpatch.pl warnings.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..6cf5438b6292 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -336,7 +336,7 @@ struct ieee80211_ht_addt_info {
 	__le16	operation_mode;
 	__le16	stbc_param;
 	unsigned char 	basic_set[16];
-} __attribute__ ((packed));
+} __packed;
 
 
 struct HT_caps_element {
@@ -351,32 +351,32 @@ struct HT_caps_element {
 		} HT_cap_element;
 		unsigned char HT_cap[26];
 	} u;
-} __attribute__ ((packed));
+} __packed;
 
 struct HT_info_element {
 	unsigned char primary_channel;
 	unsigned char infos[5];
 	unsigned char MCS_rate[16];
-}  __attribute__ ((packed));
+} __packed;
 
 struct AC_param {
 	unsigned char 	ACI_AIFSN;
 	unsigned char 	CW;
 	__le16	TXOP_limit;
-}  __attribute__ ((packed));
+} __packed;
 
 struct WMM_para_element {
 	unsigned char 	QoS_info;
 	unsigned char 	reserved;
 	struct AC_param	ac_param[4];
-}  __attribute__ ((packed));
+} __packed;
 
 struct ADDBA_request {
 	unsigned char 	dialog_token;
 	__le16	BA_para_set;
 	__le16	BA_timeout_value;
 	__le16	BA_starting_seqctrl;
-}  __attribute__ ((packed));
+} __packed;
 
 /* 802.11n HT capabilities masks */
 #define IEEE80211_HT_CAP_LDPC_CODING		0x0001
-- 
2.52.0

