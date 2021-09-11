Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585FB3FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso3413435wms.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J2fkjqvpR8abaNlEvVWIoS62+awuGE1JwFovkYfulF8=;
        b=ADj8dQFiYZ7CBnyL6edh+oUmxxayiVqMi763OuGXn0YtFGdCTKbNRbSbsKmvbcj8hV
         WpsHFCiuvh2FjwEDY6uobs4D3HZ+exkLfvIj8SmeW/7ItVqiKjb3vAgRVGsii7xHMdLS
         B82ZFpazlw1o4UDJIDTgaadpPUOz7efumu5mYEPHqqpxlPiN2EdPCl9OhjWgibeTa8Mw
         2mj4m0PpQLGbQ56uxrLfdltmHQexEVRviuzV+mZtsVjzeVxn6UFwGpDK9yt44QWWdNTr
         G1CmECpor9AKJqmabHSxKa4Jea8NQUIUKJBx/okQ/w+wv2vKT1YzokA40TfCBa209/jw
         qoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J2fkjqvpR8abaNlEvVWIoS62+awuGE1JwFovkYfulF8=;
        b=DzjTFgdrakiOp55JwgEp8TyZuBQ3DKtbvvG5/20AIh95FQlwARByxl8B8ARRQV00sh
         ybgcPbOCGBuaSwr/pcZSrtu9LFqLwA+DmCPcbIm3U2RsJMMzuZCmBGaGcqdMYVuMuRPV
         wIzWtpf3UjJ6NsUvn4GNGcI7mIIfKLL3mJwZ/r/r9bVNNP23Cl/6Ux3bjOnyxV4U/gXP
         2AiH94i8kc6SHjs1933anrn1XtQlyutG3sFJ/EHBGsYTbO5sDoUG7iyrQZuf4OyhmOqL
         XOl5wCn9ACwhZ7K8C8ni2TDBge0mMZtsjDXJZk2HxyDpBB5lh3KQK+aneGtiG+3kS713
         0fQw==
X-Gm-Message-State: AOAM533nOymdqMR0RFam8KcRSSZJ+trdNZk9LNKTSvxQ0nR2NMHES2GU
	hB517cjCSXs36bpMjqEg/rU=
X-Google-Smtp-Source: ABdhPJx5gGCMJZGYOD/aJ7zZBaJDd/j0+JIZQb/8cWU/qcK3KPYFbMH+lkE6TMYrZKtuN1BzkH900A==
X-Received: by 2002:a05:600c:3203:: with SMTP id r3mr2717161wmp.175.1631366839836;
        Sat, 11 Sep 2021 06:27:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:19 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 17/18] staging: r8188eu: remove unused ODM_CancelAllTimers()
Date: Sat, 11 Sep 2021 15:26:34 +0200
Message-Id: <20210911132635.30369-18-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911132635.30369-1-straube.linux@gmail.com>
References: <20210911132635.30369-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_CancelAllTimers() is unused and it is the only caller
of function ODM_CancelTimer(). Remove both.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c               | 5 -----
 drivers/staging/r8188eu/hal/odm_interface.c     | 5 -----
 drivers/staging/r8188eu/include/odm.h           | 2 --
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 4 files changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 011ebcdac797..0e5b14051ffd 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1409,11 +1409,6 @@ void ODM_InitAllTimers(struct odm_dm_struct *pDM_Odm)
 	timer_setup(&pDM_Odm->DM_SWAT_Table.SwAntennaSwitchTimer, odm_SwAntDivChkAntSwitchCallback, 0);
 }
 
-void ODM_CancelAllTimers(struct odm_dm_struct *pDM_Odm)
-{
-	ODM_CancelTimer(pDM_Odm, &pDM_Odm->DM_SWAT_Table.SwAntennaSwitchTimer);
-}
-
 /* 3============================================================ */
 /* 3 Tx Power Tracking */
 /* 3============================================================ */
diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 4e56ebf30e76..c97104c3682f 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -96,8 +96,3 @@ void ODM_sleep_ms(u32 ms)
 {
 	msleep(ms);
 }
-
-void ODM_CancelTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer)
-{
-	_cancel_timer_ex(pTimer);
-}
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index a100fdf87379..4a5a7c754008 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -1137,8 +1137,6 @@ void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value);
 
 void ODM_InitAllTimers(struct odm_dm_struct *pDM_Odm);
 
-void ODM_CancelAllTimers(struct odm_dm_struct *pDM_Odm);
-
 void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId,
 			      u32 PWDBAll, bool isCCKrate);
 
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index c7784f540e7d..95e0303c28b8 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -99,6 +99,4 @@ void ODM_delay_us(u32 us);
 
 void ODM_sleep_ms(u32 ms);
 
-void ODM_CancelTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer);
-
 #endif	/*  __ODM_INTERFACE_H__ */
-- 
2.33.0

