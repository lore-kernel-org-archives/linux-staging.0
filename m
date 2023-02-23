Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A241FB5
	for <linux-staging@lists.linux.dev>; Thu, 23 Feb 2023 06:47:32 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id ee7so23836450edb.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 22:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677134850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6CjMSX3fCv/Qr1M0aeSG/e+l/GblnDne7N25TnEl9vI=;
        b=MAwUCEBEIh7x0Lr0V2oLN8HKK9Nn5ZwZbIFA//ovhuOIgajx6fkWg56JTkjQrQbr9t
         L/WXYNqVV2McAS71EAQB3Oo63SZOXkxPMEZTnDRn1kjmtCytieBTNbkYu7RwpXp2A7Vs
         TaDYpPzcRqwaCxu47TH/JDCV+SwjIc7PGhyJPFPNHb2FBTEH8ASwhJyY+mQsOGW6G7lr
         YSkm4xBhXb/W9eGRCH41G14c2QaQ8nmPlypW7Wnwu2GQzk9K2DMVpV6U5P5HK5iDPK0c
         +8lQwbpLbxcBUEmXnmbkb1QHbPp2kyBnUqZpWt5CNRoNdasziBejSfiGYIvHIPhBnn0X
         4rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677134850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CjMSX3fCv/Qr1M0aeSG/e+l/GblnDne7N25TnEl9vI=;
        b=vqWwLBFVahdZs3scGMNiSHsODPljxqwlWZd+SAN/F0xBfS7dWyDZJW3/krpsuP5UZc
         bNY6THyRJcpbumv7d/vMKfpuqwU2x+NsQCxf3lqMJ8o96Q9oq4ypSG2AaebqbbJNy4O0
         SjbVMjKBOwQ3rNwxD7KLY5jE7rqnAPqWC1GqZuc3JUeeb6AhRDg4Ae/BONjK8e1N0YjQ
         fsNhXK9KhZDGYLy2zcywQ7oDSu9vQqPdPuZDD3BbI3vG1/+I7JzAIOiKG+4AOkubNiZZ
         fFdTxMn/0k2B6Ghv3W1x8qmtAjAlMQt/I0PqwZLsZmm5tXX3nQNtpW0CMa/eHZuMhs6w
         IGmQ==
X-Gm-Message-State: AO0yUKXCRJn9yenDjc5LGOxfjETJnLDQRmtTM+o9hq2ockdJXVC/Owvh
	ZoWucSLBAXmazD42xSZ6pfs=
X-Google-Smtp-Source: AK7set89d0/XCAaY6TDRJ0GNgheYEinTgayLhXErICIVlYtWFn5N4+TqzuXiuKgyZjytwk16GCoecg==
X-Received: by 2002:a05:6402:1e8e:b0:4ad:de7:253f with SMTP id f14-20020a0564021e8e00b004ad0de7253fmr11531165edf.3.1677134850536;
        Wed, 22 Feb 2023 22:47:30 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id h21-20020a50cdd5000000b004af5968cb3bsm2614654edj.17.2023.02.22.22.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 22:47:29 -0800 (PST)
Date: Thu, 23 Feb 2023 07:47:28 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8192e: Remove empty struct rtl819x_ops
Message-ID: <31b5b0ba88d7b07b0407956d56446e8f0e62e3e7.1677133271.git.philipp.g.hortmann@gmail.com>
References: <cover.1677133271.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677133271.git.philipp.g.hortmann@gmail.com>

Remove empty struct rtl819x_ops as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 ------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f5a155d1a81a..718d69b4ce16 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -25,9 +25,6 @@
 int hwwep = 1;
 static char *ifname = "wlan%d";
 
-static const struct rtl819x_ops rtl819xp_ops = {
-};
-
 static struct pci_device_id rtl8192_pci_id_tbl[] = {
 	{PCI_DEVICE(0x10ec, 0x8192)},
 	{PCI_DEVICE(0x07aa, 0x0044)},
@@ -2190,7 +2187,6 @@ static int _rtl92e_pci_probe(struct pci_dev *pdev,
 	unsigned long ioaddr = 0;
 	struct net_device *dev = NULL;
 	struct r8192_priv *priv = NULL;
-	struct rtl819x_ops *ops = (struct rtl819x_ops *)(id->driver_data);
 	unsigned long pmem_start, pmem_len, pmem_flags;
 	int err = -ENOMEM;
 	u8 revision_id;
@@ -2257,8 +2253,6 @@ static int _rtl92e_pci_probe(struct pci_dev *pdev,
 	if (pdev->device == 0x8192 && revision_id == 0x10)
 		goto err_unmap;
 
-	priv->ops = ops;
-
 	if (!rtl92e_check_adapter(pdev, dev))
 		goto err_unmap;
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index c2a4b2ae6a81..c8816c44ca51 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -198,9 +198,6 @@ struct rtl8192_tx_ring {
 	struct sk_buff_head queue;
 };
 
-struct rtl819x_ops {
-};
-
 struct r8192_priv {
 	struct pci_dev *pdev;
 	struct pci_dev *bridge_pdev;
@@ -218,7 +215,6 @@ struct r8192_priv {
 	struct delayed_work		txpower_tracking_wq;
 	struct delayed_work		rfpath_check_wq;
 	struct delayed_work		gpio_change_rf_wq;
-	struct rtl819x_ops			*ops;
 	struct rtllib_device			*rtllib;
 
 	struct work_struct				reset_wq;
-- 
2.39.2

