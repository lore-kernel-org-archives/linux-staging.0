Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58472
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:57:03 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso7611494wmj.4
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0zn5WjZjwzNr5arL/+ZIp0qYLVTWTo+XAzdShzhK7/Q=;
        b=WkVkvZ4nRhAanPCqnNgszlWRHIocaHadvhZYDlpG6VH1tj+EgfvSn00zMo4XXmMcFT
         4y4V69xYYEw9JiQgbrvjMHQ3mbcCYU92jFwtFqO/RcNsddpJfZp3poi+fWT5GfMkGoFB
         +x6TvmV2JTGsIJjPZwHqvvZeqJ57yKK3uAcKds/l9+GpoxaKUhyMzdKa42dEk61UjRoT
         Kr9rfZ0YnzskuzXXp+JuYDYQyLZLSR819WbalkjHxSt9gwNQyNdOv+jjn2p5x1qtKHlm
         K+4MBDEJuTSZvhXpD/wL78extpkP7OWizdQ2KijDowfEjQwEfcQ/yabsMquxME1cluOB
         W1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0zn5WjZjwzNr5arL/+ZIp0qYLVTWTo+XAzdShzhK7/Q=;
        b=jHsFx2R/Y9+dhdKOEAzHWWNDp8Kdhb6t+7t5X2XhFGBcuS0b3QZv088jA50AnNfhjZ
         +tmopO1XcfrUGNlkL3rrypKbYOZ/c9fH7ejar0i1+5cNyisxY1D1oS3LUhmXonATYBjx
         ELEWcnlW7SN6FfeuBEC6glWZh2sjNHCmnpeBgh5TZ9rD3QAZk//r959iiOpswU2ePZxu
         PZu5BcrmWYuGFs+sBIdhWL5IqALvDVEFBfyb0ZvrqzGTgC1amed7Rp7zXly4YpwIEdwq
         Gg4E4ggcMsb+bsE+HDk8whn4ujwxuGqRkzwFrtfDhDaY/uB+8W/190wxkLHxwfOhuQhH
         PcNg==
X-Gm-Message-State: AOAM5310re1QkSU2KQJJXaHQscGFrbL/miK7sg5rPtpU4ZhIdwHqPqJX
	MfbMBm9nFCxwsgV0Md+rCjw=
X-Google-Smtp-Source: ABdhPJxNh9iHPMjZxkRbnOE6yyUIXLgs9SVuUf9OqqT7/0/2SF/ywY7t95l2zArpHVaN8B7lDICIPA==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr22814393wmk.102.1626533821964;
        Sat, 17 Jul 2021 07:57:01 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id m15sm11430161wmc.20.2021.07.17.07.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:57:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/10] staging: rtl8723bs: fix camel case name in macro IsSupported24G
Date: Sat, 17 Jul 2021 16:56:47 +0200
Message-Id: <fd5e1873f72e7d5f72b6f4bf801ede882e9df4e2.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626533647.git.fabioaiuto83@gmail.com>
References: <cover.1626533647.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix camel case name in macro IsSupported24G

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c128d462c6c7..af7d133bce94 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -343,7 +343,7 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	if (ChannelPlan >= RT_CHANNEL_DOMAIN_MAX && ChannelPlan != RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
 		return chanset_size;
 
-	if (IsSupported24G(padapter->registrypriv.wireless_mode)) {
+	if (is_supported_24g(padapter->registrypriv.wireless_mode)) {
 		b2_4GBand = true;
 		if (RT_CHANNEL_DOMAIN_REALTEK_DEFINE == ChannelPlan)
 			Index2G = RTW_CHANNEL_PLAN_MAP_REALTEK_DEFINE.Index2G;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index eebd48438733..d18537fde4ed 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -149,7 +149,7 @@ bool HAL_IsLegalChannel(struct adapter *Adapter, u32 Channel)
 	bool bLegalChannel = true;
 
 	if ((Channel <= 14) && (Channel >= 1)) {
-		if (IsSupported24G(Adapter->registrypriv.wireless_mode) == false)
+		if (is_supported_24g(Adapter->registrypriv.wireless_mode) == false)
 			bLegalChannel = false;
 	} else {
 		bLegalChannel = false;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 343d077d9c76..2fa6ced333a0 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -156,9 +156,9 @@ enum network_type {
 
 #define is_legacy_only(net_type)  ((net_type) == ((net_type) & (WIRELESS_11BG)))
 
-#define IsSupported24G(NetType) ((NetType) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
+#define is_supported_24g(NetType) ((NetType) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
-#define IsEnableHWCCK(NetType) IsSupported24G(NetType)
+#define IsEnableHWCCK(NetType) is_supported_24g(NetType)
 #define IsEnableHWOFDM(NetType) (((NetType) & (WIRELESS_11G|WIRELESS_11_24N)) ? true : false)
 
 #define IsSupportedRxCCK(NetType) IsEnableHWCCK(NetType)
-- 
2.20.1

