Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C68F2F80
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:57:07 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r11so15511355wro.9
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h7cmhoo6uHHiWyqOEukiZuxiFoAIrYlsbE+X0TBfTdY=;
        b=doKjqXkI/gpnoxGX8nWtdVGFLTDHSF+c4lba5VXfY60uhdGMhS3M2aLN1dVT8Yq2xw
         fH6IPtUBOfgl/hXFZENI5RH2bdjWwQGjDJwRijM6jPBsCOhdJ9esdkiIi5+SqybpRT6D
         EpDEYsbySjZDAU5C7z8/f5aIM+vGCMj8wDqDsHHIuvl7dPL5RoHgHvt4TJGXb4d3szAF
         UrKXap501hP2e4aXHGJJGOsh0wbj3xBrKZxjCxy4FjyjeQv8MYnU+6MlDdwp+0uMakj2
         G+UjONQJ7Axc8tUOrvgLkJ5C61fp9gVc6iLd2oNHErw9jU0k1PlzvSrg8ZAqaSdE41Rw
         idhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h7cmhoo6uHHiWyqOEukiZuxiFoAIrYlsbE+X0TBfTdY=;
        b=pk8zOzzXyhPhXAcvqKODzk7kRAmFyzUin8EB29YB5abQQcgnB/r3ukLN/wubTxhIfX
         rHEgtl0+cpet9ClHfJwDE9c7kzEZB48Da3ExdyhZUdG38OkTNBvoH/CPz3RFjQldJ0SB
         hZLaB4zpQzLUzXPu9wOCS3v2WY9tqh3PGBfr9nZ8LmzPu2ccQlX/55mit0twMEm2jf6d
         4F8Cr0QYVau9N8RNJZhZU0kHLECNk9t3H5OxI1cE7MYmhxDXy8fUrKalemc4yJaTKQ53
         byiAZpXadX22jL2IChJBXdz//K8vxIhmUkNg2kV+PDPmjFc7FZjin14hPSRDe3JlGJd0
         MbZQ==
X-Gm-Message-State: AOAM532lxN4Dhw/0fERqIWNPnr+wujvbNZ5IN42kiq0mM/6lcNkRLMuU
	rZvsTlXC0KygKrpN/6PGjBM=
X-Google-Smtp-Source: ABdhPJxamHsM3u1x1WHlbUePsD58eNV/XXJd7c4inKG36h2O7lY0P6VtaLQnA0dlt1f8tlAhHm5qlw==
X-Received: by 2002:adf:e101:: with SMTP id t1mr19540015wrz.215.1626533826048;
        Sat, 17 Jul 2021 07:57:06 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id g138sm13303380wmg.32.2021.07.17.07.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:57:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] staging: rtl8723bs: fix camel case name in macro IsSupportedTxCCK
Date: Sat, 17 Jul 2021 16:56:50 +0200
Message-Id: <65aec26a3c25f1e756e33bf5f7f5af0cd3b105df.1626533647.git.fabioaiuto83@gmail.com>
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

fix camel case name in macro IsSupportedTxCCK

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        | 2 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index a6fcb5e9d637..da67adde2ebd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -402,7 +402,7 @@ void update_bmc_sta(struct adapter *padapter)
 						      supportRateNum,
 						      pcur_network->Configuration.DSConfig
 		);
-		if (IsSupportedTxCCK(network_type)) {
+		if (is_supported_tx_cck(network_type)) {
 			network_type = WIRELESS_11B;
 		} else if (network_type == WIRELESS_INVALID) { /*  error handling */
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 56c5cb318fdf..08f9ba9bf7ff 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1661,7 +1661,7 @@ void update_wireless_mode(struct adapter *padapter)
 
 void update_sta_basic_rate(struct sta_info *psta, u8 wireless_mode)
 {
-	if (IsSupportedTxCCK(wireless_mode)) {
+	if (is_supported_tx_cck(wireless_mode)) {
 		/*  Only B, B/G, and B/G/N AP could use CCK rate */
 		memcpy(psta->bssrateset, rtw_basic_rate_cck, 4);
 		psta->bssratelen = 4;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9fa79146c39a..07cff4c490a0 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -158,7 +158,7 @@ enum network_type {
 
 #define is_supported_24g(net_type) ((net_type) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
-#define IsSupportedTxCCK(NetType) (((NetType) & (WIRELESS_11B)) ? true : false)
+#define is_supported_tx_cck(NetType) (((NetType) & (WIRELESS_11B)) ? true : false)
 #define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)) ? true : false)
 
 struct ieee_param {
-- 
2.20.1

