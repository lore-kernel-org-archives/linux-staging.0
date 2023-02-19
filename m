Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EE1322E
	for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 21:15:44 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id i31so2924147eda.12
        for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 13:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CNKm2ICS8NTcE9li8wqc3yPoX8R5OlDOV+QO9nDi+Rk=;
        b=T6l0u7h2r5bDEzKhCuMOX5vwH8APMxKVNNOiSC/e8tLHeKNSHx1VgVQueGNayOrp6R
         v5FBLKlOsx+jxt2IQJRc9Ke/iaH1NyYES+uT2D/jugsWPOZEZNDt88eHDtgUuWOUReup
         rQRj1x+Zi7tcrlLFIxtRA3GCc8tkEtQQUFmV+9kHZRPkOvq9i+ccHWKhaSQEY/dBG5xp
         PTA6pdh4tp9sxrZm5+WRsPQwTzqRiWLgKmQfnmnnJZfW8llj4Eume4G6IcL/uxf5jggw
         3YT4pW78YA9RdZbvzJKTqV3vRPVE+Ewc5uT+SKvEAoY3QqOLuZKA4L/jSuy/dY8pgTZO
         Dc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNKm2ICS8NTcE9li8wqc3yPoX8R5OlDOV+QO9nDi+Rk=;
        b=IyVH3DmSSt4It91yumC0lRRDzZdF+by9gkpibU6OoytHG/BEQAzoPCZAJ7phZt0Jio
         CCaw+ZAXZ9beuygHcQEpuzDUuydSWDyZcPbj+0K/aWyl/LSgG0sXpCUK9EzUObD+12ID
         ETf8uCZkIYG7BTqSg1tIcqoCNRN7u/zo0uAdD+Pek3WhW7n0GHgzKIQ9CYfHmJasNxWK
         8Sk374/HNAE1oQJCTP1TFUF8yRS5zhVfyTA0Md2Hsl69guECTvfBVRKffTa3QvAzlny4
         pxgsku3h70z86dsPjgaXz/LWrofz2t1SGuQ6fOMzJYApN5X05rVcXYVGz0KeHmam9CMp
         rlfw==
X-Gm-Message-State: AO0yUKU+aLwtlhBdaXqpwFXr95vUr7L9HRzaEiZ1B8mgGJ71oQN40bKe
	Kxsn1imz8KyOlYhIxXEm1sE=
X-Google-Smtp-Source: AK7set8Z+/HFpC2Eg8xMwXru6lOSDfRdE4Qu4CcLg4my6aCpDp/MQLk7NvVTZkSiCOreqSs4ImANDw==
X-Received: by 2002:a05:6402:d0e:b0:4ac:ce7d:a9c7 with SMTP id eb14-20020a0564020d0e00b004acce7da9c7mr1056616edb.4.1676841342625;
        Sun, 19 Feb 2023 13:15:42 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id o1-20020a50c281000000b004aef4f3bc26sm925604edf.87.2023.02.19.13.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 13:15:41 -0800 (PST)
Date: Sun, 19 Feb 2023 22:15:40 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] staging: rtl8192e: Remove entry .init_adapter_.. from
 struct rtl819x_ops
Message-ID: <cc6134e1cf43a8b74615f9eb4377988e3edd0bca.1676840647.git.philipp.g.hortmann@gmail.com>
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

Remove entry .init_adapter_variable and replace it with function name
rtl92e_init_variables. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 73f3d0973a5a..7b8683a9bdb1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -27,7 +27,6 @@ static char *ifname = "wlan%d";
 
 static const struct rtl819x_ops rtl819xp_ops = {
 	.nic_type			= NIC_8192E,
-	.init_adapter_variable		= rtl92e_init_variables,
 	.initialize_adapter		= rtl92e_start_adapter,
 	.link_change			= rtl92e_link_change,
 	.tx_fill_descriptor		= rtl92e_fill_tx_desc,
@@ -974,7 +973,7 @@ static short _rtl92e_init(struct net_device *dev)
 	_rtl92e_init_priv_lock(priv);
 	_rtl92e_init_priv_task(dev);
 	rtl92e_get_eeprom_size(dev);
-	priv->ops->init_adapter_variable(dev);
+	rtl92e_init_variables(dev);
 	_rtl92e_get_channel_map(dev);
 
 	rtl92e_dm_init(dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 00e413a644d2..541b7aa366a5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -205,7 +205,6 @@ struct rtl8192_tx_ring {
 
 struct rtl819x_ops {
 	enum nic_t nic_type;
-	void (*init_adapter_variable)(struct net_device *dev);
 	void (*init_before_adapter_start)(struct net_device *dev);
 	bool (*initialize_adapter)(struct net_device *dev);
 	void (*link_change)(struct net_device *dev);
-- 
2.39.2

