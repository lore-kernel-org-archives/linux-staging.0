Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727770
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h14so14290042wrx.10
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ox/3hovqRmIBLc2q/DXSwnRb+KO+HROy6YUiuqSHaDo=;
        b=Gw7CHIKdEoVwG47RJzW/ImQRhHUoWVRgOD1ibTvIqRZXnFm7dJQEh6XAHoLJeTKNFy
         1TEx/Njo+6EDy+xnMdlt6PCh7XX0bkF5iCyYiFyp6VnJJRA0FFarPYR2f+Hb3Y+9cyDR
         0lezS9Vf1rPWlT1ivpZokGyi78B6ZbUKiBGL2BNXrrNqjC+BrmEUXEXsJFh9S0890sx1
         FWin9gTOlO4VZmJCL9st8VUf88+B6scwogWsDGHMjeziuntFvbcUb459YvDbQP2rDfXL
         PIP9XByRnUq6b/qPMCuDuQR4JEPJ/ASHDAOVtnSI0F/gfxxqzYSH/h8rgifrOf172G87
         0G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ox/3hovqRmIBLc2q/DXSwnRb+KO+HROy6YUiuqSHaDo=;
        b=QDz7XU7ICfwG2Tw/QXP2xZQ1Mh7BPkPXqAhLgTZ7n7aJffe7MNTrHOb4gtvuln/3Ft
         oXesr5iTL0MxX98LSfLPAgQcb3mPgAoPZmREk5gi+e4NXe4wgdg1qVCHtnFIFe68+k/d
         4oj2xUFJD5HNqHFuuE3C1Nscg7JxqZlzcxKM2mu1FmIrh8cdN1iO9oTqms6Y1+X983o/
         W1Js06CCFFWTgW0lkP/LUiMaQ0pDc+RvjOqtpdH+im4UkMtPYXeYPovajtzzmeVxcfZ8
         D4nn3PSrb/CjF4cytcth4+fh/mDdjNlGgtNfGgIk37Yy3x79Kelawli5B2v9UElvLsFl
         Q0Gw==
X-Gm-Message-State: AOAM5337ICkhRJxx7OeUb7HF+/5cNgFVuYe3NjzFG7p6zhuRU22JLzdz
	uFBRZmja+vVwITYvVWAFmQk=
X-Google-Smtp-Source: ABdhPJyxCvaJnV9ZkjoYCDTfOC3NjGELL5u+Dv5YKIlEo9igZNMsE4smYpC1XkGksYxRlF0HgWWN3Q==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr15228450wrq.263.1628329704588;
        Sat, 07 Aug 2021 02:48:24 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id f17sm14669023wrt.18.2021.08.07.02.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:24 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/21] staging: rtl8723bs: beautify function ODM_PhyStatusQuery()
Date: Sat,  7 Aug 2021 11:47:59 +0200
Message-Id: <5e17b5ece9dbeb526f7a9aff147bf8767d39395c.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

beautify function ODM_PhyStatusQuery().
Fix camel case name, put more than one argument per
line, fix camel case in arugment names.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   | 8 ++------
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h   | 8 ++------
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 2 +-
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 5e6186040484..16d479dbd069 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -393,12 +393,8 @@ static void odm_Process_RSSIForDM(
 /*  */
 /*  Endianness before calling this API */
 /*  */
-void ODM_PhyStatusQuery(
-	struct dm_odm_t *dm_odm,
-	struct odm_phy_info *phy_info,
-	u8 *phy_status,
-	struct odm_packet_info *pkt_info
-)
+void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
+			  u8 *phy_status, struct odm_packet_info *pkt_info)
 {
 
 	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index c0dbf5cc8ed4..b2eae7d993fa 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -76,12 +76,8 @@ struct phy_status_rpt_8192cd_t {
 #endif
 };
 
-void ODM_PhyStatusQuery(
-	struct dm_odm_t *pDM_Odm,
-	struct odm_phy_info *pPhyInfo,
-	u8 *pPhyStatus,
-	struct odm_packet_info *pPktinfo
-);
+void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
+			  u8 *phy_status, struct odm_packet_info *pkt_info);
 
 enum hal_status ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 6dc5cd959b75..418016930728 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -129,7 +129,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 
 	/* rtl8723b_query_rx_phy_status(precvframe, pphy_status); */
 	/* spin_lock_bh(&p_hal_data->odm_stainfo_lock); */
-	ODM_PhyStatusQuery(&p_hal_data->odmpriv, p_phy_info,
+	odm_phy_status_query(&p_hal_data->odmpriv, p_phy_info,
 			   (u8 *)pphy_status, &(pkt_info));
 	if (psta)
 		psta->rssi = pattrib->phy_info.RecvSignalPower;
-- 
2.20.1

