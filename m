Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626AD79E2
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 21:48:11 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-93abb185e13so7556566b.0
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 14:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680731289; x=1683323289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eeN/ZVCekgyzBVdfluaI952fB28+NGzvtQuNBvQl0F4=;
        b=mKjE+YrucVB00cnIxz5ePtLUpfzRlI2aykANj3/Y4X6zTiWTyp9nbNUkAYySQH1YXd
         YTcgbah83IztmnIFRag8YWb/SHm34S/0XXPzpTthAA8J7n/qtIN9YcG8U/59iZef0WB3
         7QRrY6oM+h2YU190CJijXVwKcyyODJF9LxrDV12wObVFVuAh0mLlu/nXI/cYAUQ9s7Qv
         kM4B8+HfiLG5FdHtVlFZm26FA+RBIfK/ZX3TpmyrIAZa5n19iAfwIMCbiKKrmFhbtq8C
         MZqG8SRP10ZswxPtC0BuDjWiF2pWqj9ZIuCmdQO6dG9QE3WxOHse2AJGDtMiHhpw1fIx
         Y/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680731289; x=1683323289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeN/ZVCekgyzBVdfluaI952fB28+NGzvtQuNBvQl0F4=;
        b=G/ErRmE5oRl/VPGxiVng3qb+zHMAhLAddeBlZ1rmOuz/YbV8chBHnmTD48NzbksFd4
         I5qUDUByKElW626m6DcKBfoKi1xUo25BEz98uQbOg3zn2Ne8BowkLOWBcAMBVKLiX35i
         0ogp4kXmiGPGP9XXUp+0inJn3rPPUyoA41Vt+doimNp3uSEd5T2B2k03aibbWiiZLejs
         J2jvtlgchost+DUBUmZtLQgSBbIoq8v1ePOnDBwvtwrbAUwTc3+eFi3XrhPELAMDyFVt
         KUq1ikQQGJ2+flqQlCL0DuKAa5VuxMGPZSSw0OHIUWyGtFFs0nTG2Ekc4goYRJNLS9X1
         kugw==
X-Gm-Message-State: AAQBX9eibaDe33e1HR1O92tYDr/kh0HkGih4GGtQN2/zQcFxaMvfHJ4r
	yAFfRAsfxQwF+vVdSzdWcRmsKRTrvfU=
X-Google-Smtp-Source: AKy350Z43E3vh7ltSo+gFfh9V/5IKBKRnuclYMAAB8hD/qO48g1hK8oFQAe+43P5ufMzqO5B84n8VQ==
X-Received: by 2002:a05:6402:1e8e:b0:501:ea97:5192 with SMTP id f14-20020a0564021e8e00b00501ea975192mr3289324edf.4.1680731289690;
        Wed, 05 Apr 2023 14:48:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090643ca00b0092f38a6d082sm7790097ejn.209.2023.04.05.14.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 14:48:08 -0700 (PDT)
Date: Wed, 5 Apr 2023 23:48:07 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: rtl8192e: Remove unused function
 _rtl92e_dm_init_wa_broadcom_iot
Message-ID: <4ccb680dab2e2e08cb723ca9c11431afc2331779.1680729715.git.philipp.g.hortmann@gmail.com>
References: <cover.1680729715.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680729715.git.philipp.g.hortmann@gmail.com>

Remove unused function _rtl92e_dm_init_wa_broadcom_iot and the variables
that are not any longer used.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 11 -----------
 drivers/staging/rtl8192e/rtl819x_HT.h      |  3 ---
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 50486f2a6f3a..93504d5a8578 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -173,7 +173,6 @@ static void _rtl92e_dm_pd_th(struct net_device *dev);
 static void _rtl92e_dm_cs_ratio(struct net_device *dev);
 
 static	void _rtl92e_dm_init_cts_to_self(struct net_device *dev);
-static void _rtl92e_dm_init_wa_broadcom_iot(struct net_device *dev);
 
 static void _rtl92e_dm_check_edca_turbo(struct net_device *dev);
 static void _rtl92e_dm_check_rx_path_selection(struct net_device *dev);
@@ -1531,16 +1530,6 @@ static void _rtl92e_dm_cts_to_self(struct net_device *dev)
 	}
 }
 
-
-static void _rtl92e_dm_init_wa_broadcom_iot(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv((struct net_device *)dev);
-	struct rt_hi_throughput *ht_info = priv->rtllib->ht_info;
-
-	ht_info->bWAIotBroadcom = false;
-	ht_info->WAIotTH = WA_IOT_TH_VAL;
-}
-
 static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 {
 	struct r8192_priv *priv = container_of_dwork_rsl(data,
diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 22e4f126ed56..f4e9fa849796 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -162,9 +162,6 @@ struct rt_hi_throughput {
 	u8				IOTPeer;
 	u32 iot_action;
 	u8 iot_ra_func;
-
-	u8	bWAIotBroadcom;
-	u8	WAIotTH;
 } __packed;
 
 struct bss_ht {
-- 
2.40.0

