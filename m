Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C683489
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 19:04:49 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z4so18816530wrv.11
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aXbrVUeSVUKGA1kFryhIbtHmRoYkiOzY/emxjEyZSbE=;
        b=QCQASC0tb4YFQbCXtokWNVndupjqwzfeMbPmnyJaajvdQpXj1cHRUCtgNCkXb11dFy
         Qbupueh9DHPGabEbl0be8oB+w18QardcHkd0yNYSZIajNhNSkUJVjaOOivc1RoXAx0DW
         1iEa1QkQKwHp8JS9lXhlbSH5gTYQZf/TSwlpKa30FoCSHcNA2mISVCvzd/UP8seUnpGk
         gEf7u8kO7fZOeeG3jKs71UIOY2ZvsknF3pKU77Hql9XE2ryY/Vrz5KQ+VTueosIDFUrP
         YSv2tUnDVz7wyfSZR3i3yLq9oLOY6A3VROlZqglohc6g9Jmyz8+vnYZF6HzMWkOACtjj
         R+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aXbrVUeSVUKGA1kFryhIbtHmRoYkiOzY/emxjEyZSbE=;
        b=pLczwAsgNhnBA9KJ4JryND0vH559LDlBdv/58xzwQ2ajpD1rSpLRGjm8idKtjo7rKu
         zs+0xchAUguZ61n7am8fcm/eIiGw94NT0oN6HJOFCy6Iu179Rn4uOhzFjkf1jEDjKtvk
         Lu7nE7GMaRlT+l9DdYMe+oxT1kmIM5KIbHdXnSqP75sr6F/Tx7+n6jF+EIKMqai0v9sm
         uetnU3Vvf08th5o5ac/bjCtgGRyR0rUlMdaJEniMeESqhjFA9TP4+3B5t/ILcBkTZLRR
         +AEzrqrXLdn3VLkybV2ndKjhazRSRAob693X6sCP3WpjZf0/rf4wjn9sNGcTG2n2tst/
         VpsA==
X-Gm-Message-State: AOAM532kcn+3xuNa/7y4hLLpvYc1nN+eAxuzausIDKAUVDD1A7VZJa9u
	bCtsOwX7gkMrI94emeNURtqoIQ==
X-Google-Smtp-Source: ABdhPJz+6fbJwnohCVf6kR/Vy6SNZJto5RNld4vjC1noxVINo6RrsZMF8iZDg0YoVFRHr4TJd/3YSw==
X-Received: by 2002:adf:f383:: with SMTP id m3mr13503528wro.81.1627844688247;
        Sun, 01 Aug 2021 12:04:48 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id c10sm8196026wmb.40.2021.08.01.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 12:04:47 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH 11/15] staging: r8188eu: remove RT_TRACE calls from core/rtw_sta_mgt.c
Date: Sun,  1 Aug 2021 20:04:33 +0100
Message-Id: <20210801190437.82017-12-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801190437.82017-1-phil@philpotter.co.uk>
References: <20210801190437.82017-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from core/rtw_sta_mgt.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index feaf39fddf7c..3905c28b6b3c 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -263,9 +263,7 @@ struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 		_rtw_init_stainfo(psta);
 		memcpy(psta->hwaddr, hwaddr, ETH_ALEN);
 		index = wifi_mac_hash(hwaddr);
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_info_, ("rtw_alloc_stainfo: index=%x", index));
 		if (index >= NUM_STA) {
-			RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("ERROR => rtw_alloc_stainfo: index >= NUM_STA"));
 			psta = NULL;
 			goto exit;
 		}
@@ -287,10 +285,6 @@ struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 		for (i = 0; i < 16; i++)
 			memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &wRxSeqInitialValue, 2);
 
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_info_,
-			 ("alloc number_%d stainfo  with hwaddr = %pM\n",
-			 pstapriv->asoc_sta_count, hwaddr));
-
 		init_addba_retry_timer(pstapriv->padapter, psta);
 
 		/* for A-MPDU Rx reordering buffer control */
@@ -364,7 +358,6 @@ u32	rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	spin_unlock_bh(&pxmitpriv->lock);
 
 	list_del_init(&psta->hash_list);
-	RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("\n free number_%d stainfo  with hwaddr=0x%.2x 0x%.2x 0x%.2x 0x%.2x 0x%.2x 0x%.2x\n", pstapriv->asoc_sta_count, psta->hwaddr[0], psta->hwaddr[1], psta->hwaddr[2], psta->hwaddr[3], psta->hwaddr[4], psta->hwaddr[5]));
 	pstapriv->asoc_sta_count--;
 
 	/*  re-init sta_info; 20061114 */
@@ -530,7 +523,6 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 
 	if (psta == NULL) {
 		res = _FAIL;
-		RT_TRACE(_module_rtl871x_sta_mgt_c_, _drv_err_, ("rtw_alloc_stainfo fail"));
 		goto exit;
 	}
 
-- 
2.31.1

