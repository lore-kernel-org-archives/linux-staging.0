Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D75033C4
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 20:52:59 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id ec43so21857972edb.8
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 12:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFBycE3+qKbCLQPSVLOwBIegJGdnIvZfudlDEkXTW5g=;
        b=if/4EqmsonJ9Hkxtynct98Ox97fFgHN59xfvkwrWqJVR3DYxx2TAiiLitQfA4uun3e
         YZ0ioqFBrYPGAAmsRgLZEwowPhKb5a3fvaVqEV7NE/DK28Xh94yi2Z3wk8GAEcPm7cFt
         crQLQJgPRMG9DuzzcJhDFZFFfGgUAWSY/IX+/uPO9C935YhFX356+3tBbhLLInRYCedS
         MiGNSJmmLnCjrIQUZq3cbzh9qUltIcgdD/TS2qdSWDm/KaUeGHCAcTlWo5G2+MJpx+s0
         mWHcgoJjVsY4BwxCHyTH29T+yu02IIvhPsDUE3el8rt5Y8o817F8N65gb3IHVVY0Oehh
         wfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFBycE3+qKbCLQPSVLOwBIegJGdnIvZfudlDEkXTW5g=;
        b=w9iVTue+QYWIxaiHpSjmISvlaUzRiXIvzyx5YT/C2K9Pcbl4NLy7qy0wRttupp5+GT
         iY/B9fN9MBSKgGz+K09JT1+BmGLUbQ750hf71ROaLKLUx1gzwWsT9OTLxzaRjOFYb562
         reyj4I4DsSofK1fWTZys52SiZjJToGD3dyo9kIoLRo8k0IjYbucBumTy12Ytfag9Zw06
         Eekda9kYh+AqmCYhQwVnJiwxKpgDOTcY9m+5RS/DI9lSuDt6xZ/xUpbhVP08YhBR81rG
         lqBTjxs09aKHDOl5S6aVnlsXmfw1BdUrrL01k8cDXtQCWPqj3Eg9n76VTeoKcyUkvQI9
         eKYg==
X-Gm-Message-State: AO0yUKXjMYMJKrMYR3nirSMcsX9TacFhsHTSSyxaCj7CyNmBVOddEfYw
	hSTN+cTNe2xbKsJ3mBVvzoM=
X-Google-Smtp-Source: AK7set+ZMQPYEVVFdv/LXr0buAiwb27Dgltwb/3VATRV0i61jDtiKeGG31e2iZsA760ScdDlkDyzlg==
X-Received: by 2002:a17:906:5352:b0:8dd:76d5:dbc with SMTP id j18-20020a170906535200b008dd76d50dbcmr4122624ejo.0.1677012777724;
        Tue, 21 Feb 2023 12:52:57 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id u23-20020a509517000000b004ad61135698sm2060099eda.13.2023.02.21.12.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:52:57 -0800 (PST)
Date: Tue, 21 Feb 2023 21:52:55 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] staging: rtl8192e: Remove entry .tx_enable from struct
 rtl819x_ops
Message-ID: <76955e787fd161dea83d10e81054fafb3b334b5c.1677010997.git.philipp.g.hortmann@gmail.com>
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

Remove entry .tx_enable and replace it with function name
rtl92e_enable_tx. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index aa0456931b09..f1cde3fc8634 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -30,7 +30,6 @@ static const struct rtl819x_ops rtl819xp_ops = {
 	.link_change			= rtl92e_link_change,
 	.rx_command_packet_handler = NULL,
 	.irq_clear			= rtl92e_clear_irq,
-	.tx_enable			= rtl92e_enable_tx,
 	.interrupt_recognized		= rtl92e_ack_irq,
 	.tx_check_stuck_handler	= rtl92e_is_tx_stuck,
 	.rx_check_stuck_handler	= rtl92e_is_rx_stuck,
@@ -1406,7 +1405,7 @@ void rtl92e_tx_enable(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	priv->ops->tx_enable(dev);
+	rtl92e_enable_tx(dev);
 
 	rtllib_reset_queue(priv->rtllib);
 }
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 71958c7a4cbf..79281c077182 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -211,7 +211,6 @@ struct rtl819x_ops {
 					  struct sk_buff *skb,
 					  struct rx_desc *pdesc);
 	void (*irq_clear)(struct net_device *dev);
-	void (*tx_enable)(struct net_device *dev);
 	void (*interrupt_recognized)(struct net_device *dev,
 				     u32 *p_inta, u32 *p_intb);
 	bool (*tx_check_stuck_handler)(struct net_device *dev);
-- 
2.39.2

