Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EEEA2A
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:29 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-56ffe7eee6fso671992eaf.1
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492329; x=1693097129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVP43ZdT+Ah8txpqgYO67dhB2NuYflevUyyp4oWr+Mg=;
        b=I2bQLi96Sufi0VclsAjtNQwD7BuaUlTG5TtgiU+xgRCxO5H7M8T13xegVnQ6gVKfK6
         3sY7VYepiQT4c1zcA0K26kd0rh3FUKlfnD5zGFHD4M4/W1DWee8OAWMqlzXyXau6Z6tw
         /oLhOO9OSJhzhPiA1gTDwjh6QeBqIB4c3+kL1AoUTQSIei9Vp7nu3fu6ZgTPDgdzkSnR
         pEPMhxLZXrP4tgAXI5qMEef3Q2JptqQD0BNIYyOSO26FYBeeYPIadf9XJ2AlsEq5kCaQ
         DTvOMDUXuDu66oyw1jyPd3cZEwEKYfeWrWnFMlZVkGWwZCzt+RM9r7aw6FlTTTFlniUX
         nv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492329; x=1693097129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVP43ZdT+Ah8txpqgYO67dhB2NuYflevUyyp4oWr+Mg=;
        b=Yx9XkKbs+fnwoXDEv7WU6QnPa+4CUDD6l/yw3TCc+sxj95Ji5ECYXlpLbUjsCZw4BD
         n5fDND6vpjVRMJ4imnIEKnTBy5b1LFXqh4MX1Pf77qlgoIUl95JBILmhJ4lNxShBj+6f
         ENsAUl9ftNqNUAZUmT86AU862UXrJkD5itJ8HtU3s950SYtiTHd0Hl9srKLf8L/sLg/+
         p4Nxekt/8ra1lfJgPY9aMWU3af5tubujbBtnVq4soyACalhAsL3bgyLCQextJ3wLrBVr
         Zr3s+VxLthJ6jZRFzbH3vYNPw2S7WY5RwCS/Ha2+Uv/egOT7U2KjD9E+xrLkTBsYKgGI
         9Kyw==
X-Gm-Message-State: AOJu0Yx1Fv3cqUtA2IVGjl7a+g2y3Har8e58/4EDiBtzlCIVgCKmoQ40
	BmWwxbMriT/mCAFpTlsZhCi5tg==
X-Google-Smtp-Source: AGHT+IGDP5sANo4IhkqOVaphQ3jmgOfa7gbQtfzg9AMb2dBEpYWI98MCngull48D9XaaZK23RS0e5g==
X-Received: by 2002:a05:6870:3307:b0:1b0:b13:c16 with SMTP id x7-20020a056870330700b001b00b130c16mr4720685oae.2.1692492329130;
        Sat, 19 Aug 2023 17:45:29 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:28 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/16] Staging: rtl8192e: Rename variable pTS in function rtllib_FlushRxTsPendingPkts()
Date: Sat, 19 Aug 2023 17:47:41 -0700
Message-ID: <20230820004744.278022-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pTS in function rtllib_FlushRxTsPendingPkts() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 1d41f62fa346..4907468ddaa5 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -520,13 +520,13 @@ void rtllib_indicate_packets(struct rtllib_device *ieee,
 }
 
 void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
-				 struct rx_ts_record *pTS)
+				 struct rx_ts_record *ts)
 {
 	struct rx_reorder_entry *pRxReorderEntry;
 	u8 RfdCnt = 0;
 
-	del_timer_sync(&pTS->rx_pkt_pending_timer);
-	while (!list_empty(&pTS->rx_pending_pkt_list)) {
+	del_timer_sync(&ts->rx_pkt_pending_timer);
+	while (!list_empty(&ts->rx_pending_pkt_list)) {
 		if (RfdCnt >= REORDER_WIN_SIZE) {
 			netdev_info(ieee->dev,
 				    "-------------->%s() error! RfdCnt >= REORDER_WIN_SIZE\n",
@@ -535,7 +535,7 @@ void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
 		}
 
 		pRxReorderEntry = (struct rx_reorder_entry *)
-				  list_entry(pTS->rx_pending_pkt_list.prev,
+				  list_entry(ts->rx_pending_pkt_list.prev,
 					     struct rx_reorder_entry, List);
 		netdev_dbg(ieee->dev, "%s(): Indicate SeqNum %d!\n", __func__,
 			   pRxReorderEntry->SeqNum);
@@ -549,7 +549,7 @@ void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
 	}
 	rtllib_indicate_packets(ieee, ieee->RfdArray, RfdCnt);
 
-	pTS->rx_indicate_seq = 0xffff;
+	ts->rx_indicate_seq = 0xffff;
 }
 
 static void RxReorderIndicatePacket(struct rtllib_device *ieee,
-- 
2.41.0

