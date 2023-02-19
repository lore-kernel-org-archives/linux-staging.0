Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EB9322E
	for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 21:16:22 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id s24so4883114edw.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 13:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676841381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UkQuOoYWrqHzF7sqnR/KeVzMvcxOpAsOg249BRbujhQ=;
        b=eTwBnBmDfQoWeS10EDjwky+rA+UGnxGDFOZhIcHFvWQTCIIKV30OlrzdZAlQHEQA5X
         O6Eg1OP0bujKVNOnRyZuikUHSLjI5kamQeJkX/urCLcSrEVaNG74uQmUAiBA0weYAawG
         yi+YZAxSDRMECPxz1NfT+jGU5dibsJQe0exstoIQ+vAuESkeXhp5ddtBZFIUYWOGzNgF
         qeGboymTNGlTo9HCjkAmimIlsxLZGBYF3lmTP2Io9ecqHN0Pifgm8I8po5yzmIW8rpzA
         AYbFi04H0k6kaGWbI+P9EmtbaBCXv4oTqTXOqxJfBkovr6QUDQ8n2nDxn24gMNQjbRYO
         5iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676841381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkQuOoYWrqHzF7sqnR/KeVzMvcxOpAsOg249BRbujhQ=;
        b=n2YlC1JYz7goZGn+MuxteUJJk4qpu2NamkbzTZ5hUTJyeAjpyLtzUIa2bQhV107OAm
         /gLzJk/ImJgD04/qsd8BPzaC9fnk8NI4q4xhf6P7wumuVF54sw6H1lMYXdm0RkmpWQNs
         oOH0wEw4bmxv1P7fhUYQ5ZdlDumtSqZx1OPOCNn8Tpi1J7Kep6sO1XsDhhpx5K59gIcx
         TOC5vMvgNX/WwvSh7kGY8j397npF7CmIdAdpnQYFV7GCDXTbFDFwBoiR8rZgomAUgUXG
         cRQXcpJPDc2jp0Xd8e5qfSZ5RJEplFEt6fs2cTsb4BwuHtPvbM2uff3tvmooRBGEZcNv
         38AQ==
X-Gm-Message-State: AO0yUKVInIU5d5Et2BewmnZTpfzzUk2egHMdLlZ6LKA8ReFEGgmaRDCW
	AkCFPlAc6SDQ/lQ1scSgfBw=
X-Google-Smtp-Source: AK7set9RxbcbXqVJEalEi/Dn8n3BHyB8HCN8IPRF8iKOMldXQfL00wr8VIAHqgNVB+0NzcqxvvdJGQ==
X-Received: by 2002:a17:906:291:b0:8b1:7ae9:7332 with SMTP id 17-20020a170906029100b008b17ae97332mr9167337ejf.6.1676841381725;
        Sun, 19 Feb 2023 13:16:21 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906804700b008b138641f37sm4820169ejw.24.2023.02.19.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 13:16:20 -0800 (PST)
Date: Sun, 19 Feb 2023 22:16:19 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] staging: rtl8192e: Remove entry .stop_adapter from
 struct rtl819x_ops
Message-ID: <87f874eae22027956b9f1140b8d460ed8b63a9f9.1676840647.git.philipp.g.hortmann@gmail.com>
References: <cover.1676840647.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1676840647.git.philipp.g.hortmann@gmail.com>

Remove entry .stop_adapter and replace it with function name
rtl92e_stop_adapter. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 7 +++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index a4796330f86d..566513338089 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -29,7 +29,6 @@ static const struct rtl819x_ops rtl819xp_ops = {
 	.nic_type			= NIC_8192E,
 	.link_change			= rtl92e_link_change,
 	.rx_command_packet_handler = NULL,
-	.stop_adapter			= rtl92e_stop_adapter,
 	.update_ratr_table		= rtl92e_update_ratr_table,
 	.irq_enable			= rtl92e_enable_irq,
 	.irq_disable			= rtl92e_disable_irq,
@@ -756,7 +755,7 @@ static int _rtl92e_sta_down(struct net_device *dev, bool shutdownrf)
 	}
 	priv->rf_change_in_progress = true;
 	spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
-	priv->ops->stop_adapter(dev, false);
+	rtl92e_stop_adapter(dev, false);
 	spin_lock_irqsave(&priv->rf_ps_lock, flags);
 	priv->rf_change_in_progress = false;
 	spin_unlock_irqrestore(&priv->rf_ps_lock, flags);
@@ -2055,7 +2054,7 @@ void rtl92e_commit(struct net_device *dev)
 		return;
 	rtllib_softmac_stop_protocol(priv->rtllib, 0, true);
 	rtl92e_irq_disable(dev);
-	priv->ops->stop_adapter(dev, true);
+	rtl92e_stop_adapter(dev, true);
 	_rtl92e_up(dev, false);
 }
 
@@ -2401,7 +2400,7 @@ bool rtl92e_disable_nic(struct net_device *dev)
 	_rtl92e_cancel_deferred_work(priv);
 	rtl92e_irq_disable(dev);
 
-	priv->ops->stop_adapter(dev, false);
+	rtl92e_stop_adapter(dev, false);
 	return true;
 }
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index d83af5f8ce82..083bba3dc51b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -210,7 +210,6 @@ struct rtl819x_ops {
 	bool (*rx_command_packet_handler)(struct net_device *dev,
 					  struct sk_buff *skb,
 					  struct rx_desc *pdesc);
-	void (*stop_adapter)(struct net_device *dev, bool reset);
 	void (*update_ratr_table)(struct net_device *dev);
 	void (*irq_enable)(struct net_device *dev);
 	void (*irq_disable)(struct net_device *dev);
-- 
2.39.2

