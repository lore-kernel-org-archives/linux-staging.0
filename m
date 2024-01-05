Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FEB23747
	for <linux-staging@lists.linux.dev>; Fri,  5 Jan 2024 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFyF4ZAl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cca8eb0509so15855461fa.3
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704447168; x=1705051968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ByzwZGHe2vxw8uFwYxJ78SuaBAL6cggpBYAyl9030dc=;
        b=YFyF4ZAl9xFYRkbT48yi2wWmgPwz/jDfm9dfHnLjf5BtAUNc2BXXKZ8dFbYJ60ZjEf
         D5jEsYWUBXKSu7YG4f4k7QyCiScYP/N/e6kxlFkit7o9xTeQbLbbvTQ4RyKkcGUnSKwV
         XshJRytEtBHDsFurgW1q5vDUqd7KT8rHjQg72RWz/w+H0cS7JaKxr/BzT+dy98ocxovQ
         5jKf0pos+ghsWFTEzx/CElcJdLTIF5uRjE06LWkfLTyrrXnll8Zxfbc+yK+HTESSpDFh
         +d00ydnY50riPw5W9xMWhvspL6pg99V046ftLofNnnJ2jY+3pzr/NbAksJbYhNcAVQQ0
         JFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704447168; x=1705051968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByzwZGHe2vxw8uFwYxJ78SuaBAL6cggpBYAyl9030dc=;
        b=R3vTGxy49N76053U+rGglWzo0qASGOY2XpWjsGyxE+VdvOwQlvstxJ/+kVq/1QWCJE
         hdGiiHarXsxdHS4lCIBSvvzBijXs6yBcXUF7B/6L+tyELVlli2SqJ8t0NKvjd+yY3ezh
         /P4//TaRlG+6MMJtPUa/5fW65INb1EKR8a0qiFkplac/HMHnGzFGTBlOQ3wsAN0A3foQ
         wAQYvCVA6FD3F0mMKjZvDPTUvoHCErugChteh2lSaZwGvlvi93ZDwB+YilhqYL1D/f9n
         Rh1h7dsJmEVcwOoaBp+xFg0SirVts5jLKwKylNoBjEXm/Tm1CYXCY7QvpqY7Wg3ETmeV
         pFkQ==
X-Gm-Message-State: AOJu0YwW5C30zIeCf3y/jLiPRIH0NU6CTyArTe58shjIul5wYjCmsO3L
	MvzUrL/ZCoO0IuN89+ODQqs=
X-Google-Smtp-Source: AGHT+IFXft7wZ3/+4JSVA4Zv8xNgK2YCrmv+Iqwmhw2YCnQdDT4+DX7aAPzeLbFmrc/spYOXsyc7YQ==
X-Received: by 2002:a05:651c:547:b0:2cd:15ee:fa8f with SMTP id q7-20020a05651c054700b002cd15eefa8fmr1028470ljp.55.1704447167779;
        Fri, 05 Jan 2024 01:32:47 -0800 (PST)
Received: from localhost.localdomain (ip5f5aba64.dynamic.kabel-deutschland.de. [95.90.186.100])
        by smtp.gmail.com with ESMTPSA id b69-20020a509f4b000000b005557bbb81bfsm774885edf.79.2024.01.05.01.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 01:32:47 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8192e: remove return statement from void function
Date: Fri,  5 Jan 2024 10:32:16 +0100
Message-ID: <20240105093216.13981-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove return statement from the void function _rtl92e_if_check_reset().
Found by checkpatch.

WARNING: void function return statements are not generally useful

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 5107d06a9fd0..6450f86c563e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -909,7 +909,6 @@ static void _rtl92e_if_check_reset(struct net_device *dev)
 		netdev_info(dev, "%s(): TxResetType is %d, RxResetType is %d\n",
 			    __func__, TxResetType, RxResetType);
 	}
-	return;
 }
 
 static void _rtl92e_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
-- 
2.43.0

