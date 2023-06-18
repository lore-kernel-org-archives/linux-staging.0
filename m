Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F42184C
	for <linux-staging@lists.linux.dev>; Sun, 18 Jun 2023 13:06:32 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b4f9583404so20058825ad.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Jun 2023 06:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687093592; x=1689685592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrnRiINtmKsRPpdoYY28cns2m1Iqy+OAFvN9buTT+SU=;
        b=lZexxq7P3XtuZPtJJ5JNGgBbfUyPOyFIcg0Cf1k4PZUWTiouPub2JaLA0sUnZcqg7y
         sy5cTPc8wRDhABm2qeP7wQoyi0q2O/BZ00wmncwqtaP9WQssMnaKjq2B7BNnAz65FZlh
         RIKRJwVBJJF37fYkkIYX99CbN0gm0IFO+oHkUOjKLprNovaxDt6jlgDinvY+2IXrHbnB
         JyuAmnC1ULxFXQ1qWSvx6rpRoeM41/DR8Q6fnD8Nhty+eBdBVXAgJy163iv1sdu+MNQe
         xzh9ruZlmDgiDQzy8g4Chp4nDMXrKUP83aje03f68VOk3J8wzM/aPqwowMPLmk9ArNt6
         h28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687093592; x=1689685592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrnRiINtmKsRPpdoYY28cns2m1Iqy+OAFvN9buTT+SU=;
        b=T1ewinYDhX4sXsegcu/nkPZ7543LVf+jH8ENIvT69RJJx0XD69wFHJ2U9s/krgXYB2
         RWkjzvd68/6TFpb1wkjfpbNFi2emblSCd0HucPchJNl7Ls9AfPqOMHpw4+hTQzXBc6/4
         KODoMaM1tHPFTCdf/6IzcE2feG+7DSKLFKpujqZmY57VOLcbPZ9f1o64AVQQhcGRR4r9
         W1yyyTgCnMLRAp3lRF+eQm4EQlUCNu5OOMDmhIB2ACXdj3eBg2d6kZREEjzcgdtyFNwB
         iqvQVRzBtrUQOlVGGSQIqLSPIFOk4qbnVXZExQOMYA8GPGZ4u1XlQOfFVc094H1CrQic
         6NxA==
X-Gm-Message-State: AC+VfDwNwh71Eg+Ryi3iABIcf0CweYIV4ZRdnKqZiDToZfH6p6SbEuqP
	gSsw494oC/UDjsCzM75GqZo=
X-Google-Smtp-Source: ACHHUZ7u0MlTI1QnE1/QfcX+1B04t7ijeC3d4SMCyrPu+0RQ8QpwZMt4KJuaa1PbrX26Fyi54isqOw==
X-Received: by 2002:a17:902:ee41:b0:1b3:de1d:1ce1 with SMTP id 1-20020a170902ee4100b001b3de1d1ce1mr6859808plo.61.1687093592061;
        Sun, 18 Jun 2023 06:06:32 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b001b23eb0b4bbsm18670943plg.147.2023.06.18.06.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 06:06:31 -0700 (PDT)
Date: Sun, 18 Jun 2023 18:36:26 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, philipp.g.hortmann@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH v3 3/4] staging: rtl8192e: Rename variable LeisurePSLeave
Message-ID: <b45c35593a3b080814cc3fc882907dfc1d367d76.1687092111.git.yogi.kernel@gmail.com>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687092111.git.yogi.kernel@gmail.com>

Rename variable LeisurePSLeave to leisure_ps_leave to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v3: Revert back to v1 of the patch as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 68e921a3a0a8..b82d2b7aa26c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -717,7 +717,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
 	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
 	priv->rtllib->set_wireless_mode		= rtl92e_set_wireless_mode;
-	priv->rtllib->LeisurePSLeave		= rtl92e_leisure_ps_leave;
+	priv->rtllib->leisure_ps_leave		= rtl92e_leisure_ps_leave;
 	priv->rtllib->set_bw_mode_handler	= rtl92e_set_bw_mode;
 	priv->rf_set_chan			= rtl92e_set_channel;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index e79510258447..0ee9b99b4c5e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1721,7 +1721,7 @@ struct rtllib_device {
 
 	void (*rtllib_ips_leave_wq)(struct net_device *dev);
 	void (*rtllib_ips_leave)(struct net_device *dev);
-	void (*LeisurePSLeave)(struct net_device *dev);
+	void (*leisure_ps_leave)(struct net_device *dev);
 
 	/* This must be the last item so that it points to the data
 	 * allocated beyond this structure by alloc_rtllib
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 46c77ed335ab..c00f72316a3d 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1200,7 +1200,7 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
 			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
 			    (ieee->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
-				ieee->LeisurePSLeave(ieee->dev);
+				ieee->leisure_ps_leave(ieee->dev);
 			}
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 6a7738a828e1..d7df6f698c0c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -316,7 +316,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 	chan = ieee->current_network.channel;
 
-	ieee->LeisurePSLeave(ieee->dev);
+	ieee->leisure_ps_leave(ieee->dev);
 	/* notify AP to be in PS mode */
 	rtllib_sta_ps_send_null_frame(ieee, 1);
 	rtllib_sta_ps_send_null_frame(ieee, 1);
-- 
2.34.1

