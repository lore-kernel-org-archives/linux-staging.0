Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4711FF5E3
	for <linux-staging@lists.linux.dev>; Sat, 29 Aug 2026 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018618; cv=none; b=pWWiTAEDlduLqah/NenN4bJZTgeYKSjFi2zLgD1isl10ALOK7hNXpNTxQ0W8YN7HPJJ7lUlwGO2rJwTo5Kugp0dA30P6n2qdCQjLaaJUg0KqJ4NrmLiq5dXOHyHsONe/Sf6I/PJ3ulP1yiMGrKzsQqgoLM9zMv3CX+BEndPRdUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018618; c=relaxed/simple;
	bh=FTPAarf/mizk0u8bdshHgq6IEz7WcpqwdItWjHX1dVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cb0AciSoo+mJW27W72FeWUij9WDzZLaf7JFedFzfgS7GOLGS9x8W6VsOm2EhU0O9rUTwSDleAICdhFF5cQWlwr9XKkZaOmyXPgpSqRvpBMOHluAWlcGInrN3hGupRNKSWbv43E4ToV2wdU9Rlf3VTzDUQ5nCy90ClTAweE5Hy8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACmH851y; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACmH851y"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-854f8068301so1276527b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Aug 2026 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788018616; x=1788623416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnD97PHReqQB3H2W3lc4LNtjiJ2gT8oWqhG2Qo3SxWg=;
        b=ACmH851yxX/UoK5bWyWY9wNoTTqPUag0uR61sWouz7c5072XK2cMEMw6t7WmxiKzzo
         vLhzCe4a57vLXX0DosaDH7JI9chAWXiuIFrRURw3jGTYNBWqAN8xnCmsjw73aC3r40rm
         vaQqltVBv3OBCgv7/ePWsV57rA6AmyDXwACdPnh116G/zFcErTzm1R+XgiDBxYN9QXIU
         pXmj1d6p6JFWn0WyDiq10TQ6f9qZop8+ofXk6r0v7K+Gv8mArRQi7i3AlK/78vLb8WQ/
         NUObDYIao4SADM5+gxtQ68JyFOvZmbYudkZKa+5OzIJK0AtvDtPihBbhi+w+JWn5uml5
         zxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018616; x=1788623416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnD97PHReqQB3H2W3lc4LNtjiJ2gT8oWqhG2Qo3SxWg=;
        b=Szr+hvLc0t4zgsxWcgDdFDXtxgjQaGF/WRScV7mnFNU65J7dshA3mckhP3/rAuvW14
         TZWI8sO4SE/7IQGLv0IGdSP8MAYwvT7aWAiPBqVZSba/UEovWbo8E3+pv+54B0i3xJHI
         9Mhxq8gsoIkoEmr18ulxZ0VqSaxBu5/lCTBxlnvXVgHCAD1G5ytTG5SFePSLP2EEhd4e
         mFw5OqYljm4zebM194zLiRDsmH2Z/Km0iHMIzGXwZOwiu8ikpBx6S2M7liKajjWP1w83
         5EXnO2BlzQTn/at5DBou9dkPO9xnp7VYYWfqxbgHvAN7tlja1pQTJ9vKy/BpzkpC5CFV
         OOCw==
X-Gm-Message-State: AFuF++kfxI23Uc2P+Ld0PhlLShTi52pNAl6gDYyIMq+0nvPQWR+N6M1y
	0IBOojfDV0a4yFKZipUouQvdw1R3epHmMlqpfY9EsdKJVrxahmwwvZON
X-Gm-Gg: AR+sD11x/wOVkTR6njLP3uwg0tBuB2keWnw39AWaoL16p/Xjc1gbDabZnQsgOWK802z
	ibaFy/AMNjbHvx7dLMxOqE+qQt4jSStHBPBJkh8ZjjUOk2DtrBBf/fEv5Og5leLKXfSuQQuXXKW
	EsCORJl6selSFGe0W6KOs4rgmTv5gi5S5bEeqDOY5dn5MhQLvX0Dusgev/wmBEI2jc1hogyDw/K
	ILFOhALNMrgMdZUxMpXU60Oqo2EVmE6GITyINSpOZ2Qh1sL96+A2eJ36Op5/pdzJZ87zbbj0kET
	1ymn07CANrRjJKW8sv4k1pubgqZduHGTVVLqkixuuvcfK4s034HvdtHTkGUi9LAspI5vkJ9KR8t
	RslXihEkVsw1Y2slQAhFZo+P+wkCVthbGiPpSeYxu/WrOs2ntRwysWQcaQ5UXxz8mF6+fw7DYlz
	AI+4YPVjTIqPvt7jj0dHIfSgfGi+3f2rjIvPYTRMMvkhTWwXO9di8/gLGb2Av70a1QW96UehobT
	w0OEQ4FwIwvZSOM/XvvcS11
X-Received: by 2002:a05:6a21:3995:b0:3d3:adbf:777a with SMTP id adf61e73a8af0-3d3adbf8154mr11208534637.22.1788018616268;
        Sat, 29 Aug 2026 08:50:16 -0700 (PDT)
Received: from Debian.tail44843d.ts.net ([183.82.161.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm23838131c88.4.2026.08.29.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:50:15 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Mirza Ishan Beg <seedandsyntax@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics
Date: Sat, 29 Aug 2026 21:18:38 +0530
Message-ID: <20260829154838.4533-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807150940.5066-1-seedandsyntax@gmail.com>
References: <20260807150940.5066-1-seedandsyntax@gmail.com>
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
Changes in v5:
- Removed the `Closes` and `Reported-by` tags.

Changes in v4:
- Fix incorrect struct type: use `rtw_traffic_statistics` instead 
  of `traffic_stat` (reported by kernel test robot).
- Added `Closes` and `Reported-by` tags.

Changes in v3:
- Fix missing semicolon in pointer declaration.

Changes in v2:
- Added Link: tag with lore URL as suggested by Greg KH.

Changes in v1:
- Repetitive `pdvobjpriv->traffic_stat.` dereferencing replaced with a
  local pointer `ts` to improve readability and reduce line length.

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fee26..59f13f6b85ad 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1109,25 +1109,26 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 static void collect_traffic_statistics(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
+	struct rtw_traffic_statistics *ts = &pdvobjpriv->traffic_stat;
 
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

