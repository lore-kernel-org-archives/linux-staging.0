Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D05C322E
	for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 21:15:38 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id s24so4879420edw.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 13:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676841336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FnARXeUlH8SP3sL9hF5FqRg/oldYCWKd88vCzYsrVf8=;
        b=gmOVl9JbMjaOA0bu1b5yHXa9Qw1edQArY83Zk2Z0JkwuCCXShjPrNavDcwtpO7F0j4
         v7mKMxB5DZXmn+oLeE2qJvQXh9/ncC/dFedduKdffqhEsDiVN6J4LgRwJUt84w1ihcVl
         3ZX8P2LHk03Tie/TPn9rVs493XforbGL2dG/j/h/dZsqsX/NWaKEUEh0WEHio5B5CuIx
         aflqrSMlKooqM0T7usi9vsKHFkdCBHpFuWvnMcAdyIdsdn3y8nQpx1rOMLV44YnEoJlJ
         +xG6Y3CNZmg0dt6/J+Ok7LApnQSeTaaqUFNA7oayP8P/Ai8NiZyiTbmxEs6kMtVxZh2E
         IHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676841336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnARXeUlH8SP3sL9hF5FqRg/oldYCWKd88vCzYsrVf8=;
        b=gufmnLF6fVIxsmg//SgJsvbh5Fc4z1OBC9iAP0oqb8rmOHQC40KVo6sJspEfNKditz
         8WdAH9mkWK3L35P/jnJpWl7KSzgDReLnHe0bmPBbhZM+0+PFPPD5GV05zI6TsuzhNiPQ
         0FW7V86Gd0ray1vmgv/nCpU+A1JBMRTe3Sl8YbdGKKrP53boK4RInoqxEzNYVoR7oxTC
         Tb7uzNZRbJkTI1qj/Beb3KTPDSsdoGTG2mtZisyWv1U78eZfURzc5FXii0knOSRV6aqe
         8tTHf1EPloeamH+mXe7AtGt+mWIgZqaSXBXqsmIBv3Fka/mnC95XtUsbHsJ82BAnx/jt
         sQ8g==
X-Gm-Message-State: AO0yUKW7iDwvg99LBg1rpVD+rjWk/7/q50a+2+ql4jJEfHU7+a/TpxHr
	FZBsACfQ+MS7SG3zJu35iCk=
X-Google-Smtp-Source: AK7set9TBHtisrMThzgiKhDzZGTIHy001NVA0sgocM+rw/8LBRwscckWSaATBqbPJZ50BKRo4QF66w==
X-Received: by 2002:a17:906:105e:b0:89a:8238:3323 with SMTP id j30-20020a170906105e00b0089a82383323mr6295288ejj.6.1676841336315;
        Sun, 19 Feb 2023 13:15:36 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id s12-20020a1709066c8c00b008d325e167f3sm330408ejr.201.2023.02.19.13.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 13:15:35 -0800 (PST)
Date: Sun, 19 Feb 2023 22:15:33 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] staging: rtl8192e: Remove entry .get_eeprom_size from
 struct rtl819x_ops
Message-ID: <1323e1ae2b4f52dc42b7ce5debca5608c9c5aafd.1676840647.git.philipp.g.hortmann@gmail.com>
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

Remove entry .get_eeprom_size and replace it with function name
rtl92e_get_eeprom_size. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 104b16cfa979..73f3d0973a5a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -27,7 +27,6 @@ static char *ifname = "wlan%d";
 
 static const struct rtl819x_ops rtl819xp_ops = {
 	.nic_type			= NIC_8192E,
-	.get_eeprom_size		= rtl92e_get_eeprom_size,
 	.init_adapter_variable		= rtl92e_init_variables,
 	.initialize_adapter		= rtl92e_start_adapter,
 	.link_change			= rtl92e_link_change,
@@ -974,7 +973,7 @@ static short _rtl92e_init(struct net_device *dev)
 	_rtl92e_init_priv_variable(dev);
 	_rtl92e_init_priv_lock(priv);
 	_rtl92e_init_priv_task(dev);
-	priv->ops->get_eeprom_size(dev);
+	rtl92e_get_eeprom_size(dev);
 	priv->ops->init_adapter_variable(dev);
 	_rtl92e_get_channel_map(dev);
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index fd96eef90c7f..00e413a644d2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -205,7 +205,6 @@ struct rtl8192_tx_ring {
 
 struct rtl819x_ops {
 	enum nic_t nic_type;
-	void (*get_eeprom_size)(struct net_device *dev);
 	void (*init_adapter_variable)(struct net_device *dev);
 	void (*init_before_adapter_start)(struct net_device *dev);
 	bool (*initialize_adapter)(struct net_device *dev);
-- 
2.39.2

