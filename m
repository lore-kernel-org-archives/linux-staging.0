Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADCA72
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:45 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t18so1608273wry.1
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rixj5/i6BGfp1Vs+8IoalsN41TavQQbGb/xLln0grsU=;
        b=YNNkX5DAotwR/s3bsgPw6EnY5CAGY15227xtsfI4Up086oPSeFYdYTYLy6PD6a1EE7
         GEiZWAMqFK/ECO3p0g/ECvhzvZuPrjY1Y1KUm0ahEZgq01MeF9V95/IfYkgThnji0lL3
         5VxS61qN0s9UChErFsNgHoiyhmy2PajFofEYn9asiqNoulPGTKnawcxCU/Bpfi1lndWB
         PWvaWBAXfhC5Sn5TPQS74iD5OdR9epWkGuJLnQ78eTebp+F8iVnNvYSEQR5dbT942OHH
         gbjx7ghi7MTp3mFgHwhOZwQjQ4MyCMQT9WiXt9S/sk6IrDXpCLTZ+HOShrpYdXnLvt/i
         7fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rixj5/i6BGfp1Vs+8IoalsN41TavQQbGb/xLln0grsU=;
        b=ICgdtWMvG4qjRasPKtjimmJvR2Z71TSo1xgvdfYsdvA6KkiDoJLl2FKDkWVt+SsRrG
         akJV09Y42Yipgicp+73vq8queP/QBdgO0M/mB2nYKSVMGhjKMDUBWOuJs2TcXiqGToWW
         f124TLLRxkiYCZQoT9TL7DX+Pnb0I9p4sjoFNz557fugbZwbcDwbrF/R0MwXq9vyYUyH
         I0+/VPr5CPiPxrrtfairthy1sJLJ+x2euH1a4sYu0pIo9BLGHV+G9nID4Wij3mn28/KW
         jpdRbZNzbeat6ekvBgPIO1pDUkJJZz87hSMdiKqV6tscHwaeXct6W9mEb5uJKntVdbgU
         ZtSA==
X-Gm-Message-State: AOAM533tJwwpVr4rmdAOyijDeF1aolaWLSxBEQlSk+wFq6g7Cx9Xhm/p
	xY4O/kkpxd3oUvplvUDb5lcRaGakEGZNvw==
X-Google-Smtp-Source: ABdhPJz33c0/6/QsYDAwgV/lOIosz3avOpUPIZ1H+ZO3L9nfRM3G1p8h82Xz/jO+ylQhfouQ//kd9A==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr14226595wrr.324.1620217063994;
        Wed, 05 May 2021 05:17:43 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:42 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 05/10] staging: mt7621-pci: replace mdelay with msleep
Date: Wed,  5 May 2021 14:17:31 +0200
Message-Id: <20210505121736.6459-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two mdelay calls in driver code located in
'mt7621_pcie_reset_assert' and 'mt7621_pcie_reset_rc_deassert'
functions. Both of them are not called in an interrupt handler
nor holding any spinlock. Hence, the function mdelay in them
can be replaced with msleep, to reduce busy wait.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 296f50fb3571..40bb2e8a1177 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -441,7 +441,7 @@ static void mt7621_pcie_reset_assert(struct mt7621_pcie *pcie)
 		mt7621_rst_gpio_pcie_assert(port);
 	}
 
-	mdelay(PERST_DELAY_MS);
+	msleep(PERST_DELAY_MS);
 }
 
 static void mt7621_pcie_reset_rc_deassert(struct mt7621_pcie *pcie)
@@ -459,7 +459,7 @@ static void mt7621_pcie_reset_ep_deassert(struct mt7621_pcie *pcie)
 	list_for_each_entry(port, &pcie->ports, list)
 		mt7621_rst_gpio_pcie_deassert(port);
 
-	mdelay(PERST_DELAY_MS);
+	msleep(PERST_DELAY_MS);
 }
 
 static void mt7621_pcie_init_ports(struct mt7621_pcie *pcie)
-- 
2.25.1

