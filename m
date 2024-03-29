Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC793FBA9
	for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711710918; cv=none; b=lECfs8oUn831j8ESqt3BqUXlRIZhcicLNF0lughVujMcjcJMy71MKbsVgdI/6d4O9HWQpUCl6EmLh8/xqHhqpoW4caeA9M4pb69JnfU+3qeyZ6PzWssNwwNRo2ATpZOK/sA9Yz+Hn5G3QAs/tFVq+xZ1rJX1wAjVOSQG2iQlngU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711710918; c=relaxed/simple;
	bh=EOA+jVJLIL4PoU6sggptKp83PTQ9H4I6t2TXmnpH+Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJM1+ehttkis/m8ttdBdqR7eG79S3vKtOf0tZYq/8NYdI7jRQ+2HMduHgBPZei8ROporCCsxMTCYY0D9gK08DouSJaGge9Y8ub8RRpFI6PIy7ve0B3ejFAiCQp32ylmFC4UO+4LBh/tU+bFheuL4n7X2e81XYoSd6wKbNtbCWT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7iieoGB; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7iieoGB"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56c0bd07e7bso2162433a12.1
        for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711710915; x=1712315715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6y2nKwiZaKwgK5YzfxmEPHK3AhO3OAbsE+oqfU69W60=;
        b=A7iieoGBL0Ko2vXU9hwrlKP9L4PdF7ZwVXQbrIQGCnqQGT3dIJ5mQERR3bZIbbkEWb
         fp1ib/f8RFBGRy19gUWZvaTz5R/MxMWbacWsHO5DGbxePHOQFA9pwihmZ6ugy4FTpxgI
         T6Wt4eV0Fd2YoUJNfx6V8k9PncDBYLUYmS1gIKSlw216D/TaRs4kxrJVwHXrGKMCmb+I
         T0eftIQXipBv7moTK0UJPWzpmC/cUIuyjp6oyk2eHe0X/09TXM51KI6C2BDrb921xMeb
         NwpJo18TmVSu19nB8jEJqTaMQAQd5/J3jlP0S9PLxqHh78is2FBNn+LKIwskjZMqY23Q
         WFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711710915; x=1712315715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6y2nKwiZaKwgK5YzfxmEPHK3AhO3OAbsE+oqfU69W60=;
        b=XanvzwaPVKSLoA+FDpAZrngRnt75zvEx90bnK2MfhEgiFPHQXInv+vzuc6sRqoefmM
         0cbsOZ8Oz2bOcwhSGMng2kRZJ8JX0dkC+yC691aPFt7sxS/fFDBg0DyUCsA+HHO3BmxF
         GxI5zN2iDG05MYnymmIxFK1S6YTC1zSvTYaEtAT7yeeZSeej3HpRQBtWRJ9LrfK7eyU4
         H+9IbmsG7oX9xfBWXJkePr15176iIEcu1XlQx/QBxY7qbKHugywZwygBaqwtOUQUC2yM
         Ssz6wYH1tlEuGndp6QDkNdr7kgYvkaM8hh1iEwDKFUr+A9vmCQlklZuwSGzncawuQWEq
         MtMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQVULAzOVMbKt4t185P7CYSzp9hvIrOYZI1YJLql6vPd/8OHppNPY8KL8A/j60GuDwzCYGmCjdiOQHVlpG6mVg/yOf3LXkA1EjEQ5muw==
X-Gm-Message-State: AOJu0YxrqfMehKCpkZNgVqvFT6H1u5F13HyV/asknTlytRTkOSKPVDyF
	i/sAOEzrtthunY3t/654jmZau2f7n71GxXVM7YxL/jvIVXTJUwXk
X-Google-Smtp-Source: AGHT+IE5klrgPZzCTIgoZMg7FftfA+RvHdIDLm/hKVpxaSnluYHsG8iorvKRB1Q777aNIaYvqscaaw==
X-Received: by 2002:a50:aad5:0:b0:568:260b:e502 with SMTP id r21-20020a50aad5000000b00568260be502mr1086610edc.13.1711710915192;
        Fri, 29 Mar 2024 04:15:15 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-65.web.vodafone.de. [77.25.34.65])
        by smtp.gmail.com with ESMTPSA id f4-20020a056402194400b0056c4cdc987esm1894625edz.8.2024.03.29.04.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 04:15:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8192e: remove unnecessary wrapper
Date: Fri, 29 Mar 2024 12:14:58 +0100
Message-ID: <20240329111458.14961-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_rtl92e_dm_ctrl_initgain_byrssi() is just a wrapper around
_rtl92e_dm_ctrl_initgain_byrssi_driver(). Using a wrapper here adds
no value, remove it. Keep the name _rtl92e_dm_ctrl_initgain_byrssi().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Compile-tested only.

 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 4c67bfe0e8ec..aebe67f1a46d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -163,7 +163,6 @@ static	void	_rtl92e_dm_check_tx_power_tracking(struct net_device *dev);
 
 static void _rtl92e_dm_dig_init(struct net_device *dev);
 static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev);
-static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev);
 static void _rtl92e_dm_initial_gain(struct net_device *dev);
 static void _rtl92e_dm_pd_th(struct net_device *dev);
 static void _rtl92e_dm_cs_ratio(struct net_device *dev);
@@ -929,11 +928,6 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
 		dm_digtable.rx_gain_range_min = DM_DIG_MIN;
 }
 
-static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev)
-{
-	_rtl92e_dm_ctrl_initgain_byrssi_driver(dev);
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	dm_CtrlInitGainBeforeConnectByRssiAndFalseAlarm()
  *
@@ -952,7 +946,7 @@ static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev)
  *
  ******************************************************************************/
 
-static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
+static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u8 i;
-- 
2.44.0

