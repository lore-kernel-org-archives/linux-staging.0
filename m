Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C93111C8D
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:09:28 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4047ef37f55so1666415e9.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794167; x=1695398967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YYrZWmR9ibcpEx9K+dr8dK7clI/EvOdBCBQrgTnJvTM=;
        b=K04vpU4TldsQAwFSaF4lVjRvsF54sTgD/L8lszcVdYddtu3xJoqlekj5YIdG816a40
         CavbSSpkCZM7iIRaGCGQPYEg7qw6PNZDbc0lejLhfhIOsPauz+3G+SGAX6+vWOElT97R
         n2GTOh3/gQNQGxNkVOX/tpMu8J6M0wBhE2kqTR5rbxR28kCex3MtWTaEmldM0Zquv/RB
         HTdgpOdU1s0yUa4RQhGWe33zJ4EjgGoxj0izdpbGynH562nuF/5GZ8aKRXJBkoXGj8Pg
         vLgg7xjWuO1TRoGYhzAhrNIcrWtWRQ2+uEQJo9UePGUqncZ0NqfBdiK33S7saPY7eq1B
         vtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794167; x=1695398967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYrZWmR9ibcpEx9K+dr8dK7clI/EvOdBCBQrgTnJvTM=;
        b=D6UAfFE41GXvtArSFRGCfCcmbJ37XdgRM9GrT7LjDAlvPf1M0uM1ZmToMt2sfHSGea
         0Zc8A7qZdN7QzL01urXno6eW9kWNPmjiSsG1Jcoy+GaC5ZV+fygt1o8k8/WZc1bdr6lu
         D8S4LUAGKyKGYw406IKu4h3y7xNZZmfPUzo1Iakhh2iqxpWKf3pZn2pRm/vo/SmwFalm
         MpD29o2rMccU5jVRpf4AohJOwTz0yD1ALkbbd2/gH3udNh8BzHnIcFYmQW4fWsxII62E
         vyzG60sFBYkq9AwKtXBH/dogmOULHiwYClpMtJGyJ05pOlW7dBd78CE3Q2y8bPM14Xb/
         7Klg==
X-Gm-Message-State: AOJu0YyLkhsGlCComfIoFqhBaqZHbKcnAlJZED1gy+LwDdsGh677yeAT
	4IF3ZA/sdme3mQSVuFjmR9U=
X-Google-Smtp-Source: AGHT+IERri93rYEDEreWdnSc19Cfvd4qaU1YamBg/Iz5qjCc1rmMNuQgLxbzfA7Bdzt0u3+bDqzLdw==
X-Received: by 2002:a05:600c:3ba3:b0:401:c392:d28d with SMTP id n35-20020a05600c3ba300b00401c392d28dmr1906777wms.2.1694794166885;
        Fri, 15 Sep 2023 09:09:26 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c214d00b003fc16ee2864sm4994907wml.48.2023.09.15.09.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:09:26 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:09:25 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/16] staging: rtl8192e: Remove struct rtllib_hdr_4addrqos
Message-ID: <e146191ec1781a3989b318316fe9d8cdb330a52a.1694792595.git.philipp.g.hortmann@gmail.com>
References: <cover.1694792595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694792595.git.philipp.g.hortmann@gmail.com>

Replace struct rtllib_hdr_4addrqos with struct ieee80211_qos_hdr_4addr to
avoid proprietary code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h    | 12 ------------
 drivers/staging/rtl8192e/rtllib_rx.c | 18 +++++++++---------
 2 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e73292201e3a..24060c9722e6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -679,18 +679,6 @@ struct rtllib_pspoll_hdr {
 	u8 ta[ETH_ALEN];
 } __packed;
 
-struct rtllib_hdr_4addrqos {
-	__le16 frame_ctl;
-	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 addr2[ETH_ALEN];
-	u8 addr3[ETH_ALEN];
-	__le16 seq_ctl;
-	u8 addr4[ETH_ALEN];
-	__le16 qos_ctl;
-	u8 payload[];
-} __packed;
-
 struct rtllib_info_element {
 	u8 id;
 	u8 len;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 265a718a20a4..cf98b020194b 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -94,13 +94,13 @@ rtllib_frag_cache_get(struct rtllib_device *ieee,
 	unsigned int seq = WLAN_GET_SEQ_SEQ(sc);
 	struct rtllib_frag_entry *entry;
 	struct ieee80211_qos_hdr *hdr_3addrqos;
-	struct rtllib_hdr_4addrqos *hdr_4addrqos;
+	struct ieee80211_qos_hdr_4addr *hdr_4addrqos;
 	u8 tid;
 
 	if (((fc & RTLLIB_FCTL_DSTODS) == RTLLIB_FCTL_DSTODS) &&
 	    RTLLIB_QOS_HAS_SEQ(fc)) {
-		hdr_4addrqos = (struct rtllib_hdr_4addrqos *)hdr;
-		tid = le16_to_cpu(hdr_4addrqos->qos_ctl) & RTLLIB_QCTL_TID;
+		hdr_4addrqos = (struct ieee80211_qos_hdr_4addr *)hdr;
+		tid = le16_to_cpu(hdr_4addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
 		tid = UP2AC(tid);
 		tid++;
 	} else if (RTLLIB_QOS_HAS_SEQ(fc)) {
@@ -163,13 +163,13 @@ static int rtllib_frag_cache_invalidate(struct rtllib_device *ieee,
 	unsigned int seq = WLAN_GET_SEQ_SEQ(sc);
 	struct rtllib_frag_entry *entry;
 	struct ieee80211_qos_hdr *hdr_3addrqos;
-	struct rtllib_hdr_4addrqos *hdr_4addrqos;
+	struct ieee80211_qos_hdr_4addr *hdr_4addrqos;
 	u8 tid;
 
 	if (((fc & RTLLIB_FCTL_DSTODS) == RTLLIB_FCTL_DSTODS) &&
 	    RTLLIB_QOS_HAS_SEQ(fc)) {
-		hdr_4addrqos = (struct rtllib_hdr_4addrqos *)hdr;
-		tid = le16_to_cpu(hdr_4addrqos->qos_ctl) & RTLLIB_QCTL_TID;
+		hdr_4addrqos = (struct ieee80211_qos_hdr_4addr *)hdr;
+		tid = le16_to_cpu(hdr_4addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
 		tid = UP2AC(tid);
 		tid++;
 	} else if (RTLLIB_QOS_HAS_SEQ(fc)) {
@@ -356,13 +356,13 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 	u16 *last_seq, *last_frag;
 	unsigned long *last_time;
 	struct ieee80211_qos_hdr *hdr_3addrqos;
-	struct rtllib_hdr_4addrqos *hdr_4addrqos;
+	struct ieee80211_qos_hdr_4addr *hdr_4addrqos;
 	u8 tid;
 
 	if (((fc & RTLLIB_FCTL_DSTODS) == RTLLIB_FCTL_DSTODS) &&
 	    RTLLIB_QOS_HAS_SEQ(fc)) {
-		hdr_4addrqos = (struct rtllib_hdr_4addrqos *)header;
-		tid = le16_to_cpu(hdr_4addrqos->qos_ctl) & RTLLIB_QCTL_TID;
+		hdr_4addrqos = (struct ieee80211_qos_hdr_4addr *)header;
+		tid = le16_to_cpu(hdr_4addrqos->qos_ctrl) & RTLLIB_QCTL_TID;
 		tid = UP2AC(tid);
 		tid++;
 	} else if (RTLLIB_QOS_HAS_SEQ(fc)) {
-- 
2.42.0

