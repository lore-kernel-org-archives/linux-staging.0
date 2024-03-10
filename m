Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8963FB8C
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114964; cv=none; b=mDzHJGyseuo5RN0ysf7NJIj8Lj+fh2Hi21QQbTeV/tdGlkyk5xdAJYr9gt0h1wt1mO2ZQPKzMRkqU5NpLlCQexjAbBDKcbzv7B9l2Em9EyfCQCeSARDwM6W6DQD0DvMxyMFGMxOIUiMvuc3cuVZ5Q3UZt1VG8OLUvmrKGbXnCzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114964; c=relaxed/simple;
	bh=0rM740sBdk8huHY4NhOTOHcOY/GxVUJCFjfyR5Pl/4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CjDY7iodSQrdW5xQmvCznZKr1YFGVWMbWfIGILwK2WSSxiUAQvbOwRxpHUeTsknNV2xO/giprs1ZjPSjt4VNPpk+zD3AQjttdURvEbCPai98Hz6w2TdqnHyQ9euM1NkEX57Db5MMt3j8IvXrTOnPVQZpPqg/KpI0xgppYTBoIYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gFWZ3gaa; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gFWZ3gaa"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29bf5eaaa50so26849a91.2
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114962; x=1710719762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7EKp2vsKNvqYuCUlnv6xBioKoVPQsG67LiV/PqaQG8=;
        b=gFWZ3gaaniYEAIWopvQiEj8OhQtRnLGUjieogNa5C1l5HSXpNbdwFF/QHRA8koqdto
         gSOmTh1bATDBp2wyG7zEWZ+3bkwFrK7gHD1lmqNFQt6NC76eJADprUe7m0BgVGA+GAbo
         Q4aTGnmdn9Ls6m+tmqVA4hi5Fy1snUN6QGc8qVsAnPstzBl70oiONOGnlNyJAQUv3RR2
         2pd1bo9RtsB0xR1wXv8jNnm39tLe1Tw5hVlmwej8IY2qPiIaEmBXBf4ZeyXZmqpgFGmR
         ornmwv2sUFjBC+zw+WVLojKF4hjUz43zTvGaPzofa4PcNtW4UjQtSAzokU7JzsvT13On
         gcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114962; x=1710719762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7EKp2vsKNvqYuCUlnv6xBioKoVPQsG67LiV/PqaQG8=;
        b=IQXrcU8vbzAzNkJZiSzlJara51BOAS57THUksEZkcwQOncGRsuey7Nga3JptaHUY6y
         T9QBBuMhuJOfkS/pC5KFo7KiTEVQKqNHAHJ53gi1DdnTztwXE09zjdXNm4pXZVcsTOS6
         +EI6fSEINZLchuWT5VArS08428gfFnOyhdP3bRNnb3U6FjQskx+b76B5daXbVhxWZxZz
         Jb9bGn6nKLmazxWnI+RVOnVhHXVUSDm31r0RUYJlh2FRzJckHY9V52uByplysjo/8P3F
         Gs+WupkgNY4ExkT4fqY3sdDA2zAsBrENvJaeV5nqNgfWqDwJbXC/qAIReBzsIMRgUr8a
         qtsg==
X-Gm-Message-State: AOJu0YzLjpZ0wrxGZa4TwLbKJ/g5B74iM6zCK3iygfLXPII+NpIFbeFU
	Mmz/fOrU3O/UdOxUe7C1gG7TWMEhqc8fGf3KtPmR3dUlR9SnPFTcfFWX7690xD0=
X-Google-Smtp-Source: AGHT+IEyS1YeZzKbvQgPctRBcV6Cg1k8qI2HQXgKh+rzOM36uKfAjbZhzNULukcyyLJwJ52A5lvn5A==
X-Received: by 2002:a17:90a:df96:b0:29b:aae6:49da with SMTP id p22-20020a17090adf9600b0029baae649damr2396493pjv.47.1710114962764;
        Sun, 10 Mar 2024 16:56:02 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:56:02 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/11] Staging: rtl8192e: Rename variable bAllowAllDA
Date: Sun, 10 Mar 2024 16:55:50 -0700
Message-Id: <20240310235552.4217-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bAllowAllDA to allow_all_da
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 41373c013299..e3276d2c3616 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -702,12 +702,12 @@ void rtl92e_link_change(struct net_device *dev)
 	}
 }
 
-void rtl92e_set_monitor_mode(struct net_device *dev, bool bAllowAllDA,
+void rtl92e_set_monitor_mode(struct net_device *dev, bool allow_all_da,
 			     bool WriteIntoReg)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (bAllowAllDA)
+	if (allow_all_da)
 		priv->receive_config |= RCR_AAP;
 	else
 		priv->receive_config &= ~RCR_AAP;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
index 878c96236824..1224f190937e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.h
@@ -21,7 +21,7 @@ void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val);
 void rtl92e_get_eeprom_size(struct net_device *dev);
 bool rtl92e_start_adapter(struct net_device *dev);
 void rtl92e_link_change(struct net_device *dev);
-void rtl92e_set_monitor_mode(struct net_device *dev, bool bAllowAllDA,
+void rtl92e_set_monitor_mode(struct net_device *dev, bool allow_all_da,
 			     bool WriteIntoReg);
 void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 			  struct cb_desc *cb_desc, struct sk_buff *skb);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 3819a859710d..393fff7e6a8d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1477,7 +1477,7 @@ struct rtllib_device {
 	void (*set_hw_reg_handler)(struct net_device *dev, u8 variable, u8 *val);
 
 	void (*allow_all_dest_addr_handler)(struct net_device *dev,
-					    bool bAllowAllDA,
+					    bool allow_all_da,
 					    bool WriteIntoReg);
 
 	void (*rtllib_ips_leave_wq)(struct net_device *dev);
-- 
2.30.2

