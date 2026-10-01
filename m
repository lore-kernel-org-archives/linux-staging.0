Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85588521892
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867912; cv=none; b=UcrxoBJ1Rn8hLTQXFTG+go/PJXsE14Cu4frzLj0JB2Jvg9vZMdeqwpp03AhupQdM4Tyl0P+vABur/rAusVOKbl+1IH9PBSx5Mp/ElPifo7wDSuN1zQ9L9/zHbHc/+qPZimBj5CaTQnvMhLEjlCUBIUDVRtL3v+KgFsGGsomJ17w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867912; c=relaxed/simple;
	bh=/a5I0o0PXfY6fo//dcOVIvt+RZlHQAF4wYFHD6XTPm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6n0MoOYSEyTHFoeld80xL9L8ScjH8Nuab/ElQlxcBOjfVAf0yRCuLrnL8L5VlPn95dj7TPr4yS+M7tcKfcd31jfDpbJqpNJshIZqcoxjMaDXicK0hELgb8mqVHXsJDh5ghtrXPu8LvXNHAHcm9JnxZYrEEsSEqJ9VozmR5lk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwNbur0z; arc=none smtp.client-ip=74.125.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwNbur0z"
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6aae3e8cf08so4754740a12.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867909; x=1791472709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVJFHk55f/JB5gxQJXumCKsoBsmFGnW9ftl9dla0NlQ=;
        b=qwNbur0zGwzYEkckK30UaIutbG45QppFguDY2k9RxX14G47A2BKrA8ThTtjXA8Bwui
         D1LxYrlAPFOWmiJE0D+qugDKl9hDmldYOXW8vi782gpUTilepuH835VZZWE3C5tW2Nur
         BZfR4c40J5fyGl+oyWvBP11o4fKq8Z8yeyI/0EtdBgzH9VYl1BqP2FOoBhs59O+IgsNr
         Mn+N/PlSdAo5AxcbnxvfxJRimmEG0Rzj0LOuGU4n+uWnk20Gmct2wmRf9AZlcyvQsV2e
         Jwhtzrn0gEFyqPT5sF4YRbVc1koLC/4es6e/5qFaW4qS6vYl03lWZfy2sDClWq4WhTdd
         vGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867909; x=1791472709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVJFHk55f/JB5gxQJXumCKsoBsmFGnW9ftl9dla0NlQ=;
        b=NgXjLacgtYJcHrh8xamTqwtgSDagLlPhZJd51woZfQ7u2j+sMTgSTOfekk6uUnSPNx
         8qv19ugOYscZtpjcLbIQKCzd9i/GkcRDx0VetJe5elCnpMSQ9fGz45RuRI+A1P89QBpz
         jDApxEg2mMKhEj6QO7UAffb9dHaoJTchSn1E1yWfmdeW3AWVoyiGeO470ea8CgqVzuV5
         nUrpMIjaun+DSuXZY7VGziTodRJHygpYaBnon/0Y6fOZuoUmcO8VIW8nDR0f2cpHDbHQ
         HhHc9StrtnGvsL3eShFZnCrHf1ePZ1tM/NHDh0yI2Sz1JqJw4DHdUWhHJbvg32CpKKCW
         pMAA==
X-Forwarded-Encrypted: i=1; AKwUvBzHP9aJUDDYCqxcuP8gTbd9n6sMhHapamacE04jroPQL5meSLt2Ee0NXbMo5ynphjqmGtkGI/8nRlevcRvd@lists.linux.dev
X-Gm-Message-State: AFq9FYJ6EUrQKrZLdVp9DA5JB311dNh8ORLI3wIgUEsGATgz1Fbg4v3t
	NFtCDFJvgIoRoMi/Kroi6O+9iTBuT1VUEXuZ36vc+YoEqhKo5eh4wNeJ
X-Gm-Gg: AYBFou35E7x/YC2D7UCBJDi/YfpQHvKgifN02HikTPYdhG3233ITuGM00oaxk+EDJJv
	DX1ys5LfxHYI5ckPDANiHp1H/c71X5kMM6InCktTMnD4q5LyGbDxPb/++81BJIr1hTaNrGn3/n2
	8yETiqxW0USvni5kimjjwoDSLuJ/v2H52xpBJz/1SSjTVfYvpAFvYuM9DbFprF4+k/kRa3mMWbU
	bGFbRYtlQYoODF/FkSyBg4XiRp2DTCZu8brTqLiHoyV7zgEzFZsSX5OZU6Dz71zbWkc7UGUe3Lf
	iSJCOOt9n9Ub/or9xLItmcR9wsLn8nLIyNq1H4TlGJdu8cpduPPlcWZvkmEsizv7nkIL3XHXAyj
	QfCvsS8bNMSPcCVpdvB8fGSSulMUI4K+D/SrGvaREMDNlpdXWZAIc5v3z2EjT0U+USw1LZHCrj5
	xTsKqPT+HiuMjsnhWnf+VBUvRFR0bOBXpH49R/UIozZyqMS6PA1pNSqdwExA==
X-Received: by 2002:a05:6402:a0cc:b0:6ac:d86d:f709 with SMTP id 4fb4d7f45d1cf-6ae199333e7mr3746086a12.25.1790867908358;
        Thu, 01 Oct 2026 08:18:28 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6a3b7sm3881916f8f.41.2026.10.01.08.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:28 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	m.steinmoetzger@gmail.com,
	atharvmargur@gmail.com,
	straube.linux@gmail.com,
	andriy.shevchenko@intel.com,
	s9430939@naver.com,
	qstrydom0@gmail.com,
	dev.lmmrtns@gmail.com,
	khomenkov@mailbox.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Thu,  1 Oct 2026 17:18:14 +0200
Message-ID: <20261001151814.157881-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct identifier references the 8192CD chip while being in a
rtl8723bs codebase. Additionally, the identifier uses the _t suffix,
while being generally reserved for typedef identifiers.

Rename the struct to rtl8723bs_phy_status_rpt
across the rtl8723bs codebase to accurately
reflect the driver and clean up the naming.

Additionally, propagate the real structure type all the way
through the call chain to remove redundant casts to and from u8 *.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   | 6 +++---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h   | 5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 7 ++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 34b0369a7936..c85194c8fe67 100644
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
@@ -105,7 +105,6 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
@@ -383,7 +382,8 @@ static void odm_Process_RSSIForDM(
 
 /*  Endianness before calling this API */
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
-			  u8 *phy_status, struct odm_packet_info *pkt_info)
+			  struct rtl8723bs_phy_status_rpt *phy_status,
+			  struct odm_packet_info *pkt_info)
 {
 
 	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index ca3380328a72..21182a880da3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -18,7 +18,7 @@ struct phy_rx_agc_info_t {
 	#endif
 };
 
-struct phy_status_rpt_8192cd_t {
+struct rtl8723bs_phy_status_rpt {
 	struct phy_rx_agc_info_t path_agc[2];
 	u8 ch_corr[2];
 	u8 cck_sig_qual_ofdm_pwdb_all;
@@ -57,7 +57,8 @@ struct phy_status_rpt_8192cd_t {
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
-- 
2.55.0

