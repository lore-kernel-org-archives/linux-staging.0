Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986A33FCF
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:37 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d21so10282019wra.12
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0pikKkKyV9neSxxsD6Rq5EII7Lyu/8RY9WBWekMxOm8=;
        b=PnTRsbFQmubYYS/U0sALN3rgpe/fATZ3/BCTeTpQZnCydNqLH6oTNTfsIC5LjHd3/s
         7/TeQU7E5vjdmWuZKe95xO6OEZ7UvIpjOFQYiAn0b3TOvdcO8zx1Br0Yg7iJ4alP7w4m
         C4Eo6xHLOUF8F6G+NeVvxWE0JjJXcG6uG+/POcgKHNXb9mx0jl7cnmdrC0OaKpLS/Jvr
         aVA1N3gI6BK7eUDAGln/NV1uVh0earjMLtBKM9SDE3GHJxR+gBxpV/Ckwue7pjlSoiDh
         M3rnlq3RfxM/8OkkO/DawctMMzwMiDgPqpoP0uWF2fj6gIRavC1hTPt80IisdF8FXXpc
         F0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0pikKkKyV9neSxxsD6Rq5EII7Lyu/8RY9WBWekMxOm8=;
        b=u3CMgHQyeOlTwaDl38Dfcj4eE6PZz4bKfRoWnp2DcALFjYpoQ25SpLPdk+/0PaQFOX
         jYIsWn8kxHlWtehnq/hAsr8fIBE3aWm8UzQQiNzQPPG43XciEmh7Bus7i//eKX83LlmP
         Gw2TeWmU08ytqgDculPINlbiphp5StmLmfchorHsXdhmwNxmHkjuPGx3cj7qtdxpCauU
         pTlKal8Tx5U/O+3D1tTOWLffu9oIQ8xZO6HvE6waINCw7CB1n4OqPcN0ZRlbGUB1ihUH
         BByYeYCX9PoGQk3Y/wn/fQjot1r7f2YVokDn69ZnpLtT4DWPBJS1MkbOLsyMo1cf9Bcs
         vI1Q==
X-Gm-Message-State: AOAM533qt0jW0yTRmOpfslFVgQIwQUEsbQzLkuUhAvAnZ0a0pbWJHhc6
	keomMl7Qt92YS9QMgXP9Q4M=
X-Google-Smtp-Source: ABdhPJxsYvWeMWgFIbkvnjFnQJNJBiFocKL9WCLEFj3rus6Y4BytM6egNAJRGC0MPQYVuF0yQfVQpQ==
X-Received: by 2002:a05:6000:1379:: with SMTP id q25mr846259wrz.429.1632341136052;
        Wed, 22 Sep 2021 13:05:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/47] staging: r8188eu: remove rtw_scan_abort()
Date: Wed, 22 Sep 2021 22:03:45 +0200
Message-Id: <20210922200420.9693-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_scan_abort() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 23 ----------------------
 drivers/staging/r8188eu/include/rtw_mlme.h |  1 -
 2 files changed, 24 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 456933475c16..f1bc4b2e930d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -897,29 +897,6 @@ inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 	rtw_os_indicate_scan_done(padapter, aborted);
 }
 
-void rtw_scan_abort(struct adapter *adapter)
-{
-	u32 start;
-	struct mlme_priv	*pmlmepriv = &adapter->mlmepriv;
-	struct mlme_ext_priv	*pmlmeext = &adapter->mlmeextpriv;
-
-	start = jiffies;
-	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) &&
-	       rtw_get_passing_time_ms(start) <= 200) {
-		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
-			break;
-		DBG_88E(FUNC_NDEV_FMT"fw_state=_FW_UNDER_SURVEY!\n", FUNC_NDEV_ARG(adapter->pnetdev));
-		msleep(20);
-	}
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
-		if (!adapter->bDriverStopped && !adapter->bSurpriseRemoved)
-			DBG_88E(FUNC_NDEV_FMT"waiting for scan_abort time out!\n", FUNC_NDEV_ARG(adapter->pnetdev));
-		rtw_indicate_scan_done(adapter, true);
-	}
-	pmlmeext->scan_abort = false;
-}
-
 static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
 {
 	int i;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 9dc9f9b94850..e8d51f495702 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -557,7 +557,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue);
 void rtw_indicate_disconnect(struct adapter *adapter);
 void rtw_indicate_connect(struct adapter *adapter);
 void rtw_indicate_scan_done( struct adapter *padapter, bool aborted);
-void rtw_scan_abort(struct adapter *adapter);
 
 int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
 			uint in_len);
-- 
2.33.0

