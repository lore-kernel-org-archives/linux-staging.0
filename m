Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67113322E
	for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 21:15:49 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id k5so5680726edo.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Feb 2023 13:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676841349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkbsuJIz6VwsIVSfK2JskzxbP3ShTN1QUSOlCSaSNH0=;
        b=XOtDzQAq3ERBqYgJBscibnLrqjW93b4cRvR2aRUdzauL+vCexicJb0FcjUWsii4kDu
         g13QeT1J1aZvoA74xIZpIHXCWedKRb6fujCCQOsdPKYxN8qYir1Lrj6/rnfAVQlb2Xor
         aXAryvA+8Ei16j8NaQwiPR2JbuUu/hzDw3AIJqUG32E5ZkZCcyKYSopHWShMjg7x+Ea9
         Gv/9j7Yclol1nDWtW0cZHC7yj/TzyKCLpL8djkDUTn+Odcugc2ZMQZODiYwYyFcwO4lD
         7Q07ECXJe66qkrfc21PMQBoKcWA9FGr9R1UYGj7B1LQIpy2G/omF9Fjal57VdrgqrEqH
         iMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676841349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkbsuJIz6VwsIVSfK2JskzxbP3ShTN1QUSOlCSaSNH0=;
        b=l8r2IWa9+wNIArjhCwVM88s1xzLTjTv45/JwwQG+UKGzIkV766bECj6sAaqJuC/nth
         lxKRW2kY9eJEyPPo3jP8oXlkgpzumEHFtV2XI85ClG33ZQVvIRWX6aFNuqo0BIywprQB
         eizU4IbNCMtT4HNMtwGCQJrRSxVefqi1iGH3qKDB2YSE3I5AQnFot6kamOGI8XavziSI
         mmbRK8nIbu0i3qosiiNTCrfkXQ7i25QZl7apOgW38f0eYwqe16A7izBLs/xV0F27tcQx
         cnccbnDxd77izi/Vbtj8qGW9jo76kpCeHXmV8MrslvtTuoOSOJ+wNyV81ijf1KGsu8K0
         DDVA==
X-Gm-Message-State: AO0yUKXxXM0eFzUb99jxzby/PynfXzPy1ouCVU6xU4iV0RpU49zoIqdP
	zaiAD9wyNMRaEIoGlRdiBAw=
X-Google-Smtp-Source: AK7set8n1jHI8It8rj+KFupevoL6E0xhX6yGnLNLXW2Fw8kgna1z3qeRRsQmbWmCN4j0kO1h8CT8IQ==
X-Received: by 2002:a17:906:256:b0:882:bffc:f2d2 with SMTP id 22-20020a170906025600b00882bffcf2d2mr7958249ejl.2.1676841349029;
        Sun, 19 Feb 2023 13:15:49 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id u21-20020a17090657d500b007c11e5ac250sm4853849ejr.91.2023.02.19.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 13:15:47 -0800 (PST)
Date: Sun, 19 Feb 2023 22:15:46 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: rtl8192e: Remove entry .initialize_ad.. from
 struct rtl819x_ops
Message-ID: <7457e18ea9f3b2415bf41fca8ac2b22349d2edd1.1676840647.git.philipp.g.hortmann@gmail.com>
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

Remove entry .initialize_adapter and replace it with function name
rtl92e_start_adapter. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 5 ++---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 7b8683a9bdb1..3bebc1153572 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -27,7 +27,6 @@ static char *ifname = "wlan%d";
 
 static const struct rtl819x_ops rtl819xp_ops = {
 	.nic_type			= NIC_8192E,
-	.initialize_adapter		= rtl92e_start_adapter,
 	.link_change			= rtl92e_link_change,
 	.tx_fill_descriptor		= rtl92e_fill_tx_desc,
 	.tx_fill_cmd_descriptor		= rtl92e_fill_tx_cmd_desc,
@@ -690,7 +689,7 @@ static int _rtl92e_sta_up(struct net_device *dev, bool is_silent_reset)
 	priv->rtllib->ieee_up = 1;
 
 	priv->up_first_time = 0;
-	init_status = priv->ops->initialize_adapter(dev);
+	init_status = rtl92e_start_adapter(dev);
 	if (!init_status) {
 		netdev_err(dev, "%s(): Initialization failed!\n", __func__);
 		return -1;
@@ -2381,7 +2380,7 @@ bool rtl92e_enable_nic(struct net_device *dev)
 		return false;
 	}
 
-	init_status = priv->ops->initialize_adapter(dev);
+	init_status = rtl92e_start_adapter(dev);
 	if (!init_status) {
 		netdev_warn(dev, "%s(): Initialization failed!\n", __func__);
 		priv->bdisable_nic = false;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 541b7aa366a5..9edadc62faa9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -206,7 +206,6 @@ struct rtl8192_tx_ring {
 struct rtl819x_ops {
 	enum nic_t nic_type;
 	void (*init_before_adapter_start)(struct net_device *dev);
-	bool (*initialize_adapter)(struct net_device *dev);
 	void (*link_change)(struct net_device *dev);
 	void (*tx_fill_descriptor)(struct net_device *dev,
 				   struct tx_desc *tx_desc,
-- 
2.39.2

