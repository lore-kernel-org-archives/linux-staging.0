Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DC66D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:00 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id e7so24777233edu.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HQhkdC5CcQ7hQ6cBneOuG1liDEe+YJ+J8dvyHLF5dQw=;
        b=mR6t8UHKLVP42ZJn6SFG3sm1kn5Rwyjt5lPaPRqT2ZXO/xfE2GgUSEbQmRAFNiC35K
         qk7P2uQEsjrQS4/4ebnYHevlzgyKDHK+XLsRyOhlJecxnCpaw4TezJnGjDZGLpq/qZMK
         Le2KoLHa0VdldVwYCFwjA5yoKL7f0ZoxI8Bo0XmGaJz+GutENynCRdDQHbqMzoV5WXVX
         oB22pjpVTXUbC4FMI0xDnASVpaVy7qfwyBZg6FvA39qjYHuJ8Tr3EIDh2vj9Seb7bUCb
         3LWEFVF2ew8M4lJrrTjZiS43sHcaf9TWwBQVRXUPn53aH1p6B8VYNhQYzv4l6Rdgu5bj
         Xowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HQhkdC5CcQ7hQ6cBneOuG1liDEe+YJ+J8dvyHLF5dQw=;
        b=V8B7yEzgDUapEXnFxiQaN+uSMYod7+GSJ/2VKTHeYgQNJI2VlkpP5FVz35sMsX84/x
         0AywlSROeRP/a4xrJmmqvZnyiaLGgBuXc27uRTGsJc+MgYGRFduvMGdjOF84xU8rc1mP
         u7hluEOkuQXiohtyrdjQGGYxV6i1lC+v2LtSYE5h5uXj8pe4zbIZ+Lpj6rGG+XA3Hknx
         FfAY7HpEhVgpwl7/+cP1gLR0lxg4iodY17dnaLeRmwnQYl+KifHaRgkYT4GUwxXalbfA
         Vn+5+EVvUzRMkPmNZVmprqK2AajIfeyCIJS+w3m0jJCkn2N7XwGuVs837xv2EQPe8pWv
         jbkw==
X-Gm-Message-State: AOAM530PHrjckUo1bW8/4XR2r3Qjp0qWpK5dieo6P761QXZQL4AXzVmk
	PPbMh1tobQo4x6aysl5eXLsmOA==
X-Google-Smtp-Source: ABdhPJzTquNRTvyY8sV9bktbH6k2T3AmlnXbtNtQ8FWuSGH2EdZoywSNy+4Dt4LBZU2ocxi9lxqFcw==
X-Received: by 2002:a05:6402:150e:: with SMTP id f14mr175353edw.63.1618423918607;
        Wed, 14 Apr 2021 11:11:58 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:58 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 23/57] staging: ks7010: ks_hostif: Remove a bunch of unused variables
Date: Wed, 14 Apr 2021 19:10:55 +0100
Message-Id: <20210414181129.1628598-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Add comments to preserve documentation.

Fixes the following W=1 kernel build warning(s):

 drivers/staging/ks7010/ks_hostif.c: In function ‘hostif_mib_get_confirm’:
 drivers/staging/ks7010/ks_hostif.c:528:6: warning: variable ‘mib_val_type’ set but not used [-Wunused-but-set-variable]
 drivers/staging/ks7010/ks_hostif.c:527:6: warning: variable ‘mib_val_size’ set but not used [-Wunused-but-set-variable]
 drivers/staging/ks7010/ks_hostif.c: In function ‘hostif_infrastructure_set_confirm’:
 drivers/staging/ks7010/ks_hostif.c:849:6: warning: variable ‘result_code’ set but not used [-Wunused-but-set-variable]
 drivers/staging/ks7010/ks_hostif.c: In function ‘hostif_phy_information_confirm’:
 drivers/staging/ks7010/ks_hostif.c:929:19: warning: variable ‘noise’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/ks7010/ks_hostif.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 8bc3b7d8d3d5e..eaa70893224a1 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -524,13 +524,11 @@ void hostif_mib_get_confirm(struct ks_wlan_private *priv)
 	struct net_device *dev = priv->net_dev;
 	u32 mib_status;
 	u32 mib_attribute;
-	u16 mib_val_size;
-	u16 mib_val_type;
 
 	mib_status = get_dword(priv);
 	mib_attribute = get_dword(priv);
-	mib_val_size = get_word(priv);
-	mib_val_type = get_word(priv);
+	get_word(priv); /* mib_val_size */
+	get_word(priv); /* mib_val_type */
 
 	if (mib_status) {
 		netdev_err(priv->net_dev, "attribute=%08X, status=%08X\n",
@@ -846,9 +844,7 @@ void hostif_ps_adhoc_set_confirm(struct ks_wlan_private *priv)
 static
 void hostif_infrastructure_set_confirm(struct ks_wlan_private *priv)
 {
-	u16 result_code;
-
-	result_code = get_word(priv);
+	get_word(priv); /* result_code */
 	priv->infra_status = 1;	/* infrastructure mode set */
 	hostif_sme_enqueue(priv, SME_MODE_SET_CONFIRM);
 }
@@ -926,14 +922,14 @@ static
 void hostif_phy_information_confirm(struct ks_wlan_private *priv)
 {
 	struct iw_statistics *wstats = &priv->wstats;
-	u8 rssi, signal, noise;
+	u8 rssi, signal;
 	u8 link_speed;
 	u32 transmitted_frame_count, received_fragment_count;
 	u32 failed_count, fcs_error_count;
 
 	rssi = get_byte(priv);
 	signal = get_byte(priv);
-	noise = get_byte(priv);
+	get_byte(priv); /* noise */
 	link_speed = get_byte(priv);
 	transmitted_frame_count = get_dword(priv);
 	received_fragment_count = get_dword(priv);
-- 
2.27.0

