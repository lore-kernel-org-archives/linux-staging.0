Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B62101E9
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:27 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68bec3a1c0fso839271b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972386; x=1693577186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKylAdpbd6bAT6DkmqHJUl+vujDdihaxPwNW91ic0fo=;
        b=Y7Q+sqUaSW3vzJEHdF9uiGaoNUCsojkzB05711djc5hfk2bCCBVBZu/DQpzHk3Zgd0
         44W5Zbpox0fM/UpQcjni+3dTgxeIqAoQeOnu0I02B+OAcU5ZYAlYpNi0uCkXY2U3CS0H
         vUriHbnVlqO5p8I3E9aggkNGOnSworSQHHK/hy28cF0zFB1XqayEFf4qUKCcmP2qctk/
         cmtdC3tjhbiGvjd22nVvkjzi1RQ21LGgGE+9gM5Ac2Mn9QUiiPsoieL/qY3kR0/dyqUD
         C+hvRysiDgF+j8dwaaUknFhtVRqHGzHsx6klVyutHkOlR8HGP1cz1KOdGLUzZzTBUzo/
         Eupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972386; x=1693577186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKylAdpbd6bAT6DkmqHJUl+vujDdihaxPwNW91ic0fo=;
        b=hURX1/NL3MppyLLn+T8RwDVtsI/K4GcN34aq2Q+506BbwVW8NHzn9HXAywUC4L+j9Y
         q97TOgKPGlj6vWZEp6jC/NDWBbZq8Kk6N2ZxWj3Rn+9lsNnPPYdaH3dFTXd9xrsr8wnc
         b8GZVTOjWzcqFyMDrGvTdIQT5cIPSAu8cOlLT0a4nOTVe7lso5AI6fDEUJLpU0Dur2Pc
         /6Dr2nvXp7SMy9QfIR42026rj4oZOOq8gib/s3Y5dIjqHhI1pZD3JbNjp2X40dWQrqif
         TwxRRoRz5AwpZwP2jgvTFY1wR8TaQDUY6hM6532waamHkJlJuMmmCXLEThdgJG04S8IZ
         cdkA==
X-Gm-Message-State: AOJu0YzhQa58tPOiR/qR7TelDn0E7P7XSoG1DiOAvrdRkQvZIobH1H30
	VWX12r3alT9o19GvzPP0Xi3IYQ==
X-Google-Smtp-Source: AGHT+IGgbKwCOlfYMyCws4X06VH/xiXwzjL6b3sf172YAxQgv3qBX3xijGOgSjL5p6or9VVgfWxq9Q==
X-Received: by 2002:a05:6a20:2455:b0:122:10f9:f635 with SMTP id t21-20020a056a20245500b0012210f9f635mr21148928pzc.19.1692972386656;
        Fri, 25 Aug 2023 07:06:26 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:26 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 10/16] Staging: rtl8192e: Rename variable pRxTS in function RemoveTsEntry()
Date: Fri, 25 Aug 2023 07:08:41 -0700
Message-ID: <20230825140847.501113-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
References: <20230825140847.501113-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pRxTS in function RemoveTsEntry() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending whole series as v4
v3:No Changes
v2:No Changes
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 131a5d7b4599..944970272801 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -364,14 +364,14 @@ static void RemoveTsEntry(struct rtllib_device *ieee,
 
 	if (TxRxSelect == RX_DIR) {
 		struct rx_reorder_entry *pRxReorderEntry;
-		struct rx_ts_record *pRxTS = (struct rx_ts_record *)pTs;
+		struct rx_ts_record *ts = (struct rx_ts_record *)pTs;
 
-		if (timer_pending(&pRxTS->rx_pkt_pending_timer))
-			del_timer_sync(&pRxTS->rx_pkt_pending_timer);
+		if (timer_pending(&ts->rx_pkt_pending_timer))
+			del_timer_sync(&ts->rx_pkt_pending_timer);
 
-		while (!list_empty(&pRxTS->rx_pending_pkt_list)) {
+		while (!list_empty(&ts->rx_pending_pkt_list)) {
 			pRxReorderEntry = (struct rx_reorder_entry *)
-					list_entry(pRxTS->rx_pending_pkt_list.prev,
+					list_entry(ts->rx_pending_pkt_list.prev,
 					struct rx_reorder_entry, List);
 			netdev_dbg(ieee->dev,  "%s(): Delete SeqNum %d!\n",
 				   __func__, pRxReorderEntry->SeqNum);
-- 
2.41.0

