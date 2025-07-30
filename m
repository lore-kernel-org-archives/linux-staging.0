Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963912949F1
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872315; cv=none; b=DPSXUmi6KvdnqhAIhXRXZ4r61WY6nrF2YwNdKAZpcJ44rUM/IPFJUu+qPGskGfApDn+4v83wC7XfYTu+70tO3RyPGcEl5tK8PVtie8zD8L25K/8amL9XCmbb7+3MuVAvbisYnq063pPq1bK/OpeDhi/yrJx6mODDbWksp9FmK/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872315; c=relaxed/simple;
	bh=213EVC+0UVwqwh4SAqNbTXFElUgCZw5dNB4DgvuHqj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxDlyNFBW+nxxNDIdsF0jSjJdPwHzSszUoR92+BzS+OpodTrmaZCDgPE0fA7T94nIo8OUhJDQN7+rC6ZbD+EkROS3LWagE37jmZtzGUAjp/PuskYhBMJt+JH5CUgooWkH7GgVk5SgQ3ALrvX0SsAcaXvNLWx+eJSylFzGJojMuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxRGd6pc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxRGd6pc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so11975175a12.2
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753872312; x=1754477112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp2PMrXLI/gbGEVH6n9WhPc+A6Nzp3ouOjOI/qshZbo=;
        b=WxRGd6pcVP+1Kw2SxbCu9m58/rgLB/mbZyIuYr5jGLmACXcMHtJT3liQI8XHiMPAWJ
         1E/Mc3kfFy5cIUD1GMUv1MjplTfQGZmPW4wVhxGOVLUHRCJjVJmdyroCXgpWQsip1eWy
         3nHtW/qeiv2++RhT6E76oLVl9n9ewzm+DDKuS1By0j3tBVlwg1+syQO3NVtitr8zSV5B
         zIIJim2AmEadnG5VzHYAoTk0FTGuIznvd3nKWNo9yVXh1wa2/2mW8VPSVLY+tboye8Xc
         Qrq3PX4oEPyogkTDONDwZdAWM2zKg0CA69rqFMehbxMxjXjktTQGjRhHTOnZKPsdPBsy
         4wHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753872312; x=1754477112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp2PMrXLI/gbGEVH6n9WhPc+A6Nzp3ouOjOI/qshZbo=;
        b=jwJjwiKMZ+7w/M674GpV/UHfGohs22Sygl1XQ4zJJKRLOChogdY0YM3XrSTC7ywIKg
         r2iGvTlMq0MNackQ2bGarw2dlEwm/4utvc+hH0iylFSEE0L9ZAWmCHZYCYJfLpOWXkni
         laLLdjSRz27HRDh4xnJuIlOcHID2es0TZWyRWFxeNQjiZiSOYdVG081ieek6VnFmqjqi
         KFm4W8t1sC+KiF2rbkMNzqY0vvEFL0mgCGAAHb255n1VcFX5U0rtJWmGXhaqoTYIz+uz
         Zyie7d9W5NXhBmXJexPgas2FB7qV9QVoBMbHLGcEVwO4l33XwEe6MFduNvqPDLRwPIjp
         jj6g==
X-Forwarded-Encrypted: i=1; AJvYcCU0Du3JdqIr5Ax8R7zPgeI3Zg1ppfKIVvXgfwhG8RktIRKDK7EwEX7h68i5GAJ+RIE0Ez2jjhgBw8pgQomp@lists.linux.dev
X-Gm-Message-State: AOJu0YyMwIaz3YJy2oH5KWoW9A1YNCyiekMCzaZtgDV5s8Pw3f88Fpc3
	yscU8lEJW0cW1/hJmkmG0PPniKqFnJSMFfmZwGTj3Cp+Oa2k1zaH39BR
X-Gm-Gg: ASbGncubyAQg/A1QDHhvCP4veZcFyH9Mr4kShkixNGyQUekV9afYr20aQMj893EZH/O
	UI/Hwm1rGXz2J2ByI7S5OhblPXwu2ZgAiUAM6/sZOOwqmkBmK+/4F7c34BP0ENZ53ZlOJrZ6nSD
	jBGvmShMAT4AqVHQfry0MFjfnn7LruKPlhhLxoD4/jnamJHysVgo1kLPCcamg1vKaS0K7KQHzqD
	cAUE3jk0biBIcdWHlNGlvKXDBz/qGNdVZ5mYw7oz4gr6wqBxhDuknppmHiGVjbfaqBPGvLHiJDr
	ZKYE2NkiHqJe48f6qdDIWwhcYRaw0WZ2vZi/qwQHX5vhhhh51kki2ny/7p+TeoLBIJ0rRps4npx
	ThvTl5pPeakiEL8QOlw5y/EfTsFDT9/0NQIiveLdrDKcOHDEAn2NfId3C7bpwDoikJew=
X-Google-Smtp-Source: AGHT+IHq3jDlrsvJ/ol1RfNeI83klIIU/EwAubIlTAI7K4FGKPInNe5pZk7IDHPVEm86DyphLjKVyw==
X-Received: by 2002:a05:6402:51cd:b0:615:87a6:58a7 with SMTP id 4fb4d7f45d1cf-61587b5a205mr3216376a12.33.1753872311530;
        Wed, 30 Jul 2025 03:45:11 -0700 (PDT)
Received: from tumbleweed (ip-77-25-32-208.web.vodafone.de. [77.25.32.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157974fde0sm1582734a12.7.2025.07.30.03.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:45:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/8] staging: rtl8723bs: merge rtw_os_indicate_connect into rtw_indicate_connect
Date: Wed, 30 Jul 2025 12:44:58 +0200
Message-ID: <20250730104501.150270-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730104501.150270-1-straube.linux@gmail.com>
References: <20250730104501.150270-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the functionality of the function rtw_os_indicate_connect into the
function rtw_indicate_connect to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 13 +++++++++++--
 drivers/staging/rtl8723bs/include/mlme_osdep.h |  1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c  | 17 -----------------
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index bc74c7838a3b..38238ea5ec99 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -901,12 +901,21 @@ void rtw_indicate_connect(struct adapter *padapter)
 
 		set_fwstate(pmlmepriv, _FW_LINKED);
 
-		rtw_os_indicate_connect(padapter);
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
+		    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+			rtw_cfg80211_ibss_indicate_connect(padapter);
+		} else {
+			rtw_cfg80211_indicate_connect(padapter);
+		}
+
+		netif_carrier_on(padapter->pnetdev);
+
+		if (padapter->pid[2] != 0)
+			rtw_signal_process(padapter->pid[2], SIGALRM);
 	}
 
 	rtw_set_to_roam(padapter, 0);
 	rtw_set_scan_deny(padapter, 3000);
-
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index 4bb7a01caf4a..00c0a44c125a 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -9,7 +9,6 @@
 
 
 extern void rtw_os_indicate_disconnect(struct adapter *adapter);
-extern void rtw_os_indicate_connect(struct adapter *adapter);
 extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
 
 void rtw_reset_securitypriv(struct adapter *adapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index f85e17ae0e7f..326acbd8dc84 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -6,23 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-void rtw_os_indicate_connect(struct adapter *adapter)
-{
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
-
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
-		rtw_cfg80211_ibss_indicate_connect(adapter);
-	} else {
-		rtw_cfg80211_indicate_connect(adapter);
-	}
-
-	netif_carrier_on(adapter->pnetdev);
-
-	if (adapter->pid[2] != 0)
-		rtw_signal_process(adapter->pid[2], SIGALRM);
-}
-
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
-- 
2.50.1

