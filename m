Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5390F31327A
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786115622; cv=none; b=rb2lJHBG5/GSCW+18/6HqEICtzfE1OeNE7IPcWri4wFW+wsmMpnpgQMhKSYdsuPvZJcUkNrfbnhUT6eao/por+gHAsajGml9A1N9eWDa9HUZqrGei7EYVtSmF5koeJdeQvi47XvVxEq+UcnO3KtC5LlFJwC8cv0elfTEULszeio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786115622; c=relaxed/simple;
	bh=TZvg4CCk4pYjzBzeTpLzlyqBGqsE8q40km4TaDOFFzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FM61uXtesX/w479h6JhdV8FbE57QpICSQJCHuhFMr6U4q4lvhxa3hePGs1Af0NzIicfxOEtZDwOAKS+oGkjita8bIBhVTu7ceCmczzQREVk0xJ2UFPKdfzrw4iVZy7DS3liG1nWcOVxwA2id+5C6KJ90DmfbhDMYyc45vxqRqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/eNnQQz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/eNnQQz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso31399445ad.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 08:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786115621; x=1786720421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gjiFRc/9v/fTmjpossmewKY7B5mrRB470O1t2G1f0w=;
        b=Y/eNnQQzO8l3Hpvf8WxmuPHK7kageqvpMrHogzgvBZouVsNDJ8bl20iv48GQOSkByq
         vT9cR08521R6HThfqaoE+E5fzzFCUuN/bko3V7XnzdCOWos1tnMYzXTFCWtJopX7ITKI
         VuDMV0jJzlA/wileWsyLml/L6g3JcIEB3QmYjYzBQMDNoYQFTOURXmC0HgQ8echu6vji
         8BWWfM5jgiTwzvfxi/4k6JGFIvsMKOSt5EvNsPGpPPOZDZfnN69M5jjunqkXxkCO8MDa
         Uidwie2NdbVVo94F6t0ui6ETbDxlrFhTzg+j0AAC/zhUZVIGij7FWMYnS+1SCYTJAqBQ
         WuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786115621; x=1786720421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gjiFRc/9v/fTmjpossmewKY7B5mrRB470O1t2G1f0w=;
        b=nDjHDSoGF2ickXMIJcDveHK/I1fdju15g7aGqh8/11e+yz1Uzb9UyjLZFKf1X3PDnC
         lqBxVJ36K0KzpPJF/a9dejtTheopL7KMaST5Zou23eI0dMIbEl+k4zVa7PJDHDCKLrJk
         sfm2qlwMT3YALXJ8kS8AluqG2lZNtQ0UuigcIw/s4aKkokQvEi4TJCjeIyhz5NEY+LuM
         +q8lHmQ8rQTdKbLeqCAsUQyVta/SQEpvPTG5rsUOqjm41m9whcUYjNacyG/9JRPF4bCM
         cHN4ApPVed1aA1WPQN8O6N8kBp6u0hp9gJOfuIk85XFftrDZytsbw45f90HbL/fibmc/
         bj3A==
X-Gm-Message-State: AOJu0Yyu4tOBoeJ3WUTKSvQ11jn3k1junyU4AZLBu3qNmiEAP/nguWG/
	RWyC9LSKsSvz7dC+zqgXhQCp98AVF028AL4kqdIpb3zv+ilNL7ZFi5tGQJg5ZoHC
X-Gm-Gg: AR+sD12bWiU7LAwhiHNFTwyD0gHrTdVIXkKc7Fht4kVTetvlQVSWXeV+8jWBoKHYUDW
	tv6p6r6WblitNANrX1AZJ1r62pgtLkXy+VWPR4/XicK+NGdWB4NMPxMfASthZW6fKztHtiFYv5P
	k8OV/2QLsHtadWipFWv9Xo83vXLjayxSjGmcGjSSf/ssS/SftuqE2LDizVpFlge71yjdyxP+WgM
	vNlHt5iDDZSHw8FccxqEajIIh2arf/7fgmIYXgut2JBQPgPVSw1DT+IOHMu3IdZeQDhRsON4ypJ
	XroOsQHRFjrZiEW8cIvHgbc1zfHcfoWKYFwfIo2yLQVZoYpRvXpHmswmwyqTaHvcndk8A3BCgPr
	LxmFS4Al69uY3u9kaeos+pho8Yuk5Msm3ycb8MOXJTha3NajU5gCaBdiLr5oGA4cOjC73CHTnWs
	/ZWb58syZ1sP99i51pGUqkAkpsUqYwAhMIfO+Z7Q6g7cELh1oThtZLp3UvCJOxH+LYIvVxnfghU
	wiujWeLaS1mTeucsinlg8nDewCno1M=
X-Received: by 2002:a17:90b:28d0:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3903c57a0bbmr22792525a91.10.1786115620517;
        Fri, 07 Aug 2026 08:13:40 -0700 (PDT)
Received: from Debian.myguest.virtualbox.org ([183.82.161.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86fc7bsm8707685eec.1.2026.08.07.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:13:39 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	lkp@intel.com,
	Mirza Ishan Beg <seedandsyntax@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics
Date: Fri,  7 Aug 2026 20:35:29 +0530
Message-ID: <20260807150940.5066-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803180549.20859-1-seedandsyntax@gmail.com>
References: <20260803180549.20859-1-seedandsyntax@gmail.com>
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
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608070159.puVnOVxb-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202608070545.V0T8UE77-lkp@intel.com/
---
Changes in v4:
- Fix incorrect struct type: use `rtw_traffic_statistics` instead of `traffic_stat` (reported by kernel test robot)
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

