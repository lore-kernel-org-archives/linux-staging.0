Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0632405C57
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779002902; cv=none; b=RDkG0opPMp2E0oKh22ZrpeccCgGHy1EVGDDypjHqayLxf+d5hiYXGn7VOSkttebsJXs11h++kZnlsbQxGqmSwLb06ccRUPVcJ5GbHYIdiPmR52mC3QHo8AlYyh40rw+JD2i3Y+VDnpYMicAgTTiNU0W6NchZMk9+TGTGf4h75j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779002902; c=relaxed/simple;
	bh=L5eO3pixj5NmxOTpRZvnfQnRMAnXDscCqyCnXCtwBnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMTtEnZZ5LzhkoygHDZ6lHPTfE6yOTnEkcDhHahqFWm2RFjjZYhOVlUO/Y00qKn7vUxKXVn0El6Hqhu1BxGYpcvDbInhEw7xQNhPOo7seNfl+8MGj1b66zCVH0BDQZEe8a+8fVUtAV5QNQ/LK0hARutUgoDgQIltn9Ufck9BEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9cfDBw6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9cfDBw6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so17373035e9.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779002899; x=1779607699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfqgepPcLkpTbnXkfrRVH8YKdVaUwttUDjhi9Uy4sVY=;
        b=k9cfDBw6z1mlCqdlEtl1xMZUU2tJQ/fiJyB1sxvM1+wGVzK/l1LnoMeo4uHuPjsqts
         H2hnMbWv77wM8ZcCGdegcIEeTzvGxJJ/LN0mNPuwN5PdXk8DoaAvJmhbiVhiaqtlByNc
         kvBwPkyEkJwpb5kdeLYBxqGHxETDrmldB/ErNYFa2iS5+Uzr3HbBBDJzQyov/IH+Lb4R
         1MQrLuoD10sZ/bROnemMjRaJkWaKGID+jecmiJFJYFc2Ivgt77iQlyHy3skSHyslr6sK
         u7OIbPRmmFb0FsI/U+yyz8G+fMNWCLcWw0fLpyrAuOedgrejFkLMNnqStmaJvC1BLq86
         JGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779002899; x=1779607699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfqgepPcLkpTbnXkfrRVH8YKdVaUwttUDjhi9Uy4sVY=;
        b=ZX57oGFOTJIv7XMz6haAfAMQiBRWwj6S80m/TzXgVOZJ+g/rlpVu5NyFVlvy0/7oSI
         k9tvipVidoYZ0JvkBkLElYSiguf8ymxhQDifkvxN07BzWjxavPRcu1AuGi3lPHOpQaqQ
         Oyx70vsTyEUJT7lqZj6KR7It+I+rdiiM8XnZWgwXLv93ibMsuzsrXdcUkroS9QJkuECm
         9pvJL216CM91sRq9081f0QQ3JSYQvvuPDdgHWNFBGF3gwU4gywM0vYv2WLf6haPjcKKd
         JK0munqLOTD98BOXfKYmcrF6KrLzJTG58RO0TyfqcWJHHwXW78a5nnMuq4z/v11Objj3
         yEFw==
X-Forwarded-Encrypted: i=1; AFNElJ8392fY+1SPzk7bYl8I2a0L3DrXLqjAoB83riUUldfqcTkVLEv0aKo9FnNuZBKnthypWD38SBtR92+M+yH4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+uzO3OGVjUEVwZOsd6UFSKIHcDt/J8rf7puhJBIl0veafYjWz
	pm+A7cDW0c0/4ZdlooRKBA08Tl2Qw3gnefL7eZZQtlVm9L9K5TjOyOqP
X-Gm-Gg: Acq92OHyWn+TbqGOn/WaZ2lVlc8C6+K5mRPDeqvBXJ1bUhgqXFDfp1+YzTf5gqsClbk
	TlYnSlh+il8WHjmet+r//wfR9QXRL8Jz0HmnhYN3lEezh3o+Qabw6iLoMVdXE2g5OOrMVQGAv8w
	vWJgVO/qDifhuLdbg1/CTx5ubh6sMHrm8uyfviWsoiI0z0GpZjpNcMB/HNn2LSUstMNfjV85uK7
	BOCUPGeIukWd82kgMtpeRhdaqk1vLk3Eb0gZiA62rAWb8l3WCnj6eu/VJ1lYvOB19vT174a6dYy
	/Hyr1HS7/6aMptt7ovW9WTlhplh3I4QUxSoEvokSHt16Wb/GFweqAfGxV5ftH038h2/8JojRuXJ
	pDNsZWHpJKYQ0Y+cN/JwqeliU8xqlLE7g+FxzCayh1hXdf4qyMHzY59K+AwgzG/oTWDg8tDplUV
	HrNHVCbtSxkR+OIeIxiYBesBY=
X-Received: by 2002:a05:600c:3e1b:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-48fe6515f20mr138558215e9.24.1779002898976;
        Sun, 17 May 2026 00:28:18 -0700 (PDT)
Received: from tumbleweed ([95.90.185.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6b9efsm79400585e9.5.2026.05.17.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:28:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove READ_AND_CONFIG_MP macro
Date: Sun, 17 May 2026 09:28:02 +0200
Message-ID: <20260517072802.71149-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the READ_AND_CONFIG_MP macro from odm_HWConfig.c and call the
ODM_ReadAndConfig_MP_* functions directly to reduce code complexity and
improve readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 4784d33eab0e..937002495d09 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -7,9 +7,6 @@
 
 #include "odm_precomp.h"
 
-#define READ_AND_CONFIG_MP(ic, txt) (ODM_ReadAndConfig_MP_##ic##txt(pDM_Odm))
-#define READ_AND_CONFIG     READ_AND_CONFIG_MP
-
 static u8 odm_query_rx_pwr_percentage(s8 ant_power)
 {
 	if ((ant_power <= -100) || (ant_power >= 20))
@@ -415,9 +412,9 @@ enum hal_status ODM_ConfigRFWithHeaderFile(
 )
 {
 	if (ConfigType == CONFIG_RF_RADIO)
-		READ_AND_CONFIG(8723B, _RadioA);
+		ODM_ReadAndConfig_MP_8723B_RadioA(pDM_Odm);
 	else if (ConfigType == CONFIG_RF_TXPWR_LMT)
-		READ_AND_CONFIG(8723B, _TXPWR_LMT);
+		ODM_ReadAndConfig_MP_8723B_TXPWR_LMT(pDM_Odm);
 
 	return HAL_STATUS_SUCCESS;
 }
@@ -425,7 +422,7 @@ enum hal_status ODM_ConfigRFWithHeaderFile(
 enum hal_status ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm)
 {
 	if (pDM_Odm->SupportInterface == ODM_ITRF_SDIO)
-		READ_AND_CONFIG(8723B, _TxPowerTrack_SDIO);
+		ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(pDM_Odm);
 
 	return HAL_STATUS_SUCCESS;
 }
@@ -435,11 +432,11 @@ enum hal_status ODM_ConfigBBWithHeaderFile(
 )
 {
 	if (ConfigType == CONFIG_BB_PHY_REG)
-		READ_AND_CONFIG(8723B, _PHY_REG);
+		ODM_ReadAndConfig_MP_8723B_PHY_REG(pDM_Odm);
 	else if (ConfigType == CONFIG_BB_AGC_TAB)
-		READ_AND_CONFIG(8723B, _AGC_TAB);
+		ODM_ReadAndConfig_MP_8723B_AGC_TAB(pDM_Odm);
 	else if (ConfigType == CONFIG_BB_PHY_REG_PG)
-		READ_AND_CONFIG(8723B, _PHY_REG_PG);
+		ODM_ReadAndConfig_MP_8723B_PHY_REG_PG(pDM_Odm);
 
 	return HAL_STATUS_SUCCESS;
 }
-- 
2.53.0

