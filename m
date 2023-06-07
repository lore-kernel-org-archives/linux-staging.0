Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA146139
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 15:02:54 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-256a41d3e81so6319498a91.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686150174; x=1688742174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ciCWuo7mkukE2uWGAYr6I0+J8XwMl63aYshkUdvmROQ=;
        b=VCxEtwdUm8HLNHQcljdU0bHwGkU554jQ9c9dorWKjf7VEN+f0JQeiDrT0d8aIgdBoN
         ssCPxv4w0oIcMiuOB25ZSy4jxoJc6BdNi0gjR8oJ9T2tSRYX8CxiR4GZck0qC3LvU1mc
         2wtdVzce0PnIs7CErGRS3EP8l4VAFSeIao8Y+HNAJKGZc6oK/nvcPgrOb9f1rVpyih7I
         hqU0Mv2k0lVHOjN/vKKaGgJ/S4nxQaPDZR+fCrLJKS/pcSZRASNWCdjLhuLjl/DU+y+I
         VEeqg185Kio6zQl52dkxPSPNtJ/AoKjAwZo7Zj03NO044l57kDn0+PMAVtvsEt6Sztls
         3n/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150174; x=1688742174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciCWuo7mkukE2uWGAYr6I0+J8XwMl63aYshkUdvmROQ=;
        b=TAEW3yeSRZxZhU4mJjGhVnn8HJS5PqedJOQmZYx45w/+zAa5VIUV/0cHrY+ceeKD+h
         3IZ+nbRilqUkQ0Rjdy/35yGytJx03wzQBHSeSLMfnO+6Wc0WQMvfV2sTrQJuCPjkJ6zk
         q1dBGV9hugmohwes6pNICSqeVtVkjpqJtMea+ncyWR+DtqgHP1IkZrs1yrwJbyaecdm5
         kEgl5hzPePOV6JKut3TXxBdrgbegaqMPBdHEk97gsTUVTIav8wX0vVR3aEpCIagQW4GH
         7VVfsl1dzF9I6/BLy8KdjU+sC3WMQnd4+TWV5hrSfifK23zBI4Wg3TI+tvy2DFf8T9rQ
         /IHg==
X-Gm-Message-State: AC+VfDwsNdpkx8r75YskkVpP+kA7w3a4defFKHBikClrIyK6ldZGRhz9
	2XJwlNuXFbV8iCYVHkVqAC3icxt+zkQ=
X-Google-Smtp-Source: ACHHUZ4l5u97Jt7CCXzYWcOorreKz2dWoum4LQB1l3ensFhK3vI4lOOlDXpEYPrzw0rgb1vJ0Qj8uQ==
X-Received: by 2002:a17:90a:598b:b0:253:26e5:765a with SMTP id l11-20020a17090a598b00b0025326e5765amr4456240pji.48.1686150174229;
        Wed, 07 Jun 2023 08:02:54 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id nn4-20020a17090b38c400b002562cfb81dfsm1486061pjb.28.2023.06.07.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:02:53 -0700 (PDT)
Date: Wed, 7 Jun 2023 20:32:50 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] staging: rtl8192e: Remove variable InitialGainHandler
Message-ID: <15852c9ce64695e60b8dfa3d459ad5b1d26ba07e.1686149467.git.yogi.kernel@gmail.com>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686149467.git.yogi.kernel@gmail.com>

The variable InitialGainHandler is set in only one place throughout the
driver. This patch removes the variable and calls the real function
directly instead, eliminating the unnecessary indirection.
Additionally, the removal of the variable aligns with the checkpatch
guidelines by removing the use of CamelCase.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v2: Removed the variable and called the function direction instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 1 -
 drivers/staging/rtl8192e/rtllib.h              | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 641e993aaa86..5385bb099c56 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1129,11 +1129,11 @@ void rtl92e_scan_op_backup(struct net_device *dev, u8 Operation)
 	if (priv->up) {
 		switch (Operation) {
 		case SCAN_OPT_BACKUP:
-			priv->rtllib->InitialGainHandler(dev, IG_Backup);
+			rtl92e_init_gain(dev, IG_Backup);
 			break;
 
 		case SCAN_OPT_RESTORE:
-			priv->rtllib->InitialGainHandler(dev, IG_Restore);
+			rtl92e_init_gain(dev, IG_Restore);
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 231903002233..8218319ad834 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -731,7 +731,6 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 
 	priv->rtllib->SetHwRegHandler = rtl92e_set_reg;
 	priv->rtllib->AllowAllDestAddrHandler = rtl92e_set_monitor_mode;
-	priv->rtllib->InitialGainHandler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
 	priv->rtllib->ScanOperationBackupHandler = rtl92e_scan_op_backup;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index f7fd8b77db99..92ed1b493f6b 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1709,7 +1709,6 @@ struct rtllib_device {
 	bool (*GetNmodeSupportBySecCfg)(struct net_device *dev);
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
-	void (*InitialGainHandler)(struct net_device *dev, u8 Operation);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
 					   u8 Operation);
 	void (*SetHwRegHandler)(struct net_device *dev, u8 variable, u8 *val);
-- 
2.25.1

