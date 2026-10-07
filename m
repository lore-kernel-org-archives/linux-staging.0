Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DA247253F
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364117; cv=none; b=g2D2RpkIBg7PBFNnonPAkvsK6OxWkgdpSGxwVrCl0G2jj5djPXL5vLpsNNjtBBGu1B3RR3Xhqx6Pl2U7ALbELiau89mAEAYVrsDXJyAHCqtcABQV2ebzFpUzxiHtc1z+qCzdD6EZ1uTPXwpoBSsF4zUdM081pUb3mPBPQfhRuwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364117; c=relaxed/simple;
	bh=Am5V6nrOjsB6Eu0oH+SlaPHYK1524n4Tq6KBCE5kOkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWusZUqmq0MWIBTCQxrGjPgDtfzooLyhUx4tZOh0n9C3lMKYGuMEWVY89ywJbC6PfYNCBFUaNBG/nhqYyjjQ5BUYED2C1bOSzS4PkhNbPesoxAIkQlm5y0m2xYAC4cKAbGHM8/9uy2bgrUrTBO7EK5C5WrJmQGaJrYfjsTLngMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZbETOlG; arc=none smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZbETOlG"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c2e3efe8880so149983166b.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364084; x=1791968884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dSd8UfCb1J2hG8yzHAzc315d3lw6cUEHsW18/sU0DU=;
        b=iZbETOlGdc+jxdI7MxbRUCgIcXAHPKNRvXukS+V3ROQj/ChmmQw4AstDSf9e1LSsqE
         9aob9AK6hInWavZ6xrALEG3SQVdISR1gRjpNfo4608DlDbxc7lGSBVg32pn2ry3R2xru
         KuWNNH0NuY2khSx+xPpIrYgYxoUSVTsJ4E1RP5TAm74ckl7hZTncsM5XjCzH1rCrXtvW
         QbQNLF7kMx6Y10SPUODST7t4ZHq4cLgiYFPJmTxEESff6HuMof6nKDTrYWmOodiV1sCR
         nqPHplqiV/Mqpun8ICo3GSQ0B8QJ65xiMCrF8gJ6SUfmDTpDOQvNqSuOS7qXKN6rsz9H
         hcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364084; x=1791968884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3dSd8UfCb1J2hG8yzHAzc315d3lw6cUEHsW18/sU0DU=;
        b=Ffb9ukA9nEq+EBFmPyMwgFSbLAvisMMzWmLr/X6tc+fWoaVqxYkr8XZSaryHc7vLae
         IRGzsYPneqTkrWYAylScugoRFbF30aPf1fAz4KbTMXNJ9fCc/u0NkdIb2ZmpjPHtZ4te
         zQIvALzcSJe95zhW38wuXk5/AhlG7wncluEM5bLRl3hz3MiMHi7rkqO3Ea01mlLgEiKy
         UwxM5+4XzDyUrmE62eudd8TK9oB5ZBnjl74Pz/E2TtgoR5DLJQUwkr7VQoMFpXaSM6AV
         Oi6m6aDuEi6qD8nFEhCKS6ynd9qbmyEwekSG/c9MBIyeXLZXd6ekIU53j9jdksGNala+
         LwNQ==
X-Gm-Message-State: AFuF++mpJfSVyp9ggHYcgAY6N4bXQ0YuqZ986X066PhlyZbBLo2NJy/+
	Sq52OtYdfqsh0ldD3rIyJE4I2x8d3ST+NssUPpmAq6UlmwN4JwJXEvr9
X-Gm-Gg: AYBFou1CKofs8JZwJ3nvb/Nep6ljIqD2v10BJX4JY2tqxrA6wBcj1EUD/cXz8FtoUqY
	r8V9VDgx2yy9v8pehdQzzGC2wn4XSQOR0RoQOiqw+1S9hFx+9y0mjaSUMJXN2Zr6NjwpXguwUVU
	hQmvh8oBvqzMyyFY75cGg/JxpX1SZg4OjeRPp07nsV+SYdL8kRJPp+JRmGC/shdCYciXFS+mPxP
	1X+Nw5/9Ex71L8HuJwdt0OmC8RN/bQIxQgXrBsX+y0oZLS1tu/qq7RGkSViuZjkMy4UJgXxaGS2
	W3tApom67PXNZI+GcIaxlmzt4mL3xPcVoVGPWh3NnMqZssd5Snu8Uqyg57t8WHXu6s6SEYIHWcV
	ws26PNpPz7hCa/s062dt9YJS/3jLjR99hJYIIjUPC4n6EPZzD3NcMPnQOSjJ2i9YxL+/G0s9QkX
	3zS3/A5MHoZsQ8hyuwbFqY5pd67xpJ4JoQtrImX7+ZaVUvJRr4MqdaFQ37x+sKrI+dVVQpfgZs
X-Received: by 2002:a17:906:f586:b0:c26:19e3:e97f with SMTP id a640c23a62f3a-c317c098f26mr144416466b.31.1791364084196;
        Wed, 07 Oct 2026 02:08:04 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm3975319f8f.33.2026.10.07.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:08:03 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: unwind cast mess and remove phy_stat struct
Date: Wed,  7 Oct 2026 11:07:36 +0200
Message-ID: <20261007090736.277636-3-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007090736.277636-1-timo.joannin@gmail.com>
References: <20261007090736.277636-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the real struct type all the way through
the call chain to remove redundant casts to and from u8 *.

Remove redundant phy_stat struct, along with the dead function
prototype rtl8723b_query_rx_phy_status() which referenced it.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   |  7 +++----
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h   |  3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c |  7 ++++---
 .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
 5 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index bf2479c01873..c85194c8fe67 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -95,7 +95,7 @@ static s8 odm_cck_rssi(u8 lna_idx, u8 vga_idx)
 
 static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 				      struct odm_phy_info *phy_info,
-				      u8 *phy_status,
+				      struct rtl8723bs_phy_status_rpt *phy_sta_rpt,
 				      struct odm_packet_info *pkt_info)
 {
 	u8 i;
@@ -105,8 +105,6 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct rtl8723bs_phy_status_rpt *phy_sta_rpt =
-		(struct rtl8723bs_phy_status_rpt *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
@@ -384,7 +382,8 @@ static void odm_Process_RSSIForDM(
 
 /*  Endianness before calling this API */
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
-			  u8 *phy_status, struct odm_packet_info *pkt_info)
+			  struct rtl8723bs_phy_status_rpt *phy_status,
+			  struct odm_packet_info *pkt_info)
 {
 
 	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index ae010cae9dd7..21182a880da3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -57,7 +57,8 @@ struct rtl8723bs_phy_status_rpt {
 };
 
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
-			  u8 *phy_status, struct odm_packet_info *pkt_info);
+			  struct rtl8723bs_phy_status_rpt *phy_status,
+			  struct odm_packet_info *pkt_info);
 
 enum hal_status ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 304fda3a3b5c..a62b845c69f9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -73,7 +73,7 @@ static void update_recvframe_attrib(struct adapter *padapter,
  *precvframe->u.hdr.rx_data should be ready!
  */
 static void update_recvframe_phyinfo(union recv_frame *precvframe,
-				     struct phy_stat *pphy_status)
+				     struct rtl8723bs_phy_status_rpt *pphy_status)
 {
 	struct adapter *padapter = precvframe->u.hdr.adapter;
 	struct rx_pkt_attrib *pattrib = &precvframe->u.hdr.attrib;
@@ -125,7 +125,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	pkt_info.data_rate = pattrib->data_rate;
 
 	odm_phy_status_query(&p_hal_data->odmpriv, p_phy_info,
-			   (u8 *)pphy_status, &(pkt_info));
+			   pphy_status, &(pkt_info));
 	if (psta)
 		psta->rssi = pattrib->phy_info.RecvSignalPower;
 	precvframe->u.hdr.psta = NULL;
@@ -317,7 +317,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 				if (pattrib->pkt_rpt_type == NORMAL_RX) { /* Normal rx packet */
 					if (pattrib->physt)
-						update_recvframe_phyinfo(precvframe, (struct phy_stat *)ptr);
+						update_recvframe_phyinfo(precvframe,
+							(struct rtl8723bs_phy_status_rpt *)ptr);
 
 					rtw_recv_entry(precvframe);
 				} else if (pattrib->pkt_rpt_type == C2H_PACKET) {
diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index b63625ab4e45..072e2b5f6129 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -9,24 +9,6 @@
 
 #define MAX_RECVBUF_SZ (10240)
 
-struct phy_stat {
-	unsigned int phydw0;
-
-	unsigned int phydw1;
-
-	unsigned int phydw2;
-
-	unsigned int phydw3;
-
-	unsigned int phydw4;
-
-	unsigned int phydw5;
-
-	unsigned int phydw6;
-
-	unsigned int phydw7;
-};
-
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index e9ebecb224a6..2f230e2d27a4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -84,7 +84,6 @@ struct rxreport_8723b {
 s32 rtl8723bs_init_recv_priv(struct adapter *padapter);
 void rtl8723bs_free_recv_priv(struct adapter *padapter);
 
-void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pphy_stat);
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 
 void rtl8723b_read_chip_version(struct adapter *padapter);
-- 
2.55.0

