Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B9553E319
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918966; cv=none; b=PqcQ9eExBA29AsjIqvkqG2G7ajuEDi+iUNrMwO7XOCzqyhU4zHnHWvpg+In0kcuD0I6pjscSntVoBSi3tMUYuCZVhmkm2yCnrbLLvHU0Z1z4K+XzlzVKGbP46oAgub9sa6RxK8FgM4Mf3hYjUH8dvYoIMITw4/W45UxQUMYXFYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918966; c=relaxed/simple;
	bh=IDJqFbIJ+Lq1Jf9DcU0KCW0ttxfoA2bTcIvvprI6nfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kw1cAD+oW/xAH7aG0Ytpt2yjn0mu6Ff5+momFbHWm2gvMmqEA8ecu/4EZhfeHUswPfmyYk/oEzBaMKPYZh7AxKTka/h7zBAILtOtDck0w5GNXI9EMRWTofLOkmPbShaiSR5n1LD/2GZORjQoxUQCvoaTbpqZVZ3HfY1p9aMwv7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcIT8yAt; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcIT8yAt"
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a1963cf318so3536745e9.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791918963; x=1792523763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDIRPE7o88CGHqIF/j5hvY6UjNuhEKh9m4Ei7y5vR34=;
        b=mcIT8yAtfPKocTonhhj8Yc8OaFVDRuIOy1zIXx8qfh2jb2g403WbXPbPjMf58dyp14
         VFDLv9NKYZzwNeaf9IPuNZAwMIKgMCcEgMEYQ6hrsQ5FwNVK5ug4PmfdcYWMT7W0zg0m
         CZRBpf3lWYM7MxVJkUppIG62zQ/tV06Y2qu+jTJDv4pgqApNeLDaTW96WCmORHX5DX1M
         RD0n4M1sU8DoW86EPxNQ6bw6o7mFXtdCjlt5G1XszCkaX5o6wD+aTFUkF1Ff78zSsjlk
         NgcevkndESjr81knaBkusn81a+N1b1R/pYaF5JaNjSjFj/MWlkjtdhROipp/LUbQMjCc
         FRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918963; x=1792523763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDIRPE7o88CGHqIF/j5hvY6UjNuhEKh9m4Ei7y5vR34=;
        b=rHlNhBj+yaFmi4ZHu6WuRyq+N41rMgUi/bxXG3CT27K2R8gT5Ba5lHIINRtkDnK03v
         AqfxrJpcfcqScJS6XRImdObH931OW6f+FACPFuAaDDXpYeU3IncMeArT8Dtmxcz4vl8J
         6D1sPcMAAnLn7l+/VSL/l7rhzzKj+ViawrV+2ZB0uthvXoXJktqkWQbr0cqI1T10C1c+
         UQ+9UskpMzbgtCDXcUQzEU0O7D2pYNjWuSLd4cQVE2BgPKJc5YCYqCllEtTezibiaxbd
         coHQerNar40vkGFqU0UG3llhOLTwvmljfTSfBht92ki/pfB+UmqLILrgh0QOLkIwkE/u
         xCzw==
X-Gm-Message-State: AFq9FYIn3J3SSc1s4TLuQ2cA2AD1izfyRBYLnTbq08qwqjaPYL7aaWy9
	nUYeuTv5M2x0wjcr2/Enrhy+56xqO21jWKdICyNX9C/rTJT6iXWJTcqk
X-Gm-Gg: AYBFou0QcrtZacM3/V4ZH2IVodFbunbrGkcv7hT80XphGi93o6SIvpMPMxO8UvEOY8Y
	Ed5z6KPbubstZiXkcTGhd6KQjx+wIRHRzBcgxUvGSsLYdRGIjEtfn+sY1p2bMtq8YyxOPjkUUmw
	18YWQe7OXBXjlunhBjgvQ6FGjEn4yTWHoFZzfNWPSRZ9w3jp/YbtNTDznZC8a+KkHTgCnkreAMw
	8UjV0lpJTN2l3j2fp8nvJ+gxDj545FIZ7Rvnk6qOgsz3SJwnmiIShv+iYF46HifhKmSIPwmqNDx
	fsiTGS3bBVGNxE0gXkJhx8PDYafaNncNWMOGjpXIAjlvZwTVN8IpgFRx+MZG3nFX4aRuVl1lK73
	cC3cpl8APLvk4MtewG1crXXibFq805CgXxd1M+r8HNNe+Dl5FwTtkPq2zkezi2cot/057YARnP7
	K0Mk7IO8epiBO0v7Lh0Z6JumXwR4R6nKoFEjOFNQwRmdUT4C9IyhzyuKdRzYRcZq6EZhZS7Q==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr266379435e9.33.1791918963174;
        Tue, 13 Oct 2026 12:16:03 -0700 (PDT)
Received: from fedora41 ([37.168.42.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2fc4724sm7229275e9.2.2026.10.13.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:16:02 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	guojy.bj@gmail.com,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v5 2/2] staging: rtl8723bs: unwind cast mess and remove phy_stat struct
Date: Tue, 13 Oct 2026 21:15:03 +0200
Message-ID: <20261013191503.152056-3-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013191503.152056-1-timo.joannin@gmail.com>
References: <20261013191503.152056-1-timo.joannin@gmail.com>
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
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   |  5 +++++
 .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
 3 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index fb3a19da5de3..c0a079003e73 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -432,8 +432,13 @@ static void odm_Process_RSSIForDM(struct dm_odm_t *pDM_Odm,
 }
 
 /*  Endianness before calling this API */
+<<<<<<< HEAD
 void odm_phy_status_query(struct dm_odm_t *dm_odm,
 			  struct odm_phy_info *phy_info,
+=======
+void odm_phy_status_query(struct dm_odm_t *dm_odm,
+			  struct odm_phy_info *phy_info,
+>>>>>>> f52adf8 (staging: rtl8723bs: unwind cast mess and remove phy_stat struct)
 			  struct rtl8723bs_phy_status_rpt *phy_status,
 			  struct odm_packet_info *pkt_info)
 {
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
2.56.0

