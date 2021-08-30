Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB213FC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 07:10:22 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m2so8115053wmm.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQOEpVE/C5dPQ93Tb+yBF/RNgfmLwzTx629HAf0Qgcs=;
        b=uiELm4PTLBuhU7cgEqNnEg/k/V8uMGvTMgOPgR3QQxJefAQmj5HcwfiJLC54Hkg4Vh
         RidYD+FPn/GpI6z7kqIKlv/OhXpynG6so3RSJ+CmZffvwl7DT7l90FKIzQiprsVHpmSM
         R5Nv/ceMiOHX4DWrxcr4TlytcoHtLzgqfaPMLogPVJVPR3ia6lGtiKx/SJbZb/N3qdr/
         fPG4hXjZH7q1lbK2tSmKwF8xknr12rqqw4zz6uuvGXDXHk+jLFijOfPnCNPiGQrqPz2M
         vAnz3aRP0WrM/hkue2UijdcGTXSfD8172yoRbuDylh60LRyyJTr3ZtnHCqWu8AjlKnVY
         CHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQOEpVE/C5dPQ93Tb+yBF/RNgfmLwzTx629HAf0Qgcs=;
        b=CORF6+g4UmjiU0weyfJnlUgpfFO9s/d+P51i+5/Gbqd4F5+CW7cx8djRPtSjuJadv8
         4mMWTPlPLn2RDG+B1NVy6NEkaKAoINS9ML/vO4Zd83ZREjAUAgdCr8H3G5nd6hGGdNLw
         vXIloyfdAa9vqF7FGkjLUQ5Z0XMv+tx5cwUno8+YLrFEFiZ6UeNNrkYQOp9UU8ktECle
         aNrWFn/HFk0d3S4cquxgsbNISffUidv7ulNFQfHXBDM8sFJeRNlsR1pajEbn/BEY9for
         9iLItpLPGyMzdj4pnjnIbsZbniatnmzmCIwtgUWuNiZ/5ZJsYJNN22qY+RJGx02vCZOo
         rbwA==
X-Gm-Message-State: AOAM533Gs7HN+wKpJRt2Gx5Oi1Ny25iVUbS56HduFsahytf/LgBN1EBL
	XPOFsgaHOzNK8nRpw7QcRaALAlR6u6c=
X-Google-Smtp-Source: ABdhPJxMCEKVn1y7BMu5P1w6JKn20bQsG5ZgkajYeYMBq5atkbsXeVV+o3+7xo/G2TYRdlUcdjjiOQ==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr20002423wmc.95.1630307420944;
        Mon, 30 Aug 2021 00:10:20 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id o5sm14362073wrw.17.2021.08.30.00.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 00:10:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove unused _rtw_init_queue() function
Date: Mon, 30 Aug 2021 09:09:25 +0200
Message-Id: <3c03fcfbe799195c84608b05fc54efe921bef4de.1630307025.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1630307025.git.fabioaiuto83@gmail.com>
References: <cover.1630307025.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove _rtw_init_queue() left unused by previous commit
in this series.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index c58555a4012f..2d630ecef08b 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -49,13 +49,6 @@ inline int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb)
 	return netif_rx(skb);
 }
 
-void _rtw_init_queue(struct __queue *pqueue)
-{
-	INIT_LIST_HEAD(&(pqueue->queue));
-
-	spin_lock_init(&(pqueue->lock));
-}
-
 struct net_device *rtw_alloc_etherdev_with_old_priv(int sizeof_priv, void *old_priv)
 {
 	struct net_device *pnetdev;
-- 
2.20.1

