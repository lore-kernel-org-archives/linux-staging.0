Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73F36D28
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 11:23:05 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id w5so12217959ejq.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 04:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qB8JB6eDsfab/lPkD/8C2//8tOgCjprlAVkppf7bpUA=;
        b=lJKC/eDNcmbA+hwdPIVsPJweqAWjB54y8APAy1G7LRnFmM+jOtfiYOkhmQPn74YsjV
         4ECz94YTYPB7zg3CLSzFK34Z1uPVxAP1LxqKubJFCl9885Z3pd25DLxk2osrH+CdGhNR
         e65NO5qni57Bp9wYHi5DzADzp1LqefvFOSOlhZixxw5NRexlP4VFIunDfnHDZ01XyGYc
         +9djYX8rNC7PwYGoMsnlY27IbJlepMtpg/t0wmDcrPpGSPEu2Ea6bhw1aPxd38A0AGk9
         0qlbv5kRaYK2ZQl57iCP7JsOSZ04wZeHSXaiZ/75dIGdmRe6y1lYq0DCmD82fIcW1dfZ
         OxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qB8JB6eDsfab/lPkD/8C2//8tOgCjprlAVkppf7bpUA=;
        b=qrvob+k+tOlbtkfA1XUK/OR/vL1A5RsSp0kBeEZ2dbXwWX2gk0HgL4z4qr0N9G5xEH
         C3LjbR+azFtxZaGE5UliPRDtIX13Jn+KZHE3t/ixUIYddZjv7Eqmg2IDapk45vPbmtxP
         rSMVa3vsnxgrneDPWoDCbK88eqzMFstN4j2NqQg0tXYK5IYHTDuZVnNCRS810O9hfS7d
         F6OExcsTvPWI3ed9imZf3ePrc1OM8fA3Y2wFguyM/q/AnUMBnz72ArcKq+DNV8/ZN3Rg
         yngsnZ9NR7TFFyiaa5NOUwIKzoz/mu/qJVCFc8rsHCFvyXhH+C7CwFezs0aUBqohw7M/
         9S9w==
X-Gm-Message-State: AOAM531UJkoh8VhxRIp6wGCfCqEZPZI8RQLZAcDA/1uCuJlchrUNm395
	X+tJ29K8XYG3QnK+zEBC2dI=
X-Google-Smtp-Source: ABdhPJx+xemd+gwsOiUOJuZI8hRD/2Eaq+OC5r7mdtc4IWZph9BbwmxX8A4C+uI0xu9n8OntJYT8ww==
X-Received: by 2002:a17:906:30d6:: with SMTP id b22mr15330840ejb.442.1629372184328;
        Thu, 19 Aug 2021 04:23:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id d23sm1563046edt.39.2021.08.19.04.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:23:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove unused function rtw_remove_bcn_ie()
Date: Thu, 19 Aug 2021 13:22:00 +0200
Message-Id: <20210819112200.32030-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819112200.32030-1-straube.linux@gmail.com>
References: <20210819112200.32030-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_remove_bcn_ie() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c    | 38 ------------------------
 drivers/staging/r8188eu/include/rtw_ap.h |  2 --
 2 files changed, 40 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 0237b7f8e42f..1f3aa0092ef9 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -139,44 +139,6 @@ static void update_BCNTIM(struct adapter *padapter)
 	set_tx_beacon_cmd(padapter);
 }
 
-void rtw_remove_bcn_ie(struct adapter *padapter, struct wlan_bssid_ex *pnetwork, u8 index)
-{
-	u8 *p, *dst_ie = NULL, *premainder_ie = NULL;
-	u8 *pbackup_remainder_ie = NULL;
-	uint offset, ielen, ie_offset, remainder_ielen = 0;
-	u8	*pie = pnetwork->IEs;
-
-	p = rtw_get_ie(pie + _FIXED_IE_LENGTH_, index, &ielen,
-		       pnetwork->IELength - _FIXED_IE_LENGTH_);
-	if (p && ielen > 0) {
-		ielen += 2;
-
-		premainder_ie = p + ielen;
-
-		ie_offset = (int)(p - pie);
-
-		remainder_ielen = pnetwork->IELength - ie_offset - ielen;
-
-		dst_ie = p;
-	}
-
-	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_KERNEL);
-		if (pbackup_remainder_ie && premainder_ie)
-			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
-	}
-
-	/* copy remainder IE */
-	if (pbackup_remainder_ie) {
-		memcpy(dst_ie, pbackup_remainder_ie, remainder_ielen);
-
-		kfree(pbackup_remainder_ie);
-	}
-
-	offset =  (uint)(dst_ie - pie);
-	pnetwork->IELength = offset + remainder_ielen;
-}
-
 static u8 chk_sta_is_alive(struct sta_info *psta)
 {
 	u8 ret = false;
diff --git a/drivers/staging/r8188eu/include/rtw_ap.h b/drivers/staging/r8188eu/include/rtw_ap.h
index fffb6794b1ce..2eb556968509 100644
--- a/drivers/staging/r8188eu/include/rtw_ap.h
+++ b/drivers/staging/r8188eu/include/rtw_ap.h
@@ -16,8 +16,6 @@ void rtw_indicate_sta_disassoc_event(struct adapter *padapter,
 				     struct sta_info *psta);
 void init_mlme_ap_info(struct adapter *padapter);
 void free_mlme_ap_info(struct adapter *padapter);
-void rtw_remove_bcn_ie(struct adapter *padapter,
-		       struct wlan_bssid_ex *pnetwork, u8 index);
 void update_beacon(struct adapter *padapter, u8 ie_id,
 		   u8 *oui, u8 tx);
 void add_RATid(struct adapter *padapter, struct sta_info *psta,
-- 
2.32.0

