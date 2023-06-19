Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C7411182
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 14:17:51 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-543b17343baso1596786a12.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687184271; x=1689776271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z2lE7a2e73x78sHkw8HLnq0fUJFGsUNME76JPhx8NgU=;
        b=NHpLwEgbAllkTYZVBSWJFhrO127G4EAGk+PObZwauMv29q3xq9Ph+MbO26c4+j2cpA
         MyCtGuYnHvcRP4YpAbZtZn+fBwsIeIStGioI/TNjNeVurN+ead6ZGjqRMnEvB/zEBCGp
         3JllhG70x/GQD23zisSEKQBKLlaA0rkPyK0hKhbjNHWlcpJyB7btvhR2inltVM5YS4+l
         0Xe8q5oCZoMx3PoPKpWeRfcRFLipYEiC3XaSDWaLM/lQGHgl702/BmR0298xXd/T+REJ
         fDgzro9JD229vzbd9XdBIZ32rFH1iB5D3l7UPU/UH/nQWHt6LzeGMmkx3b6bfZ6rNBQf
         AuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687184271; x=1689776271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2lE7a2e73x78sHkw8HLnq0fUJFGsUNME76JPhx8NgU=;
        b=goJ+QomJBbtxCRW3ODvmz9/t89Gu4ZoDGsWmRDAGg2BsruQn6vxzpMf5OeWEfmkhpc
         r2OeBfwHfTmBsBjlerYqMoF7yKYyV4AJ3X64Zy1Egrnmsn0FYouxtZ1X2O+DFleX4U91
         /ZRQYVHEBHBomVxoiEH77ebi1aTfZgv/cnmadSzkj4q7U+hvo1RBa41GFRlxBLEGKwK/
         bc5A2/vTgB8IRmhmrKPyt0fyxC0h0UXAug0P2fgNFbgpIKHMII9ceSCRUSMegRIm9z7d
         Pa9ngTyvALFznl9hvzIU79IFAkwpTnkeb6aJojUddZy5EgEV6k9YHOoLJCEaB3taqxKw
         ohzQ==
X-Gm-Message-State: AC+VfDyBrJYiNqWL9znb/ahEOPgLWchZk/Y5gRQummLKY1jh3Zj06hKH
	38FyvIA2J1aBxNAs1TEVNqo=
X-Google-Smtp-Source: ACHHUZ71lOMJwPR5Z+FKfKg9o2n6I9rc5xObNqZMrTaCL5qHi7HhX5JyYX06DYG6aX7zVZ/htUYlLA==
X-Received: by 2002:a05:6a20:9187:b0:11a:c012:4fdb with SMTP id v7-20020a056a20918700b0011ac0124fdbmr938782pzd.34.1687184270774;
        Mon, 19 Jun 2023 07:17:50 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id x1-20020a056a00270100b005a8173829d5sm12177962pfv.66.2023.06.19.07.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:17:50 -0700 (PDT)
Date: Mon, 19 Jun 2023 19:47:46 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, philipp.g.hortmann@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH v4 1/4] staging: rtl8192e: Rename variable SetWirelessMode
Message-ID: <c0a65d217d272bf457917c89462c49e67bbfedb2.1687183827.git.yogi.kernel@gmail.com>
References: <cover.1687183827.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687183827.git.yogi.kernel@gmail.com>

Rename variable SetWirelessMode to set_wireless_mode to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v4: Rebase to latest staging-testing branch as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.

v3: Revert back to v1 of the patch as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  2 +-
 drivers/staging/rtl8192e/rtllib.h            |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 9cb4ae9ba970..51748166eecc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -716,7 +716,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->check_nic_enough_desc	= _rtl92e_check_nic_enough_desc;
 	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
 	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
-	priv->rtllib->SetWirelessMode		= rtl92e_set_wireless_mode;
+	priv->rtllib->set_wireless_mode		= rtl92e_set_wireless_mode;
 	priv->rtllib->LeisurePSLeave		= rtl92e_leisure_ps_leave;
 	priv->rtllib->SetBWModeHandler		= rtl92e_set_bw_mode;
 	priv->rf_set_chan			= rtl92e_set_channel;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cdd167de127f..581d568476ce 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1690,7 +1690,7 @@ struct rtllib_device {
 				 enum ht_channel_width bandwidth,
 				 enum ht_extchnl_offset Offset);
 	bool (*GetNmodeSupportBySecCfg)(struct net_device *dev);
-	void (*SetWirelessMode)(struct net_device *dev, u8 wireless_mode);
+	void (*set_wireless_mode)(struct net_device *dev, u8 wireless_mode);
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
 	void (*InitialGainHandler)(struct net_device *dev, u8 Operation);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 7494c7e6fff6..0eaff91d92bd 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1470,7 +1470,7 @@ static void rtllib_associate_complete_wq(void *data)
 		netdev_info(ieee->dev, "Using G rates:%d\n", ieee->rate);
 	} else {
 		ieee->rate = 22;
-		ieee->SetWirelessMode(ieee->dev, WIRELESS_MODE_B);
+		ieee->set_wireless_mode(ieee->dev, WIRELESS_MODE_B);
 		netdev_info(ieee->dev, "Using B rates:%d\n", ieee->rate);
 	}
 	if (ieee->ht_info->bCurrentHTSupport && ieee->ht_info->enable_ht) {
@@ -1654,12 +1654,12 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				    (ieee->modulation &
 				     RTLLIB_OFDM_MODULATION)) {
 					ieee->rate = 108;
-					ieee->SetWirelessMode(ieee->dev, WIRELESS_MODE_G);
+					ieee->set_wireless_mode(ieee->dev, WIRELESS_MODE_G);
 					netdev_info(ieee->dev,
 						    "Using G rates\n");
 				} else {
 					ieee->rate = 22;
-					ieee->SetWirelessMode(ieee->dev, WIRELESS_MODE_B);
+					ieee->set_wireless_mode(ieee->dev, WIRELESS_MODE_B);
 					netdev_info(ieee->dev,
 						    "Using B rates\n");
 				}
@@ -2233,11 +2233,11 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 		}
 		/* Dummy wirless mode setting to avoid encryption issue */
 		if (bSupportNmode) {
-			ieee->SetWirelessMode(ieee->dev,
+			ieee->set_wireless_mode(ieee->dev,
 					      ieee->current_network.mode);
 		} else {
 			/*TODO*/
-			ieee->SetWirelessMode(ieee->dev, WIRELESS_MODE_G);
+			ieee->set_wireless_mode(ieee->dev, WIRELESS_MODE_G);
 		}
 
 		if ((ieee->current_network.mode == WIRELESS_MODE_N_24G) &&
@@ -2566,7 +2566,7 @@ static void rtllib_start_ibss_wq(void *data)
 		}
 
 		ieee->current_network.qos_data.supported = 0;
-		ieee->SetWirelessMode(ieee->dev, WIRELESS_MODE_G);
+		ieee->set_wireless_mode(ieee->dev, WIRELESS_MODE_G);
 		ieee->current_network.mode = ieee->mode;
 		ieee->current_network.atim_window = 0;
 		ieee->current_network.capability = WLAN_CAPABILITY_IBSS;
-- 
2.34.1

