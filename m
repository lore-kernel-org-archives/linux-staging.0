Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3EA55E70
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008945; cv=none; b=k7OqL6M3Tuk5Y9mnXfTxobtRn4pJbL/rlUECQ3zYYBZ7bjfR49DivC00l3tH7PUIKYcIp0ckWp+I+DQUBtjuczq5rUAJhgMGvJtLycfqU1HiiqpacAbkv6zoQ2UGb3WFR/bDpRr4nDup+njL9iz8fRn0XGMwbyS0sW3QMbvRtxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008945; c=relaxed/simple;
	bh=GCNq+oVNnt+RZlMwVce8p37iY6XXUp2uX11yzmD+FkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GBFZZCRFDrVRbavmrlFZFowvO01pwvdNLHEvgpSEAXB17TJ1zaCVh17X6K1Nd2OftEp+JzKqqeg7T8JatQPjYeDaipwNZJeN1V+WQ7fxaXzTRcpF7QF2zZhCV052491tp7GTaLLP1SxvFkBFjb/o34Gzo7u+XYxNouVkRmgwZeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=aD1/FzEp; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="aD1/FzEp"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-21e63b586fcso2563341fac.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008941; x=1709613741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHS2iHHeZrTRnRLklghWgHy9r146lY/Nmb3FNJzmtMk=;
        b=aD1/FzEpkoDJ8kmrkefFjFG9ra5ADECUGASOl6NpNiw5MYUwtevfl2qzO+mNs9M2XO
         TIGoCAF121RbMQrXtFiMLJMr6Ona5xpvdHY/OXXsXJgbib+8LzyRJEuawKgjeeONcBzW
         L4UmrIMayc0J8TE6WoeBal9H7VMLxL4jK7V3zofXBad6sYITVPL3aiUvQb7nLZ5v7OCL
         Nv10qLWiLqPtF/CERLa50Ljxr+Ql6g9qMC1E3Jyq9LreFxA5cScgYkGtrlP2mKJDAuT+
         +mCFRBFwMK2LaUTQZonGmNxGE2Za4VfWaoWb0Fc5EpI6KILoOjNZyyoEOxAnn+eX0/EX
         wBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008941; x=1709613741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHS2iHHeZrTRnRLklghWgHy9r146lY/Nmb3FNJzmtMk=;
        b=TyeR34jhsNRTtLbT46hh8DRztR6wsSU7P3jIoKCAivmXXGAe2SM/HP/OMTlktWZZ44
         XakOXtGVKhA7ap88NUt77iA2rKJrpWe4nzZ9wf43ZagGIuIk2qn0jitDGCW5klKMahsj
         4Fl8UFe47jDzHzhhmawMVrXBd4IO1SBAoSDIk1KPpEPYmDgwcumUBleQR4OrD427Q4j5
         zBenI3tGOFLqj9NGmbuIHl7hGiQ3op+HESj7XtFshlJqsReWL0OcNLlgEtPuyYBS8G2Q
         VPDOfaDs34myvlyJccP6J7oBAUWOButh9otVAXj63N1HDYFmN4Sd7FnWmi6zp7uetZAU
         kbbw==
X-Gm-Message-State: AOJu0YxUTeORbMEhQjonRBJiOs4F8KJ9g0ctxK/r5coCZa01KLf2108j
	y/+p0iu18wlXZqx0fqIcFHraVZwr4yMsgqx24EOGANi4d8P3hHFLvmVPzyEPLg8FpfIfj7IMOEY
	W
X-Google-Smtp-Source: AGHT+IG/mgkan0BMJNDF/FisSsjPJe78YViGAJ404w6kJK8YEcbudpCIZokvAlwynNiKTI473SQX2w==
X-Received: by 2002:a05:6870:63a5:b0:21e:4e29:a001 with SMTP id t37-20020a05687063a500b0021e4e29a001mr10426983oap.2.1709008941699;
        Mon, 26 Feb 2024 20:42:21 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:21 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 18/20] Staging: rtl8192e: Rename reference AllowAllDestAddrHandler
Date: Mon, 26 Feb 2024 20:41:55 -0800
Message-Id: <20240227044157.407379-19-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable AllowAllDestAddrHandler to allow_all_dest_addr_handler
to fix checkpatch warning Avoid CamelCase,

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Fix checkpatch alignment warning
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 5 +++--
 drivers/staging/rtl8192e/rtllib_softmac.c    | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f99cc5b639fe..fc5014f719d7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -661,7 +661,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 						rtl92e_is_halfn_supported_by_ap;
 
 	priv->rtllib->set_hw_reg_handler = rtl92e_set_reg;
-	priv->rtllib->AllowAllDestAddrHandler = rtl92e_set_monitor_mode;
+	priv->rtllib->allow_all_dest_addr_handler = rtl92e_set_monitor_mode;
 	priv->rtllib->init_gain_handler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index a5925fe75a6a..d2f192fa9304 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1493,8 +1493,9 @@ struct rtllib_device {
 					   u8 Operation);
 	void (*set_hw_reg_handler)(struct net_device *dev, u8 variable, u8 *val);
 
-	void (*AllowAllDestAddrHandler)(struct net_device *dev,
-					bool bAllowAllDA, bool WriteIntoReg);
+	void (*allow_all_dest_addr_handler)(struct net_device *dev,
+					    bool bAllowAllDA,
+					    bool WriteIntoReg);
 
 	void (*rtllib_ips_leave_wq)(struct net_device *dev);
 	void (*rtllib_ips_leave)(struct net_device *dev);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d19895220878..c335b24fa08b 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -355,7 +355,7 @@ void rtllib_enable_net_monitor_mode(struct net_device *dev,
 
 	netdev_info(dev, "========>Enter Monitor Mode\n");
 
-	ieee->AllowAllDestAddrHandler(dev, true, !init_state);
+	ieee->allow_all_dest_addr_handler(dev, true, !init_state);
 }
 
 /* Disables network monitor mode. Only packets destinated to
@@ -367,7 +367,7 @@ void rtllib_disable_net_monitor_mode(struct net_device *dev, bool init_state)
 
 	netdev_info(dev, "========>Exit Monitor Mode\n");
 
-	ieee->AllowAllDestAddrHandler(dev, false, !init_state);
+	ieee->allow_all_dest_addr_handler(dev, false, !init_state);
 }
 
 static void rtllib_send_probe(struct rtllib_device *ieee)
-- 
2.39.2

