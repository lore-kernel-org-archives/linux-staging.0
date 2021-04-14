Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792D6D37
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:52 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id e7so24776847edu.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FdEVCrFFwemRGVz8oNJR0sYV8NDQMun9Dnn10s4aLrk=;
        b=T5Jffb63JPVd5H0yM+DB8OtbI31ZzfgIBRp9fcT7nfWp6tb8FNg+hZ0h0U/CvFCFTP
         UU32/JF/zBkzp4sdCgyGbO8tVdQkrqSieOquzuHbLfEQxrfHCw+lXIPgP5bpC0xXQ+KQ
         2iHgJJscQrmwvOtLFb/xZUcPSiL+EYipYKzdiK32DIud48Jc+Uriq7EbVsAi/o0zvdfb
         QNZfF8EdtT/7OjHrZKQ++TNxJNwoXLUJ9Asfu/x5R+Pr6VrmV01PPKaxt9ivn3ApLC9X
         M5/X9kPyaSxRFJDemHQUMkKVzpHQJF0EhpWq6w4Yyl7bjtYjM/9BNgJC1cVR9NEzjZn9
         nRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FdEVCrFFwemRGVz8oNJR0sYV8NDQMun9Dnn10s4aLrk=;
        b=pd0E/unb51IYDjdC2AQ+UpYr97QMXkfkHMsSccHT7qsOdSry3VwgQGeIlp8BS6tXJ2
         sGm2ehG1WTs1qp/JcBj/7AO6XWWJ42D3026HvCmNka/bjSVSA8ztM3sAuY2G6KIluwRz
         h78mIIu1ZTOfg4CqLsIsUGeR3a9dvM19wnul66dfUgyWDa2QHBBaCyE2aNbmvWww91Er
         DmfDY+CvF+EzYQG1G76WVSt08MGW+bJ9KndFDWjM7IgfQ43qg8qYjxj6ozjfX7b2RoOS
         k+yYN4reghCNVqWlspgg4yygLrvcjAiOxESdKddmifpL5vhY9xqplOkbpWYKnrszx3xm
         KwYg==
X-Gm-Message-State: AOAM530Sg6TSIe3fDF/dGZ5bYx8KCeXPIrxQ4VqZMGVy7leRVERCFupE
	EWOvIJ+BWLEemt0sdj02IJAgPwAsSVJI9A==
X-Google-Smtp-Source: ABdhPJzZK1BMaZwOXlSvNJiNdKQ3vu6LUN5MeljFZ+3mC/R1f+ruoi0sqd5K7L6WqjLGqGercAGrgg==
X-Received: by 2002:aa7:d588:: with SMTP id r8mr191546edq.318.1618423911399;
        Wed, 14 Apr 2021 11:11:51 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 16/57] staging: rtl8723bs: core: rtw_sta_mgt: Remove unused variable 'psta'
Date: Wed, 14 Apr 2021 19:10:48 +0100
Message-Id: <20210414181129.1628598-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c: In function ‘kfree_all_stainfo’:
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c:128:19: warning: variable ‘psta’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ross Schmidt <ross.schm.dev@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 85663182b388a..7b631a6b258a1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -119,7 +119,6 @@ void kfree_all_stainfo(struct sta_priv *pstapriv);
 void kfree_all_stainfo(struct sta_priv *pstapriv)
 {
 	struct list_head	*plist, *phead;
-	struct sta_info *psta = NULL;
 
 	spin_lock_bh(&pstapriv->sta_hash_lock);
 
@@ -127,7 +126,6 @@ void kfree_all_stainfo(struct sta_priv *pstapriv)
 	plist = get_next(phead);
 
 	while (phead != plist) {
-		psta = container_of(plist, struct sta_info, list);
 		plist = get_next(plist);
 	}
 
-- 
2.27.0

