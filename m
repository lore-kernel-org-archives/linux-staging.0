Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645270
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 00:55:22 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id hw6so14211942ejc.10
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 17:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ksajpnsjJzPlnTGdprn7ElzDNq6N2TCOP+6qf/O43zw=;
        b=iN+YJH9WVXFJF82gYEqnQ0Z2Lp2scoDpO018/OJfQaGSejCiXf39lYREjmVD642jWV
         P0HSiTYTStjzbYaRr4372O39f19spQq4qWyHx51/+sRBlJQd1mXbqPzL8pbCim98NmJu
         wxPPcXDqiASQ50HnZWycIzT9tD9h9US2cClrshjK+hzRWiIZ3ea5n9E869agebFcbXiW
         8vd+ShUR2V7yfbqgvk3/JYFu3MiwxCgo6/GoxUQi59NqmuKFx2KUItEcuhLR05BXOX2n
         CnfO72oUdwOXStgHjMwmlRprEg6Me4x11h6xjWGZJTHg8SePAN9mZKe4B6I5UbVi/Xcm
         WYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ksajpnsjJzPlnTGdprn7ElzDNq6N2TCOP+6qf/O43zw=;
        b=P034q6FzY3QCJZJi7z85cxC2UhvLdQctBDHHLgHvcyY9YVBJUlBjx5Io/8hx70zweP
         g/nIAAVzIUDQfBs04Y8oh8KKHp9ubYYsYDGVHfsAaH+/V9J7R72J0VniLjdsmxecwMdZ
         xCPinBW1hB4+2rifIq3fi6jaEu0tIUdfFc+B0jsKpqa4rORfOx0h/KVwHJ83LSLu7Sup
         sbkshV+Xq1vg0y9vPIom4lpWtDB7gNEjjzMW0KgK421JsEZIo9wydnIFT22RRdGA6IV0
         4u3yccwVTva/pOBrD/ozQ1Apo5WjN14YgeYh/0Fw5uvgXH1U57yxxDL27yhH751q1F4N
         XgwQ==
X-Gm-Message-State: AOAM530536pxoz6EEjB0rojdQgQntrZKvoLRbNybtEew8Nb9sCF7dyVH
	GPPtL87f8dCtt+2ALa4u7g8=
X-Google-Smtp-Source: ABdhPJzI0jlYSuZH4DXXc/6divlLMe1Z6vgDAfJeBvZBwr+fxeKbNseWF3NzpiwRf2l5Ej2LOs/dHQ==
X-Received: by 2002:a17:906:31d4:: with SMTP id f20mr12776750ejf.383.1627865720521;
        Sun, 01 Aug 2021 17:55:20 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id b17sm620123edd.27.2021.08.01.17.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 17:55:20 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: core: Remove rtw_mfree_all_stainfo()
Date: Mon,  2 Aug 2021 02:55:17 +0200
Message-Id: <20210802005517.12815-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_mfree_all_stainfo() and the only line of code that calls
it. This function simply takes a spinlock and iterates over a list 
with no purpose. That iteration has no side effects.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index feaf39fddf7c..dae845ace2ef 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -161,34 +161,12 @@ void rtw_mfree_stainfo(struct sta_info *psta)
 
 }
 
-/*  this function is used to free the memory of lock || sema for all stainfos */
-void rtw_mfree_all_stainfo(struct sta_priv *pstapriv);
-void rtw_mfree_all_stainfo(struct sta_priv *pstapriv)
-{
-	struct list_head *plist, *phead;
-	struct sta_info *psta = NULL;
-
-	spin_lock_bh(&pstapriv->sta_hash_lock);
-
-	phead = get_list_head(&pstapriv->free_sta_queue);
-	plist = phead->next;
-
-	while (phead != plist) {
-		psta = container_of(plist, struct sta_info, list);
-		plist = plist->next;
-	}
-
-	spin_unlock_bh(&pstapriv->sta_hash_lock);
-}
-
 static void rtw_mfree_sta_priv_lock(struct sta_priv *pstapriv)
 {
 #ifdef CONFIG_88EU_AP_MODE
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
 #endif
 
-	 rtw_mfree_all_stainfo(pstapriv); /* be done before free sta_hash_lock */
-
 	_rtw_spinlock_free(&pstapriv->free_sta_queue.lock);
 
 	_rtw_spinlock_free(&pstapriv->sta_hash_lock);
-- 
2.32.0

