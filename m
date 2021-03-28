Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280A70
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 16:35:03 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id z8so13166532ljm.12
        for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8uzzBHYJ9k3IeVj/Ns08/VMJtjfoQnf/27xVqh41LLc=;
        b=cil0Da3ojmtVfUsk0OoVGHxN5jzMuZboX9OCpRXbo0t3XuIY5pskNHlMn1ZrQKxK9H
         zALrpV5aFJ8BPhohtxkfJZLUy4XrzFPboJJMS8it9+n6+hj/nR/FfaGLMT3C8GEa+fkW
         xZ0THzO36qP0DGXOZmujnJ3ujKrOWe3cxB7LFgif8VgGLK/tHJcCnveWS6kp6aa6GsUg
         cXCcqpZ5vA46a0gGuMBO/Q2KjcCQ4tMFJFb/eEBhJE0wrGIuSh6hgyWKcVS5UjF3lena
         anwwTHzS5gZkzDW4/+yO28wHfAcodLTpqpbljG6DyXyBw8DazRUSxgipRkkF06ggZbtB
         jRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8uzzBHYJ9k3IeVj/Ns08/VMJtjfoQnf/27xVqh41LLc=;
        b=GrZ6XubZoLnp/8Xv0AqUNg2yCTofai47labKxJz6ltsy04A+JTYglzJVcTd9XQSakr
         J/7YRlltctKTAPdzEjdzEim0z4bh/QqxOqcq9wE5iKFOt2FaDoRdSLXNHpxdtVIQE0ae
         gYtZgTUzKvUmdRudt8RqRWnlSJf7driF+5UwJu8XoGOY3qbgXEnQ5CPDu61dUnjrQjdz
         t24KknoiriV4anTF13bMfCzS5/NVN1NJ9N8ARmb+afIMyG3da/39d6JKDfYRFjd8ooiR
         gJSHHBxvHakEW1BJjozJDL/LR4MoKnqHju+fNmWYkKC9t1eIH2QgJK/dTp3DUunYWxzl
         DTZg==
X-Gm-Message-State: AOAM531srKnLWjY1Z+FQ/Kj8LBNIDvBd1stkVBWNlDPnG/2hdF3dgwNR
	wiE3s39+F5FXZ19WYUPzV6s=
X-Google-Smtp-Source: ABdhPJxqqasZf26IuTxvQiathELmJ1ErAywac4HLB+Dp1vDEI6b97AJfUNNpnGoWemqquzeWbsSA+g==
X-Received: by 2002:a2e:8117:: with SMTP id d23mr15613726ljg.395.1616949301337;
        Sun, 28 Mar 2021 09:35:01 -0700 (PDT)
Received: from alpha (10.177.smarthome.spb.ru. [109.71.177.10])
        by smtp.gmail.com with ESMTPSA id d8sm1524871lfa.49.2021.03.28.09.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 09:35:00 -0700 (PDT)
Received: (nullmailer pid 53212 invoked by uid 1000);
	Sun, 28 Mar 2021 16:34:06 -0000
From: Ivan Safonov <insafonov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ivan Safonov <insafonov@gmail.com>
Subject: [PATCH 1/2] staging:r8188eu: refactor OnAction(): use switch instead table lookup
Date: Sun, 28 Mar 2021 19:33:23 +0300
Message-Id: <20210328163323.53163-1-insafonov@gmail.com>
X-Mailer: git-send-email 2.26.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The switch is easier to read and refactor.

Signed-off-by: Ivan Safonov <insafonov@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 57 ++++++++++++-------
 .../staging/rtl8188eu/include/rtw_mlme_ext.h  |  6 --
 2 files changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index 50d3c3631be0..4d741737d671 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -3780,26 +3780,10 @@ static unsigned int DoReserved(struct adapter *padapter,
 	return _SUCCESS;
 }
 
-static struct action_handler OnAction_tbl[] = {
-	{RTW_WLAN_CATEGORY_SPECTRUM_MGMT,	 "ACTION_SPECTRUM_MGMT", on_action_spct},
-	{RTW_WLAN_CATEGORY_QOS, "ACTION_QOS", &OnAction_qos},
-	{RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &OnAction_dls},
-	{RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back},
-	{RTW_WLAN_CATEGORY_PUBLIC, "ACTION_PUBLIC", on_action_public},
-	{RTW_WLAN_CATEGORY_RADIO_MEASUREMENT, "ACTION_RADIO_MEASUREMENT", &DoReserved},
-	{RTW_WLAN_CATEGORY_FT, "ACTION_FT",	&DoReserved},
-	{RTW_WLAN_CATEGORY_HT,	"ACTION_HT",	&OnAction_ht},
-	{RTW_WLAN_CATEGORY_SA_QUERY, "ACTION_SA_QUERY", &DoReserved},
-	{RTW_WLAN_CATEGORY_WMM, "ACTION_WMM", &OnAction_wmm},
-	{RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &OnAction_p2p},
-};
-
 static unsigned int OnAction(struct adapter *padapter,
 			     struct recv_frame *precv_frame)
 {
-	int i;
 	unsigned char category;
-	struct action_handler *ptable;
 	unsigned char *frame_body;
 	u8 *pframe = precv_frame->pkt->data;
 
@@ -3807,11 +3791,44 @@ static unsigned int OnAction(struct adapter *padapter,
 
 	category = frame_body[0];
 
-	for (i = 0; i < ARRAY_SIZE(OnAction_tbl); i++) {
-		ptable = &OnAction_tbl[i];
-		if (category == ptable->num)
-			ptable->func(padapter, precv_frame);
+	switch (category) {
+	case RTW_WLAN_CATEGORY_SPECTRUM_MGMT:
+		on_action_spct(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_QOS:
+		OnAction_qos(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_DLS:
+		OnAction_dls(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_BACK:
+		OnAction_back(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_PUBLIC:
+		on_action_public(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_RADIO_MEASUREMENT:
+		DoReserved(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_FT:
+		DoReserved(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_HT:
+		OnAction_ht(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_SA_QUERY:
+		DoReserved(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_WMM:
+		OnAction_wmm(padapter, precv_frame);
+		break;
+	case RTW_WLAN_CATEGORY_P2P:
+		OnAction_p2p(padapter, precv_frame);
+		break;
+	default:
+		break;
 	}
+
 	return _SUCCESS;
 }
 
diff --git a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
index b11a6886a083..aa733abad10c 100644
--- a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
@@ -227,12 +227,6 @@ struct mlme_handler {
 	unsigned int (*func)(struct adapter *adapt, struct recv_frame *frame);
 };
 
-struct action_handler {
-	unsigned int num;
-	const char *str;
-	unsigned int (*func)(struct adapter *adapt, struct recv_frame *frame);
-};
-
 struct ss_res {
 	int state;
 	int bss_cnt;
-- 
2.26.2

