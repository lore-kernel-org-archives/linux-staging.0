Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442957487
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:06:42 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id w189so10988134pfw.4
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C3nf306oEfMsyZ7A/6P43aOoOgNlqhI8zKR7LmGgzA=;
        b=YH5a7Qf7bHqiUjamMDYDR4fYo3/lUlFVkLQzAby/DSDXbs61FsJcGUTuYr0CsEeAQl
         nribGEDcxzKJjIrLikwWrkn3XFPKHeTq9WhZMLwGKUl3gTpvEZcvSD6YeX12pKiPOsBN
         Te1Nt9UwnpYWqqPngotKBzn4EJ7KngORvCr6iOGvXuZJ4cJ+7PD2HbdUvCyxn8/uM0V4
         ml9fHAYBG/rsQy3GeMz90vj1FV/Xg6YqLtSdJRqedYKsA1YqqtV6oY270UKORZfjGkiy
         FPpfMtiVTjI/JlF8NfhzI/S0QrHNETwDjh9ybJYOTcz7lWBT1gJlI3DW+LrIZ2rJOy6c
         Fwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C3nf306oEfMsyZ7A/6P43aOoOgNlqhI8zKR7LmGgzA=;
        b=bU4/3cENbWXnc4u9hWzN9a7FNxtCQHZBw0Zhy+Kqv6BQxIummD8BZaVTvbOvGuc8s6
         OepCrPQBLmkV+AABl4vyfRWOJLmYkTziwHEAD0blyiw0aDDn0LC2Kwnl/+VjeJ6vyPXZ
         xyaoG5RMM3Cg9HD9dxofr8nVwIuQRYnajMNBNSQWwOAzHsGUX8K9sMSGhxHqftFJuYhP
         m/diYluxj/uFDxJ+vXhvAcg2YjAfyeqqS+i7s/+6zDdaFqQKdyilubjMqNM1t7t9tdp/
         kfZ1mBTE+n/iL5sdy1JzNT3gB0xmGhhbI2BK3fxBWkv/gqddSXCsjcqRrnH+6nUBkWbf
         iv6Q==
X-Gm-Message-State: ACrzQf0vr+R//zoOz/yv/5onaHvI8Hy9vKYbbo0sTnwbWDF0b9LaI9eX
	QzmprUWQbiPa6x16Sa3klbA=
X-Google-Smtp-Source: AMsMyM7aQOD7s+fLCpENRTkVTAulDiw35iTwSviEl9Z5P1iLESwlJg0vQLxrFvdNJk2Oxz5SyEDd0A==
X-Received: by 2002:aa7:8299:0:b0:562:4c48:a0cb with SMTP id s25-20020aa78299000000b005624c48a0cbmr40291105pfm.66.1666717601709;
        Tue, 25 Oct 2022 10:06:41 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id a1-20020aa794a1000000b0056bcf0dd175sm1592373pfl.215.2022.10.25.10.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 10:06:41 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v3 4/4] staging: r8188eu: make rtw_sta_flush to void
Date: Wed, 26 Oct 2022 02:06:21 +0900
Message-Id: <20221025170621.271903-5-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025170621.271903-1-tegongkang@gmail.com>
References: <20221025170621.271903-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function rtw_sta_flush to void in order to
prevent cocci warning as follows:

  Unneeded variable: "ret". Return "0" on line 1031

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
v2 -> v3: made rtw_sta_flush into void function

 drivers/staging/r8188eu/core/rtw_ap.c    | 7 ++-----
 drivers/staging/r8188eu/include/rtw_ap.h | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 24eb8dce9bfe..e0ca4b6e17cc 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -1017,10 +1017,9 @@ u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
 	return beacon_updated;
 }
 
-int rtw_sta_flush(struct adapter *padapter)
+void rtw_sta_flush(struct adapter *padapter)
 {
 	struct list_head *phead, *plist;
-	int ret = 0;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -1028,7 +1027,7 @@ int rtw_sta_flush(struct adapter *padapter)
 	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
-		return ret;
+		return;
 
 	spin_lock_bh(&pstapriv->asoc_list_lock);
 	phead = &pstapriv->asoc_list;
@@ -1050,8 +1049,6 @@ int rtw_sta_flush(struct adapter *padapter)
 	issue_deauth(padapter, bc_addr, WLAN_REASON_DEAUTH_LEAVING);
 
 	associated_clients_update(padapter, true);
-
-	return ret;
 }
 
 /* called > TSR LEVEL for USB or SDIO Interface*/
diff --git a/drivers/staging/r8188eu/include/rtw_ap.h b/drivers/staging/r8188eu/include/rtw_ap.h
index 8b4134eb3095..89b02c97e041 100644
--- a/drivers/staging/r8188eu/include/rtw_ap.h
+++ b/drivers/staging/r8188eu/include/rtw_ap.h
@@ -26,7 +26,7 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta);
 void sta_info_update(struct adapter *padapter, struct sta_info *psta);
 u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta,
 	       bool active, u16 reason);
-int rtw_sta_flush(struct adapter *padapter);
+void rtw_sta_flush(struct adapter *padapter);
 void start_ap_mode(struct adapter *padapter);
 void stop_ap_mode(struct adapter *padapter);
 void update_bmc_sta(struct adapter *padapter);
-- 
2.34.1

