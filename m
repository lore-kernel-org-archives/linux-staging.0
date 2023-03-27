Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDC779CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 21:02:41 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id i5so41773015eda.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679950959; x=1682542959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1phiZ58+EMRbY3VbMSGewPlLSXTWA1xaHhQHOvOJHU8=;
        b=Tds7GZe6GMy19tM8wGQWXvcQU08egoXRGcLainzn2B1odQmaXTVRox4nABk41g0bNm
         VdVbwpMuCEgFBK85siNeFVTUBZgYHhytlLlqIlwXZ4h6TTuhvkgLIxOsHqu8rlGvPWs8
         G/obEJpLtdyoIrELMbTNIaet6VPorsKgICoM6qi8UK2R9vc5VUy2Utluq4UcP9tC7UB5
         wvB14uYwhdX+37dmyzxrozSxM8DWW87awJ3UauwliFvelv+uFcUzEdS30LX7v4JYQfPo
         MD4cBAUu0FlosQxpLomKXBBX++hIM9GSiVwz9IiINbnHVzoknqMZJJH5w0QBJm2LAnT9
         HTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679950959; x=1682542959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1phiZ58+EMRbY3VbMSGewPlLSXTWA1xaHhQHOvOJHU8=;
        b=4i3Ynf/xOhp/Jio0yPbsQzNowA1Pxbds6EoqdkmSSipfhNxqjc9IeLtFB7AUEK47Lo
         m3NsMY47dyGW7I4ScyKamQYE1Jv9NquCuhbkhy2leNg/SYye+XWFnc1EIOzBtU3pcMYX
         Xrb7AvzKcUoO25k8MlBgA4cmdCuvNSM4zMvgShtJq9lH9MVhj5PwqBQKBlhhjk12sVFj
         yPH6RkTw4Ys0Ofpdnx1KpZIV2n2AIuB8zmrXJ88soaDzlCH3OlzJoC606m9Vta/swBIK
         e64l9wQviQUZOZy5G3/cCLOVYKWZcCEV26qzOsMjzYj84b4Qg4tw2VKwXw3mQV0KmKmo
         2P6Q==
X-Gm-Message-State: AAQBX9dxPfCTlwIEvYny7FyxHqd6vwUPvoq5GI5DDRb3Cq2GejAkbfwo
	kKIcnA3hQOo//wRxya8SQDj/kqDGtKU=
X-Google-Smtp-Source: AKy350bnSsb0asvSic5sjbqzwB61xRFAnihr/5UPCw95zz2nv4BcziVhugLL43EPp1qMRLbf6OozBQ==
X-Received: by 2002:a17:906:2219:b0:931:4285:ea16 with SMTP id s25-20020a170906221900b009314285ea16mr10643243ejs.7.1679950959216;
        Mon, 27 Mar 2023 14:02:39 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090607d100b0093a768b3dddsm9018768ejc.216.2023.03.27.14.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:02:31 -0700 (PDT)
Date: Mon, 27 Mar 2023 23:02:19 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] staging: rtl8192e: Remove rtl92e_config_phy
Message-ID: <5c433417b4e8e96a70c23a03bec30d26e45791d0.1679949171.git.philipp.g.hortmann@gmail.com>
References: <cover.1679949171.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679949171.git.philipp.g.hortmann@gmail.com>

Remove rtl92e_config_phy to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 9 ---------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 1eb063fe660a..f4fdaeff2917 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -691,7 +691,7 @@ bool rtl92e_start_adapter(struct net_device *dev)
 	}
 
 	if (priv->rst_progress == RESET_TYPE_NORESET) {
-		rtStatus = rtl92e_config_phy(dev);
+		rtStatus = rtl92e_config_rf(dev);
 		if (!rtStatus) {
 			netdev_info(dev, "RF Config failed\n");
 			return rtStatus;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index bd302f5cb356..139d8268c8dc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -468,15 +468,6 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 	rtl92e_set_ofdm_tx_power(dev, powerlevelOFDM24G);
 }
 
-bool rtl92e_config_phy(struct net_device *dev)
-{
-	bool rtStatus = true;
-
-	rtStatus = rtl92e_config_rf(dev);
-
-	return rtStatus;
-}
-
 u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 {
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 498da6be3e4e..6c4c33ded6a9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -39,7 +39,6 @@ bool rtl92e_check_bb_and_rf(struct net_device *dev,
 bool rtl92e_config_bb(struct net_device *dev);
 void rtl92e_get_tx_power(struct net_device *dev);
 void rtl92e_set_tx_power(struct net_device *dev, u8 channel);
-bool rtl92e_config_phy(struct net_device *dev);
 u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath);
 
 u8 rtl92e_set_channel(struct net_device *dev, u8 channel);
-- 
2.39.2

