Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE062AE78
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778094136; cv=none; b=APxQ6/wNNeeW4D+hawFWRQ0m9wjXozsTt81nF/uC+KMc2n5KgnB1IHxF5tQAGmruI1oRtRgrbDLsAAXK7B/StWEJZQe5KOaE9ULAUAl4qEOwXRGNsnF0qvfLOZrrn91MsCg0MVQz72nGUl6gJhD2KktNIcKmHZJZbtJ5FvjZC70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778094136; c=relaxed/simple;
	bh=JZaYrfEozMKjSaZ1YP5VhkkzGdyFrIk1JlrrX6YYOZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnB/0d6VhHcj/EpJt3oyVIqQbL0jaP78HaPbXp7xW7LBO2+iCVyfUBcBlEI2yY9MUO1VuRguUPATP1n6krhpw5VyWPEgIyN5jLqUhAg0NyHy3SV7WqhLdRJwCIuOruSx7PqS+G/IDeadnKROr2ANJAwa2ZaIMQpyIONsC4g3cmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EE9t8QWr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EE9t8QWr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-364f65f6eaeso45308a91.0
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 12:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778094135; x=1778698935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9tOsIvukdXEoOpeYE1gtqLz9A1OHR7NyB1FjpZTaRE=;
        b=EE9t8QWr+WANYEwIMjiu6NuhJr1Jf0r67RYi0M9lTO/YtnH8iYX30+i3ryLjnXjlD5
         sdfX0jixNwClrQAK1Z4lb8a8B/n4BzTgdt+PiMnhdGDvcNoTPm6rBywKxuTFxNLzIfto
         xGMij9k71zjWcTBWovMdrnC2Rl+UwBukMBLcp9csj2qK3PT5E9tmQsmu9PQ0HRvNS2iw
         cJ8SXHhORPnB6SR5uF+j91/ftR4jmvva+DQdZ0ykiuU9HOQGOimS7rfGVD8heoHkBLhx
         MKDAmemPb2bBofDaLGAFcZDCu8zIs0OG+aAAvM/f1JGWl/PHu62naa5KWZCgGC9/dCz5
         5aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778094135; x=1778698935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9tOsIvukdXEoOpeYE1gtqLz9A1OHR7NyB1FjpZTaRE=;
        b=XYCUtvjrOIem9Uq9CvzuLehBisLIU1HqkgLk6hfYhEOnk4HBALSi6AJs/vjFjeQLIN
         OSnaA6Rxw/cH99OAaTLYhCRIGFo+q5AIuVT8XQXpBtNoRbwM7uZvGxun6uS1cjqRlbDS
         ILxKGfsqvOds6vt5f4NBDpBWRWpGIVUWBZwFfLLQ+duF23tXNqXTVDxGEbwR4y3NPj0X
         sr7lxzSMOWaCTL4wLXfHMTLId0EW81Dwdt2A4xqV4oXjJb4gcMfWClWQkMnJp0DHGvA3
         fCRqY9xhkToqIKqR+I10w2lP4yqsW9AdIx6tQIaMubNj8uKd272tHttNcmOgHRoPTfvY
         ApQQ==
X-Gm-Message-State: AOJu0YzHVYahfH0bwWfUbVSzcNKs6OcV9omYBZ4yBQ7iMlpnfUFDglWM
	UTk1KPzHWUofuj1IHDkir80A2SxvJ/GrHL6CEIPk2AYOxEKpAkISRx8j
X-Gm-Gg: AeBDieu1AeDVL7wlV+ok1j9EHFYLir3AZ5pYxmDdrs9D3brs3DaT3A149DHKyfXmADH
	n1S1Yx4K1NOBVjDnF3pMV9abceBuwUjAm8oOxkm0fkYLgaOsvxoJllQzcXb0wCy3eHolGZ2qxtq
	cZKN08mwuC0JlB70OV4SEsl1Bfs/Wjhf2/oqSFb1UuuukHOY5+SUbDM12hMbo24vPhQnyIo19N2
	l7EgL2mnmRlkeu1aCDbmBxHSvpOLOWaq7ww3LE7PoLjjWu0dOfHRNI6MIUnyRFB2F2596ausZTi
	WtO0AdXwYHMJqGXVFnjN9KmykxQ2j4CtA89dW/6nChN7C6i0T3EGnUBSZwZs9o7N9t4B3yDGr7Z
	NrG8q6tdE0u20+ZqqcRdruqF12zzoKSvvbFankrdCi5LNlKjeP43t3vVgcCzy3L7Ruh+zX3NEiy
	VoL1G19XpHuNJq3Bctyphz5fzeIvhAjhH+8QhpcsnDHupQUn5oxUY=
X-Received: by 2002:a17:90b:2f4e:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-365abe8c511mr4920397a91.17.1778094134933;
        Wed, 06 May 2026 12:02:14 -0700 (PDT)
Received: from sohail.. ([2401:4900:88f7:997:22aa:2a67:7f83:6413])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3660228d9a0sm24319a91.10.2026.05.06.12.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:02:14 -0700 (PDT)
From: Mohammed Sohail <mohd.sohail.biz@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Mohammed Sohail <mohd.sohail.biz@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: simplify NULL pointer checks
Date: Thu,  7 May 2026 00:32:01 +0530
Message-ID: <20260506190201.75571-1-mohd.sohail.biz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <afcUjiVlxZIj3Ma0@archlinux>
References: <afcUjiVlxZIj3Ma0@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ptr == NULL with !ptr in rtw_recv.h and ioctl_cfg80211.c.

Improves readability and follows kernel coding style.
No functional changes.

Signed-off-by: Mohammed Sohail <mohd.sohail.biz@gmail.com>
---
v2:
- Use real name in Signed-off-by as requested by reviewer
---
 drivers/staging/rtl8723bs/include/rtw_recv.h      | 8 ++++----
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 8e45871f07f0..9c32d480a20a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -349,7 +349,7 @@ s32  rtw_recv_entry(union recv_frame *precv_frame);
 static inline u8 *get_rxmem(union recv_frame *precvframe)
 {
 	/* always return rx_head... */
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	return precvframe->u.hdr.rx_head;
@@ -362,7 +362,7 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
 	/* used for extract sz bytes from rx_data, update rx_data and return the updated rx_data to the caller */
 
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 
@@ -387,7 +387,7 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
 	/* after putting, rx_tail must be still larger than rx_end. */
 	unsigned char *prev_rx_tail;
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	prev_rx_tail = precvframe->u.hdr.rx_tail;
@@ -414,7 +414,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int s
 	/* used for extract sz bytes from rx_end, update rx_end and return the updated rx_end to the caller */
 	/* after pulling, rx_end must be still larger than rx_data. */
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	precvframe->u.hdr.rx_tail -= sz;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd3bae31b0ed..8ae3adecafd9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	psta = rtw_sta_info_get_by_idx(idx, pstapriv);
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
-	if (psta == NULL) {
+	if (!psta) {
 		ret = -ENOENT;
 		goto exit;
 	}
-- 
2.43.0

