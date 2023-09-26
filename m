Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81330D1C
	for <linux-staging@lists.linux.dev>; Tue, 26 Sep 2023 16:15:44 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690d2e13074so7111392b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Sep 2023 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695744944; x=1696349744; darn=lists.linux.dev;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRdqgJyQK3irEtjIY1sArYtpNHn/PRA/0ZX748jQzQY=;
        b=jtREDjjwsdcM0P7q9C8hxTo2Y+Zy9kw2xTLOMkhZrQEcPdysf8b50AKhubzT1b2Jaf
         IpdeDiDiO8VzO3qB95uH/DK2Kdk4uiRxmzOs7n1B2VOwEo3MrRe4qaLXoEu+EdSZc6yI
         LGOMf1MkrszIvKaLulfnra7CpEScSdUbtJhzaQWIFceI9IEW7qUgzZT7MRoWD7SXrV0X
         G+XW7ghDLfrp23pWZ9e0QkX0sbDEjhS1rp5ujLcVRCzWWofhAMJ5rnHgRW+gSeJSozV0
         6DMMh+wiAulCqxv0mXyG9Pdn8D4LZSaXULGKBNZixYqpOgI/dVUS0qz4E9Bi//M6w7/8
         HQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695744944; x=1696349744;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRdqgJyQK3irEtjIY1sArYtpNHn/PRA/0ZX748jQzQY=;
        b=Mu2VzUzSar1KgpaW2MREk9UIrxjEaeoEuVjSj6JHWZexlBtWG9hArBC0+qa5fFWSrJ
         LLkMod6LvM91RrWeQW+MY0Iypdi1GsdVYDB6Gq42H1M3OO7AVd4zEoZ3UmFsjWIIN//3
         SqsWLd6RAF/Gy/7inA0lIKLl3O+AK8zD7xfucZuuIspCEJFukZs0aWZdx08wHVVjXYuJ
         7uSHcvsvbpdUYIilaxYPYhx7HtYZJ0iqfU0wb0xQox/TGbDpK3ueaY5qgRHNcj/0WVs8
         09nvnKazkgKM26gHnUenQ7WGSyPQ5lK0fdhz3a4WcI6ZrsQylkcJzc8jlhPJtAQYMmmY
         x4rQ==
X-Gm-Message-State: AOJu0Yy2N7TYSykpmOAJpTkGPbpbSs0qMPviWlby97MZdiU0NHgzIzx+
	iSCtrEygf26iZkWVfQc6vus=
X-Google-Smtp-Source: AGHT+IFXLvCotTkZMZBPmnG02w7NedZk/zhSuvc2WviLKsRzD4FgX7KWHq4bVqvEckO2k6XogENstw==
X-Received: by 2002:a05:6a20:9383:b0:14b:8023:33c8 with SMTP id x3-20020a056a20938300b0014b802333c8mr8948104pzh.2.1695744943745;
        Tue, 26 Sep 2023 09:15:43 -0700 (PDT)
Received: from 377044c6c369.cse.ust.hk (191host097.mobilenet.cse.ust.hk. [143.89.191.97])
        by smtp.gmail.com with ESMTPSA id i13-20020aa78d8d000000b00689f8dc26c2sm10132400pfr.133.2023.09.26.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 09:15:42 -0700 (PDT)
From: Chengfeng Ye <dg573847474@gmail.com>
To: gregkh@linuxfoundation.org,
	kamrankhadijadj@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <dg573847474@gmail.com>
Subject: [PATCH] staging: ks7010: disable bh on tx_dev_lock
Date: Tue, 26 Sep 2023 16:13:23 +0000
Message-Id: <20230926161323.41928-1-dg573847474@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

As &priv->tx_dev.tx_dev_lock is also acquired by xmit callback which
could be call from timer under softirq context, use spin_lock_bh()
on it to prevent potential deadlock.

hostif_sme_work()
--> hostif_sme_set_pmksa()
--> hostif_mib_set_request()
--> ks_wlan_hw_tx()
--> spin_lock(&priv->tx_dev.tx_dev_lock)

ks_wlan_start_xmit()
--> hostif_data_request()
--> ks_wlan_hw_tx()
--> spin_lock(&priv->tx_dev.tx_dev_lock)

Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 9fb118e77a1f..f1d44e4955fc 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -395,9 +395,9 @@ int ks_wlan_hw_tx(struct ks_wlan_private *priv, void *p, unsigned long size,
 	priv->hostt.buff[priv->hostt.qtail] = le16_to_cpu(hdr->event);
 	priv->hostt.qtail = (priv->hostt.qtail + 1) % SME_EVENT_BUFF_SIZE;
 
-	spin_lock(&priv->tx_dev.tx_dev_lock);
+	spin_lock_bh(&priv->tx_dev.tx_dev_lock);
 	result = enqueue_txdev(priv, p, size, complete_handler, skb);
-	spin_unlock(&priv->tx_dev.tx_dev_lock);
+	spin_unlock_bh(&priv->tx_dev.tx_dev_lock);
 
 	if (txq_has_space(priv))
 		queue_delayed_work(priv->wq, &priv->rw_dwork, 0);
-- 
2.17.1

