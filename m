Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAFA1E523
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:54:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-406532c49dcso118655e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269239; x=1696874039; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=76iRx49ZBjTzS3/ihrdEmUB6JBE+9sFOl4sgt+UhoLQ=;
        b=Hr/yoD/4kMASO3AM9DfI5inIvKf3ZhohhTdBEhUeQFyhislSUhM3yq5TEqY34fQNyI
         8b7N3WMYycswwLVw3cNodRFrNDmHCM19ThlPT9u5Fr1Qz9y2oVPJnzreWGP9qFeJPVWs
         tqZn+KYncvO2V0Ikxd+NEwREobZVxYUJ+AwPaXyzV3+bnjiejABUOpby7DnSfdVxhzzZ
         nhus6RVtT7lN2U8AZK0bcZeshiaPvdhcOZpKwLxNTWv8E00mzC24dGa0bvPsDotbAsy5
         9vTjBmIwThB0gU1+TCgp0uweW2goy6xNeyQWtF/b366qNdODck6xOR2sHqP1gV2edKCI
         fLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269239; x=1696874039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76iRx49ZBjTzS3/ihrdEmUB6JBE+9sFOl4sgt+UhoLQ=;
        b=lrbxesZwcaqoSTSX4OW6Ge3tZ4+gRXRdQFDFZrtVFfhc4S9xU/+jT4PljVeFPphmpm
         BKduZjkofB2ZTKFoD4ELZCkkN0IEs9PQQnz4fARsW2KMTO72G73ZIK8DSj0dzGVlX+HS
         StaTbDzHwO9VPdLiPissjACUnnTjPO63fHkdR5KmS8J4d8cgMBgno5vVbHwuVUvzEk9a
         u70aPbVqrWqLR9KTMVHu6/WVP/VPmLHqb/Ehqc/2F6T+G9TLO/r8uejBK1kCuhebP5/A
         wSlTI8VKlV0zEu6yfDVkGgHhDxHWkaXi2ZGp8tDx+2jxxOtFgMMcm6/bClfi45e+oSzV
         Nv8Q==
X-Gm-Message-State: AOJu0YyXutEB8vv/jpMy1vnIaTXpTqq9iUdClIVIW98nFNcj1+V3wBRO
	SAIDqFODlH2dHDl4oQFRfpE9WbS9RVY=
X-Google-Smtp-Source: AGHT+IEqGg5Mv/6tMKOZxA4ggAtVSs5nKOTnduDKRqzJPyS9+sVH5HpcAbGEOT/LL84pTdI3LN+dYA==
X-Received: by 2002:adf:f04b:0:b0:317:630d:1e8e with SMTP id t11-20020adff04b000000b00317630d1e8emr10079014wro.2.1696269238704;
        Mon, 02 Oct 2023 10:53:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm17455916ejd.87.2023.10.02.10.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:58 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] staging: rtl8192e: Remove constant parameter from
 rtllib_stop_protocol()
Message-ID: <7eebcd3a8637b686331e34532136df3e7760f869.1696266965.git.philipp.g.hortmann@gmail.com>
References: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696266964.git.philipp.g.hortmann@gmail.com>

Remove constant parameter shutdown of function rtllib_stop_protocol().
shutdown is always true. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h            |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 19 ++++++++-----------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  6 +++---
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 65f29afa81be..ff1728d1824d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1698,7 +1698,7 @@ void rtllib_start_scan_syncro(struct rtllib_device *ieee);
 void rtllib_sta_ps_send_null_frame(struct rtllib_device *ieee, short pwr);
 void rtllib_sta_ps_send_pspoll_frame(struct rtllib_device *ieee);
 void rtllib_start_protocol(struct rtllib_device *ieee);
-void rtllib_stop_protocol(struct rtllib_device *ieee, u8 shutdown);
+void rtllib_stop_protocol(struct rtllib_device *ieee);
 
 void rtllib_EnableNetMonitorMode(struct net_device *dev, bool bInitState);
 void rtllib_DisableNetMonitorMode(struct net_device *dev, bool bInitState);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 1a086f0ff10d..79a62bd9a297 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2283,21 +2283,19 @@ void rtllib_softmac_stop_protocol(struct rtllib_device *ieee)
 {
 	rtllib_stop_scan_syncro(ieee);
 	mutex_lock(&ieee->wx_mutex);
-	rtllib_stop_protocol(ieee, true);
+	rtllib_stop_protocol(ieee);
 	mutex_unlock(&ieee->wx_mutex);
 }
 EXPORT_SYMBOL(rtllib_softmac_stop_protocol);
 
-void rtllib_stop_protocol(struct rtllib_device *ieee, u8 shutdown)
+void rtllib_stop_protocol(struct rtllib_device *ieee)
 {
 	if (!ieee->proto_started)
 		return;
 
-	if (shutdown) {
-		ieee->proto_started = 0;
-		ieee->proto_stoppping = 1;
-		ieee->rtllib_ips_leave(ieee->dev);
-	}
+	ieee->proto_started = 0;
+	ieee->proto_stoppping = 1;
+	ieee->rtllib_ips_leave(ieee->dev);
 
 	del_timer_sync(&ieee->associate_timer);
 	mutex_unlock(&ieee->wx_mutex);
@@ -2315,10 +2313,9 @@ void rtllib_stop_protocol(struct rtllib_device *ieee, u8 shutdown)
 		rtllib_disassociate(ieee);
 	}
 
-	if (shutdown) {
-		RemoveAllTS(ieee);
-		ieee->proto_stoppping = 0;
-	}
+	RemoveAllTS(ieee);
+	ieee->proto_stoppping = 0;
+
 	kfree(ieee->assocreq_ies);
 	ieee->assocreq_ies = NULL;
 	ieee->assocreq_ies_len = 0;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 3c7c0f07ab0b..e9da566646c5 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -134,7 +134,7 @@ int rtllib_wx_set_wap(struct rtllib_device *ieee,
 	}
 
 	if (ifup)
-		rtllib_stop_protocol(ieee, true);
+		rtllib_stop_protocol(ieee);
 
 	/* just to avoid to give inconsistent infos in the
 	 * get wx method. not really needed otherwise
@@ -277,7 +277,7 @@ int rtllib_wx_set_mode(struct rtllib_device *ieee, struct iw_request_info *a,
 	if (!ieee->proto_started) {
 		ieee->iw_mode = wrqu->mode;
 	} else {
-		rtllib_stop_protocol(ieee, true);
+		rtllib_stop_protocol(ieee);
 		ieee->iw_mode = wrqu->mode;
 		rtllib_start_protocol(ieee);
 	}
@@ -401,7 +401,7 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
 	}
 
 	if (proto_started)
-		rtllib_stop_protocol(ieee, true);
+		rtllib_stop_protocol(ieee);
 
 	/* this is just to be sure that the GET wx callback
 	 * has consistent infos. not needed otherwise
-- 
2.42.0

