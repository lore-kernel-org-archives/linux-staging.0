Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A44AFE7
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 21:50:31 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-947a47eb908so90105466b.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Apr 2023 14:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680904231; x=1683496231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eeN/ZVCekgyzBVdfluaI952fB28+NGzvtQuNBvQl0F4=;
        b=VY0sJqQ3cZGU0aI6sJKkIl5bCp7lmFG7XDgR9PfRzRPMjFABqmF4tgrEsEBerxguLO
         2zF0UVOU1FT91rXZ5zSy7Djb6Ml8udNz4CMKsT7r/Y5cYFAR+fV5sLzSIkg2gZx6VEzS
         BnYH6GfrKPXsY8OxehyIVu8+6cj96oZVchZJ6SAilDQYXDpE7fyUc/RbHvGg4mV0tUDk
         w0Qt/8AQ3+GL0psU4Dl7ggTRxRtTtqzB5Vnw4+ptmQf+0Oe2MOgmGz2fCSR9fA9eNIZV
         b1elK/+TEojuUT8C2R+fx1UduVNHNoX60uqTqCHMwQjQ64jveRJQqKLyhyznlM0uGQ3N
         T7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904231; x=1683496231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeN/ZVCekgyzBVdfluaI952fB28+NGzvtQuNBvQl0F4=;
        b=otuKyzkQVx4hN/NDT5gR8wGd4bCbwRT1qqLz+XU7sNCUvs36n3xatK0gNFi0to/z7+
         GCy5Jfzed15Lqt7Ht5QncMDvERed7oerrggCE+K83Pxb+3FgqLL7Yxq8XTuPKqOvjLqP
         gVfJi9LlU7bAkIVoxkUc6mB17CVe5WV9uWaUvqKLHZ5p8CsDahhpu5E5GAPS4xEjo7Ch
         hpzy2fTrHngE943rtQ3aQWGV+0hCJ8ZGNmZ1C+o3Wdkr8ppTP2c2IoI0OqAgOQZA4Xxc
         aq+Iw41TfznMMJJAHakLLnTy2N9TGfXF95VC5Gy/9lxeWXncdwdnlcfRVmXZ4C13lAZM
         SjGQ==
X-Gm-Message-State: AAQBX9dXBhrr4/x4IQHoD/EHYAmm7N5LJZtwQ3nPcSS0i5StuhM2hmQk
	1Mrh7ePMidZZ4KaIOyudE7o=
X-Google-Smtp-Source: AKy350aNc6Uj35BvHmzd2cTNLkO4RBcFCg5ttxdRc77YF1akvtaEdlLahTqrEGZoWDcANrTpiK8s4w==
X-Received: by 2002:a17:906:10c7:b0:947:f415:db23 with SMTP id v7-20020a17090610c700b00947f415db23mr690276ejv.1.1680904230791;
        Fri, 07 Apr 2023 14:50:30 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id r2-20020a17090638c200b0093034e71b94sm2456872ejd.65.2023.04.07.14.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 14:50:30 -0700 (PDT)
Date: Fri, 7 Apr 2023 23:50:28 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] staging: rtl8192e: Remove unused function
 _rtl92e_dm_init_wa_broadcom_iot
Message-ID: <0e7a2a5b9edc85b7f8e3fc0f9e0e6ab7f2830d02.1680902603.git.philipp.g.hortmann@gmail.com>
References: <cover.1680902603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680902603.git.philipp.g.hortmann@gmail.com>

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

