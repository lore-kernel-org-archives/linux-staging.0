Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E52931C1
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 05:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105339; cv=none; b=mu32o37JO2/b0dP7QAipivvzZw9Jgtq59cMxCQisA0Jq2IAYRD5JhDDPf2Hrfbm6us76aMDi2/ARgWFrAfQ/TvKFIBIxfVGT3YwjSSPr/V3yQYJuTIRGbH8tuvEwhI0cY0nQ7i7QRZMrEQpQ9d3PzQ0gC6fFEpTJ3jPeaZc3Wvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105339; c=relaxed/simple;
	bh=FSOW3XQ124d9AuPuo2lHrOvFOmZ5xGChX+s2ElMPm/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MH2OoFdforZ08aJFjKCSYdYA6fmcbJ1hhupHQjlgzc6CYz4RTqO8h66aCXWR7hdg+HOZ6E1bg9xJGDiRCxAy/b7cEVe4W187VPNzA4xohffMeJUh+hOq2Y/bX2le5HwKocHOJ82dZF08ge02Y/pI5+K+rqJqLPr4j24SJr01/NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDExGv4J; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDExGv4J"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d58efc7356so7181865ad.1
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 22:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789105337; x=1789710137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRgs9+dPln55W2sl+P5oYJbAmjCJr7uv3WHo/fKpiRY=;
        b=CDExGv4JmKaAQppJRgbCcL67vhy9IcLP714tnBWi/Ji6IQ1CYtMpaIRx0kklIQi4tj
         wJdd4TpEduOGxWE+Jz3zHgX7Cs/Kp0i9B8q2y8n8aoxx8tRluzCHKW5BKlLQN2wXvYsG
         eDj+QnWPDoqMuWBGK3mr4qfFqEAsPaOWtNkpt/83gfXSOy7J1Tz1Gp/P76J9U7+DqFY1
         hLu+RI82eTUubYLEYKP9wGvZiRUw15mWeAcwswa7PkZf0IXuYufb0L6/AstKmP/6zsgK
         uo7sgEHv5qeHsrx8u0AxdUANbqabss3ZiKcMbFbEVxvO8vkgbeFGtYCZrfuT0/BSJDp5
         X0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789105337; x=1789710137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRgs9+dPln55W2sl+P5oYJbAmjCJr7uv3WHo/fKpiRY=;
        b=aijwtDi5vtWEnoGHe4CjKT1d2ZTVXaST27nJvRNhgySfwOmPpTtu22EzWoEzpTxLlF
         0G3gwDEWwrnfV7greiyz27KyR30Kx49945yyPjGmcvj9NE8yEMYGm4L9+QqM7KVRoP1j
         z9/wW5LOUg5wETyqiUhDXkWYulSaL5pCTLZJ4kkiNAbQc4e+RHM8KszXQUdy5t5Bm670
         9wzDD0eGau4x5a8JuAzPdpn7KOwZ40noxhCBCu9sJtszisCZMHucJJPwxquLUEWcvml8
         bpXDGi0wo74e8hZpP/33rIS2PCW0Ouml7aAY0kCBcMR2eSKDZ3tuN0FCV0vhLz00i6m0
         A68A==
X-Gm-Message-State: AFuF++kfkWQfcZ/+4SX/G8Sd5dYske3Vc0hqhG0Pzp4XRugPwZGfnH/+
	MEY5hKRG6J5ERTMQw9DQ6W5pu7O2nxk4YXl/Da9u8IjWYMIsJo/HEpHpo/ektg==
X-Gm-Gg: AYBFou2JEW2xFpZIXlSA2BIDFp/PHnZ1UEP7FFqY6NXdDfW5PmKvqfsXE2tr+NTf0pR
	50fpiO/fOS/RuPx9knESqbWmLFrH7PbBCkycJDBa4aCfEcX8LeY88D8ov88eejdDWjJDVo6cV9n
	cf4c7WdeeXctrTMCcZdJh6FNj0+5E4HK5+xQ2GnXNcS42wGvZ318h4iFUfQLXd+S9BLK8KzIh+1
	niQ3MxfUxP7ANY6wx42vPuejIaEcRD3ikPOKi6btnJXiuGw1qQ2yyYu1+WIwXEfa+CLN34wDE1y
	6LKxzo0PoQLs5nzIx4OX9TCZQjl6rhbPVJz35pslw6fTItciy5L91zqe63hgnylKXHh+JNxjyNx
	PzRs18HEwd+krDU8wRl+SxHmp6IcMtI9SIjPaXUhJmX8f0T6RaERko9FUIOek0t5AE/oalky+h3
	dd6YdVMTUVCR9nSe09ZAftVnO13Slt/a2ZrOHBibsGDnWvMAr/UsoPHyT3FYyqktduF7iwXVSZv
	8J1fyJrxRVAdN7RFTE3
X-Received: by 2002:a17:90b:51c3:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39d9c2276fdmr4869585a91.19.1789105337332;
        Thu, 10 Sep 2026 22:42:17 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4efc398sm3525078eec.19.2026.09.10.22.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:42:16 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove comment after function closing brace
Date: Thu, 10 Sep 2026 22:42:11 -0700
Message-Id: <20260911054211.7739-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The codebase of this driver sometimes has the name of the function as a
comment after the function closing brace. Find and clean up all
occurrences in the rtl8723bs driver, as this is not necessary.

To avoid introducing a new checkpatch CHECK:
- Blank lines aren't necessary before a close brace '}'
by this change, remove newline before function closing brace if needed.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c         | 4 ++--
 drivers/staging/rtl8723bs/hal/odm.c                | 3 +--
 drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c | 4 ++--
 drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c    | 5 ++---
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index b2d22307b115..9a47361ebe9c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -76,7 +76,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *adapter, u16 address)
 	} else {
 		return 0xFF;
 	}
-} /* rtw_efuse_read_1_byte */
+}
 
 /*  11/16/2008 MH Read one byte from real efuse. */
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
@@ -175,4 +175,4 @@ void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuse_type)
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], map_len); */
-} /*  rtw_efuse_shadow_map_update */
+}
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index d18df407e365..9a3a7050aba4 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -456,8 +456,7 @@ static void odm_RSSIMonitorCheck(struct dm_odm_t *pDM_Odm)
 		return;
 
 	odm_RSSIMonitorCheckCE(pDM_Odm);
-
-}	/*  odm_RSSIMonitorCheck */
+}
 
 /* 3 ============================================================ */
 /* 3 SW Antenna Diversity */
diff --git a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
index 9baca2aea80e..f59a6ebc773d 100644
--- a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
+++ b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
@@ -37,7 +37,7 @@ void ODM_EdcaTurboInit(void *pDM_VOID)
 	pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = false;
 	pDM_Odm->DM_EDCA_Table.bIsCurRDLState = false;
 	Adapter->recvpriv.bIsAnyNonBEPkts = false;
-}	/*  ODM_InitEdcaTurbo */
+}
 
 void odm_EdcaTurboCheck(void *pDM_VOID)
 {
@@ -51,7 +51,7 @@ void odm_EdcaTurboCheck(void *pDM_VOID)
 		return;
 
 	odm_EdcaTurboCheckCE(pDM_Odm);
-}	/*  odm_CheckEdcaTurbo */
+}
 
 void odm_EdcaTurboCheckCE(void *pDM_VOID)
 {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
index ac1249676794..5c86fed43182 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
@@ -24,8 +24,7 @@ static void process_rssi(struct adapter *padapter, union recv_frame *prframe)
 		signal_stat->total_val  += pattrib->phy_info.SignalStrength;
 		signal_stat->avg_val = signal_stat->total_val / signal_stat->total_num;
 	}
-
-} /*  Process_UI_RSSI_8192C */
+}
 
 static void process_link_qual(struct adapter *padapter, union recv_frame *prframe)
 {
@@ -47,7 +46,7 @@ static void process_link_qual(struct adapter *padapter, union recv_frame *prfram
 	signal_stat->total_num++;
 	signal_stat->total_val  += pattrib->phy_info.SignalQuality;
 	signal_stat->avg_val = signal_stat->total_val / signal_stat->total_num;
-} /*  Process_UiLinkQuality8192S */
+}
 
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe)
 {
-- 
2.34.1

