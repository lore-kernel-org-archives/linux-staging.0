Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D060C13540C
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136299; cv=none; b=Ya/qsVZR8BdzfGxBoe6PRDga19M+wBsPndPJ4n9UHpfAlf1A0SgrBra3vGSm0/kTou0vEmtzJK97XL9lehkj60OHyMbXgeySUlK5lAI1od7uYpNzZS0KhVXpNUyAfLthcr7qUJ11JQol5db+ouDF+cdYCPJQQuRnWJwc6n/IbZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136299; c=relaxed/simple;
	bh=mDWkLRaeD7jE4mY2ogV/dDnV0AcV9C9S5DYirGLToaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GW3yvtcDKdfqHGJ1jXmqA90X4aNNpKS1cqpaWmPnYyJLnVJXAkSrN04hdlMqvSwPbDC5sAZ1uO6bV++Y8oRumtjE4pERnDYZ6+9IpAvNCktW3oAaxftTmfsTHyWS6ISsytkpkQ1SLn4aDW8H9Y9nHdrLsvx8ACXNVtDo4oOpU+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=GNhht8iK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GNhht8iK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d72f71f222so26201765ad.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136297; x=1706741097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzYk9eLH9WOTdFVZV/EkZvm0zsnXu4X7XxZS+490jJA=;
        b=GNhht8iKeb839Z2TlkCCz+SqhvFD7oqJx8mFYohHWOi5+WNRqL8+gJhFWfC29Esf36
         btanCXQAvgWQGDAyEMmBKENEq7AUIUX0otYnlY/rb8fiiU9bT214ZdbpN9aHPAH2jAsz
         NwWnKf8ttanI7yomgG5wIzPqFd8i2l4MV8JgrWRtTDJGZt1g/iE8Z060Y1UUiWaBXktN
         NWlXn/pTNN6DR/PO1+jQ51RTsX0enAhKe9kv9Da0vnXFx4BGm89KB7yP3b48c+9k9+8q
         JkUocGHsqhQ4Yf3FfETvIlnK0AHlQ+QBYqpj76nsDq4iI36fQKkM1rP8pFFODT+aiRcN
         1vwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136297; x=1706741097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzYk9eLH9WOTdFVZV/EkZvm0zsnXu4X7XxZS+490jJA=;
        b=A+Z1Hl18MC5aIEQheLybQ0NdWZxGJhHJpWTtmRAcwvA3TtNFfgU2/DaMV9oZhYyYX1
         FSBzp+za3HGQMfDwHZCCY6I4fUpV7zMpjbWGRlJxDwRzjJ7urUgiUplPesouIDTfJnZ6
         5jcyJOgzxjWL/AwKnFv2fAd8ABHDJ4NEFPJpBBmXDeAHm/rAQlVl8KkqQvj7pJJguEPb
         jXktaMeSZC6Uli7UR3MgfgaIywSlwUuLlOC4s7FYP2jFfieOAxbZ+xDD+yVrsXF07nBn
         w9Vvc0mv4VeFkLVSgA1xPzHAo0UN6bqeJwcAix14RbmlgzzcXkj4GKYQnT/O9e0Nf43q
         HdCA==
X-Gm-Message-State: AOJu0YwuoI0w30FH4sWSCbVlJztAg94z3m5XMGBRIA9ja8SkfuSaPkPu
	kIA6rkasqZVoCf+4iJcISFhqT4RpZXz4wLQYpG9mTEZ3kzslLM/thf6VzH3V4iM=
X-Google-Smtp-Source: AGHT+IF3fpKD8YiFHq/Vvj6F6RVfXoBS6HD8e9raHdWjggIBZtMS/6hivzeQzVsvGiuBFxOiEmoJIw==
X-Received: by 2002:a17:902:6b8b:b0:1d7:60fc:99f0 with SMTP id p11-20020a1709026b8b00b001d760fc99f0mr87764plk.10.1706136297166;
        Wed, 24 Jan 2024 14:44:57 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:44:56 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/18] Staging: rtl8192e: Rename variable FirstIe_InScan
Date: Wed, 24 Jan 2024 14:44:35 -0800
Message-Id: <20240124224452.968724-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable FirstIe_InScan to first_ie_in_scan to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h          | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 5fd44d0c4b1d..d131ef525f46 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -269,7 +269,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 
 	mutex_lock(&priv->wx_mutex);
 
-	priv->rtllib->FirstIe_InScan = true;
+	priv->rtllib->first_ie_in_scan = true;
 
 	if (priv->rtllib->link_state != MAC80211_LINKED) {
 		if (rt_state == rf_off) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0fdc767d43e0..13a901c0db1d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1201,7 +1201,7 @@ struct rtllib_device {
 	bool cannot_notify;
 	bool bSupportRemoteWakeUp;
 	bool actscanning;
-	bool FirstIe_InScan;
+	bool first_ie_in_scan;
 	bool be_scan_inprogress;
 	bool beinretry;
 	enum rt_rf_power_state rf_power_state;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9d1e9b780bc7..44b36cc867d9 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2101,7 +2101,7 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 	ieee->reg_dot11tx_ht_oper_rate_set[1] = 0xff;
 	ieee->reg_dot11tx_ht_oper_rate_set[4] = 0x01;
 
-	ieee->FirstIe_InScan = false;
+	ieee->first_ie_in_scan = false;
 	ieee->actscanning = false;
 	ieee->beinretry = false;
 	ieee->is_set_key = false;
-- 
2.39.2

