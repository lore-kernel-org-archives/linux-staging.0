Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F45C34AB14
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772930; cv=none; b=G6/rcj2CeNXZN9uzPfDYPp7yV/sLqg1VuXXMOcSi+wx7qdhTS5GkkAc1lnjeR46gY0CPkgqHxG49AlqC3NWF8FmQKnd5lgubdmHRuVN1Jfn8CLUE/ivgsJJOcfgkUCL2nQI/LVp04ioRRSMvz11kpUbPC7na9r6OhEXkxYIPenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772930; c=relaxed/simple;
	bh=sKowtTzQp4+cET6tX6l5fuagLeNhEMJZlcZAPa64h5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyKE6vQpgPvs7yWcSpXdsvbp2Q1d32sw+v8aDHtJJ3yAxjqnCzrNwITzbP2HPr6zt5w+62E3wRLH4ABcrnj/RhXeN2r5XRzRm7oRgF3SAFgAqhZCvSmlvMw5+PkFENNJbaCNyFWpYQ7bwFy7YXtNzgftX1yoCc/5LNx573mvQGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afYwGVk/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afYwGVk/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4376772a91.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785772929; x=1786377729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Romog+KVjTIvd/B61z2MJiXe0e1BJo//nd6rEKZqcdk=;
        b=afYwGVk//0Oi4jhPF8JqFpwy87KJ0w5Q3smevPAEnYVxHzX5ih3TeodqldS9BC9sYZ
         FsaDNA7ew71cWLrM9usXn3swySqLKVoaXsV2AMb3/tmDbPlKRRlM0BSVjNX7Ql5tS4gX
         KbEFCL1TEJaabbQLOmFTS7a6g3Odub83ZkxPRaXrFodnk1/QCAIr2yjJuW50jEl8Dq9x
         RZdbW8OeK55HpbKXg8J946P6LKrCnYSmLcAmcyyd4JcBMKcI5MewZUhPO+boBNsB7+eD
         rpK84b1NspUY0bZU79cZrliBT9mGrxnuMWHHqPtF8dpF0v5lgthACLZBIJWYapdY2v0s
         lFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772929; x=1786377729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Romog+KVjTIvd/B61z2MJiXe0e1BJo//nd6rEKZqcdk=;
        b=nmiwhTc5F13xPBcLTwNlArmi7qqoyLoq85gnsof7zCbkq8DQXFWh6iU7Em6cyzg5Pg
         fUvXweXp69RSUlYJFudDl8UGxnq9z2a32DP5g/FYNd51kULEY/H5tgqnRSC0XbRpe4Ab
         z5ScSAn+Bs1MK21aeGpYvUMW38ZuGZtnpoWfl5ul/BQQdk9pKpmdCTeepexYU6wXuHyO
         vFICftcQ7FOrpOR3NPgE42Ky0UXqRhr2sk0KevMnKI3AdoBWOJBBLNbIYIijm4QmN8np
         PHs7ENzzei7BK2HMHPEMnouwdH4WCVD31eRMU8GRCAZ81STjrTzJ+IUcmrYn1njB5LNQ
         Mp7A==
X-Gm-Message-State: AOJu0YwPIrdcnc0VVRKD4QT4/S2uZWdlDwPUNLmb0D9oFb4aXcpX2Wzo
	n8Zr/m+NqfSpuwKgvtNU8kZHq5nB3Mre+SmIu5EFpQc3jJ3oJJ7fiCxM
X-Gm-Gg: AR+sD11S1718zbrQXRIg+lFvFPunbmhSSfdaDF98s0kL8rlpHkuZDrtK6UuR5+q6AzY
	igu8lCufl+IZ9pQao/m9RzDrPKTjtvd8hq/Ro7eMMKxU7VfCgZQEfLDfnwxe7CkFNL1Ljcx6+9j
	A2XnDhLWPHhUwzXHbW5kvY/PnbJLmpEEp2tVaDk/Pgj1ZOa7pSlffuCn1Prmz/h27Aju12Xxo0J
	vwHr2UcjuSc6scq1WkDUh55+fLwgFk+ACDz2OJcjEAXCl8gBVG/+BqsrTZV6l+8ignnSPgiqzeQ
	XXexBVVGiVBkdq/gp/Vjto2ZntB3W83cOePu7SncwVWpUmH8cWa+V+kothOH++7rIAcm+cCRc1j
	QcX39p6b+guoDhvBAPCzZXA5KnqVvWsxdMadA4Y4D0ZWsirQdwFG+yTXNhqC2Dy7QBaMhfPAm6w
	20ahBOnj0oMpjX0lWjCcwyz4HcZuNV9a8GHwypMEWXpvwkjJhj4CeoTapd5kIi74SQ11tKwifEe
	ikC6y71dwzWd8NPVmxeLdmA
X-Received: by 2002:a17:90b:3a10:b0:38e:79f:76c6 with SMTP id 98e67ed59e1d1-38fbc4cffc7mr9600502a91.24.1785772927737;
        Mon, 03 Aug 2026 09:02:07 -0700 (PDT)
Received: from Debian.tail44843d.ts.net ([183.82.161.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e044912sm45831506eec.15.2026.08.03.09.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:02:05 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Mirza Ishan Beg <seedandsyntax@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics
Date: Mon,  3 Aug 2026 21:30:55 +0530
Message-ID: <20260803160055.18205-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803144826.15980-1-seedandsyntax@gmail.com>
References: <20260803144826.15980-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace repetitive `pdvobjpriv->traffic_stat.` dereferencing with a local
pointer `ts` to improve readability and reduce line length. This resolves
multiple checkpatch line-length warnings without manual wrapping.

Suggested-by: Nikolay Kulikov <nikolayof23@gmail.com>
Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
Link: https://lore.kernel.org/linux-staging/agDaGJ5UKndFUNPY@archlinux/
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fee26..277eccba293c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1109,25 +1109,26 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 static void collect_traffic_statistics(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
+	struct traffic_stat *ts = &pdvobjpriv->traffic_stat
 
 	/*  Tx */
-	pdvobjpriv->traffic_stat.tx_bytes = padapter->xmitpriv.tx_bytes;
-	pdvobjpriv->traffic_stat.tx_pkts = padapter->xmitpriv.tx_pkts;
-	pdvobjpriv->traffic_stat.tx_drop = padapter->xmitpriv.tx_drop;
+	ts->tx_bytes = padapter->xmitpriv.tx_bytes;
+	ts->tx_pkts = padapter->xmitpriv.tx_pkts;
+	ts->tx_drop = padapter->xmitpriv.tx_drop;
 
 	/*  Rx */
-	pdvobjpriv->traffic_stat.rx_bytes = padapter->recvpriv.rx_bytes;
-	pdvobjpriv->traffic_stat.rx_pkts = padapter->recvpriv.rx_pkts;
-	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
+	ts->rx_bytes = padapter->recvpriv.rx_bytes;
+	ts->rx_pkts = padapter->recvpriv.rx_pkts;
+	ts->rx_drop = padapter->recvpriv.rx_drop;
 
 	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
-	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
-	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
+	ts->cur_tx_bytes = ts->tx_bytes - ts->last_tx_bytes;
+	ts->cur_rx_bytes = ts->rx_bytes - ts->last_rx_bytes;
+	ts->last_tx_bytes = ts->tx_bytes;
+	ts->last_rx_bytes = ts->rx_bytes;
 
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
+	ts->cur_tx_tp = (u32)(ts->cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	ts->cur_rx_tp = (u32)(ts->cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
-- 
2.47.3

