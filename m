Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143187E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 19:15:07 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id d26so39481909eje.10
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URSBztTq5HXujid4PUnbsPAmYdL6Ka0hNq1mm6n6cno=;
        b=fqX5yYexYI0j5kK909nrQwP2vwkyAGRQl0POVblf3X8XEadNzCO8lJzlbIQ3rqONRl
         KEpwUe1BPjJETcDhiB0DF+sECLDvw43PywmMPEyv21fxleB6TXKwUFW/A+0wSWaACvwU
         frmADMZngwXzQQhG8jArGThluWuUIcuTGNazV6cOW87OK5P5ORYmRo5q2AA+GuJ0OqSI
         gYepMIRrCxZ+nRDm1zDqyQC/g+mQPVcw7We4M2HoIfEsIFXcgPn7/FMmERxUjeOY9cgr
         l5oSEkrQGpjkhDAevijaOEjkYbvLvbDmwiyt0U0G9Lnz2v6Me+1zTR15rOA8nybhvFwI
         bv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URSBztTq5HXujid4PUnbsPAmYdL6Ka0hNq1mm6n6cno=;
        b=W/Iou/dNF2b1+LKfI/aaEFRR9p7gcfRivfYh5L9zSFvqGSraSN4D49A/KojfwcwpH8
         B9WIu5vXY/QVeqOnxV4Py9wxZA/m1HASdOrUks1Ewq4iwWw0USkW/etU6KVSlG3nFe9x
         FZbok2w4atf0P2fKWvv2AodtdVJF0CRiIRJyKUTeOf4NGWHeD0/sbuEYmxNhkt/aq0pv
         aMXmuZNiEn9zhDXCmhvWXfLB0qE0KIvx/pZRu+hFyCyltt/oruAczYQnRCZx8/37ZDlx
         98gx0L4hvNKrqBn6yEkBRDnXGIxWgIk0a0gHwtKHR1+ezlV9zEj74KSEVMmB09n7zmv7
         8++g==
X-Gm-Message-State: ACrzQf17LBcJSW1jjJsh7XiPxkRqZz895xGElCTO9GK/tO3GlnMOHjEX
	YGkmy6+Qu4h+mKn95+TQ+6M=
X-Google-Smtp-Source: AMsMyM5CXH16D7IbYQTiafXplecV8l3pNJWjj7aQ8TMiJc9+p785pNwbUydD/vDmaOjJy7oyr4/a5A==
X-Received: by 2002:a17:906:974f:b0:7aa:f705:e580 with SMTP id o15-20020a170906974f00b007aaf705e580mr18916152ejy.530.1667330105418;
        Tue, 01 Nov 2022 12:15:05 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb7a.dynamic.kabel-deutschland.de. [95.90.187.122])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b007ade5cc6e7asm1643853ejc.39.2022.11.01.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 12:15:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: convert rtw_free_stainfo() to void
Date: Tue,  1 Nov 2022 20:14:58 +0100
Message-Id: <20221101191458.8619-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221101191458.8619-1-straube.linux@gmail.com>
References: <20221101191458.8619-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_free_stainfo() returns always _SUCCESS and none of
its callers uses the return value. We can safely make the function
void. Yet another tiny step towards getting rid of _FAIL / _SUCCESS.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 8 ++------
 drivers/staging/r8188eu/include/sta_info.h | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index 51324e708697..b4aee8623099 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -242,7 +242,7 @@ struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 }
 
 /*  using pstapriv->sta_hash_lock to protect */
-u32	rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
+void rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 {
 	int i;
 	struct __queue *pfree_sta_queue;
@@ -252,7 +252,7 @@ u32	rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	struct	sta_priv *pstapriv = &padapter->stapriv;
 
 	if (!psta)
-		goto exit;
+		return;
 
 	pfree_sta_queue = &pstapriv->free_sta_queue;
 
@@ -356,10 +356,6 @@ u32	rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	spin_lock_bh(&pfree_sta_queue->lock);
 	list_add_tail(&psta->list, get_list_head(pfree_sta_queue));
 	spin_unlock_bh(&pfree_sta_queue->lock);
-
-exit:
-
-	return _SUCCESS;
 }
 
 /*  free all stainfo which in sta_hash[all] */
diff --git a/drivers/staging/r8188eu/include/sta_info.h b/drivers/staging/r8188eu/include/sta_info.h
index 55ea5edc2914..e42f4b4c6e24 100644
--- a/drivers/staging/r8188eu/include/sta_info.h
+++ b/drivers/staging/r8188eu/include/sta_info.h
@@ -303,7 +303,7 @@ int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta);
 struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int off);
 
 struct sta_info *rtw_alloc_stainfo(struct sta_priv *stapriv, u8 *hwaddr);
-u32	rtw_free_stainfo(struct adapter *adapt, struct sta_info *psta);
+void rtw_free_stainfo(struct adapter *adapt, struct sta_info *psta);
 void rtw_free_all_stainfo(struct adapter *adapt);
 struct sta_info *rtw_get_stainfo(struct sta_priv *stapriv, u8 *hwaddr);
 u32 rtw_init_bcmc_stainfo(struct adapter *adapt);
-- 
2.38.0

