Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145FF2C81
	for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 13:18:38 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id p17so8005886pgj.2
        for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJJvgLkaj1ldPKqgEqYsJV1bKUGA/M9apuGLSVBki7o=;
        b=nThlzJQiU2cDw+giTSlT/gHFuBTPFIBTNttRtPpKK+ymN6AbOn8NfOcsQKpVaAwv4r
         RCMoTrVlDXVHSHEgW4xHXLJssjj0o5cswunHtVrDlk/PWSQvY79fYnYlkqhYQOFDX6g8
         wjpl1eBVwUpjZJXn36ueF9xt7aVBfKuNhwy19d+HpRlWAck9Abp2J6WuJ+qdQbnVGgq7
         i4JuuPxa5vbNVgZsod0gxUuxpa+BBaJN1cGUVkibC1eeMb08Hm/21LK1eA9NJZIFu5cJ
         dgMFbcv/fUYZ1xI3LpLGp7CChxy4pt+fE15wSqiQJfM3Mr+P3UIO4yUZg4mtxjmyVEql
         Xt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AJJvgLkaj1ldPKqgEqYsJV1bKUGA/M9apuGLSVBki7o=;
        b=nAJFj3kaJGZncZUEgnzWH+bXpwYLiPQtX/1uP16rWR3Kja42X+zy9JKzw7ZGtwEunp
         k5O8GKGDdU0XDnMbkPKdN27XMIzVz6EuFpzs42M1l/N4j9XvCu26oaClNmRgDf/b+Tzt
         zW75wqCqZsyBF/4MQ+tykn4Rfg0rb6VYo9bqxNRX2bPKy9tfqWvSnh7N8r5nTOXLsMOi
         FMVvZQrxNS4rA0Z1mhFZrBi6Q91cni7u1tlWhtaD6l5VVIipcrzIOM1PrBDkEQw9gtmQ
         NA2ZKXCJ24q6zWAOS502BUj4v6lpg7ct2CznzNujECcQuUzF6FOVfO1oIP2zEhcx+8Dm
         3JjA==
X-Gm-Message-State: AOAM5306aY7nvkpEsq2Xb7n+a//XEMRPF6MzprredEYFR7BZKwCHowDV
	chwHF5BF5znf331VJVUzka0=
X-Google-Smtp-Source: ABdhPJzjHBEzYfDkyhbnLuvks7Kb1S7Cqymv/Ya//rLQbl6y5ZfIne/bW6SHIhFuCrR6wzqO+3cv+w==
X-Received: by 2002:a05:6a00:a10:b0:412:448c:89c7 with SMTP id p16-20020a056a000a1000b00412448c89c7mr13568800pfh.83.1636723117570;
        Fri, 12 Nov 2021 05:18:37 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id a13sm6983537pfv.99.2021.11.12.05.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:18:37 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: phil@philpotter.co.uk
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux@roeck-us.net,
	martin@kaiser.cx,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: r8188eu: remove unneeded variable
Date: Fri, 12 Nov 2021 13:18:30 +0000
Message-Id: <20211112131830.11418-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck review:
./drivers/staging/r8188eu/core/rtw_ap.c: 1094: 5-8: Unneeded variable

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index c78feeb9c862..d103a92ee2f1 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -1091,7 +1091,6 @@ u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
 int rtw_sta_flush(struct adapter *padapter)
 {
 	struct list_head *phead, *plist;
-	int ret = 0;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -1101,7 +1100,7 @@ int rtw_sta_flush(struct adapter *padapter)
 	DBG_88E(FUNC_NDEV_FMT"\n", FUNC_NDEV_ARG(padapter->pnetdev));
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
-		return ret;
+		return 0;
 
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	phead = &pstapriv->asoc_list;
@@ -1124,7 +1123,7 @@ int rtw_sta_flush(struct adapter *padapter)
 
 	associated_clients_update(padapter, true);
 
-	return ret;
+	return 0;
 }
 
 /* called > TSR LEVEL for USB or SDIO Interface*/
-- 
2.25.1

