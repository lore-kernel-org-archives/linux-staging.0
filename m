Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC7135F8B9
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 23:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775171617; cv=none; b=QmuNZIYuJtqOUP/ONRRAWpcqb2U9TEdd1EmTHQnhnDEjasHPPvYAHaW7OnOYPC2rerpwDKzuxHtj3KktQfTk3sDiAW/3LJ7J4i3AifiMpOVga3x9iebWY0cQYsUKlOPef//7U7ay7EdSlH3gLKu2XvgKHz/+6j5RjgEciWVjShM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775171617; c=relaxed/simple;
	bh=oCe4juA1e2Ds8NEAKeuyYDMnHdsBXgqbK1Rq0vvKkiE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ph8ZWCa2F9EVwHYreYXfi5KM4x5rVV1x4WFwZ+qrQl3pbz+UKKDcqQkw+jxzT4P3ILrh4VGJ7olxN4kvqo7oKy6WWBg6mMcLgXE30XwEvqg07Hlycjo4tvRN7Y9bn0FBauMnFVuevFeqhTcoRoDmlzmQx/X3YBAEkDYvTrT83uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp92SNFV; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp92SNFV"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1645808eec.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 16:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775171615; x=1775776415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HF+nTtX7q/IbBQbktSVa3N5806WR0KG8xyFeNR5dvv8=;
        b=Zp92SNFVIV7UpBl0FNG2bcdBkcBHLpuoeZXvkMaoERejkUi6n+SOEIfbbDbkzXdRU/
         nZ1jalW6MhunAb4h/5sNjGDLN88ZEUSWkpHqUpH1cv+mHScU9k4qcR/5uq81hHdd5nLA
         WG+UTiL0VOO+F3BG1L1aKdy0ZbEMmCnUyo6aQ9fuNUTptvq50NAppHdjBFFrbf4j5YzK
         7YYJQolkli0v3ooVMWSVQQy6xkH4UIN6Hb0XgBxefuy1mR3/btbprkZJlxsY4JLhmDiA
         /ehTfCeJaJgxLkouOGdKAZ8MyNIJIaIqSw0GI4gTG4fYWt4kLcxGsK5MYJ+yw0p+Qysr
         vHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775171615; x=1775776415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HF+nTtX7q/IbBQbktSVa3N5806WR0KG8xyFeNR5dvv8=;
        b=kD7nYqMecpi/nKuHFvPxKbS1fqY2R99FyM7yuLg5NbFxOnR6vGYtdugJjHzlyDJKEE
         nirQDCfgNxX3Je6KT+AMqwLwf6maqjyn6uQMk2WK5yZm9qzPj6+Tj/7CjUjHBcor69W/
         Iw7verh/RTL6mYm4OurnBXhAAZayBOW/eqzDXqIJCOJacGvAUQTYef9qVO/1kqoJLPuE
         KM9fmfPgJWOZ0YNxTZFVe6dfwPqHFKiDYKk25+C7PzMJI0N+SVssdwtKw9PXQNhzHBpw
         E5BJEuENzfvT5Wr4lO8/sd5TWEwJmDvODB9C+3kH2ZQwM1PUcVQbimkhSQxs4m8+TBvo
         zd9A==
X-Gm-Message-State: AOJu0Yze4jPQ1oGJpCph3a/wcHss7+ZTl/dzLxcX7RD4zqOXNny7riI9
	xKWyDNa7LZ7HHgHXyrfwIRVz3RcyJc4JBdjbszDdvEbhr7qwYmPDBfri
X-Gm-Gg: AeBDiev8r42ENx//6p4T6Z07rxR8FgKgfIapwLVu7OKpB2Oj3pEBnZy4WqXEp/b0kzA
	3/wOxzom8U2OMGpavqye/MY7mnjEv+ozZ4TPeR60rA/H9me7rcLAtQTpjWWqpoBS6N41ysj5xJg
	zmuByMTrghk/ufDTzCOJMuAZlHBcaDY8TXY8DzPisbDO/EUwg7EmqmJtUzUAUB0/gSBK/MkWtT6
	6kDQf5qAfk/gcmj+5unEKDjjIAoOcJlYP+agxCDQfvv/T6hN4hnegc7YotwZr10NA3oScxzw0/C
	SZ2Bd2UYYnNzMKNk4LlvNU/ZuO6it91PQqHLOvelrYJSnaGjKvoypnbx7FRZlLQvhigoPhwIxO6
	lhA0jjUuZaqwWUenKfHzsOw0nI6DP9sVdb+EDIlDRGLclxQ08dsSiuyxa7J/KAUHicWrm2i6LHv
	a6VG9eod0MuJH7wVwgD3Jvm0jNBlpTorWtmj3BZ7f0yX0XgMSwDkm04Hw=
X-Received: by 2002:a05:7301:168b:b0:2c3:d51b:91c4 with SMTP id 5a478bee46e88-2cbf99ef027mr598008eec.7.1775171615226;
        Thu, 02 Apr 2026 16:13:35 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df5ed3sm3552768eec.6.2026.04.02.16.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 16:13:34 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in os_intfs.c
Date: Thu,  2 Apr 2026 23:13:16 +0000
Message-Id: <20260402231316.4243-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses around &padapter->xmitpriv and
&padapter->recvpriv.

The parentheses are unnecessary and removing them improves readability.
No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 29939bf5a156..f97285d5bd6b 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -288,8 +288,8 @@ static int rtw_net_set_mac_address(struct net_device *pnetdev, void *p)
 static struct net_device_stats *rtw_net_get_stats(struct net_device *pnetdev)
 {
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
-	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
-	struct recv_priv *precvpriv = &(padapter->recvpriv);
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	struct recv_priv *precvpriv = &padapter->recvpriv;
 
 	padapter->stats.tx_packets = pxmitpriv->tx_pkts;/* pxmitpriv->tx_pkts++; */
 	padapter->stats.rx_packets = precvpriv->rx_pkts;/* precvpriv->rx_pkts++; */
-- 
2.34.1

