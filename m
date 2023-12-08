Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C141C87
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcgW79We"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a1cc518c5bbso65181266b.1
        for <linux-staging@lists.linux.dev>; Fri, 08 Dec 2023 10:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702059593; x=1702664393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+GiMKSFFjg4ZMw0A4N/m/YEPbPCxTc/5rQWQIRaPIU=;
        b=EcgW79WeQsISFsT8HTWePx/79AgD1sAKS9hvhn87OhbxIlsc7fkOjStbFqHegyWZaG
         dCMg3FpFdPFib4hJngEUUcEdkNp16LObXsaOoH5SWgZviHeL3SXUvt/3+yQS+BX+v0uy
         tviGF3LR42HoVNXp8FIMMdeFMJfaQgMolziWAAdNMq+0+jw+b1ZrhqN5v3WxWZiISu4j
         5YIl9P/WYj7Fo+jwyErnv7iZaIQ1EvVn+2TyB+qmGzKdEKPxia2Rs/6ea2M8ZrqmrXMa
         oD1hxsENzw6SC2kBiRBzsfe3awHf1tIEanQ8PxoV/V/btPp74JylWaa2Mw9MVpLWvcyK
         7z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702059593; x=1702664393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+GiMKSFFjg4ZMw0A4N/m/YEPbPCxTc/5rQWQIRaPIU=;
        b=vMGBtERL3laNJw678OB3yLo36lCCK+1MgYYbsP5bmFV+GQ2BcWrQnu8xYacMy1fca4
         E5JFbvoLlZSuwISGrngx2tUOMkWMO0TiPAwQk58IeehY5UQAuENkhDvHVaoovzfQTa0C
         CujO2TwUX06dBTVTqK/v9v7R4qrWwo3BLGFQYUJcM5ofcfLgwewBIN+vhmFg2jhP6qWj
         EPYWucIlKCLpX+GXCdB+ghOvIO/UgtCTWw/J3jIO4cf0MHHIN/wKG22WROg2MX+CMVPO
         VSSYxPzRsIEsHkpBaDkSEZfTDy3iLcr6nSXA/AiSAq3rgJlmcgwDexccTRZZ05OpfVBk
         nlaA==
X-Gm-Message-State: AOJu0YwMgh8o87yCYXVC6WjLrrO094TeSis2YLkcV9hoXEkmMShBgbqs
	9Nw+Xcf+CtBd8nHBw7kCUQA=
X-Google-Smtp-Source: AGHT+IFTU2n3tnX5CI1gosGvDYb9GngljuO8owN+2TVNQx5bFnanpeCoc7wlrYMkoaUv8Wy3BHYzZQ==
X-Received: by 2002:a17:907:d384:b0:a1b:1daf:8270 with SMTP id vh4-20020a170907d38400b00a1b1daf8270mr485532ejc.5.1702059593003;
        Fri, 08 Dec 2023 10:19:53 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id tf13-20020a1709078d8d00b00a1b8829597fsm1260423ejc.114.2023.12.08.10.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:19:52 -0800 (PST)
Date: Fri, 8 Dec 2023 19:19:51 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] staging: rtl8192e: Remove variable dot11d_info
Message-ID: <2438971feb0c02c5c72776f57201a4011f249190.1701989555.git.philipp.g.hortmann@gmail.com>
References: <cover.1701989555.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701989555.git.philipp.g.hortmann@gmail.com>

Remove variable dot11d_info as it is unused. Remove unused struct
channel_list and empty struct rt_dot11d_info.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c         | 5 -----
 drivers/staging/rtl8192e/dot11d.h         | 6 ------
 drivers/staging/rtl8192e/rtllib.h         | 1 -
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 ------
 4 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index c44ff26e8d61..8d89f962b3bf 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -7,11 +7,6 @@
  ******************************************************************************/
 #include "dot11d.h"
 
-struct channel_list {
-	u8      channel[32];
-	u8      len;
-};
-
 void dot11d_channel_map(struct rtllib_device *ieee)
 {
 
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index d047283f2ceb..98aa28d0cf72 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -18,12 +18,6 @@
  *		2 - valid (passive scan)
  */
 
-struct rt_dot11d_info {
-};
-
-#define GET_DOT11D_INFO(__ieee_dev)			\
-	 ((struct rt_dot11d_info *)((__ieee_dev)->dot11d_info))
-
 void dot11d_channel_map(struct rtllib_device *ieee);
 
 #endif
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ec720f776639..51dcea57a329 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1320,7 +1320,6 @@ struct rtllib_device {
 	u16 scan_watch_dog;
 
 	/* map of allowed channels. 0 is dummy */
-	void *dot11d_info;
 	u8 active_channel_map[MAX_CHANNEL_NUMBER+1];
 
 	int rate;       /* current rate */
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index fdb0e76d20b0..3c92eb401e8c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2077,9 +2077,6 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 	ieee->link_state = MAC80211_NOLINK;
 	for (i = 0; i < 5; i++)
 		ieee->seq_ctrl[i] = 0;
-	ieee->dot11d_info = kzalloc(sizeof(struct rt_dot11d_info), GFP_ATOMIC);
-	if (!ieee->dot11d_info)
-		return -ENOMEM;
 
 	ieee->link_detect_info.SlotIndex = 0;
 	ieee->link_detect_info.SlotNum = 2;
@@ -2153,9 +2150,6 @@ void rtllib_softmac_free(struct rtllib_device *ieee)
 	cancel_work_sync(&ieee->ips_leave_wq);
 	cancel_work_sync(&ieee->wx_sync_scan_wq);
 	cancel_work_sync(&ieee->ps_task);
-
-	kfree(ieee->dot11d_info);
-	ieee->dot11d_info = NULL;
 }
 
 static inline struct sk_buff *
-- 
2.43.0

