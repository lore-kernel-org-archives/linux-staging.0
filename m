Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B9E2232A
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716803155; cv=none; b=Li+n//V36A/eD6K7T5iq22/EZfpulJ/2E5AFsRZVENgrlbynYBg8eKewSrMq9jL0DEc5EGpSuETnfKg6oFpmFpI+K+AGBye5TH2WqtoccfeMTQ0/THEOes93s40RJ9JBzAVD64wVbipRuK8SjGbybFecWb0pFOnBRtTFWmBuSdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716803155; c=relaxed/simple;
	bh=kOTWfpx4J0b/iWSo6jDzUAxf8kyOBBoxftxwS3EXw9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZXmkknwuc0q72tMCHmw6gVVhfIR5GDOZ6kWDkhJxUV3/gFeWs/Wa9v8QjS48bK+kA5RNuEI2WuByaugsKcDgy5VrMe9CNLYMgZPbAwICV+KDT6MMiW3ifY5f37KrsUe4n9Qj/0BeHeQ3vZ3YkEOzg/rwgNrt82uMohT7CG5UAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7JI2fR0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7JI2fR0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5788eaf5366so1818752a12.2
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716803152; x=1717407952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZOP8/F9rHnzuZdAfB6mVQvy+M+VX8KCAQAekWNosyY=;
        b=I7JI2fR0c2aluiIZfNz5BhSg2VRsG5mtTQhgKVW1Q5DqxEEd5jGVCm9t19UEu4/jkV
         oUMcw+Ny6YfDVN/ps9NrxAGXy8lenVnR9YjSY01SH5iN+FRevgk/a73U0NcZ6D/MS/Z9
         5e5tjbnb6jwq0k751cjywbpEveC9KVzKMxT0oBBeQrd2RA/c1tla7yultSy4B8vxxRuY
         bsvRXClfTzAMhnt+RPCiED4yZOog5iU8mhoopKpuXvl3iNOWXry6R6bURMa3AQg+6k2f
         niYzQqod41N2fTUjY1Isjv7LbNAAm8c4crfKLqZr/sdNtY70Y5mNwBFxtp0jJuDXU0/3
         Tz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716803152; x=1717407952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZOP8/F9rHnzuZdAfB6mVQvy+M+VX8KCAQAekWNosyY=;
        b=oyJ8cwfDMbVpb7Am0WTmsgyFd6XsDPdWzthXjj3B2rq7MSCSrnrTIupdsIXxNnqjvY
         uambnaD4+m0GL+Bbe/SUPfe00ANMsYrPEAO1TuBU1dln6D9lKWoXNchxe0HDeLIR+W5+
         tx1P3jsNqfv79hvhAGUmHh/sqiqKDMe9TVZP66uF5wM8iV5ShTa1JnmGasLvmmkwaF5J
         xPDHOwzpbwfwwupmz6JDpV7Ta5j9hqTkpxjrkAza5WCtG6EVO9VBze39qZwOR4iH1mOZ
         7pV1W+FnoB1hXW6zfIl8tj32BguSfcS3pFBPA3BCPf0EHlikPUsnXamhVuEPJf/iVNv8
         9e0w==
X-Forwarded-Encrypted: i=1; AJvYcCXUT1zUI1z8LR+1eow8dFpV0HtekA48WtSyJIIqSDxP/9YLUUswyNCGACIlDm2rufLIgbmFoqfg9aGO53cSppAeg+QMeRcZFhyvKDhUmg==
X-Gm-Message-State: AOJu0YzN2HezLYDJh7jAnhHkhmoE3yiyWsegf6BhhvnrT3HS6qRtXKSE
	pcV1q24ViHfnmtbRKilWtuPrwMEeSyaUqmCSn6BzifUOnykJsjte
X-Google-Smtp-Source: AGHT+IHsbpT71TZR9sImvcRmaf1i8uTQArIk8guJrqh0P2g+p9RYgCKTy+djXXnXbm63Ny+uxDSBvA==
X-Received: by 2002:a50:8d59:0:b0:578:6558:4cb0 with SMTP id 4fb4d7f45d1cf-57865584d45mr3791559a12.33.1716803151747;
        Mon, 27 May 2024 02:45:51 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579c6c72ed3sm2304178a12.87.2024.05.27.02.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:45:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	namcao@linutronix.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8192e: reduce indentation level
Date: Mon, 27 May 2024 11:45:26 +0200
Message-ID: <20240527094527.2046-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527094527.2046-1-straube.linux@gmail.com>
References: <20240527094527.2046-1-straube.linux@gmail.com>
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
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
v1 -> v2:
Added Nam Cao's reviewed-by tag from v1

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

