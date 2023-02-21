Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04679446
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 20:53:47 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id da10so23607387edb.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 12:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677012826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmIDpU8pXZhC5aYh2hMJFzJrfUi2LzepJbDTKpZAl1o=;
        b=XjuV/lDfgltw3xurK4bBzbpOfF1oUP0uTjshEwMJ+4UE33ReKtVH0jGMKQHocn+vGT
         4A/VraDNjjbOk85kkyH5pau1Dpc2vIfajzemO1Q+zGl3JuYn26HlUdLDEGbu0Bj4OTNd
         0QapTGdHfhGtl+9Y+33UtZWnfC1ji09isd+ShbWFUQomICj36xcpkXkc8ZAFHeMcTUDE
         Il+Orwqcx446ACIGcaXck/XoJrpC5sUu/n/jXq4ldTyhKxOG3XTkEN2q7DR8qAfGwKUV
         gRz920QzCH5DqzBfg97Aj09qr4C3lRU2NiPq322RA2GC9YTqYdiATBPnIrOlHO5AmhCU
         b7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677012826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmIDpU8pXZhC5aYh2hMJFzJrfUi2LzepJbDTKpZAl1o=;
        b=4c1RelGf2+q9yczwAzkALP4TOesiOh1Nm8PL3MwKgrVT3O3ULcZjtGDDBSvBgp/NWq
         M9zIE4z6rHubGd5bKRBspWHD5VdTOoROYbc7xYqqwdGKdnMVgWjjJyXmRFfjcu/rRBFw
         hu0YphcscNNAj7d/0Mkotu/S1xbqbiZrviN17g1JMsiUjdYzBc4ixbO3C1VT4bFAzXqG
         sejiAhzB0TVvrHgELm0bhdQzNmf/89r3dhe81jN428iScgNUwA8o+giFOt00eFPAwbmw
         PZqGthOBqrtLcCEEO6tqYj3VJgG2gM5hppCmKFl9b+cnrQ1FXSldDU9fEoEl3vF3mHbm
         JXmg==
X-Gm-Message-State: AO0yUKWv+4NnRLuAkVquHN+Rn6PZrPBLYAaY+SSBfRAJTEq9t/mL3CsG
	hFGTLGr+Tc03KQ7eStkOInrBW1eebvI=
X-Google-Smtp-Source: AK7set+knyD7lerXdj8a4NvreqfY6fcZTZgSR/Hds2LOTR2lobqL6+4VKAXBcfc60flR+xGjUBRnTg==
X-Received: by 2002:a17:906:150:b0:894:4341:77d6 with SMTP id 16-20020a170906015000b00894434177d6mr13256655ejh.1.1677012825929;
        Tue, 21 Feb 2023 12:53:45 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id v18-20020a1709060b5200b008a9e585786dsm7576480ejg.64.2023.02.21.12.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:53:45 -0800 (PST)
Date: Tue, 21 Feb 2023 21:53:43 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] staging: rtl8192e: Remove entry .nic_type from struct
 rtl819x_ops
Message-ID: <f1fd37a2d2b90bef8caac31a98f3eeff404b3095.1677010997.git.philipp.g.hortmann@gmail.com>
References: <cover.1677010997.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677010997.git.philipp.g.hortmann@gmail.com>

Remove unchanged entry .nic_type and replace it with constant NIC_8192E.
This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.c  | 6 +++---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 2d2f9d4a0ff5..044cab649ff1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -26,7 +26,6 @@ int hwwep = 1;
 static char *ifname = "wlan%d";
 
 static const struct rtl819x_ops rtl819xp_ops = {
-	.nic_type			= NIC_8192E,
 };
 
 static struct pci_device_id rtl8192_pci_id_tbl[] = {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index fa72f8891409..f75cc96052d9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -204,7 +204,6 @@ struct rtl8192_tx_ring {
 };
 
 struct rtl819x_ops {
-	enum nic_t nic_type;
 };
 
 struct r8192_priv {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
index 81e1bb856c60..0bc3e013001e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
@@ -39,7 +39,7 @@ bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
 	revision_id = pdev->revision;
 	pci_read_config_word(pdev, 0x3C, &irq_line);
 
-	priv->card_8192 = priv->ops->nic_type;
+	priv->card_8192 = NIC_8192E;
 
 	if (device_id == 0x8192) {
 		switch (revision_id) {
@@ -64,10 +64,10 @@ bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
 		}
 	}
 
-	if (priv->ops->nic_type != priv->card_8192) {
+	if (priv->card_8192 != NIC_8192E) {
 		dev_info(&pdev->dev,
 			 "Detect info(%x) and hardware info(%x) not match!\n",
-			 priv->ops->nic_type, priv->card_8192);
+			 NIC_8192E, priv->card_8192);
 		dev_info(&pdev->dev,
 			 "Please select proper driver before install!!!!\n");
 		return false;
-- 
2.39.2

