Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC36FD9
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 13:51:14 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id s8so4900265plk.5
        for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jiHP3EwntNY7kHIRiHarxjSSg7z+gSvqkPEVsXF6hAo=;
        b=ZDIrFBfD+fu53ONyP0cGdrlDU42YMtCf84GsfCy892eiobS25HoeYMzbkTzN2PZQR5
         JBnFNvlUbjwoODH2nhuKRdnFtuFUio/OLDvLpXRjD7i9iBa9Ye7EHQ9K4M1Gjm+W+opH
         NHJ0ru8WQgNdzAKZDELwIkJfxd+n8HzqEVNKQOL3pkokVGdB5EUtO01eF7OafbKuiSTi
         kVxo9XXw9HaKqSisF/+L35YVaDvARWfakATdJoVh8p3wxcPLJ8idzm5fzW0r9tFJuL/W
         NXS4TEXzA6dpEIAnoa6KdZVJF27mQkeso0bb7DjMIIjha5gyzuXjxYd9AclauM3muH74
         y1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiHP3EwntNY7kHIRiHarxjSSg7z+gSvqkPEVsXF6hAo=;
        b=oQFGyae+g0hdV9WlsJQFueux111cjrrw8GY/upOxZGFTH/PX2VfA/DWf9siO6aU6fd
         02XLVMSjouuWVOySiHgW+VqKzoMEdfsYcbnJLs+Xev2BxbT+VVGb8B2iDmcq9vOkFfvR
         lqbKyUw6kItzrsGRjjll0uexjT0VHTEnHJ0PcrF6E1VZI11YGODEfyRGZCTBRdDWemI5
         qkomrmUTVeXcgvTH1vND4F1mUDlQGYQH1p7z2boa2ZhYqxQBaWCmP41iaLJgizBsBHt7
         LXoDGcYF2scuJu3dxUzW3y9A6NKkS03Bb4W+EuSRf3/lZA5Psa0rLyIOZU04g3dk9DII
         20Vg==
X-Gm-Message-State: AFqh2kq9vTd7v3QN+gxv5jIxSgXJAf1P6+Bdef//ixMoljDMOnJLi4Mp
	j9OGqhEERJyDwk+NzqEJ7Lw=
X-Google-Smtp-Source: AMrXdXudL2kOHVvYZCb5BpsvzkyQKNDZ4kkaEl32hU1YdhmeQSOz0xHsZ01nPNCiTVEz7reZP3PZvA==
X-Received: by 2002:a17:903:230a:b0:193:c4:8253 with SMTP id d10-20020a170903230a00b0019300c48253mr25384821plh.1.1673358673880;
        Tue, 10 Jan 2023 05:51:13 -0800 (PST)
Received: from gaurav-pc.bbrouter ([2402:e280:217b:6d8:bf67:b774:ee50:1dc5])
        by smtp.googlemail.com with ESMTPSA id z12-20020a170903018c00b0019311ec702asm7965750plg.36.2023.01.10.05.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 05:51:12 -0800 (PST)
From: Gaurav Pathak <gauravpathak129@gmail.com>
To: paskripkin@gmail.com
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: r8188eu: Used u16 instead of __le16 in rtl8188e_set_FwMediaStatus_cmd()
Date: Tue, 10 Jan 2023 19:20:58 +0530
Message-Id: <20230110135058.21364-1-gauravpathak129@gmail.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Changed 2nd argument from __le16 to u16 to fix sparse warning
  "warning: incorrect type in argument 2 (different base types)"
- Removed le16_to_cpu() in staging/r8188eu/hal/rtl8188e_cmd.c

Signed-off-by: Gaurav Pathak <gauravpathak129@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 4 ++--
 drivers/staging/r8188eu/include/rtl8188e_cmd.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 8310d7f53982..a055e71d30ae 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -193,9 +193,9 @@ void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
 
 }
 
-void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
+void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
 {
-	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
+	u16 mst_rpt = mstatus_rpt;
 
 	FillH2CCmd_88E(adapt, H2C_COM_MEDIA_STATUS_RPT, sizeof(mst_rpt), (u8 *)&mst_rpt);
 }
diff --git a/drivers/staging/r8188eu/include/rtl8188e_cmd.h b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
index 1e01c1662f9a..c785cf8ed683 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_cmd.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
@@ -85,6 +85,6 @@ void rtl8188e_Add_RateATid(struct adapter *padapter, u32 bitmap, u8 arg,
 void rtl8188e_set_p2p_ps_offload_cmd(struct adapter *adapt, u8 p2p_ps_state);
 
 void CheckFwRsvdPageContent(struct adapter *adapt);
-void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt);
+void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt);
 
 #endif/* __RTL8188E_CMD_H__ */
-- 
2.39.0

