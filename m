Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3726105
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 14:27:44 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id y2so18075049qkl.11
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Mt5NqLIpZohSANfmYMh8mk/tMtpJZlQj8cgMWB45y0s=;
        b=I3/GRIf1RcI9/7K0oF1bOlHdLy3zi65j1yqCceu6T0nLRimx3cZkWA3svYL/fIJzIj
         +Sq8Cae1HWIK58EIW0QiKTH2Ca/qwx2qBzM6K2TLl8RgwRmdY5KJfO30B6h5wzeC8uN/
         YSqgOsjHcHjEgmXUotpie7H2n36mkIElmO3iY6G+31n/F34KrpWcs+7yWWDlNsBIFIFE
         YWFF8LhmKT/szqVROaohNoy++kD2OvGZQRzCRdZ5049nSQ6cmDQUjz9vUrCAKQoJnune
         Uo6/RWF9dmI7c1DOORG0UatSYS/7z2pWP+1A72/wTwbgXtCjtuFSj7XpjDqY29iny1d9
         CZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Mt5NqLIpZohSANfmYMh8mk/tMtpJZlQj8cgMWB45y0s=;
        b=czKsrZBO9qAUOxWRLMaFoTEw7zB9ki08EDytKmvOoP48WivrhL0PULYOkUjOovu/JC
         khQd4qn+OohG9r0xHUbcQc16PkOG9u/bg8ya39Fo1GZEc+NuVVb41/zTFoAdL2ev5lpU
         /MfgrykhVA3o/dkt2WEG5yvzF3V4c14ZsERKO+SWcvRP/oTO3TkzrYEWmKoPOwxF0vBf
         M/WR7dNNxr2+oZAMWJTjhDZFwwMPQEiqz0QdlduE8sVjj/aYUWZxtJkqSGCXxTWRy8uc
         JRv56SiuBgYF14aqMBplH6v2LfE/niKB6NFA1el6j5sjtZKqUFi70BMh8IIfvGl1/INV
         u2Wg==
X-Gm-Message-State: ACrzQf3zcjd0w+UToJIxnkiij4RL9lk6Dr1KAQVIlF9xiDUKkmlY8tga
	F1sElV9NhepYwWldTzoR8CM=
X-Google-Smtp-Source: AMsMyM5l12JtH8fP+nqVzawVrelIn/45yRWJBuLS9inKsM7UKSe9S64nL/kY9frgKCIt+ahI+h1q1A==
X-Received: by 2002:a37:464f:0:b0:6ce:5821:496e with SMTP id t76-20020a37464f000000b006ce5821496emr13073475qka.88.1663597663561;
        Mon, 19 Sep 2022 07:27:43 -0700 (PDT)
Received: from localhost.localdomain ([142.126.147.56])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a424800b006ce5fe31c2dsm13378507qko.65.2022.09.19.07.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:27:43 -0700 (PDT)
From: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
To: gregkh@linuxfoundation.org
Cc: f3sch.git@outlook.com,
	guozihua@huawei.com,
	linux-staging@lists.linux.dev,
	aruna.hewapathirane@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8192e: Removes blank line
Date: Mon, 19 Sep 2022 10:27:26 -0400
Message-Id: <20220919142726.9101-1-aruna.hewapathirane@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes checkpatch multiple
blank line issue

Signed-off-by: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 933f347fc17e..ee7c1a5e93c6 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -895,7 +895,6 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 				tcb_desc->bTxDisableRateFallBack = 1;
 			}
 
-
 			tcb_desc->RATRIndex = 7;
 			tcb_desc->bTxUseDriverAssingedRate = 1;
 		} else {
-- 
2.30.2

