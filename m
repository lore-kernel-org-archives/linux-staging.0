Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710AE1FD9
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="emsd3P5M"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso201548a12.2
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520566; x=1705125366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cUcEr432jJDPoBzAXGhfAfATW/0uQ37Ygm+1e1bE7I=;
        b=emsd3P5MQGOgR2qVcdHaR4bmxIz/HTONlJ1tYwSRcaFUtt8cM/hwE5RLlmOG/5we8/
         ruZkD+/r0Y7Sj02THX1KwgLiab5hbWlIQ1QkbwgjqS24tjYRlWr8AMV6eJ0KQG8DZJqK
         JHW1lnHGKsy7q/alTH3Cz+9C67bLvWVli/ZkXdMe5F0keyvdH1/7LPaqK6yS5o0EMeBl
         ErnxkN5WeJTx/V6whjZNP1ix3tidgwz7ZFo6vPJTdUazMnkv8O+OON5g8Tm8baXbJwuQ
         1qptQa1xLW4jtf09/gjpg7omXiGi5038iKFPZBK5CgFTNeEOe5Ea+TxIITEA24NxoASK
         Srmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520566; x=1705125366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cUcEr432jJDPoBzAXGhfAfATW/0uQ37Ygm+1e1bE7I=;
        b=TkcYyNG81HljG9LorwumsebYdQgIEOnt/lR94OfGsPtaZAqQ7GwO1MufBs1WFuowNP
         5DP5gm0PKUz8h56qYvA/gHXPi7PiNlMYl7NPsnyCiJcMo7XkFLeQx2TxrRpzCOXEULkG
         4grQMGHhOMh2z9FkM1b77FCfbGg38bWT56lqna0Hm/PWl6+WsFINM+z86HCcRZ0+SS1C
         f5frmAycTvXpi4nl/81Y9+sgMwFWPMcVREFGydQVYMlikrrC17iKOeiV+jC69BSMAZ6/
         YC3h5U3QURfPVKjuBjYNacssp0On3JcX6K/pdVh4yILDcOAreN4U63CBhSjEoLnx4EJJ
         Z5dA==
X-Gm-Message-State: AOJu0YwpXS+0vy+kWoXEcNGDGyHwVHwoUoEb3VK1ZVv2qttFYrYN+qKu
	IK6pUkGpyVyY31JvN8UZIOEVuK/tBsflCQ==
X-Google-Smtp-Source: AGHT+IHaGvh6PP6Sl9ViixIGJEkv8PKMYN2FB+1f5L9+Hc90DKBQf6mP3KKiEzSNGmO2zGO1R8t0MA==
X-Received: by 2002:a05:6a20:8c23:b0:197:5be1:262b with SMTP id j35-20020a056a208c2300b001975be1262bmr531663pzh.83.1704520566578;
        Fri, 05 Jan 2024 21:56:06 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:06 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/21] Staging: rtl8192e: checkpatch fixes for rtllib_softmac.c
Date: Fri,  5 Jan 2024 21:55:35 -0800
Message-Id: <20240106055556.430948-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series' focus is on fixing checkpatch warnings regarding 
drivers/staging/rtl8192e/rtllib_softmac.c

Thank you in advance to reviewers
~ Tree

Tree Davies (21):
  Staging: rtl8192e: Remove unnecessary parenthesis in
    rtllib_softmac_new_net()
  Staging: rtl8192e: Rename variable SlotIndex
  Staging: rtl8192e: Rename function rtllib_MgntDisconnectAP()
  Staging: rtl8192e: Rename variable bMulticast
  Staging: rtl8192e: Rename variable MaxPeriod
  Staging: rtl8192e: Rename variable bAwakePktSent
  Staging: rtl8192e: Rename variable bSupportNmode
  Staging: rtl8192e: Rename variable bBusyTraffic
  Staging: rtl8192e: Rename function rtllib_MgntDisconnect()
  Staging: rtl8192e: Rename variable bFilterOutNonAssociatedBSSID
  Staging: rtl8192e: Rename variable array Bssid
  Staging: rtl8192e: Rename variable NumRxUnicastOkInPeriod
  Staging: rtl8192e: Rename variable SlotNum
  Staging: rtl8192e: Rename variable RemoveAllTS
  Staging: rtl8192e: Rename function RemovePeerTS()
  Staging: rtl8192e: Rename function rtllib_MlmeDisassociateRequest()
  Staging: rtl8192e: Rename function SendDisassociation()
  Staging: rtl8192e: Rename variable bHalfSupportNmode
  Staging: rtl8192e: Rename variable PMKCacheIdx
  Staging: rtl8192e: Rename function GetNmodeSupportBySecCfg()
  Staging: rtl8192e: Rename variable AsocRetryCount

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  8 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 32 +++----
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |  6 +-
 drivers/staging/rtl8192e/rtllib.h             | 26 +++---
 drivers/staging/rtl8192e/rtllib_rx.c          |  6 +-
 drivers/staging/rtl8192e/rtllib_softmac.c     | 86 +++++++++----------
 drivers/staging/rtl8192e/rtllib_tx.c          | 10 +--
 drivers/staging/rtl8192e/rtllib_wx.c          |  2 +-
 9 files changed, 89 insertions(+), 89 deletions(-)

-- 
2.39.2

