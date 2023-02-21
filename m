Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A3833C4
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 20:53:07 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id h16so22551528edz.10
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 12:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHR3bAPWRzNH3uceXibtG9TZoHwCI92GdhICVcRGuxc=;
        b=cujsHR2biF4mJAv32C6CIgyZzTh5zaWy4Y7EC7P7uy0efNh8aeb/mAc+jzPLmGauFE
         lWsggM0e5S2xGfKqFgwRAWLXVymontTf+C/nyZsZYQQaxt/NIGxc7LHoY2/ZKUs/Gn4q
         lMUMXiZwb+P73W9BTepfzxgAkscsiY2QFJxA9qi58DOdhtXeckdlMmmL+W/O/twK5kia
         DkAKO+nYeeLG790bZnmiScjRD62b3gtbKajvg/eUfn9qKClTu+GzN/FLXsD8LmAVrtH8
         EdXmTorTBROTKmh+/e963lGMnTKcSg2WM4E3ltSIIPjad5qHSSAc/MYJI0zp2iRdWfRl
         0nQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHR3bAPWRzNH3uceXibtG9TZoHwCI92GdhICVcRGuxc=;
        b=EtMlG/M502+jgPEL3MlPaGHpsXj8/nBWfddCd/RRHYA8FNACrO1ViSNGij0Hduus9Y
         8YJp2Dsox1ZhZIsBrGKwUOCa6CpXi/GcMI83/k4dbmMesLcUsNhQ8SLZW7AiCvkcOUbb
         KlNlfVBzMsTHcXc/WY4w+7sf1FRFg7eYZlNJeOf5XKP7IHZCYDlzZdLH0hpPKQhHbHfk
         Dz13aIZDs7r2UBqUfru7FWAnAsDG1DFhEayTYp1OjCRlOhvmvyVTUyxcvQhPCAOCkFjh
         sJvaHKjqs7IT2hnDJEZYsXdnygey5bdEVldMJZC0/bXux6ILrBieoiipan4WkBXW3oYW
         fn5g==
X-Gm-Message-State: AO0yUKUmL8g254l8MrPBDPlMGkDt1ZMh27Yyq49C5Syzt86h4kUeqGr+
	ZTdG4TbjuKkZze0E4oaEyGZuY4wA/Y8=
X-Google-Smtp-Source: AK7set9LVCJ2MJfL0Hw4KezNFy2ugWPQLpB9o9oMcCJvFTifgWIjIZPISLlfR92PtrsQqaEX06ZSPA==
X-Received: by 2002:a05:6402:34d5:b0:4ab:dde:dea7 with SMTP id w21-20020a05640234d500b004ab0ddedea7mr6024923edc.2.1677012786030;
        Tue, 21 Feb 2023 12:53:06 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709066b8d00b008cdb0628991sm3580334ejr.57.2023.02.21.12.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:53:05 -0800 (PST)
Date: Tue, 21 Feb 2023 21:53:03 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] staging: rtl8192e: Remove entry .interrupt_re.. from
 struct rtl819x_ops
Message-ID: <a972ff8963b426f20651810b5161c8759ffa2d05.1677010997.git.philipp.g.hortmann@gmail.com>
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

Remove entry .interrupt_recognized and replace it with function name
rtl92e_ack_irq. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f1cde3fc8634..3323bdf564ee 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -30,7 +30,6 @@ static const struct rtl819x_ops rtl819xp_ops = {
 	.link_change			= rtl92e_link_change,
 	.rx_command_packet_handler = NULL,
 	.irq_clear			= rtl92e_clear_irq,
-	.interrupt_recognized		= rtl92e_ack_irq,
 	.tx_check_stuck_handler	= rtl92e_is_tx_stuck,
 	.rx_check_stuck_handler	= rtl92e_is_rx_stuck,
 };
@@ -2103,7 +2102,7 @@ static irqreturn_t _rtl92e_irq(int irq, void *netdev)
 
 	spin_lock_irqsave(&priv->irq_th_lock, flags);
 
-	priv->ops->interrupt_recognized(dev, &inta, &intb);
+	rtl92e_ack_irq(dev, &inta, &intb);
 
 	if (!inta) {
 		spin_unlock_irqrestore(&priv->irq_th_lock, flags);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 79281c077182..d3558bf6ce23 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -211,8 +211,6 @@ struct rtl819x_ops {
 					  struct sk_buff *skb,
 					  struct rx_desc *pdesc);
 	void (*irq_clear)(struct net_device *dev);
-	void (*interrupt_recognized)(struct net_device *dev,
-				     u32 *p_inta, u32 *p_intb);
 	bool (*tx_check_stuck_handler)(struct net_device *dev);
 	bool (*rx_check_stuck_handler)(struct net_device *dev);
 };
-- 
2.39.2

