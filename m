Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B619446
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 20:53:21 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id cq23so22112075edb.1
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 12:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C0WSsokq7YhZ7tRIrQ84d4jt5vnNEl2l3KCQRl75DR4=;
        b=oPZS5+xrB9voyvwB01Ty/Zly3Uzmlzh+UqQdu8mI7bpXBDGREamZ5csNbQRWEuBeeR
         a0Ncw8qQJjKCFl8wI/wSaHNwPtxLfYDdnHPr5nteQL19+O9vAeBGVMWfZ2YFtju4C4EA
         l3R47hWiwlIRovHI9gJKWgQTwu40cMXSHOXj16Xi5S9CDMPkfDd6DycxwIvk7frh5+Y+
         0VyYxGdSJjSwYc1AlbSebhxE4hZCrJnbcwftxdi9+If+O5X1nR5TOoShJnIx2Tju1Dyx
         p5tDuh1S7xozR8ghVToLbnCv7Yhmih6guMgM/KudT9rw2PN48IQR9me8MTtYttxH4BCI
         0pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0WSsokq7YhZ7tRIrQ84d4jt5vnNEl2l3KCQRl75DR4=;
        b=dbwXYasOgwgBmxjUdrisGNYhwNt8OEwCUEZZyRsb31RcoqsDCaVzYnbitbwXc3JiJO
         SDFOg8VNz2hITdWUcKVErlptH28BNVj2FdKtUWbmwJWKfNwpvUVhdRoOeW9k5dudw3KZ
         f0h+QtKIjC3g1WJZZehQcVM7GW5C2m3TTYIX2aewd6gOWtvhnFHznioGqX+LFWzym1Dj
         SeRD2uRJ8X6QFsECBujUvP9nShXBP8E15BgWNvAXAo5fsHXDKw97T88eC7hMtHoAXqHF
         +oRqxurjHtWRBlptArbZ7DaxYFOGlD5sqjKTVoZ1VUAmz6DwzA5K541UCqxBph1GTzT8
         3YpA==
X-Gm-Message-State: AO0yUKWumJ4qqaF3XLxZ6xfDwIpRJCKImcUgYwTK4iAYCBZDdVEJ2lHz
	egpb4vaJQFrqzSlN2C5tYjSop7uBltw=
X-Google-Smtp-Source: AK7set/D2Bw4ZEdzcYuyPgw/k7ncU6BNLMMQtWEPWfQygryU+HolzZ/faFWKM4UVp4Jt+ycNyqnzww==
X-Received: by 2002:a17:906:cb:b0:8b1:814e:c83d with SMTP id 11-20020a17090600cb00b008b1814ec83dmr15392234eji.6.1677012800122;
        Tue, 21 Feb 2023 12:53:20 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id u4-20020a1709060b0400b008c607dd7cefsm4427732ejg.79.2023.02.21.12.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:53:19 -0800 (PST)
Date: Tue, 21 Feb 2023 21:53:17 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] staging: rtl8192e: Remove entry .rx_check_stuc.. from
 struct rtl819x_ops
Message-ID: <6538f1e158664837f6d1e7a20583ff20fc4f1403.1677010997.git.philipp.g.hortmann@gmail.com>
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

Remove entry .rx_check_stuck_handler and replace it with function name
rtl92e_is_rx_stuck. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 5 +----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 410c03833b9f..15eab612b08f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -30,7 +30,6 @@ static const struct rtl819x_ops rtl819xp_ops = {
 	.link_change			= rtl92e_link_change,
 	.rx_command_packet_handler = NULL,
 	.irq_clear			= rtl92e_clear_irq,
-	.rx_check_stuck_handler	= rtl92e_is_rx_stuck,
 };
 
 static struct pci_device_id rtl8192_pci_id_tbl[] = {
@@ -1063,9 +1062,7 @@ static enum reset_type _rtl92e_tx_check_stuck(struct net_device *dev)
 
 static enum reset_type _rtl92e_rx_check_stuck(struct net_device *dev)
 {
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	if (priv->ops->rx_check_stuck_handler(dev))
+	if (rtl92e_is_rx_stuck(dev))
 		return RESET_TYPE_SILENT;
 
 	return RESET_TYPE_NORESET;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 87be8aaa7822..43e1c651e6d2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -211,7 +211,6 @@ struct rtl819x_ops {
 					  struct sk_buff *skb,
 					  struct rx_desc *pdesc);
 	void (*irq_clear)(struct net_device *dev);
-	bool (*rx_check_stuck_handler)(struct net_device *dev);
 };
 
 struct r8192_priv {
-- 
2.39.2

