Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14AA3DDB02
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869918; cv=none; b=mTM5MO/4rXuwa/p4KIRDuDeweMXCOufnah+Wi5DC53IcLRX7s5oBure/9U/QLjOvvC7c3F1vvJmD9qLwxzBur07H2qOPcCzIIfl+nIAfZEHOhNKAzP32VbWeK18eteI3fod+usrC7jFHulueK/jC3B29IoDRFzuFaL5qCvIAEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869918; c=relaxed/simple;
	bh=8D4KfYrVlVXwyqWnK/YbBls8DmHeg530/bdJqD/KZn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5vS51U3lGOTDge8JPs3t73LO1l0Ha3SbVZlizAYYThOvOjXCCn+eyU7qBGp0jXj09U+tapjv886ggJHYv+3DvPw3uhnbpBemViaGhXUkYIkB5qqKZpGnj4X9hglSn3diK18BJir8IUSCQ+uNhsOhzhUcOFNCIhxBSIzJMZPoX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGUllvnJ; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGUllvnJ"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48afdb27425so557310f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869915; x=1791474715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXDrZW8Yth+9+duqV7J2Csa/w7pQ2E6AflQjaMeQxP8=;
        b=PGUllvnJ2d/YQdqMeV5w/pzKOZ/5jLOa+4LtnD53eEaEXvj0N6VBcvGraWHuKsn2FB
         nTL8S8IjfGS11scTwV9VFP8+TgA33UZAb6RSnqrY9XUMqKX+lmhW8SRcJJQ39ibqjPfY
         HUtWIU73nBlNkLG0Kqi62GEMD+EJvqfdeo4kOYpuJinop/Yn30Xkg9yDlsv0/uzzJlrh
         Ckg7n0CK3OsB/NxozPDWXQo4rurjWdRdn6+t6wqL26ULbZuPgOq8MhQEJzxF8jJ9TSNd
         sYn25CFapxKmSS6f19Gn3yy1/F30F+g7pymARhS+00Mbi4HpTTwQKMOFHHXU2k7dR/jy
         UY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869915; x=1791474715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXDrZW8Yth+9+duqV7J2Csa/w7pQ2E6AflQjaMeQxP8=;
        b=zaXm6pWSWSJ54TKLb7Lh+qXXf7HZ0FWTKvGMqe9POpLGGvJFhLbBCWrFfeg1E7NAch
         26C2yHYNOFqy3UPstOBYq80Wi7J0Eq5XJFGhxXVK+qAF6oWRR1dLBhI70Rpr9Ox4iBn0
         bEsObp+rwRquO6MkefydxvvQ/gofuZipyo/8VnmdeNKf3zQ3WezFPZmdQMV2BLzwTxEs
         yeqjWG4phc/Dhbpevw8Iqfv3heIwMlefvMTIoAudBWC+c84zKys/eQXXrsnPNDntUQdT
         ce/TxdrXfBEozLPeOsY9tfmxxsiTnHyb2yG4w4I72sQkRD0+3g7Jx5gXS7YPEfldYZKG
         9Aaw==
X-Forwarded-Encrypted: i=1; AKwUvBwrT+5sfPlrG+e1haaK33iHH8MxigZPoI19gcuweMr8j1Il1KeSyEI29wti2U0xPaQyNjxH4NwUMmxzIa26@lists.linux.dev
X-Gm-Message-State: AFq9FYKIiFPsIZBuumiSHT2CVHYh4zJK50YPVzu6qUuAweEqL1R8U5TP
	oHFFcCAAapFcnlQ+F4OBv2ACALoCW2C5j38DQ4B52invPNBBytDlR66P
X-Gm-Gg: AYBFou0268zHc7VlNuRSOTfA3QgXNZ9G4MMkDHuI4AgYnN9dzW+9kdJ0LOIuXACP1Kc
	+bKolJPNpRrN01r9VSLefsRuHLp1Gqd5PQSUxDN62JI+gVZ7dVCz7PaYAhQ3oGcDp5GR2s8tJE3
	IHkif5xBzwuNaeqkuZSjHur18WKoHaaMXz/d35pKfQn7kHfaUGFY8UfnsQPSnvStKKvmplXxRfg
	uX6D7PglMUUfJb3WAyvUqNkonqxGZNc+kjL0J7F/ZsHLmrxK24NrJ5waHRBEuLG9i8Qmpxo56W+
	beDbRC6KTUnjf2NFUjvOl/41gQ4JcioLTy+nzasnSx9ThD4+VQkJO8/Hbn2k1JRU8FKIAfvXECD
	4yOG0P1kpJUKH/8U7dR/QHrrWnXlj/6ay8aVrelnrZa4DTJsC5i17cyUrJzPh32DE24L8jg68ii
	hzFxWt2zR0V3LEpvlJyyq7fR6PK1b2n9UdypVAf3ZwpE6E2hZhz8dESJrfbsLl89qe17gx
X-Received: by 2002:a5d:6f1b:0:b0:48b:26c:8cc with SMTP id ffacd0b85a97d-48b12716e36mr46781f8f.27.1790869914694;
        Thu, 01 Oct 2026 08:51:54 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff96dsm6878545f8f.8.2026.10.01.08.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:51:54 -0700 (PDT)
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
Subject: [PATCH v3] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Thu,  1 Oct 2026 17:51:34 +0200
Message-ID: <20261001155134.159481-1-timo.joannin@gmail.com>
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
Changes in v3:
- Included patch version changelog (missed in v2, sorry).

Changes in v2:
- Propagated the real struct type through the call chain to remove u8 * casting.

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

