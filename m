Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB492FAF
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:31 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so7241809wmq.5
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fuMF6VsqpQHGen6pDrwB6pK2wNwSSnPLXzA/6UmoJDM=;
        b=TB9O6EbM//r2ckVijBZKpxGik/U3pQKiV30mWyiYoqiqAwhEtMWeuXIfRZkccyxEMq
         Osl3ibf++hF1ZKssVJjfnZmJ//wR/5O33NI8oU0vpj3GDb6pZbPD7CPx/0BZyKgXlyVh
         WUfQPmQmbyDPVTfoLK4Cxme4ZWnPe8I5eyOzwfTWZGcVEXDMIkaxxKoURo2WdLcesiLb
         omokyUlJA7WL/QWDvEfjjSfI5Vlqw3VkQ1FP13MnEfXUX6i6Vg1iiaibw0ag8LFnIa+R
         J3Yk8Y/IXDW1kclaWcV9wj3+Nua5pHlA/rCq3Op1mOeC44Bh7JTeb/ToUe8jrA9V/VPf
         0kUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fuMF6VsqpQHGen6pDrwB6pK2wNwSSnPLXzA/6UmoJDM=;
        b=npyttT8FOFHx3/62PJW8/7y5Tmrs1vQbQ+3f4w89DHCKAU2ZO9Jh5wb4M7WehHJQqk
         6cfDmiBA2NDdtxaIa6J2qEhQd/G3O85u5hDhZSykKeqDY20yWLmhJGrgRbluNif9eDa9
         Kd2hir0rqULraCjcsE2lYUl1vhWycc9PToQ4Nap975dd8szR0HGxArMfy8VwjV52bxx/
         jTDg747kfxeC5RwJzbvFxZ+9aqXutYrCdF0ZwCiEN7UxuNjObmOeUKP1Me2jEfvR3Aiv
         495diODCjrbjORIWXCD2dh4QwPZiP9dA2GGoDykpnw9+xLaptRcqUogJiJ29IFMz6Y0F
         sLTQ==
X-Gm-Message-State: AOAM532Z+a1e7ojCY9T8yS3CA7FDzO4X/tCzc1kn5F+GKImF9GHwGf8z
	zbemPQOp9K5gUHW4OFfhE/k=
X-Google-Smtp-Source: ABdhPJyTT28EUO5h7sUhmYeB1tutWW8W08tFYp1InzaNJkD7BB4VN+rEHmUPRKV//CH5uzQ9PVwS9g==
X-Received: by 2002:a1c:8083:: with SMTP id b125mr15890904wmd.176.1624099650061;
        Sat, 19 Jun 2021 03:47:30 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id 62sm11991768wrm.1.2021.06.19.03.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] staging: rtl8723bs: remove 5Ghz field in struct registry_priv
Date: Sat, 19 Jun 2021 12:47:08 +0200
Message-Id: <2d01d07bfad725fd8fd6437a3abe9332a781bd4e.1624099125.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused 5Ghz field in struct registry_priv.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 02df5bd8f575..895c41526164 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -171,9 +171,7 @@ struct registry_priv {
 	u8 RegPowerBase;
 	u8 RegPwrTblSel;
 	s8	TxBBSwing_2G;
-	s8	TxBBSwing_5G;
 	u8 AmplifierType_2G;
-	u8 AmplifierType_5G;
 	u8 bEn_RFE;
 	u8 RFE_Type;
 	u8  check_fw_ps;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index a06c8b1beb01..648456b992bb 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -289,7 +289,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->RegPowerBase = 14;
 	registry_par->TxBBSwing_2G = 0xFF;
-	registry_par->TxBBSwing_5G = 0xFF;
 	registry_par->bEn_RFE = 1;
 	registry_par->RFE_Type = 64;
 
-- 
2.20.1

