Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA72F42
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:47 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id u6so483936eda.12
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=2SSQQj013RZlWs9wGfRUXVrA/uDJ2ngKJB6u8ISOGaE=;
        b=JJ4mn9dpVZCHQgmmlBB7iE/PtFScritoSfe3Tk+m16DWWi5JCKdk2G8ULV6HYJVZ1i
         HDW1TCFfd65Ul3lNPcBxQ2Bmi3Kqib+p2YmVEtizr6rBuRAXCFfwxvKCL6tsDruGcOvT
         J8TfqT8HRdJUZOox0rUHHeTqQ219DaRr7tzMIS0NXGPZb1751i3rGpKRvXecGG22aLDX
         D5p0RNsZkhWETnEvnJP94RMdwwBD9MvELidiC/tiQlUv/ZUPlBM4jrhwma5L75HjtFOB
         1tuIdZlJL1khgAlK1p3JHF6yscaW4Myb4AA73V2N9x7dvNO6sM8cGhGjbeQwrdO6vsU6
         n52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=2SSQQj013RZlWs9wGfRUXVrA/uDJ2ngKJB6u8ISOGaE=;
        b=32t4WMlrFenLYt9VDoNHHNmu29EUJW66TQd8dLDy6obpI8epwF44YyHGRFnS+rXnAf
         pobhgTbWlHLY4uF8CqU0gS6mnlG067w5JbcHRSIoe2KuzP+K41t5rp1T+bpLFjqJa4Br
         JgfCoKSi/8n+8KcQPg0h/7dmQvZwxqNbD9RkKpYGtDvlBNaG5+Bmj8flj3p6P6QbzHk9
         optlJu08ZbInmQY/tSY1GtXGRCQ7EGATtXE4jmc4NRSafRK0aACo3k6QhkiRJBGb2pZe
         tuKk/9/e/mhjXwF1pdKmpDL1sKPS4a1hBfjvmXUOB4C2yyHjFC6QZb5su8pOe0tAU9fH
         Ym+Q==
X-Gm-Message-State: ACgBeo0SeVFQYH0xdgn8hXQ2sLUr7pP7EL5vE2ayAUsjn9/KSrO7zrF6
	ushaxSLSYsmG/v8A5qsrS0c=
X-Google-Smtp-Source: AA6agR640Zqbr9KTJsVpoK9esFUqHVA5whNVRnpPA92sbodIBfc8lyacbTEKhtzBe9tJzACmNVZgqA==
X-Received: by 2002:a05:6402:353:b0:446:2d2c:3854 with SMTP id r19-20020a056402035300b004462d2c3854mr3527186edw.193.1660913685528;
        Fri, 19 Aug 2022 05:54:45 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/11] staging: r8188eu: remove unused function parameter
Date: Fri, 19 Aug 2022 14:54:28 +0200
Message-Id: <20220819125428.8412-12-straube.linux@gmail.com>
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

The parameter 'aborted' of rtw_indicate_scan_done() is not used.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 4 ++--
 drivers/staging/r8188eu/include/rtw_mlme.h | 2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 594bfaf27291..e3cf3e8962fb 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -892,7 +892,7 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 
 }
 
-inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
+inline void rtw_indicate_scan_done(struct adapter *padapter)
 {
 	indicate_wx_scan_complete_event(padapter);
 }
@@ -1365,7 +1365,7 @@ void rtw_scan_timeout_handler (struct adapter *adapter)
 	spin_lock_bh(&pmlmepriv->lock);
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 	spin_unlock_bh(&pmlmepriv->lock);
-	rtw_indicate_scan_done(adapter, true);
+	rtw_indicate_scan_done(adapter);
 }
 
 static void rtw_auto_scan_handler(struct adapter *padapter)
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index d81668498e46..e8168e36fac2 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -537,7 +537,7 @@ struct wlan_network *rtw_get_oldest_wlan_network(struct __queue *scanned_queue);
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue);
 void rtw_indicate_disconnect(struct adapter *adapter);
 void rtw_indicate_connect(struct adapter *adapter);
-void rtw_indicate_scan_done( struct adapter *padapter, bool aborted);
+void rtw_indicate_scan_done(struct adapter *padapter);
 
 int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
 			uint in_len);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index a52d1553acdd..0c752cf0c6c5 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -231,7 +231,7 @@ static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
 	mutex_unlock(&pwrpriv->lock);
 
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
-		rtw_indicate_scan_done(padapter, 1);
+		rtw_indicate_scan_done(padapter);
 
 	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		rtw_indicate_disconnect(padapter);
-- 
2.37.1

