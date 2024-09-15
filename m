Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581A288D1
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382464; cv=none; b=fLe3oP0xGAMS9wo4XxEVNfwwAQX8ZKO+6ZIT11DxCZJf2M/sFz2yGq9r/9ofy4HBz3KLGca6lDiVdWDlXqUBm2UCHmy7ucXt0Kuax+/z5dlpu7cWypbFb6I2lZ9UqPkUTKsE3HTq9EJNzsSjhoLTu7iUDkze7JTmfjOnUSrfMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382464; c=relaxed/simple;
	bh=pFBLKa7eakDbJQvDx5GAJvRveZklRB0mvRHkGxKzFik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YypMQNNwPEVqiDhAdi9UXkE+bbkYcKdSBOafvSaCxkC/NZrAlUMKoR4x0EtRqRAYbs6GdM9R8Px5wv901X1t153hGSb0SQRrDuHJNk3ZfonVVgD1Z8TsWls9zQLO98j8qsdV0Oca70gNlgTf4UPz11/d0dVcVXNgDEEmrr972bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3ChG9yf; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3ChG9yf"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso545726566b.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382461; x=1726987261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3O7884USr5rmr1eBEbAXs5vHrzE6NgETmRQZwaRy8Y=;
        b=O3ChG9yfpezuxuJSGsfa4fQGor8MPWDy9ZWHGtouNfMnerN7EgKnYvsOmo+lJiMKv9
         0dWDWspvKq/F0yVvQcy5hPhfgotubMRnzXU58IActGt6zn0NLxyu5vd69nCimlpcAkWB
         rPVWwtIqy1BwNfmUsF2ZiDe5mf9N5KRdM8qmXoiL48+qbnKnl4BqWRw6jgfU4er5HPQ3
         sObh8F4K2ms6aUwpDl6YUBLLn1tZxDmYA1mc2UaUYxAlFptpUYHhDqgSWU0IaOftxcgN
         QPOfBcGci8rUZIXgf+AzmSg488p88EP1Vid1WvxTyyELov+h0TVJD4o60a+I0CUiSDxo
         Dnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382461; x=1726987261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3O7884USr5rmr1eBEbAXs5vHrzE6NgETmRQZwaRy8Y=;
        b=mwzzjyyWteCPzLnp0aoKRIRzAxzJwY97sOQ+SydL7X1ee6caN7LNqGSYba9ST/Tn0g
         rJG9Ovw+NpGG/lkevhgo3qhSO5+/fCap/70PiGejUCEnYsPEr3KgOd0Ar2dKSNgkyXTG
         F3Qtrw/Gstk1msJ1iElip+vj6uZS4zO31CbPVk7f5sNaoJZnhrx52z1XklNkCOxlYbxz
         /9ULi1Aqic3xsi8aWWfLEqZRNXCn4T3vd3Vxs20Mr5q9jAyP1q6JqMLpxwEn78XZyRd3
         4BEPm+Z5mVvq4E0c0NGH4YiUV4Ovacnr6cWs24JNCEr0UqiWmX2E1JDfCEVGZ/PxKRzC
         nTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnUc7MyYf+NzyOJE/7KOssmwc2L4ld2zNteM2Oj509VkA8sxm1Fx5le1DqR2yWcVCRBlWRzSDdNTOz2AIM@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4FPW0TE5mhD69f45YmCY47SuX6SXjYGMACNsHwPHIoOy8r6Hd
	G3WFQnaGqpRDvIRuxXebqkG70o9W9HZec5NcsWVR1f7l1Sh1gvNLGyg/vw==
X-Google-Smtp-Source: AGHT+IGh+yadhr3UkyNRuLvLdwbD/v4caveq+WJuFsXtJJ6X9ZV6hphCFtdTRejkbk9v8+tNXBexKg==
X-Received: by 2002:a17:907:f71b:b0:a7a:a892:8e05 with SMTP id a640c23a62f3a-a902949ac77mr1180375466b.33.1726382460935;
        Sat, 14 Sep 2024 23:41:00 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:00 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 06/17] staging: rtl8723bs: Remove unused function _ReadCAM
Date: Sun, 15 Sep 2024 08:38:20 +0200
Message-ID: <f8ce4d176c2aa1d312183263658c4683a23a1e4c.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function _ReadCAM.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 4eee324385a3..9bef4b9e2aca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -435,21 +435,6 @@ void invalidate_cam_all(struct adapter *padapter)
 	spin_unlock_bh(&cam_ctl->lock);
 }
 
-static u32 _ReadCAM(struct adapter *padapter, u32 addr)
-{
-	u32 count = 0, cmd;
-
-	cmd = CAM_POLLINIG | addr;
-	rtw_write32(padapter, RWCAM, cmd);
-
-	do {
-		if (0 == (rtw_read32(padapter, REG_CAMCMD) & CAM_POLLINIG))
-			break;
-	} while (count++ < 100);
-
-	return rtw_read32(padapter, REG_CAMREAD);
-}
-
 void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 {
 	unsigned int i, val, addr;
-- 
2.43.0

