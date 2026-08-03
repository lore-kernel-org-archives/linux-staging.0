Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16AF417BE2
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768563; cv=none; b=dnlNuXX0FWQ5WyrdpaexGRFoIEsjvu4nDQw2Wc/f1sWBb7+Kvc8Fg8Rj25FPnpLC7wqJS46WAy8lx1mzO43BPavZaNX+znLOA+ZZ0TCCFCyaVw+ECTEuSFWsAmQQ0+T+Sqp5DlMoCrKEVw+B0Tx47NYn8A5hwU+FKIC5XlYwm3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768563; c=relaxed/simple;
	bh=yXSrBtOlaEUAOxbBAS3EpuNazhUSLmm6d/PYmEb6PEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHlSGQR0uKUfEc3ENYCBGHii57VRpy8jT/Rz7SZSTHNIZKtW/L0m9ewEVINAwhJeK2qWccCOkk7129P92ypDaoP+2mpG5IjOfWGZM1bzP3EgFX/1wfwHlUy3GBWTF1ol0xAxlWPEmbAoilIwiigJ5eLBukeryTciwo9CYzNxWMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C60rv0h9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C60rv0h9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38deea72eebso3316780a91.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785768561; x=1786373361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSDW3CGfoOGO3/Bj9spSJOLGw2/wshC5Zc0x5JyYqew=;
        b=C60rv0h9epGC4NopsIUI4UM1Yz/UeddTkGTmrpHQhg1I5e69ac6OJSfj5eQqj+z5fR
         dGa0BQJX6R9+ES/G7kv4kzd8CE5HmWfClWjMUVe4ig6c8ctVTqbvcJCILpROK0jtnaax
         K/auuzJftCfpNE4KQzWtbtDV1v9Vi23a1YztYDH/42XWcP9Pq8Q8Hr2qBmSrrAICFA7N
         L5jKfIyQauSiRrfKmXxX2IXwHYzmlL37i8MI2WP/558WjxNvBWjw6LWIBZ+v0GjjGCNk
         nWLGf8571u1zluC9jOk+DsGfcQIIOFUjAr9o3vpzkkbJGg5SsPix9qyRTkEKNSVkEGlE
         bqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768561; x=1786373361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSDW3CGfoOGO3/Bj9spSJOLGw2/wshC5Zc0x5JyYqew=;
        b=Vqg6hCoVbSMDk3hdCLz3VO4jxw5E6Pw1IyeQfnmUxAeAjlBy0Smpx9TQJe3lJa1M4O
         xXIwCZdctKUyEYRmOdwDsnTwrJpohysBeJkgm+7Nl+7U4QN7tvJsGTLYmmpK6nMH9Or1
         cvMffgH8PCT6lbxF38f69bINAo5L2hN1y4XlXkntcAIZQAYDKuBKEzW9I4JP0TjCaVUN
         0+YjhEoLzaTMmlFoLJs3VJHxIWwzMKsjn51+v421l2AJlcIVp66bNB39u8BZIbEVHh7A
         1XXUR051ogABTZ3E9F+wSfiRQb237ZjY8J7cNqbUKImp+aQwAgixVE7nAIOLSvEokA2X
         C4nQ==
X-Gm-Message-State: AOJu0Ywwgx60bF/XBYKk7hg6zy2Lgn6DRRk4MVTPGTFJQ+Zd48groyXW
	HSZs3/hJiUx+aGVi4A0h3UPrGLKM1EvHLLp/QV4WMWM+4mEmn2QWighY
X-Gm-Gg: AR+sD111fflLZqPVKmxQaUbJDyBywl0k484VuimfYzzIeY0vWKMDPoTxqSE5jOucp7p
	MLa9AHuE3Ov5DkKravceVgtboc0yc24X47W8iZjtLKl7GVmtJnU5fJEGVBx9oeKyF50V32xchJe
	ZT6Yhr4kS8ATD4AkeqBE4LV3WmQ5fYWENxAqREcyJMvUoe7oJ1HoL1Oh3quy4WZP1TwR0c2r/y4
	hj2fEYjEYN9PNnLNlTtNOT4MJllAKu7+HfcbWdLRWU6u1J9JUmJQfJtLseGZ1Hy4hJEzc/wS9EF
	HdjHyGXiJ/+l3+TRas5Ma6YUsK/jK66QRy7Gu270lKgma19i9wHFlscPtXvkbaI2xQLmwAa7176
	43aysvH4/w7sLYA1C7UkpOV8lcxv2cH4wBkc27j9I4c6pRL1k1EDdTepIk+B3hQgYIrL08V5VOy
	hBamuU8W2ZBZ5bmJu+yi0QS27jedr0FPjAoUSKioBeXFYRowjMAmxnRD6NjIq7JYWfonecZ/oYY
	WKfbAH9zelIEKdIAXmBIudw
X-Received: by 2002:a17:90b:2882:b0:38e:4482:ab15 with SMTP id 98e67ed59e1d1-38fbc4feb5fmr9634342a91.22.1785768560922;
        Mon, 03 Aug 2026 07:49:20 -0700 (PDT)
Received: from Debian.tail44843d.ts.net ([183.82.161.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm35979191eec.14.2026.08.03.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:49:20 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	seedandsyntax@gmail.com
Subject: [PATCH] staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics
Date: Mon,  3 Aug 2026 20:18:26 +0530
Message-ID: <20260803144826.15980-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
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

