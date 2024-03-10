Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18FE3BB47
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114959; cv=none; b=GwLmQo8Si+ianYJrHPNTRDKvRTsQUAQy/wBB2mw5wA6PfrgkSA1OBYmUhfV5HeKv0ZEH7I1lX98lEGcJtPJ9fu6lgVmef2pr9DmiSs2PHRxsTnuR04CTLE1/httZm1ZmVlIWyPrLg9J2lBfTrN20ZY46CRzuG2LkJrHpQqG29RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114959; c=relaxed/simple;
	bh=3K0sO1C4XLSXE8b13C4nNIhyadNMqY3iN3rrAQeDfb8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dRxd+jV/t8AfVsVhh/K7VZ6mrOGeQEjdXXLQmlP1tALLS23sdZ6em9KSs52fQ/MSJHwxSDcYXMAAGHkyNvN/rRmtb+3bkcPoKc6AZFo47UgizrfNyTJLZEhDAJ/1NYbxVKpSu2/hFEDpAphwpcd3l1nXCJ4UpQThNDTULc2kTtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=QVKjOWAx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="QVKjOWAx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29b9c60fe91so1685335a91.3
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114957; x=1710719757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O21vPxTFfXzVjkRb4ZxaMigBSRssVgbLO2eIiMZRryw=;
        b=QVKjOWAxwj0cmeAfjzLcQIEOGPeqORT4LW2mHe6CColsbUkjuVAfhrL/a0/DON/UFz
         0clxxqKBWhn/uUTRbhPSo2/HBW8PvKh9WmWxfUZfsW7SCuJ6wlm+D1EDsJZqq2gwqRD6
         /on0XGEofmi+MYJDhh9M3k64xFztDAfpdHe/Us2YFQYWhqts45eJZCVNENgP0dqj/lrG
         W+CnKgfimwNGtmQCJSJK66Tzbdn2ZN+yiDYUnIAScBl9/+JDDXwDnFFA26mqomlAiCDr
         qnLpij1wEX9qDySjagxNS21TvQWBWtJgUEW3IEbKNVGdPGUOjtSPKGV0Xv5faQfPMHhv
         cJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114957; x=1710719757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O21vPxTFfXzVjkRb4ZxaMigBSRssVgbLO2eIiMZRryw=;
        b=cau2y5IowBpv+WUMPofD2hqCxIz/jEUEKWy7xPl1h2tit+Cvo4t9fLO8cZza5VRGnR
         DrmAqMvSzFlCe99X2zGXFA0Z4eJZv3tGGTx0gE6iac3/oobwsoFT7UE1lclizsnudsEA
         4LNcco5pHa5mZ36fwQXs6RU1QG0Qv9JadRgRxfwcJUiPwtFjJ/wSlecNmbcxnSS4u1pa
         CWEfhbNSg3eodh3PSxX+we+aGoBgP4AbzcSxc6uBF6CMNVNyqamhDCb9bZ/LKQA5aAJT
         bqFYGML67tnryqwBOnPYLE2y8DtOfQevnHZEMrjWS1UCbgzf5Am7f8enGq7/MQ6bZ3nN
         4fdA==
X-Gm-Message-State: AOJu0YzITKpYOU7nqx6zB9nXyoL/lr58r2TTnjDHGMCs7F+e5IQR2zwM
	IcsYBWAPRQIMTNpr242h8JQS9sfaLxbvA+7B6HvRVpvmPmSJcAde+keLNviR5hM=
X-Google-Smtp-Source: AGHT+IG80U2lYnIb95/FIBq/xcNYhI2Eh4gJda58mSg/SdUj+hFqN33boAFHMBHJuUtkuJQH53XUyQ==
X-Received: by 2002:a17:90b:3a81:b0:29b:efcb:7e7c with SMTP id om1-20020a17090b3a8100b0029befcb7e7cmr1007369pjb.24.1710114956974;
        Sun, 10 Mar 2024 16:55:56 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:55:56 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/11] Staging: rtl8192e: Rename variable ReturnPoint
Date: Sun, 10 Mar 2024 16:55:42 -0700
Message-Id: <20240310235552.4217-2-tdavies@darkphysics.net>
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

Rename variable ReturnPoint to return_point to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 649b529657ba..08d057ab8f74 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -964,7 +964,7 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 		     MAC80211_NOLINK) &&
 		     (ieee->rf_power_state == rf_on) && !ieee->is_set_key &&
 		     (!ieee->proto_stoppping) && !ieee->wx_set_enc) {
-			if (ieee->pwr_save_ctrl.ReturnPoint == IPS_CALLBACK_NONE)
+			if (ieee->pwr_save_ctrl.return_point == IPS_CALLBACK_NONE)
 				rtl92e_ips_enter(dev);
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6fbf11ac168f..b2b8947da89d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1051,7 +1051,7 @@ enum rt_rf_power_state {
 struct rt_pwr_save_ctrl {
 	bool				bSwRfProcessing;
 	enum rt_rf_power_state eInactivePowerState;
-	enum ips_callback_function ReturnPoint;
+	enum ips_callback_function return_point;
 
 	bool				bLeisurePs;
 	u8				lps_idle_count;
-- 
2.30.2

