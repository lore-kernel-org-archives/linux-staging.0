Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6B17C
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 14:53:02 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64d604cc0aaso1970752b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685285582; x=1687877582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h281HgpjzK4XEri7LVFQyvfUqK1gjl7k3qozv2JOCAE=;
        b=nR1fI3qjXN5dxhT/H2mc44EsCADS2cSqRN83AR2w6D7+whusEr4zT7A9oYtZ7S570u
         OUENjdpgmBAqIFDzB6S7oRYbVTiOt3/aiF3JdTQD4Hp4sX1PKLIXmj7e3GagxO6SIQk6
         aVcKI1k8fsja0rlelkTzJ+Xmg83K8tKW8efrEM5EhjQsnQm1D3DBinIXaVT4SnpINsMg
         Zjp4CGdAv8AmtQrkah+AvE8hi2gWMNvmj2NHwE60e5VbxFG8MGgEQAUc/soBbNEVKomg
         NzmL15HeHOkpeXs3Sr9Qb5rOYq9HC5ogSQN+D3uPRJTJSbo/nM8k4VkJ3wEwVlI1oyev
         sqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685285582; x=1687877582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h281HgpjzK4XEri7LVFQyvfUqK1gjl7k3qozv2JOCAE=;
        b=LqvUljv1q3bb8cGCB4zRhhtdyjfVK/AI4sOIUDiBmtKsQ2CjxGE3xwWOszvOYxaHjM
         UURgXq/bofkPQlu7IRDz3V3YZpt2Z2T8UBK60sM7SGuSl7o+EpTHROhx07kDQFlMdj/r
         gtuhQ+Bn6BWpp8H6HmfjXmbjtfErBPpxFq4XDnyXXkLbBcClEhQ+2WmTQw6kvla5kdUr
         Zy40wRNqhKH0smFpwMMK0V2dy0D65BPC8+cHZnLDAyMZ7B8KZ/3XsF/LJvWj8Za957Qb
         oHh4c2VDw95lrwMI7QKOOu24nmP5P/m705SWJGnzJCCPtDnMPw2IdvtfsPa0+id6fimK
         1hYg==
X-Gm-Message-State: AC+VfDyJFOEer8hZhInvQoicgsnNFRZ1XQvIFBQQDmmlXL2xIjD6TRxK
	yc8pC1eXR5hnnvQpnblC4P5lGwHI2ZM=
X-Google-Smtp-Source: ACHHUZ7/htqm/7HGd8RJuPjs7WprXIgVuzvLzBW4KqV3JK/pdQpTJDazny+scCDYyN4IUaaGThmdag==
X-Received: by 2002:a17:902:ec8c:b0:1ac:6d4c:c26a with SMTP id x12-20020a170902ec8c00b001ac6d4cc26amr11738757plg.14.1685285582106;
        Sun, 28 May 2023 07:53:02 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.199])
        by smtp.gmail.com with ESMTPSA id bg8-20020a1709028e8800b001ac591b0500sm6385884plb.134.2023.05.28.07.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 07:53:01 -0700 (PDT)
Date: Sun, 28 May 2023 20:22:58 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: rtl8192e: Rename variable InitialGainHandler
Message-ID: <721239f5b292ba9ffa973f5fea81069aaeac34a7.1685284727.git.yogi.kernel@gmail.com>
References: <cover.1685284727.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1685284727.git.yogi.kernel@gmail.com>

Rename variable InitialGainHandler to init_gain_handler to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 61fd84ca58d2..4fceb5ee51d5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1130,11 +1130,11 @@ void rtl92e_scan_op_backup(struct net_device *dev, u8 Operation)
 	if (priv->up) {
 		switch (Operation) {
 		case SCAN_OPT_BACKUP:
-			priv->rtllib->InitialGainHandler(dev, IG_Backup);
+			priv->rtllib->init_gain_handler(dev, IG_Backup);
 			break;
 
 		case SCAN_OPT_RESTORE:
-			priv->rtllib->InitialGainHandler(dev, IG_Restore);
+			priv->rtllib->init_gain_handler(dev, IG_Restore);
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index b82d2b7aa26c..eb20b8014997 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -734,7 +734,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 
 	priv->rtllib->SetHwRegHandler = rtl92e_set_reg;
 	priv->rtllib->AllowAllDestAddrHandler = rtl92e_set_monitor_mode;
-	priv->rtllib->InitialGainHandler = rtl92e_init_gain;
+	priv->rtllib->init_gain_handler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
 	priv->rtllib->ScanOperationBackupHandler = rtl92e_scan_op_backup;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 03898efea12d..d361d18d54f6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1713,7 +1713,7 @@ struct rtllib_device {
 	void (*set_wireless_mode)(struct net_device *dev, u8 wireless_mode);
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
-	void (*InitialGainHandler)(struct net_device *dev, u8 Operation);
+	void (*init_gain_handler)(struct net_device *dev, u8 Operation);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
 					   u8 Operation);
 	void (*SetHwRegHandler)(struct net_device *dev, u8 variable, u8 *val);
-- 
2.25.1

