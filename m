Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571263AE1BB
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698639; cv=none; b=QR8qt2N5HgXk9Gz/hTYsvFgNxrtA1JR2DJSodLEcrZiqQhz+zuDYmbH8sLiXtYXKhQSBOsa/fp4Q1mfaabi16e8/ieyTXuWhQCzYOOIGb7UHy4iYsT9ayoOO6Ge+iIX12IpHeHigHZ+n/28GvrCCkIBMzl17JyuEKpGHNgScUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698639; c=relaxed/simple;
	bh=0pvG0OuCdwjeS62GNIIzupohVl1jm3yI8/8/fk6Sm5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nxom14asuEdALB9ts2Rrtixz7RFh4iWQUegm06DOhtkJpN/EnnVizKebMysh2btr9bo3kQSBlT0ZtJ1jPXkAuKf5A+h/KH4o1Ch83RryRrbDs4ax5Kb9QBmFUUZu23suge4SBWZPhdL9VUsDDY4ycN3MRWGCbl5XlhTIXEueofQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsLE7ON9; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsLE7ON9"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-13809223fd4so6157357c88.1
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 05:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781698637; x=1782303437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zsjx/nUIr3hgUbbFIgdIn35NYPMytMuNX0CR9s5Npk8=;
        b=gsLE7ON9msbAmaAlomI56QFClnww516hmIW8kP7vdV17RZOKVLoS9BRbKt5fLjht5a
         TKEMRyCeXj5mIQQTso7lrdWIdyIw8e3w0/qGuFTw2YtJopgsfxhr2cC4JMBxH9NHffgE
         4JTjFusfMCB6T1FprlIgHGxKDNT0B+ub/CCBI1po34S+tqGK5/Ej0cYi23otn7uEUkK4
         rpoTX8xiLrN2q2XL2jV1si3WjcVbZBkFDRnHvZT6u3a8HPenX8NCetN09rqL1GCdzOfU
         FH9ZuEgPi1dbtUS1p1Oqm6LpulVIwfUSTmkf6O3uxZg+VPy+xmZqPx3u26GzmyReHgpZ
         3jFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698637; x=1782303437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zsjx/nUIr3hgUbbFIgdIn35NYPMytMuNX0CR9s5Npk8=;
        b=MbtftTJ2nrSook7P3BqUdnzvKJhz7CCi5DbkQebzFsdzuKYc6sqeTqh1qKe6Ny+loF
         5YWQEd6RADiHkLJWui02fIeUVvwTQzJZzAQw8R4MjHHI8HrwJeOG6D6nzOQZU4EcW3Zt
         Qs+eDynFaUPYw/PHehyOA3e6Yk8CtEAR+RcV5dr0mq+rG382zHDqJrfcUd2WeSVOjXZz
         pU0ftQ4DPTOeF75t1Iqlfe7wb2MSYHIar2Fh8KsJ1ozQDy6TBd/nYlE+qgJmG2jIgLHW
         iWpPONGQjUVPrkxevLJ2IQzaocagUUi38GzC/x09veb+GmVTCBjHNfzVvzKRS+neNBa5
         j1Eg==
X-Forwarded-Encrypted: i=1; AFNElJ/PFjuAX6x9AptfkbWBbw5EwrONEhtdHnuti8E635X0hmYNKxX950j0dxvLVDd3aTi3R8wfdJqCJk1bJUlK@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+6loG7S14x6gduZxChUIg9pg67E2KB0jzIoYan8LvOccy9oRu
	jSED50nJq3wZZwPTfBrGd8tA7KM7xyyl5phYpITtCohG/h16ad8Aav13
X-Gm-Gg: AfdE7cmtXbUpQurk92MkXOzPi4JUaMs7bGerQJMuLfXKmxAsC9On1J/WyuhQyDf7fV+
	y3qEqWlcI7fcqZCZV0BRcKzflrhYULN2sVVjGZz0JOIY6no8yyymklE50LgKJcVcJjC1CijWNQa
	JokWVsUj3BxouQqnsFDQniWQUwv6oJKuaWgjDd7+8jNnJqKXylnjSWIPDuUBJenh3A3JWuDqHMm
	iICSjEDKmh6IDyrqTiyiQmq+4u66hZ9aOIeFcQOeEKtFNkaF4/zmYA7U68eO/YTQX4OX4s1Ecix
	5aFn5ykuzux3oqu1yxV/OVAsUFSF8gtyb6L2DP7ysIfBNscwHg7el0acbp8U2IXvkKdFhioU3TY
	gCrGnGVube+2Ey23XSHQXROv0OIdtUnTm6hAcRkQgeb2BO4YZU40A0N6Sb6Va2D/tgMpnCmt+Uq
	r50iY+3eC7a/b9KveAHWKVg4MozmGaPIZ6hax7BmCqA+Ou
X-Received: by 2002:a05:693c:20d0:10b0:30b:d865:4bd6 with SMTP id 5a478bee46e88-30bd86551fdmr593552eec.22.1781698637199;
        Wed, 17 Jun 2026 05:17:17 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f878sm22607711eec.17.2026.06.17.05.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:17:16 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 4/4] staging: rtl8723bs: convert update_attrib to return errno
Date: Wed, 17 Jun 2026 12:16:54 +0000
Message-Id: <20260617121654.27-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert update_attrib() to return 0 on success and a
negative errno on failure. Update rtw_xmit() to handle
the returned error code.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 066f6e974e4e..4d886a35f4c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -654,7 +654,7 @@ static int set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 	return 0;
 }
 
-static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct pkt_attrib *pattrib)
+static int update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct pkt_attrib *pattrib)
 {
 	struct pkt_file pktfile;
 	struct sta_info *psta = NULL;
@@ -741,24 +741,24 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	} else {
 		psta = rtw_get_stainfo(pstapriv, pattrib->ra);
 		if (!psta)	/*  if we cannot get psta => drop the pkt */
-			return _FAIL;
+			return -EINVAL;
 		else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED))
-			return _FAIL;
+			return -EINVAL;
 	}
 
 	if (!psta) {
 		/*  if we cannot get psta => drop the pkt */
-		return _FAIL;
+		return -EINVAL;
 	}
 
 	if (!(psta->state & _FW_LINKED))
-		return _FAIL;
+		return -EINVAL;
 
 	spin_lock_bh(&psta->lock);
 	ret = update_attrib_sec_info(padapter, pattrib, psta);
 	if (ret) {
 		spin_unlock_bh(&psta->lock);
-		return _FAIL;
+		return ret;
 	}
 
 	update_attrib_phy_info(padapter, pattrib, psta);
@@ -794,7 +794,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	}
 
 	/* pattrib->priority = 5; force to used VI queue, for testing */
-	return _SUCCESS;
+	return 0;
 }
 
 static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
@@ -1955,7 +1955,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_frame *pxmitframe = NULL;
 
-	s32 res;
+	int ret;
 
 	if (start == 0)
 		start = jiffies;
@@ -1968,9 +1968,8 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	if (!pxmitframe)
 		return -1;
 
-	res = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
-
-	if (res != _SUCCESS) {
+	ret = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
+	if (ret) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 		return -1;
 	}
-- 
2.34.1

