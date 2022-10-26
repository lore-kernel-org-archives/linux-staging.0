Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B8CA28;
	Wed, 26 Oct 2022 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666780585; bh=Nu1SWNtGRTsJcwbwP/PERGl+2UsXTpRN4McY4HN8/lU=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=hzqCngcJ3D74gZj2HTKcDVabu5ff2OFAjuk8kImoZz+jEtFE+iwW1IBX3K423H1Bx
	 cweHeqCgkWRRqyj4jAdN04YoI2ECGCtYm/0mCjWlnZe8g4pCHpJS2dU6UypT96UwVZ
	 7lzzs2Qn5/qLLLrDACdUuZglS3sOqS1ByrhaqdTE=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Wed, 26 Oct 2022 12:36:25 +0200 (CEST)
X-EA-Auth: y/mb8iDgGK/LUCLB3d9Yyf+f8YvHkDUOK07o/RseykjYFs9uRR5y5S+zFb7fRulsBZmvsdLjVduxZR90zqY1ubUqOpWVaCBA
Date: Wed, 26 Oct 2022 08:57:48 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8192u: remove unnecessary function
 implementation
Message-ID: <a15fe9f6167e76e4422d303ceafbd4d9b432dd13.1666754500.git.drv@mailo.com>
References: <cover.1666754500.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666754500.git.drv@mailo.com>

Current implementation of function ieee80211_tkip_null simply returns
back to the caller without any useful instruction executions. This makes
the function call and its implementation unnecessary and should be
removed.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211.h            | 3 ---
 drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c | 6 ------
 drivers/staging/rtl8192u/ieee80211/ieee80211_module.c     | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index 9cd4b1896745..00c07455cbb3 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -232,8 +232,6 @@ struct cb_desc {

 #define ieee80211_ccmp_null		ieee80211_ccmp_null_rsl

-#define ieee80211_tkip_null		ieee80211_tkip_null_rsl
-
 #define free_ieee80211			free_ieee80211_rsl
 #define alloc_ieee80211			alloc_ieee80211_rsl

@@ -2256,7 +2254,6 @@ void ieee80211_ps_tx_ack(struct ieee80211_device *ieee, short success);
 void softmac_mgmt_xmit(struct sk_buff *skb, struct ieee80211_device *ieee);

 /* ieee80211_crypt_ccmp&tkip&wep.c */
-void ieee80211_tkip_null(void);

 int ieee80211_crypto_init(void);
 void ieee80211_crypto_deinit(void);
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
index 7b120b8cb982..9bfd24ad46b6 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
@@ -716,9 +716,3 @@ void ieee80211_crypto_tkip_exit(void)
 {
 	ieee80211_unregister_crypto_ops(&ieee80211_crypt_tkip);
 }
-
-void ieee80211_tkip_null(void)
-{
-//    printk("============>%s()\n", __func__);
-	return;
-}
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
index b94fe9b449b6..3f93939bc4ee 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
@@ -159,9 +159,6 @@ struct net_device *alloc_ieee80211(int sizeof_priv)
 		ieee->last_packet_time[i] = 0;
 	}

-/* These function were added to load crypte module autoly */
-	ieee80211_tkip_null();
-
 	return dev;

  failed:
--
2.30.2



