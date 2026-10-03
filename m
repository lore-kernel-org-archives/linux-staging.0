Received: from mail-vs2-f16.google.com (mail-vs2-f16.google.com [74.125.227.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE62641C6
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 04:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002811; cv=none; b=EaFpVzkZGAQGLRX8AkGuYQrszhTuOYaUpQsj7Ou41hShR9Jzg1ENwN4xVYyngsX1V7v+feiobdexRt4OhKsS87mGaJqpmjyaZ1AvUSEoO1Zq2shnD1KWJVFhAC+j9IsxObKTbJ030xUnFVcmmxnUDpTbbgmYXulEB8f4cpZOIWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002811; c=relaxed/simple;
	bh=gIDbFUccMqnYFMZDIeOPhLXFY88ImLk2A6cLsl4slhc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S1YTphTtbXLMcFIOfaj2AdHRBDB2DMJByi3WKC+4ka8vx2JgCHCstWC/QRw2UHR2korqYbEelHTygRV3mieMpRPHxhZADIXlbDcHoTz5b6LjTgGX6bQkIGM3YBUWMe8CYlW1/lViVMPgT0rpoVuX8G0QE5dpiw1CH+GvvwiCE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6jyuUgp; arc=none smtp.client-ip=74.125.227.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6jyuUgp"
Received: by mail-vs2-f16.google.com with SMTP id 71dfb90a1353d-5d79bed1d00so28443e0c.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 21:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791002809; x=1791607609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uHU7iI9EW7CI4ri+lRqVj5wszswoc/zT9qoMCUc6a0=;
        b=Q6jyuUgpn+NuEfdDDVdO9g+LvnkFOfcdQUOrmVQ2xvyBWcUsO2cHENIvMpEl8Ed/tD
         +EgCp5p4u7agNNYhP83o407ndsWSoBxvMKyHW9ayKxr3LRTWAnf1DkXhUv5rMrtnlANJ
         v9kzBiXQK4klXBPkT502iMc4/7Mj/lWBzR5Lf6k5kl9pzGr4BRw7QeF1GL+HLuqKVbvp
         bmlmx9IojRnYbNyolIMLwmiyP+QpACmzm8AqUL4bNRlYZvuKEwFfit5jr9R3wfkk9W8H
         OE1qONXD5xibgoPcBDi+XQjsDU2ZNxAEgKmIEDAsT54aeOxLgir39PFqjOGnQDyXVwvA
         VBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791002809; x=1791607609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uHU7iI9EW7CI4ri+lRqVj5wszswoc/zT9qoMCUc6a0=;
        b=kAeqiOmOIxeuUFPXd6KkEnZArT3MjxobMBahZd5QdRsmUhb7+CCFd+jh7EYQLkmVDw
         7YUmGmO//cc3ul6Vj49f9dBlpTrJ/p2GSQX5YC2redqWRbm4BbHq179KAgNws7POnTSB
         xv5MMJ0NQXvEWxBDiixurhXhEew2Yehbdg2BVdx4O1pcCiosREr4cAX1ZaHpgRd8m2/D
         lvSjG/AMZmH83qMdULslXGNL5W/IcxMB2v+aFfx+EqROcltHHJSy9igmtaEXeDl251P9
         SCpQ4QMQtK2yZ37V7jroI9qGXw7t6hhGdoWjzvx2AugEASpSuKKPWCQg25IjYPA0dujm
         ZakA==
X-Gm-Message-State: AFq9FYITp2RAPxjvAe9Bx932+1d8i+7WZJ13UkjWcfqaJo5n43kOIbne
	Fcz1kCCLwtKuOZkyqqZc1RJOHwItCIwIS46oMEQm1ZySwMOGyiTfZ1M=
X-Gm-Gg: AYBFou2jfYjX5w8KugfcNDSBGE6YsGkoZXFt8vsO0KoO6x0pJKs+IUw50Rnc/uAOWEh
	VMjwY1Y2rFjeCM6dngzwgx21nTtP8s78bVHj0KoXy2Z2sEFIbDIL2lQVfOy25Z3S1RMnhwvcdJ8
	tX6qz1JvSe1a43bkgSTlKzgTpQYHaC8Ibk3t+2KBdIPBFDMzMhCbJOlgSjw8IbhLTb8myx5tC+I
	Y4tCmhwRz9lteLQUOkK1LKIWWe2xi6KQrapVpknQDOb8CfwJIruTdN9s94zTsUesSNrOSA+IWOz
	hCcPydX2TUVaccT1hgKxw9Im5SO2dux2HZpJ6U44pssyOQc1+nunHVnfhmz4p1MPdTBrZlfxVWl
	MGeLUZwfa5zd9e8EfatD2EJx0tsyEitWroftUjwrQ8YatKTY3nDhKQb+Pjh92/IpFcAoL6d0lT2
	oIJXlZyqJIoyMdINjfczWtTRnSE/oVIXk/kGEDARSBh1I5z82Io60d4Ei/VUVp5pMaJCbE8v55R
	l6YvRk+DsCMvy+X653Zaz2oUKYIYLHQDzFZeI4y2FOT3OgCaBNHkl6GhQB2EIDYf2hdTh60
X-Received: by 2002:a05:6122:469f:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5daafc57003mr1406970e0c.8.1791002808599;
        Fri, 02 Oct 2026 21:46:48 -0700 (PDT)
Received: from x1-nano.. ([181.55.23.9])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61112dfesm6006789e0c.4.2026.10.02.21.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 21:46:47 -0700 (PDT)
From: Steven Sierra <bizoru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Sierra <bizoru@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove multiple blank lines in rtw_recv.h
Date: Fri,  2 Oct 2026 23:46:43 -0500
Message-Id: <20261003044643.2451960-1-bizoru@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collapse runs of consecutive blank lines to a single blank line to
resolve the "Please do not use multiple blank lines" checkpatch
warnings in this file.  No functional change.

Signed-off-by: Steven Sierra <bizoru@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 9c32d480a2..28d2f619bb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -58,7 +58,6 @@ struct	stainfo_rxcache	{
 */
 };
 
-
 struct signal_stat {
 	u8 update_req;		/* used to indicate */
 	u8 avg_val;		/* avg of valid elements */
@@ -140,7 +139,6 @@ struct rx_pkt_attrib	{
 	struct phy_info phy_info;
 };
 
-
 /* These definition is used for Rx packet reordering. */
 #define SN_LESS(a, b)		(((a - b) & 0x800) != 0)
 #define SN_EQUAL(a, b)	(a == b)
@@ -212,7 +210,6 @@ struct recv_priv {
 	/* s8 RxRssi[2]; */
 	/* int FalseAlmCnt_all; */
 
-
 	struct timer_list signal_stat_timer;
 	u32 signal_stat_sampling_interval;
 	/* u32 signal_stat_converging_constant; */
@@ -238,7 +235,6 @@ struct sta_recv_priv {
 
 };
 
-
 struct recv_buf {
 	struct list_head list;
 
@@ -261,7 +257,6 @@ struct recv_buf {
 	u8 reuse;
 };
 
-
 /*
 	head  ----->
 
@@ -271,7 +266,6 @@ struct recv_buf {
 
 		tail  ----->
 
-
 	end   ----->
 
 	len = (unsigned int)(tail - data);
@@ -298,7 +292,6 @@ struct recv_frame_hdr {
 
 	void *precvbuf;
 
-
 	/*  */
 	struct sta_info *psta;
 
@@ -306,7 +299,6 @@ struct recv_frame_hdr {
 	struct recv_reorder_ctrl *preorder_ctrl;
 };
 
-
 union recv_frame {
 	union{
 		struct list_head list;
@@ -361,11 +353,9 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
 
 	/* used for extract sz bytes from rx_data, update rx_data and return the updated rx_data to the caller */
 
-
 	if (!precvframe)
 		return NULL;
 
-
 	precvframe->u.hdr.rx_data += sz;
 
 	if (precvframe->u.hdr.rx_data > precvframe->u.hdr.rx_tail) {
@@ -405,8 +395,6 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
 
 }
 
-
-
 static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int sz)
 {
 	/*  rmv data from rx_tail (by yitsen) */
@@ -435,7 +423,6 @@ static inline signed int get_recvframe_len(union recv_frame *precvframe)
 	return precvframe->u.hdr.len;
 }
 
-
 static inline s32 translate_percentage_to_dbm(u32 SignalStrengthIndex)
 {
 	s32	SignalPower; /*  in dBm. */
@@ -447,7 +434,6 @@ static inline s32 translate_percentage_to_dbm(u32 SignalStrengthIndex)
 	return SignalPower;
 }
 
-
 struct sta_info;
 
 extern void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
-- 
2.34.1

