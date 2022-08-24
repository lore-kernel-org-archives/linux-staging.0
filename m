Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C98187E
	for <linux-staging@lists.linux.dev>; Wed, 24 Aug 2022 20:14:43 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id t5so23465680edc.11
        for <linux-staging@lists.linux.dev>; Wed, 24 Aug 2022 13:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=O2auyW/wyuCTRZgooWa2O9OlE4D4l/s1oCdHs9nl/AM=;
        b=RkCHIIr13O8y6XDImqeVhXCvTCViIgq/I2Q9U83Sp0NchD+XeBv2fybJXTkGfGkJlf
         LxlTt3dqw8JKKkNTzmyAjX4aWDkQFDQNDc4E/2Wkwr4HL3bk6RV1NhrbHCvPcRZZ0t0m
         yFdBK75Yo2yHfwHs1aB0+DYF20JLsbIkbR6b1K2BddFl4jXyJN4P0jIEKKZDQ7Yn1iL5
         pSOyD0v+rao59R7MStWhXYQRT9fryjqbn62BaF1dZ9PCaau2iTgAlOwBlfDG6UMkVHl9
         X6J0Sxag1N3Ci8eeyKEZwT7taN5pyzBGCf7kXURgHZH485MibCy8FSorTkaRik0PuAQ0
         jBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=O2auyW/wyuCTRZgooWa2O9OlE4D4l/s1oCdHs9nl/AM=;
        b=ru/dW9LCoD371ElYFnt54EQjhC6Vigj0WgvuoiaewBlUJsBY0603d88OS8ZqWcvc8A
         je2uxJLjUOsZ2l0EmgkwfeprWdF+i/b1La77V25sC5Pa6A3ss5UxTzFg8i/5lgnHQaxs
         INYiN3NXYTEyC50KZH96Ga3QNajuZ7JolkDRccTaiLHsFgK1gk7dYMtDkU6PKQdtJpyV
         uDYMM3I498S9HjpWX1gieJBeBaJSxvwQsCQnQtuND8E84hU5OsrhqSMa9KbGjhQhGXHO
         +8fpgyMMmyyR3M1FY3Xw7PFejvCX2W+Ce58yKSEjlLW0hDEjk1CYcajFuCxxfMglqBq5
         MICA==
X-Gm-Message-State: ACgBeo19bwhpQONlukejGZ4CNmCsTGVXm1+bQAyB74oYBfPzu04bAx3h
	ogkp9xrGO1dpL/muZAPQQ3o=
X-Google-Smtp-Source: AA6agR4yvrNf2nypLiV3+GroLzz/CEDa+5vK7a01KJMJogU8vyj0ZhI/1cLv6KwFgeFEqkd9NAWPXg==
X-Received: by 2002:a05:6402:328c:b0:446:bcc8:bf49 with SMTP id f12-20020a056402328c00b00446bcc8bf49mr522360eda.309.1661372081382;
        Wed, 24 Aug 2022 13:14:41 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id d26-20020a50cd5a000000b0044758c9b951sm2220907edj.79.2022.08.24.13.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 13:14:41 -0700 (PDT)
Date: Wed, 24 Aug 2022 22:14:39 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: rtl8192e: Rename Tx... and RxCheckStuckHandler
Message-ID: <3041cec77df10cdff18d5466beb3b0616370b112.1661370978.git.philipp.g.hortmann@gmail.com>
References: <cover.1661370978.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1661370978.git.philipp.g.hortmann@gmail.com>

Variable name TxCheckStuckHandler and RxCheckStuckHandler is changed to
avoid CamelCase which is not accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 8 ++++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 5b3b215448bc..ff73b8cff5e8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -43,8 +43,8 @@ static const struct rtl819x_ops rtl819xp_ops = {
 	.rx_enable			= rtl92e_enable_rx,
 	.tx_enable			= rtl92e_enable_tx,
 	.interrupt_recognized		= rtl92e_ack_irq,
-	.TxCheckStuckHandler		= rtl92e_is_tx_stuck,
-	.RxCheckStuckHandler		= rtl92e_is_rx_stuck,
+	.tx_check_stuck_handler	= rtl92e_is_tx_stuck,
+	.rx_check_stuck_handler	= rtl92e_is_rx_stuck,
 };
 
 static struct pci_device_id rtl8192_pci_id_tbl[] = {
@@ -1143,7 +1143,7 @@ static enum reset_type _rtl92e_tx_check_stuck(struct net_device *dev)
 	spin_unlock_irqrestore(&priv->irq_th_lock, flags);
 
 	if (bCheckFwTxCnt) {
-		if (priv->ops->TxCheckStuckHandler(dev)) {
+		if (priv->ops->tx_check_stuck_handler(dev)) {
 			RT_TRACE(COMP_RESET,
 				 "TxCheckStuck(): Fw indicates no Tx condition!\n");
 			return RESET_TYPE_SILENT;
@@ -1157,7 +1157,7 @@ static enum reset_type _rtl92e_rx_check_stuck(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->ops->RxCheckStuckHandler(dev)) {
+	if (priv->ops->rx_check_stuck_handler(dev)) {
 		RT_TRACE(COMP_RESET, "RxStuck Condition\n");
 		return RESET_TYPE_SILENT;
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 698552a92100..8f254c34d5d3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -299,8 +299,8 @@ struct rtl819x_ops {
 	void (*tx_enable)(struct net_device *dev);
 	void (*interrupt_recognized)(struct net_device *dev,
 				     u32 *p_inta, u32 *p_intb);
-	bool (*TxCheckStuckHandler)(struct net_device *dev);
-	bool (*RxCheckStuckHandler)(struct net_device *dev);
+	bool (*tx_check_stuck_handler)(struct net_device *dev);
+	bool (*rx_check_stuck_handler)(struct net_device *dev);
 };
 
 struct r8192_priv {
-- 
2.37.2

