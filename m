Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7817C98E
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823608; cv=none; b=MsfOKOiVFl9MpB286+INL6i867TvzvPDj8zVJlYpU9rrWL8Yn3hNJd4vrJABVLDHZlTZ9w2r+bLWpm6iu5gpl7jYmHSXtxhePiR9orGGkBPnsScYiMu/JiVXTu+l6uiroLZ5R8OZsvYIB1HM0u1tdApd2eo1ekiMLqcYBhpu1gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823608; c=relaxed/simple;
	bh=LTYeFszybk7UogGptFrkCYxtXAHySb6fBAYEP3TvpU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rTdanFP2OYZEAqfUzneM6eZs+8sHL6r5gzNO+RmCygSLXf2e5c2QTjpEZNnS1K6DpzI2KuVSni/bFdzEVkkwoRS/AXsVOyIVww6S/y6PbB4xjumjavDBv8CXTUlcWOsw5wnEejx++TS2osxglrWdRo3pkfhww99tmTCA+zdxw04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=fGytg8tO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="fGytg8tO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20543fdb7acso25380165ad.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823605; x=1726428405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CokQS4kXNUYPMSO/bhNH26UTp/Z0p345ebJ88SlkfZg=;
        b=fGytg8tOwqVeSVEuosvJWt0tcA4iUlz5waC3vdiSsmLiwjB4lQsvzIzdEYRSGo4Qw+
         4uWKSoS1DS/jZSqGitgfBKpkclGOMKnLmdBacwq187vRxoMXHehBQHR4V95+lUEQ8xbE
         Rmxw+yINSXAmjRNYg0DSU+ScFp5dA3FSHun8PkmxfbbTy1C2rpvRQYf2hJJb9xGZ2FOf
         tHrbZMNTj74m2U7x4QmcvSkBnMlFn8zFxnbRJJ1caw8Of941n3g0NtRyvnKZppUsZpwj
         GzkgMdbbctAVC4oo2HxkOyGHtGlOs6A92fnSj6ii6/kXtInQXnY2ygiEDEV0X9a8C56y
         Jptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823605; x=1726428405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CokQS4kXNUYPMSO/bhNH26UTp/Z0p345ebJ88SlkfZg=;
        b=ojbaWdttJ8dV9z9Ome2xk9z8Fnnb7Q2/xQ0s1GMN5YX+6CvROX/a4pAkERibNF86Mf
         wo7uq7LX0KjsK8R0LJTx3p4IRq+uqs2cnGhEBZ0jk3xluWBR/pqVMDzcYA9jOn1ev1Rm
         EgMlgdyJUNfhNG+X3Te8kt+pL5Yb+lQBMVZ/QvQFJJ1Paz5FM68FLDXcPbgaaPHOcfSe
         FynWwWyOux/iaLm5wsSnUqdmiw9A0MbzE9Yubl8/xeAtHa0C1JPyKZdVUGKdPsnRcnTI
         0PJ9tr8Mjpy5ADV9HiIE5jcppGMqxHmzb2ZfEWzXftiaNGTTqzjGdbggHuqYFttrSLGG
         aWQA==
X-Gm-Message-State: AOJu0Yz64m6jVLOi4lLtMDwkybEZrWLBk1JwTEtwTk0OfOrubmSLzY0r
	IZaHvBbcLHKkvthmhEA2UZqABf4Vrd2lsf9XI5BQCIJHR6e/zx+SPtUeoiXRTDU=
X-Google-Smtp-Source: AGHT+IG2dsp94gPihKGFg5H5haq3c+EPQj+JUdDhx0pe14/DtjqT3zFZ1C+fHjy51BvMA1Shdl5g6g==
X-Received: by 2002:a17:903:2412:b0:202:4b99:fd27 with SMTP id d9443c01a7336-206f0620834mr84000685ad.51.1725823605335;
        Sun, 08 Sep 2024 12:26:45 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:44 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/16] Staging: rtl8192e: Rename variable SignalQuality
Date: Sun,  8 Sep 2024 12:26:28 -0700
Message-Id: <20240908192633.94144-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable SignalQuality to signal_quality
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 078e36962197..eab6bbf9f3bf 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1264,8 +1264,8 @@ static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
 				else
 					sq = ((64 - sq) * 100) / 44;
 			}
-			pstats->SignalQuality = sq;
-			precord_stats->SignalQuality = sq;
+			pstats->signal_quality = sq;
+			precord_stats->signal_quality = sq;
 			pstats->RxMIMOSignalQuality[0] = sq;
 			precord_stats->RxMIMOSignalQuality[0] = sq;
 			pstats->RxMIMOSignalQuality[1] = -1;
@@ -1309,8 +1309,8 @@ static void _rtl92e_query_rxphystatus(struct r8192_priv *priv,
 			evm = rtl92e_evm_db_to_percent(rx_evmX);
 			if (bpacket_match_bssid) {
 				if (i == 0) {
-					pstats->SignalQuality = evm & 0xff;
-					precord_stats->SignalQuality = evm & 0xff;
+					pstats->signal_quality = evm & 0xff;
+					precord_stats->signal_quality = evm & 0xff;
 				}
 				pstats->RxMIMOSignalQuality[i] = evm & 0xff;
 				precord_stats->RxMIMOSignalQuality[i] = evm & 0xff;
@@ -1436,7 +1436,7 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 		rtl92e_update_rx_statistics(priv, prev_st);
 	}
 
-	if (prev_st->SignalQuality != 0) {
+	if (prev_st->signal_quality != 0) {
 		if (prev_st->packet_to_self || prev_st->bPacketBeacon ||
 		    prev_st->bToSelfBA) {
 			if (slide_evm_statistics++ >= PHY_RSSI_SLID_WIN_MAX) {
@@ -1446,10 +1446,10 @@ static void _rtl92e_process_phyinfo(struct r8192_priv *priv, u8 *buffer,
 				priv->stats.slide_evm_total -= last_evm;
 			}
 
-			priv->stats.slide_evm_total += prev_st->SignalQuality;
+			priv->stats.slide_evm_total += prev_st->signal_quality;
 
 			priv->stats.slide_evm[slide_evm_index++] =
-						 prev_st->SignalQuality;
+						 prev_st->signal_quality;
 			if (slide_evm_index >= PHY_RSSI_SLID_WIN_MAX)
 				slide_evm_index = 0;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b599309b70ff..76792268629d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -464,7 +464,7 @@ struct rtllib_rx_stats {
 	u8  mask;
 	u16 len;
 	u16 Length;
-	u8  SignalQuality;
+	u8  signal_quality;
 	s32 RecvSignalPower;
 	u8  signal_strength;
 	u16 hw_error:1;
-- 
2.30.2

