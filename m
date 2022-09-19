Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050265C92
	for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 13:58:51 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id d15so20481780qka.9
        for <linux-staging@lists.linux.dev>; Mon, 19 Sep 2022 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gHhzCqcr4uMccNSgvISt+fTNHdK2v4nDlLBU1IjHghk=;
        b=a/ucEdaAbOnjhtwf8vzz+hi2pLgvu/UPwGk0HDn2GT1wp9dtDGzis/xwfrkSOXjS7S
         lefOo0d3wsdzUSYKtUmh7C7KjPDMXowPlGzjN7qfag5VgLv5rdDVQ6QL1RSF7GQ51J9m
         AvHfcF6jfK0IWpOs/KMo9Nl+ZAtS+PS1A7YHp4ytMg64v1zlOiIbuPdaONHx5IWY/vAh
         OSi1ELC8ZD/QnWVMzLglXI9EaWGc6su8ONg+BUfaEbm9vAUxm0azCet0lcvVVlbgjSxF
         Qy7a1FndCKVDzq9v/L0oftPGjaGJHAfAWV/7hpWmWMq6hWpgZbU5K4xcHrtb6ujIEEnp
         iP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gHhzCqcr4uMccNSgvISt+fTNHdK2v4nDlLBU1IjHghk=;
        b=XTk46Nj7csspyogUkKIPCi4Cr/Bbboof0L7PhNXRTkXt5WJUMklx8KtQ8zkp2Z4bQ5
         lP8Mu487rEkKcld5cgBDCnpCjProqBqc4wYqJY3FtM57xikd+gLAK8QFixfQ1cqZIBCU
         C9kYKnerFU/NQJO0bOtnwVNVDgny7MBnJGRj00wyBup/GWGdru7v1gCFK2EDkS7trg/U
         7YaTowBPnx591UXHjezS/bIW3B9/EEvywqoIuuphkg/w4DmkqDY/3E8TfRBqtN+BDefU
         FcoVloGyTkpeeU/JzDppuxcktPriXMLOFpAYf3TBI81U8/31O/3GHtSktyp6a+oN4NWb
         Qrbw==
X-Gm-Message-State: ACrzQf3ACvhSJPcs+kuJNErezlYAbw6kXpb0Xp8h5WCHA4CWr4dEl8Zg
	XSrZFFdoVP4wiF6Se++M1QI=
X-Google-Smtp-Source: AMsMyM4OBiNLKEn12KMlz6pMi0ikG17VPuRSKTzFjrlIfNsFyrzI29OeNDNNVWWaDH0oKwZWAzH3sQ==
X-Received: by 2002:a05:620a:4382:b0:6ce:2761:28d0 with SMTP id a2-20020a05620a438200b006ce276128d0mr12535723qkp.329.1663595930797;
        Mon, 19 Sep 2022 06:58:50 -0700 (PDT)
Received: from localhost.localdomain ([142.126.147.56])
        by smtp.gmail.com with ESMTPSA id l19-20020a05620a28d300b006b60d5a7205sm13725882qkp.51.2022.09.19.06.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 06:58:50 -0700 (PDT)
From: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
To: gregkh@linuxfoundation.org
Cc: f3sch.git@outlook.com,
	guozihua@huawei.com,
	linux-staging@lists.linux.dev,
	aruna.hewapathirane@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8192e: removes blank line
Date: Mon, 19 Sep 2022 09:58:12 -0400
Message-Id: <20220919135812.8307-1-aruna.hewapathirane@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a checkpatch CHECK issue
CHECK: Please don't use multiple blank lines

Signed-off-by: Aruna Hewapathirane <aruna.hewapathirane@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index d5275319a486..f651947f6b44 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -920,7 +920,6 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 					tcb_desc->bTxDisableRateFallBack = 1;
 				}
 
-
 				tcb_desc->RATRIndex = 7;
 				tcb_desc->bTxUseDriverAssingedRate = 1;
 				tcb_desc->bdhcp = 1;
-- 
2.30.2

