Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765382185B8
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504433; cv=none; b=pWNgL/aJJH7cKKz54rstRKwqT9JrpHX7/TQ6wl69OESrvf4CxisYqR70qmWxPjfAwELzOa75uqwMlkDMCxIxbDoAqhFxXTwln/w5wgYcN2nRBZ1xw7jOvH/d7R43o6DWKn8Z2280Zr934a6ZLUF6DnG7YjKXTDUFp9EPKV5n3SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504433; c=relaxed/simple;
	bh=spShQhbzwsDpuuBCF0J00kLiKd8sC/VG38gYV30hMzo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=humAcnfdmJ6YL3OW0ISVD4juFv02heZcjfUvaCNbmxDVrCu485bnzxTgZb89ceAHQaFrRpKbhrnxvEyQoJ6E9xUY4IUxe7dgywrq5z0CgLnIxKFxsV0ZqKCt7W+mNPH6qcIugxxcS7c/9HGVl99iRkqKGKzmAAePOtEEcrKcIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0dO4uWP; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0dO4uWP"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e278d8345aso265013885a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504431; x=1754109231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EZ13gOR4MCpjhKGk8VIh6hqTqWWLNSk/iwMXtaMPUY=;
        b=e0dO4uWPH/3YpxQ7XJTLPrBiZ0Rx4utkTEX2tlJTJ6RMdUq3sJ92pA3vJSmOYJQXZ+
         skaAGaKBl7Srq2EgslW/xpOQwLYLTsLZKPXEff6hyULmaqawElbpwVKsOhbuYO3moR9A
         nN3wZIprqxJl7BnVW7YHpzoSJ1wGV/gedU0pnmJfZkycn7TceJRbnhfUjE9ZG6fg/NM+
         yreuRs3w7j73jez8Jtxvf03OD7d7vacM5gQG6hITg22CXOogCRJZhWHVmTiZtPYbqalj
         8LFi+W2JNtUiE4Z3bNfUjok0gLkUVR+6Bos27lfq3lxVVtmfTcIy6VZwjoaYodvocrVU
         kAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504431; x=1754109231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EZ13gOR4MCpjhKGk8VIh6hqTqWWLNSk/iwMXtaMPUY=;
        b=ReQRdAk2T2XFho1WxU8wLv4N0RYlQbqkK67iMTViFBNhF4B1Y9brSGF9whuo81bSiZ
         fxoNDjCmZbxA66oV1l/BnpmpZwAbGctbdYmgiDnImXa41bNllHlhCKfy87hHK6x4hLeQ
         kqkg6LGozXqMz3N2j9Tsux1hjdykRLms2jMnS+abycbaro7lsLE2M9+kV4iOIzNzBtB5
         LuAiMUf3xD8I9JL3lXbeevCOMY6PH2nPThcq7zdorHWp/TvoC0XQGuQ2iPtrMVewCs3A
         N3qjFdod2tSP8mVnVbRWBGBtYJSnqWCM00DcmES/9AURCxPOZ095PWgxPkRF1bYuehMX
         vI8Q==
X-Gm-Message-State: AOJu0YxQehr/KdNCsAH1TRoFXqWOzCcXuUYlW4b3YZLHe9l68gzfx8kj
	6DdQkVIsJXX56SAmfNBZmJzK/E7C5/omM+irGVqpaB5AY0KfabenIYHM
X-Gm-Gg: ASbGncs6JIEN/2JD9gnxd2Yxsf8GNgXjbGVC9PV+f31wAyktz3vyoowS5qNTIG269Ae
	1r4Iuouwc5VkxDEl9ZSXHpl52DvY8Zu7AlOSmFhsZhStmSbYUFpe0dQudTULgE5lDMGmAqL1PfP
	9RJVxL2ozfXZK+8AeJ4mVHRN2MWVyz3XLtGgGLl+vcAdh3PmQUswDHF8B9nm8lp33RlNGhnctUj
	cjmj64kCHF5QBkEjUoMsEng+exMWsoF8TcU0laOBKsU3mJEyj1ZQeVGrG0/D08PliGKBnHkHc+h
	nbDevy0By7wMQKwmwzy4/0QbtsLeTiHQL6qzGjKuZ/1GFYyVMDk9nfG36ZVSc3wc0Ur//WLAbif
	M3GaEpRRXoS8BiMXnY3IWYVIqESrdeX5ACo8Y/X4MIuezRETaKp8=
X-Google-Smtp-Source: AGHT+IHSWMa30iDJm+pBR8Q765qRcpjOUuLJpjvifMALXHOQqjnCpC7lXlrGDs+Vnb96ZoSfDY4SPg==
X-Received: by 2002:a05:620a:2193:b0:7e3:4417:2b14 with SMTP id af79cd13be357-7e63bfad12dmr592154585a.61.1753504431314;
        Fri, 25 Jul 2025 21:33:51 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:51 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 11/20] staging: rtl8723bs: remove space before semicolon
Date: Sat, 26 Jul 2025 04:32:09 +0000
Message-Id: <20250726043218.386738-12-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed an unnecessary space before a semicolon to comply with kernel
coding style. This change affects a single line.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 161f149bf244..547734f5492e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2105,7 +2105,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
 	/*  adhoc no 802.1x */
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ;
+	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0);
 
 	pdev_network->rssi = 0;
 
-- 
2.39.5

