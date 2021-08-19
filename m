Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956C6D1B
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 11:23:04 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v2so8291824edq.10
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=buu5/LlT/wY8R2dObdowDUNyc0UUwmBR3hVh0l4eAaY=;
        b=dWlPrs/iV+Sfjk+sXEPdm9O+hxfCpx2tf/7j18yjciuWVYIRq9PoehDuQzPCKgSBQ9
         fbEHh1Aut1qAoW9/M6BscFkKwvcT1869EWioEvws+YGQwpEpENFNoXg9gfDbON/Gtdfr
         iJzq97aYg8jKzdBOObly/zli1nkN7JtQGUaxxyclMTVRKSKFSlYff/crjmGZi00Y4P/t
         0N1o/KxX/pF2ZaoX2lperFL1AaZU8au63cSazLgZ8fWQdYFShry6tPRifD5z+gcZ5+H1
         MoKapsOwwtjGDCgQsRnes+C06ZIno04376ZxcEW4rSi/ZhjZC1GPKKuPvHiMOf8Pm7eD
         x0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=buu5/LlT/wY8R2dObdowDUNyc0UUwmBR3hVh0l4eAaY=;
        b=JnPd1AzG2/oCIn/VGHsU3A8XeNBMt0yifVZQ8U1vuHDdsPneC0NaAtD9Rqyc6Wg5Q9
         0aZQIDmtm8+wFFRp0dwz8wkdUsmhtrcgodjLEK25j4kkLC4sJo1vEymiLYWoZvTkL3+c
         eHYsiZTyZ2UGsIwvUzH1wAyyjLUIHPdjAnlXxGM3YYozKlSiI+YJsCb+neLLcvV4/mAw
         dR9lIOiOcTZ45ww4ppkQZgR1gJb54N0HTYs1VxkxaxVSRQD7mc8hx0n2bCVSeuSGrpOA
         y4N8ddaTHsQ1oLkjlzEFfGt5554ZnNKVG2clnSyjFs6/CL2qGrXGU+uN5pMGvopKAUck
         f5dQ==
X-Gm-Message-State: AOAM530QG6SucuET4HfxkKpjMtNvw4p/leqkbhJB/0dHccvZiSjMAYLY
	vvzwWKUgNOpdHh02PQbV23I=
X-Google-Smtp-Source: ABdhPJx6LwVW66OMnQDje5jQ/X2gCu4rPMjTB1PlokMMKVXBaToJn5ZUBMPPXwoB7wyoockaiT0K3g==
X-Received: by 2002:aa7:d147:: with SMTP id r7mr15701438edo.148.1629372183426;
        Thu, 19 Aug 2021 04:23:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id d23sm1563046edt.39.2021.08.19.04.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:23:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove unused function rtw_add_bcn_ie()
Date: Thu, 19 Aug 2021 13:21:59 +0200
Message-Id: <20210819112200.32030-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_add_bcn_ie() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c    | 63 ------------------------
 drivers/staging/r8188eu/include/rtw_ap.h |  2 -
 2 files changed, 65 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 1127e9a52458..0237b7f8e42f 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -139,69 +139,6 @@ static void update_BCNTIM(struct adapter *padapter)
 	set_tx_beacon_cmd(padapter);
 }
 
-void rtw_add_bcn_ie(struct adapter *padapter, struct wlan_bssid_ex *pnetwork, u8 index, u8 *data, u8 len)
-{
-	struct ndis_802_11_var_ie *pIE;
-	u8 bmatch = false;
-	u8 *pie = pnetwork->IEs;
-	u8 *p = NULL, *dst_ie = NULL, *premainder_ie = NULL;
-	u8 *pbackup_remainder_ie = NULL;
-	u32 i, offset, ielen = 0, ie_offset, remainder_ielen = 0;
-
-	for (i = sizeof(struct ndis_802_11_fixed_ie); i < pnetwork->IELength;) {
-		pIE = (struct ndis_802_11_var_ie *)(pnetwork->IEs + i);
-
-		if (pIE->ElementID > index) {
-			break;
-		} else if (pIE->ElementID == index) { /*  already exist the same IE */
-			p = (u8 *)pIE;
-			ielen = pIE->Length;
-			bmatch = true;
-			break;
-		}
-		p = (u8 *)pIE;
-		ielen = pIE->Length;
-		i += (pIE->Length + 2);
-	}
-
-	if (p && ielen > 0) {
-		ielen += 2;
-
-		premainder_ie = p + ielen;
-
-		ie_offset = (int)(p - pie);
-
-		remainder_ielen = pnetwork->IELength - ie_offset - ielen;
-
-		if (bmatch)
-			dst_ie = p;
-		else
-			dst_ie = (p + ielen);
-	}
-
-	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_KERNEL);
-		if (pbackup_remainder_ie && premainder_ie)
-			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
-	}
-
-	*dst_ie++ = index;
-	*dst_ie++ = len;
-
-	memcpy(dst_ie, data, len);
-	dst_ie += len;
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
 void rtw_remove_bcn_ie(struct adapter *padapter, struct wlan_bssid_ex *pnetwork, u8 index)
 {
 	u8 *p, *dst_ie = NULL, *premainder_ie = NULL;
diff --git a/drivers/staging/r8188eu/include/rtw_ap.h b/drivers/staging/r8188eu/include/rtw_ap.h
index b20edab3bb00..fffb6794b1ce 100644
--- a/drivers/staging/r8188eu/include/rtw_ap.h
+++ b/drivers/staging/r8188eu/include/rtw_ap.h
@@ -16,8 +16,6 @@ void rtw_indicate_sta_disassoc_event(struct adapter *padapter,
 				     struct sta_info *psta);
 void init_mlme_ap_info(struct adapter *padapter);
 void free_mlme_ap_info(struct adapter *padapter);
-void rtw_add_bcn_ie(struct adapter *padapter, struct wlan_bssid_ex *pnetwork,
-		    u8 index, u8 *data, u8 len);
 void rtw_remove_bcn_ie(struct adapter *padapter,
 		       struct wlan_bssid_ex *pnetwork, u8 index);
 void update_beacon(struct adapter *padapter, u8 ie_id,
-- 
2.32.0

