Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BACD1E496
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKov3g93"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-333130bcae1so113544f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 12:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701204216; x=1701809016; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9QnSXqV0Ukg8Tls+sByuxYlBpsCAZ28kGNWhfBeP1Ho=;
        b=HKov3g93FzFIoV3KDhsW/5csHFBpkePb/f2ZyhptApgbIMD9a9xqvnDQ5caWcpWPYs
         MrdZi2JTQBr7Am7/4S8G9t7vE+WBzqk94Y8rcE5L+B+q6Mf/WsGkjrzl84Yaw7aht9AP
         HAVQdBnGeTaSY06ydBlND7YoRKUMlaUNinONFeLzD86Ei7qlaVqu8/P+rDlaFoIQ/3Dg
         R9QWZWReVFnfnPHV5tcsaTKzBhioj/xDWCWeFJcngQidUpG2KjgKe+heWQmkv+TR3F1T
         h5dFmZkpR2cU16DQI1hzUoG81zNmPfggwmO4XXW1q0flEpbenTJSBQtA4hMmCVcLI1Lj
         9WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204216; x=1701809016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QnSXqV0Ukg8Tls+sByuxYlBpsCAZ28kGNWhfBeP1Ho=;
        b=QkDns8eRGH/LjLf5+GOVzChTMxYHOxrnsKYGj144FNgBhP/se7x3ifJ4AcijnB1CWZ
         HNWZ15CUrSf7krCc6XHGv3w8wiV5oQokJM/7FMt3zHLqW2ulJMEZsar8N41FYfG+gU4g
         n35EuYr0R3afXXEGcq7iBQjc3wh4u9THK58UU0IhVE6JHQci+p6r0NnMltUK40g5wgnK
         Fow5NKzIaDby0FzJty/cbMosYjpoDhtF6sQfTn47qyi+JYX+VFJsT2gP7ZLm1sH2QD8k
         jSUxO7ArX/QyBtiwBBEKSStPW4UVnNgnKWSK4yyVUu/P38oB/odq/eQKQ0ZKIbtFL/t3
         /S6Q==
X-Gm-Message-State: AOJu0Yy85Edxi4Uw+EvYNjE2GzUnRGZ9vDOk9AUKRabbY0Ywvivkm4sO
	3JmDEXoavNfbcmzUR+55gdM=
X-Google-Smtp-Source: AGHT+IFlZOut4UOdkDfCqhaFrV+ufRdE2pcqAgXRc8/GSdFqLcF/4Ay8OYltPMEbnxhXgVTq0bEccg==
X-Received: by 2002:a05:6000:80e:b0:332:ff23:588a with SMTP id bt14-20020a056000080e00b00332ff23588amr5726442wrb.5.1701204216304;
        Tue, 28 Nov 2023 12:43:36 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm14585699wru.67.2023.11.28.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:43:36 -0800 (PST)
Date: Tue, 28 Nov 2023 21:43:33 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] staging: rtl8192e: Remove unused function
 rtllib_FlushRxTsPendingPkts()
Message-ID: <1a4471053e200e0eb8a39b0a2de6c2f4e9a36656.1701202700.git.philipp.g.hortmann@gmail.com>
References: <cover.1701202700.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701202700.git.philipp.g.hortmann@gmail.com>

Remove unused function rtllib_FlushRxTsPendingPkts().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h    |  3 +--
 drivers/staging/rtl8192e/rtllib_rx.c | 33 ----------------------------
 2 files changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 44a937953db8..b9ac313e5f97 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1814,8 +1814,7 @@ bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn);
 /* For the function is more related to hardware setting, it's better to use the
  * ieee handler to refer to it.
  */
-void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
-				 struct rx_ts_record *ts);
+
 int rtllib_parse_info_param(struct rtllib_device *ieee,
 			    struct rtllib_info_element *info_element,
 			    u16 length,
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d9517dbc5593..fd0357753c30 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -488,39 +488,6 @@ void rtllib_indicate_packets(struct rtllib_device *ieee,
 	}
 }
 
-void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
-				 struct rx_ts_record *ts)
-{
-	struct rx_reorder_entry *pRxReorderEntry;
-	u8 RfdCnt = 0;
-
-	del_timer_sync(&ts->rx_pkt_pending_timer);
-	while (!list_empty(&ts->rx_pending_pkt_list)) {
-		if (RfdCnt >= REORDER_WIN_SIZE) {
-			netdev_info(ieee->dev,
-				    "-------------->%s() error! RfdCnt >= REORDER_WIN_SIZE\n",
-				    __func__);
-			break;
-		}
-
-		pRxReorderEntry = (struct rx_reorder_entry *)
-				  list_entry(ts->rx_pending_pkt_list.prev,
-					     struct rx_reorder_entry, List);
-		netdev_dbg(ieee->dev, "%s(): Indicate SeqNum %d!\n", __func__,
-			   pRxReorderEntry->SeqNum);
-		list_del_init(&pRxReorderEntry->List);
-
-		ieee->RfdArray[RfdCnt] = pRxReorderEntry->prxb;
-
-		RfdCnt = RfdCnt + 1;
-		list_add_tail(&pRxReorderEntry->List,
-			      &ieee->RxReorder_Unused_List);
-	}
-	rtllib_indicate_packets(ieee, ieee->RfdArray, RfdCnt);
-
-	ts->rx_indicate_seq = 0xffff;
-}
-
 static void RxReorderIndicatePacket(struct rtllib_device *ieee,
 				    struct rtllib_rxb *prxb,
 				    struct rx_ts_record *ts, u16 SeqNum)
-- 
2.42.0

