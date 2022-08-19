Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD532F42
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:43 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x21so5563007edd.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=6nwxe1++PRhv2s0+vNHsqO2vQoiOkVixhjx+02+ah2A=;
        b=IdMupijCCG07S6XRhxPDNwtwhCoqAA8u3wa3vFDBj4dAT6JIulwc8cVswfc54wc9uh
         GrvsEwfCRRJ48kGlmtl4TM4XLVRCvT8gMLRzRhgYFM8YYpufKCvHaLDMIw0EHtBEcTKV
         kEJtDu3E8B93sklpqSTT9pZZl7yb+/e6pNjdoIWLXvM+brUMF1TsucAjDC5NfZ4MyBC9
         QIE33mKIR3UAcqZIYGZKny2BoC3VT2I2HKNDcCvXFE39xsDstpvmbvzoaTu2KUARcF9+
         m0K/tixQt6HGJJRCXRynGgOzo4dq4aVj9q1Xa9vdq4fDzBrS2AENhz/jq6HGhC0bmWAk
         3qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=6nwxe1++PRhv2s0+vNHsqO2vQoiOkVixhjx+02+ah2A=;
        b=yJ1I3qGF9M2jxMtg5j3IuAiV13+vf7OahG1Et4r6M8Sh0IXCTblrTxyf8kYdHDaJjM
         7iInyUAUzxwV7OAROPAh27nra+3YwMIRterNuxhklnOfirvNZGalI+5qeulkzOnPnSyt
         1VY0pUt5Qd92C/TO1AFDgmG/E9CAbiAKI/KAcDPKZJinJseS7TnB6fuNRzP1wnNxe/3H
         3pZpqz3chQhzPSLwFmHlTy94CR3pbjECb3MlxntSc+Y5Ho+enNUamvTW+QS10i3oq5xr
         XEFFFxRGG7bRr7cK1GTcyi98hgU+FESZfb4g1845J1370wzad1TbZ3JIkIGJovXKNiBk
         QpPQ==
X-Gm-Message-State: ACgBeo2ioRWzwBzMNKA0j5BEkYsNNntUxBkhtJxeedzfFWDT+MSGtRlb
	cUbNVwZAofSHhEdXaEJJMbUYcXFw3kI=
X-Google-Smtp-Source: AA6agR5Gvbd2XyaxSiCHDP7C8nNhOGV3GL/jDgKcnsRiMw+6zrUGHKzWKm9zK4SaUCnZEGyCyHYEbw==
X-Received: by 2002:aa7:c84f:0:b0:446:2bfb:5a63 with SMTP id g15-20020aa7c84f000000b004462bfb5a63mr3699865edt.172.1660913682048;
        Fri, 19 Aug 2022 05:54:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/11] staging: r8188eu: make rtw_report_sec_ie() static
Date: Fri, 19 Aug 2022 14:54:22 +0200
Message-Id: <20220819125428.8412-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819125428.8412-1-straube.linux@gmail.com>
References: <20220819125428.8412-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_report_sec_ie() is only used in rtw_mlme.c.
Make it static to get one step closer to removing
os_dep/mlme_linux.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c      | 27 ++++++++++++++++++++
 drivers/staging/r8188eu/include/mlme_osdep.h |  1 -
 drivers/staging/r8188eu/os_dep/mlme_linux.c  | 27 --------------------
 3 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 2705c9d87b14..213c64303b01 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1639,6 +1639,33 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 	return ie_len;
 }
 
+static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
+{
+	uint len;
+	u8 *buff, *p, i;
+	union iwreq_data wrqu;
+
+	buff = NULL;
+	if (authmode == _WPA_IE_ID_) {
+		buff = kzalloc(IW_CUSTOM_MAX, GFP_ATOMIC);
+		if (!buff)
+			return;
+		p = buff;
+		p += sprintf(p, "ASSOCINFO(ReqIEs =");
+		len = sec_ie[1] + 2;
+		len =  (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
+		for (i = 0; i < len; i++)
+			p += sprintf(p, "%02x", sec_ie[i]);
+		p += sprintf(p, ")");
+		memset(&wrqu, 0, sizeof(wrqu));
+		wrqu.data.length = p - buff;
+		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ?
+				   wrqu.data.length : IW_CUSTOM_MAX;
+		wireless_send_event(adapter->pnetdev, IWEVCUSTOM, &wrqu, buff);
+		kfree(buff);
+	}
+}
+
 int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len)
 {
 	u8 authmode = 0;
diff --git a/drivers/staging/r8188eu/include/mlme_osdep.h b/drivers/staging/r8188eu/include/mlme_osdep.h
index 5b9f688f9424..2c0ce06bce82 100644
--- a/drivers/staging/r8188eu/include/mlme_osdep.h
+++ b/drivers/staging/r8188eu/include/mlme_osdep.h
@@ -11,7 +11,6 @@ void rtw_init_mlme_timer(struct adapter *padapter);
 void rtw_os_indicate_disconnect(struct adapter *adapter);
 void rtw_os_indicate_connect(struct adapter *adapter);
 void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted);
-void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
 
 void rtw_reset_securitypriv(struct adapter *adapter);
 void indicate_wx_scan_complete_event(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index 37c7f52421ee..aff9e18476db 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -102,30 +102,3 @@ void rtw_os_indicate_disconnect(struct adapter *adapter)
 	rtw_indicate_wx_disassoc_event(adapter);
 	rtw_reset_securitypriv(adapter);
 }
-
-void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
-{
-	uint	len;
-	u8	*buff, *p, i;
-	union iwreq_data wrqu;
-
-	buff = NULL;
-	if (authmode == _WPA_IE_ID_) {
-		buff = kzalloc(IW_CUSTOM_MAX, GFP_ATOMIC);
-		if (!buff)
-			return;
-		p = buff;
-		p += sprintf(p, "ASSOCINFO(ReqIEs =");
-		len = sec_ie[1] + 2;
-		len =  (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
-		for (i = 0; i < len; i++)
-			p += sprintf(p, "%02x", sec_ie[i]);
-		p += sprintf(p, ")");
-		memset(&wrqu, 0, sizeof(wrqu));
-		wrqu.data.length = p - buff;
-		wrqu.data.length = (wrqu.data.length < IW_CUSTOM_MAX) ?
-				   wrqu.data.length : IW_CUSTOM_MAX;
-		wireless_send_event(adapter->pnetdev, IWEVCUSTOM, &wrqu, buff);
-		kfree(buff);
-	}
-}
-- 
2.37.1

