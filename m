Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5DE29A2
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:41 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id a22so5545920edj.5
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CIjrHGuGx65kEr5OnXk6j8Kk9ipZphKrCoiITYTkDYM=;
        b=Q5SAh+2URpPpHI/LXe1o/nFD70HQH3JZ+f6a9SdnVWsZJpb5feJ1/fIa31wuqLs5sb
         3l2FmUIpSUwLDc7N9bAObfySZkN5tTCuCbzyP73LHhp3wzaKss6LJSryNzMoebNTUV9J
         vwlASK8ti8rHBtlPT6KJNSK6XfWCud7HOFAAu+c/LVh74MRBaJOwfIGVxnvm+Ay4BUtd
         pdG0CTu9wP6z71YLntmteFV1bI944nlgpaGh73isN8qH6E/bHfU52elEzLg2KOd3Ej8c
         2NV31BgmjcN0pdLbAstJTpEBdxzzJsJ7e6087UR3fT/rvGj7YG9clBshTqkIdg9Yy0QJ
         JVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CIjrHGuGx65kEr5OnXk6j8Kk9ipZphKrCoiITYTkDYM=;
        b=xEDS2FuzHbgJsW990xSpDyf8/ln4IqDRifr8MREwWkdF1BX9/DafCF0Z30Dc9izJrX
         WVaK+lpQaL8xF2QbfHb/U/ur7mszuOggVpwHF6BZ/thJDMJHJ5uD4oN8MXE2SlM7ATAP
         ATrpCFuCFdMoN85/bNS+I1iaW4NC1f2XPT5kPSMNQK2W4lXT/hwTwJ1JHD53LDjMyIc5
         /8fp0T1dpYtlTO4VhNH5+mT8NnVpjpZkwK8i3TpJCFNlwlSTskMyg0bc3SIsHtn+QAV3
         7MdneTQy8U9iA2vKJ+3WQy05XAeQnSkrs3EHbkfJZYoqI9N564n6a31ITgxvhJZWidWQ
         36rg==
X-Gm-Message-State: ACgBeo1z9JL+DLAgcjOt7LBeD9w17eLgxUODatpl0Dn+B7ExlsESEShW
	NhFR+clc2lnke58P0TZFTnw=
X-Google-Smtp-Source: AA6agR43A4yZvPS/8b8NGGA+fUNxNmRqIF7zq1pW5+HaDCtEsVsIinA7sIqZm4zs12UIOqsbOSYKiA==
X-Received: by 2002:a05:6402:e94:b0:443:e3fe:7c87 with SMTP id h20-20020a0564020e9400b00443e3fe7c87mr6184960eda.144.1660913679764;
        Fri, 19 Aug 2022 05:54:39 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/11] staging: r8188eu: make init_mlme_ext_timer() static
Date: Fri, 19 Aug 2022 14:54:18 +0200
Message-Id: <20220819125428.8412-2-straube.linux@gmail.com>
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

The function init_mlme_ext_timer() is only used in rtw_mlme_ext.c.
Make it static to get one step closer to removing os_dep/mlme_linux.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 22 +++++++++++++++++++
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  1 -
 drivers/staging/r8188eu/os_dep/mlme_linux.c   | 21 ------------------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 6d3d5ff9a00e..3103e8871dfd 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -334,6 +334,28 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	return chanset_size;
 }
 
+static void _survey_timer_hdl(struct timer_list *t)
+{
+	struct adapter *padapter = from_timer(padapter, t, mlmeextpriv.survey_timer);
+
+	survey_timer_hdl(padapter);
+}
+
+static void _link_timer_hdl(struct timer_list *t)
+{
+	struct adapter *padapter = from_timer(padapter, t, mlmeextpriv.link_timer);
+
+	link_timer_hdl(padapter);
+}
+
+static void init_mlme_ext_timer(struct adapter *padapter)
+{
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+
+	timer_setup(&pmlmeext->survey_timer, _survey_timer_hdl, 0);
+	timer_setup(&pmlmeext->link_timer, _link_timer_hdl, 0);
+}
+
 void init_mlme_ext_priv(struct adapter *padapter)
 {
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 343ce1ce4b3d..a6b1b1b7da74 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -388,7 +388,6 @@ struct mlme_ext_priv {
 void init_mlme_ext_priv(struct adapter *adapter);
 int init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv (struct mlme_ext_priv *pmlmeext);
-extern void init_mlme_ext_timer(struct adapter *padapter);
 extern void init_addba_retry_timer(struct adapter *adapt, struct sta_info *sta);
 extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index 899d8e9c3834..bc4f979280b6 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -130,19 +130,6 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 	}
 }
 
-static void _survey_timer_hdl(struct timer_list *t)
-{
-	struct adapter *padapter = from_timer(padapter, t, mlmeextpriv.survey_timer);
-
-	survey_timer_hdl(padapter);
-}
-
-static void _link_timer_hdl(struct timer_list *t)
-{
-	struct adapter *padapter = from_timer(padapter, t, mlmeextpriv.link_timer);
-	link_timer_hdl(padapter);
-}
-
 static void _addba_timer_hdl(struct timer_list *t)
 {
 	struct sta_info *psta = from_timer(psta, t, addba_retry_timer);
@@ -154,14 +141,6 @@ void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta)
 	timer_setup(&psta->addba_retry_timer, _addba_timer_hdl, 0);
 }
 
-void init_mlme_ext_timer(struct adapter *padapter)
-{
-	struct	mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-
-	timer_setup(&pmlmeext->survey_timer, _survey_timer_hdl, 0);
-	timer_setup(&pmlmeext->link_timer, _link_timer_hdl, 0);
-}
-
 void rtw_indicate_sta_assoc_event(struct adapter *padapter, struct sta_info *psta)
 {
 	union iwreq_data wrqu;
-- 
2.37.1

