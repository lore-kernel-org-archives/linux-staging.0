Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA216105
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 14:16:46 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id h21so20654130qta.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gi0TnNbGqxYHjuOkweth3voflohQx3+OCCEOwCUfQSM=;
        b=lq61+2uFX+UjcC1s4RAx7rx9aBCHZXEUBJI7L53vGqd2Fh/3gcaDpU6LF/Am7ZIQKB
         3nieaq+ZvBN8KGV4S4QeGeMGTa0qJCPRqXmOz8EVqerjpVDENvt1Mo/vvznll1Z4nB0H
         XrYxDmfldK7uhhZiYEi64TgqTypg2BNFUMYvx7KrZHgN6TNj46NNd1NwWMmF56EpTQSZ
         +DqF9YlEERlNMFF4A5Ois7OJsoha+qa7Wmv0J/DOrQI5ipoW6m1mp+Fo6xzkG8u7Y7rM
         LLJ83xhLt1l9BHD7ldYULLBFB8LMeP+uxg03p7US2uRTIXJg0qyB4bDV9VOaVzdbVIAp
         Qweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gi0TnNbGqxYHjuOkweth3voflohQx3+OCCEOwCUfQSM=;
        b=ys41MXZgkHeDthQwHtSIoPelPjHLhDILjX1lnKvlbcDJ2m0HoIAUuuiZ8oVlMacxSO
         733iq1hhagCzFlrlLRjEcTeomuwnW6749Qg9SFtm3HltE6Gvh3EG11a6yU5iEV3zUlhf
         7uWwh9A+nttTYmw5GQe2niJhvIG+54rV2Eev3DxZZLTcnQxQpSnuOE6z57jXNyOtAaHi
         J7mhzitmDLO6hTo7Ua5JyrJRtzjvhzAr5Tk2vtvOJyDmbPHvvVMHbrk/3vGAZUc6quTQ
         m17L5JMxa6/k/3y4D3JyV1l/msY7xNkav/tgL9l3SoSWdOJKhm7QR22GSH6UcBCmFiaQ
         IWuQ==
X-Gm-Message-State: ACrzQf22mU/Xt0XsK4aVtPn0MumDtt6Kvu173KeRspCR+vr2dq1f3uGK
	LMQEN8Xxz1H738hT93YuZzI=
X-Google-Smtp-Source: AMsMyM4FhYhpHQBMEPreZIWLNq+qEzxt4809sJ350dYwnOQ/wEb2PyYBsTAI8KxLoUb7ktsDXVCzcw==
X-Received: by 2002:a05:622a:1886:b0:35c:b9f5:cbcd with SMTP id v6-20020a05622a188600b0035cb9f5cbcdmr15464555qtc.290.1663597005287;
        Mon, 19 Sep 2022 07:16:45 -0700 (PDT)
Received: from localhost.localdomain ([142.126.147.56])
        by smtp.gmail.com with ESMTPSA id w4-20020ac86b04000000b00343057845f7sm10377369qts.20.2022.09.19.07.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:16:44 -0700 (PDT)
From: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
To: gregkh@linuxfoundation.org
Cc: f3sch.git@outlook.com,
	guozihua@huawei.com,
	linux-staging@lists.linux.dev,
	aruna.hewapathirane@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8192e: spaces preferred around that '<<' (ctx:VxV)
Date: Mon, 19 Sep 2022 10:16:24 -0400
Message-Id: <20220919141624.8765-1-aruna.hewapathirane@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes 2 checkpatch CHECK issues

Signed-off-by: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index f651947f6b44..933f347fc17e 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -818,10 +818,10 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 					 cpu_to_le16(rtllib_query_seqnum(ieee, skb_frag,
 							     header.addr1));
 				frag_hdr->seq_ctl =
-					 cpu_to_le16(le16_to_cpu(frag_hdr->seq_ctl)<<4 | i);
+					 cpu_to_le16(le16_to_cpu(frag_hdr->seq_ctl) << 4 | i);
 			} else {
 				frag_hdr->seq_ctl =
-					 cpu_to_le16(ieee->seq_ctrl[0]<<4 | i);
+					 cpu_to_le16(ieee->seq_ctrl[0] << 4 | i);
 			}
 			/* Put a SNAP header on the first fragment */
 			if (i == 0) {
-- 
2.30.2

