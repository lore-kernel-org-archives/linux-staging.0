Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B8D8C11
	for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716722447; cv=none; b=law6M7ea2I/T/aeqK/Rj89LxPXYxrQOn0l2TK0J4FwJmd8KehaYzC2JNh4K65TcUwVLkFYkOpK0XiofmTALG9sWuL5Xz8YrCUCPJWbovoBquLnShEMup3i1KsmRC8ZQjJ+pzU63hEncwpdI7XCgX/1toS0B9b+NCuN+VVbuwSE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716722447; c=relaxed/simple;
	bh=4nW91lsMoRhISbgOyFITvMo+Qsc6DiQN/rZt8bOa+/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdW/HeO8QNmc6NdiG9LVBY42KzcCzXjspx8QI6gZ54HBWRvQFV91ZSR1KdGwh+58X14ws8n1RvnDonwLGkeIEfex1j3ykJJmS/wG7iatXeR+wYvmt3TyZve1IViBFJiT9o8BgDlkB/Jyuq7ZzAuNm99QqPt4W6w8695PvKkFeCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGkW9ybJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGkW9ybJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57869599ed5so1102358a12.2
        for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 04:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716722444; x=1717327244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syZ0Cd4s3FznpGYw+gPuAARyriAcDeWsVaK2kx6TUGw=;
        b=HGkW9ybJYpaFhod3T9LzojlY2JDS3Hs1bahAVU9Q5/XrqzVss7dzT4ownJxd4AG7QN
         Xzs3MOCt8k06F9YyRHi2U+mQjggsiusXwL3aTOaYGKNJu24pKU8pIhbZiuF6g5jbOS9A
         lJ9iyz3B5Qfn5GgbTiPhAkNqEM0uMHA36Z251e7E+Ark4HYL3Tcx4qap8KROwcAD/hFD
         1/BBQX1tjFZLkYRvkfYRhhqd9QfeS84NKfG2dEpXiFS6w8uYR0ImnnIPBiWdq22in7FR
         fDM7JLQwt/MT3gsMtRf+oZuBJXT49hl1pQmrWD1RkE9P7Ob6Gn21MtqhZ+7wG9kqctEv
         mdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716722444; x=1717327244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syZ0Cd4s3FznpGYw+gPuAARyriAcDeWsVaK2kx6TUGw=;
        b=Cyhp4JRlh5qvHogs5XyducWXULl9GbCksqgu3nH7qnWDsGRcfO4BiqWNCOpXcwqg//
         F4v1KKWekGpiHNm86tt7NbtH17KkfL3w4uyDQAGsFvcVL6QnkwekNARkzYjp7/yl+vZ9
         eh4QMR/pdiFmtStzwFlJ7bofKU5Munaz1mcH/utYKVFKzi9IKDRd/V4ncNy3IBTrBqIk
         iVu0Jk4X34EOYX9uzW9VFjGe0um3vCYjRXAkap9Fe2DdPr5FI1ToTmA3ZiVwLKUs2PjO
         eo6fVA/1picNNRfnii7kRghdTlYMHNvCcdqmlDKgKGC08xSMCinJ14HXTgW9QbuLkzsZ
         V74g==
X-Forwarded-Encrypted: i=1; AJvYcCU/gEKbwOhTAxC7ewy+sS/o+8IOo/CHOM9tncWcB9hrBLmpZfc6z2o/2u0nt0lFfTGf9oiDLY86FTCTaxGrqGZ+BB/WLdFllWX6hd0DLQ==
X-Gm-Message-State: AOJu0Yz35/4D8gTyVUK53P1oMTOhGaXfHE2DJ+s+pm6VTlu/dc+KqqVZ
	4c+cuuym4va75z1KbZR8EyXbdNal5WEBh0gTBmqRTN6kLbIfBDA5
X-Google-Smtp-Source: AGHT+IGC7ii5g3GCI9INcE+djtsNq7KWXcdyct1Hk/1N95YMi7CDZgYjH+PyQBKl+G9MfHEBZp4hNw==
X-Received: by 2002:a17:906:c217:b0:a62:2ef9:139 with SMTP id a640c23a62f3a-a6262f5c244mr441785666b.0.1716722444087;
        Sun, 26 May 2024 04:20:44 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8e534sm373983366b.170.2024.05.26.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 04:20:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: rtl8192e: reduce indentation level
Date: Sun, 26 May 2024 13:19:26 +0200
Message-ID: <20240526111928.14574-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240526111928.14574-1-straube.linux@gmail.com>
References: <20240526111928.14574-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce indentation level in _rtl92e_dm_rx_path_sel_byrssi() by negating
if statements and use continue in for loops. This way the indentation
level of the code that is covered by the if checks can be reduced. This
improves readability and clears two checkpatch warnings.

WARNING: Too many leading tabs - consider code refactoring

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 170 +++++++++++----------
 1 file changed, 86 insertions(+), 84 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index aebe67f1a46d..2fda44c5a412 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1335,51 +1335,52 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 	for (i = 0; i < RF90_PATH_MAX; i++) {
 		dm_rx_path_sel_table.rf_rssi[i] = priv->stats.rx_rssi_percentage[i];
 
-		if (priv->brfpath_rxenable[i]) {
-			rf_num++;
-			cur_rf_rssi = dm_rx_path_sel_table.rf_rssi[i];
-
-			if (rf_num == 1) {
-				max_rssi_index = min_rssi_index = sec_rssi_index = i;
-				tmp_max_rssi = tmp_min_rssi = tmp_sec_rssi = cur_rf_rssi;
-			} else if (rf_num == 2) {
-				if (cur_rf_rssi >= tmp_max_rssi) {
-					tmp_max_rssi = cur_rf_rssi;
-					max_rssi_index = i;
-				} else {
-					tmp_sec_rssi = tmp_min_rssi = cur_rf_rssi;
-					sec_rssi_index = min_rssi_index = i;
-				}
+		if (!priv->brfpath_rxenable[i])
+			continue;
+
+		rf_num++;
+		cur_rf_rssi = dm_rx_path_sel_table.rf_rssi[i];
+
+		if (rf_num == 1) {
+			max_rssi_index = min_rssi_index = sec_rssi_index = i;
+			tmp_max_rssi = tmp_min_rssi = tmp_sec_rssi = cur_rf_rssi;
+		} else if (rf_num == 2) {
+			if (cur_rf_rssi >= tmp_max_rssi) {
+				tmp_max_rssi = cur_rf_rssi;
+				max_rssi_index = i;
 			} else {
-				if (cur_rf_rssi > tmp_max_rssi) {
-					tmp_sec_rssi = tmp_max_rssi;
-					sec_rssi_index = max_rssi_index;
-					tmp_max_rssi = cur_rf_rssi;
-					max_rssi_index = i;
-				} else if (cur_rf_rssi == tmp_max_rssi) {
-					tmp_sec_rssi = cur_rf_rssi;
-					sec_rssi_index = i;
-				} else if ((cur_rf_rssi < tmp_max_rssi) &&
-					   (cur_rf_rssi > tmp_sec_rssi)) {
+				tmp_sec_rssi = tmp_min_rssi = cur_rf_rssi;
+				sec_rssi_index = min_rssi_index = i;
+			}
+		} else {
+			if (cur_rf_rssi > tmp_max_rssi) {
+				tmp_sec_rssi = tmp_max_rssi;
+				sec_rssi_index = max_rssi_index;
+				tmp_max_rssi = cur_rf_rssi;
+				max_rssi_index = i;
+			} else if (cur_rf_rssi == tmp_max_rssi) {
+				tmp_sec_rssi = cur_rf_rssi;
+				sec_rssi_index = i;
+			} else if ((cur_rf_rssi < tmp_max_rssi) &&
+					(cur_rf_rssi > tmp_sec_rssi)) {
+				tmp_sec_rssi = cur_rf_rssi;
+				sec_rssi_index = i;
+			} else if (cur_rf_rssi == tmp_sec_rssi) {
+				if (tmp_sec_rssi == tmp_min_rssi) {
 					tmp_sec_rssi = cur_rf_rssi;
 					sec_rssi_index = i;
-				} else if (cur_rf_rssi == tmp_sec_rssi) {
-					if (tmp_sec_rssi == tmp_min_rssi) {
-						tmp_sec_rssi = cur_rf_rssi;
-						sec_rssi_index = i;
-					}
-				} else if ((cur_rf_rssi < tmp_sec_rssi) &&
-					   (cur_rf_rssi > tmp_min_rssi)) {
-					;
-				} else if (cur_rf_rssi == tmp_min_rssi) {
-					if (tmp_sec_rssi == tmp_min_rssi) {
-						tmp_min_rssi = cur_rf_rssi;
-						min_rssi_index = i;
-					}
-				} else if (cur_rf_rssi < tmp_min_rssi) {
+				}
+			} else if ((cur_rf_rssi < tmp_sec_rssi) &&
+					(cur_rf_rssi > tmp_min_rssi)) {
+				;
+			} else if (cur_rf_rssi == tmp_min_rssi) {
+				if (tmp_sec_rssi == tmp_min_rssi) {
 					tmp_min_rssi = cur_rf_rssi;
 					min_rssi_index = i;
 				}
+			} else if (cur_rf_rssi < tmp_min_rssi) {
+				tmp_min_rssi = cur_rf_rssi;
+				min_rssi_index = i;
 			}
 		}
 	}
@@ -1387,59 +1388,60 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 	rf_num = 0;
 	if (dm_rx_path_sel_table.cck_method == CCK_Rx_Version_2) {
 		for (i = 0; i < RF90_PATH_MAX; i++) {
-			if (priv->brfpath_rxenable[i]) {
-				rf_num++;
-				cur_cck_pwdb =
-					 dm_rx_path_sel_table.cck_pwdb_sta[i];
+			if (!priv->brfpath_rxenable[i])
+				continue;
 
-				if (rf_num == 1) {
+			rf_num++;
+			cur_cck_pwdb =
+					dm_rx_path_sel_table.cck_pwdb_sta[i];
+
+			if (rf_num == 1) {
+				cck_rx_ver2_max_index = i;
+				cck_rx_ver2_sec_index = i;
+				tmp_cck_max_pwdb = cur_cck_pwdb;
+				tmp_cck_min_pwdb = cur_cck_pwdb;
+				tmp_cck_sec_pwdb = cur_cck_pwdb;
+			} else if (rf_num == 2) {
+				if (cur_cck_pwdb >= tmp_cck_max_pwdb) {
+					tmp_cck_max_pwdb = cur_cck_pwdb;
 					cck_rx_ver2_max_index = i;
+				} else {
+					tmp_cck_sec_pwdb = cur_cck_pwdb;
+					tmp_cck_min_pwdb = cur_cck_pwdb;
 					cck_rx_ver2_sec_index = i;
+				}
+			} else {
+				if (cur_cck_pwdb > tmp_cck_max_pwdb) {
+					tmp_cck_sec_pwdb =
+							tmp_cck_max_pwdb;
+					cck_rx_ver2_sec_index =
+							cck_rx_ver2_max_index;
 					tmp_cck_max_pwdb = cur_cck_pwdb;
-					tmp_cck_min_pwdb = cur_cck_pwdb;
+					cck_rx_ver2_max_index = i;
+				} else if (cur_cck_pwdb ==
+						tmp_cck_max_pwdb) {
 					tmp_cck_sec_pwdb = cur_cck_pwdb;
-				} else if (rf_num == 2) {
-					if (cur_cck_pwdb >= tmp_cck_max_pwdb) {
-						tmp_cck_max_pwdb = cur_cck_pwdb;
-						cck_rx_ver2_max_index = i;
-					} else {
-						tmp_cck_sec_pwdb = cur_cck_pwdb;
-						tmp_cck_min_pwdb = cur_cck_pwdb;
-						cck_rx_ver2_sec_index = i;
-					}
-				} else {
-					if (cur_cck_pwdb > tmp_cck_max_pwdb) {
+					cck_rx_ver2_sec_index = i;
+				} else if (PWDB_IN_RANGE) {
+					tmp_cck_sec_pwdb = cur_cck_pwdb;
+					cck_rx_ver2_sec_index = i;
+				} else if (cur_cck_pwdb ==
+						tmp_cck_sec_pwdb) {
+					if (tmp_cck_sec_pwdb ==
+						tmp_cck_min_pwdb) {
 						tmp_cck_sec_pwdb =
-							 tmp_cck_max_pwdb;
+								cur_cck_pwdb;
 						cck_rx_ver2_sec_index =
-							 cck_rx_ver2_max_index;
-						tmp_cck_max_pwdb = cur_cck_pwdb;
-						cck_rx_ver2_max_index = i;
-					} else if (cur_cck_pwdb ==
-						   tmp_cck_max_pwdb) {
-						tmp_cck_sec_pwdb = cur_cck_pwdb;
-						cck_rx_ver2_sec_index = i;
-					} else if (PWDB_IN_RANGE) {
-						tmp_cck_sec_pwdb = cur_cck_pwdb;
-						cck_rx_ver2_sec_index = i;
-					} else if (cur_cck_pwdb ==
-						   tmp_cck_sec_pwdb) {
-						if (tmp_cck_sec_pwdb ==
-						    tmp_cck_min_pwdb) {
-							tmp_cck_sec_pwdb =
-								 cur_cck_pwdb;
-							cck_rx_ver2_sec_index =
-								 i;
-						}
-					} else if ((cur_cck_pwdb < tmp_cck_sec_pwdb) &&
-						   (cur_cck_pwdb > tmp_cck_min_pwdb)) {
-						;
-					} else if (cur_cck_pwdb == tmp_cck_min_pwdb) {
-						if (tmp_cck_sec_pwdb == tmp_cck_min_pwdb)
-							tmp_cck_min_pwdb = cur_cck_pwdb;
-					} else if (cur_cck_pwdb < tmp_cck_min_pwdb) {
-						tmp_cck_min_pwdb = cur_cck_pwdb;
+								i;
 					}
+				} else if ((cur_cck_pwdb < tmp_cck_sec_pwdb) &&
+						(cur_cck_pwdb > tmp_cck_min_pwdb)) {
+					;
+				} else if (cur_cck_pwdb == tmp_cck_min_pwdb) {
+					if (tmp_cck_sec_pwdb == tmp_cck_min_pwdb)
+						tmp_cck_min_pwdb = cur_cck_pwdb;
+				} else if (cur_cck_pwdb < tmp_cck_min_pwdb) {
+					tmp_cck_min_pwdb = cur_cck_pwdb;
 				}
 			}
 		}
-- 
2.45.1

