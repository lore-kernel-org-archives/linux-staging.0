Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C911F410D3B
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971198; cv=none; b=A2E9Avv5gphdpILHdNe/Tn1796YJZXf3hZsJLVI+VBGC7y2UwzumUtXUG7ARl1qhpgRkWZDvDnk5/inpIfgzyfbb0kLoWeu3XAtG0NDXg4QBml5bzIlvIgq7Hq3ywt3z9zswlhH5mJmNl3HvAwKyod3U6+DAa+qBKO4XrnahaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971198; c=relaxed/simple;
	bh=N/gwP6Kw713DVJ6gb4TQ7Ho9wHTLdAD1wlFdzd4dOP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJWh6xVpIoQPLbkfCGKEv6G4SNRCAKaFmq/D7VwUxs6Dxdsnzmrn1Zt5IYtThggDC6GYcFqnNEPOBXsXeSYty3d2khCfIfU0S3cpurSenK+WSQCbi4QysZX5nDJsuPIdpyWr4wKyJ8DxeGwuaTgrhQru6c9HI+cZMPjYnQ61gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muH31Fwo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muH31Fwo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso58965255e9.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971186; x=1775575986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZtupQHxoyxU+TuHxlXKDWJhqWX/uW8r+feDBWQESKE=;
        b=muH31FwobXbRoKK6NTXUw1j0vK7pwl/MhxDyjK4AWcovjtzCBmC3l1y0Cor/GH+0tu
         5goRJtNeYiOO2trDavdmGGFt4Gkt90B8ouEiXvYnY7yRBkDFQ62b8BkPou2YMuAA/Uzs
         rha7KiNCDRpTmiMM7zORyeoqCIrx/ayEJDiXXmcT9agBXeB21/IJkm/s+aVlByb2oSoM
         jGUXGaF9OQLVyWpCHPvpGUX8kEni+l9K0K0pqcuNZoOu6MFistxQSZbKNXqPMAmNG9Ks
         dgF5raiiaIMQxY3y6UmT23Rc700FCZtiwVFO98Vi0q32ib9Pi0qw+pqY3eU1VCt3Q9rY
         ZS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971186; x=1775575986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZtupQHxoyxU+TuHxlXKDWJhqWX/uW8r+feDBWQESKE=;
        b=EfHgwLQUEkSyPuDIZGxY2IsGJr2+99MWrikf9L7WVRq8QM71ABwEuKYF7Q4aHmSfxX
         1tE4bc7au3PjHRHzDib7c6CI3DUalo5y2L5hNrAjYNH4oFFNh1QdO3xV+vRpfnjOiu5P
         a6/dp3UMFw9xq9tWCtTfuVqxgnDgR2pdcHelW3kAkYqYL62WsZFxwk4hFl2rumqXcdXp
         7YPdjyaS/wr0SGeitioq9oAH6t9hNbHr/l7ZV2TNW5H4nMGn9XwkUWa7tk44pYdZWT5D
         uY+oeHMgYa0/DK4gKBvS0H3gJB2FaOX8c0bS2VI8jSTogwLyBE43OppJouBdIPntlIPH
         JBug==
X-Gm-Message-State: AOJu0YxAnyRQmtQPQrrq8rOb0PMm4xImDXzrjHBJmXE0Of1VkJILpvfK
	vTBd3Kmnx1UfScEDaNKATN7Alhl/3QDlF8ozf6g+8HVfpoFPJ5I8i93H/rzR+S0t
X-Gm-Gg: ATEYQzzrWKMRWBxloXxxF1reWdhDQXGISezJofVJu79w2cv0XUEMt/P6aDSvm1fdgx8
	ZE+jETaVIncs6q/pHaQQF/sy2SQZZfcm91Srm2X9ro+4DQzzMRrSAISbbCh1alq+SLfNVTVeA+H
	Xep8SdEAuIJNQzeODWTG3p7+s4sTdLb7oXfzuZh8OpwwZB56z5uBHXoDt5wpzSh2X4C2H3/IeqC
	77UJPjYEpY/k08EaMd9aNAU7u3WkUmeJvNwV3xpdn44AKBMoq1lB6cGbpqFrXcDWTq7ZaVTBs1H
	AHfA/HdkYVwYM37raw6WzK6sR0n/lmSNoec0uXZeQirvEhLas2R3Fri+VpSqMsNBBGi5BUeNOMn
	0c4Mu4joxwOefrwmf1d7y4oxea7N0PHGQ2YlRk/4HzZjyiD7Aq+WhXZxNc2sjWdrcDgqyzg2gGO
	ek57bCrUniUzOdXmsemrWUCA==
X-Received: by 2002:a05:600c:8b03:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-48727ef1756mr323087115e9.29.1774971185383;
        Tue, 31 Mar 2026 08:33:05 -0700 (PDT)
Received: from potato ([31.176.162.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aceb230sm21653485e9.4.2026.03.31.08.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:33:04 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: remove useless line in rtw_sdio_if1_init
Date: Tue, 31 Mar 2026 17:32:51 +0200
Message-ID: <20260331153255.22764-3-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove line in rtw_sdio_if1_init that just sets padapter to itself.
padapter is allocated at the top of the function, put inside the pnetdev
priv (rtw_init_netdev), and retrieved with rtw_netdev_priv, which
doesn't change anything.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 64618632ee78..8412331c4949 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -247,8 +247,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	SET_NETDEV_DEV(pnetdev, dvobj_to_dev(dvobj));
 
-	padapter = rtw_netdev_priv(pnetdev);
-
 	/* 3 3. init driver special setting, interface, OS and hardware relative */
 
 	/* 4 3.1 set hardware operation functions */
-- 
2.51.0

