Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C73F2C8B
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 23:16:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d27so19843792wrb.6
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 16:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vn9bvwuSnFrh1rfvBJWnxWxgqxQ6ttruWdgg8+YeWQo=;
        b=ySrzRkpl9HxxQ8TjCRC4GAuMcEwbarPCUFE/BwSh6d24lkF+9SWXAjfNNY86C8qfJo
         UukIwXA8NtV/O4SDz3n4i90bMUIzmjsZq2i8SOvAVxjbz5Q3KwQfmi8X0iaJ5m4G+wwp
         eDo+evFsRLZlKMWjRQCIHebGbnV8uaRi/1AKHe1t3PMiNF35v2U0N25zUN5jZGrhaerM
         ALpn+WNiWSc0uMxs4UzjZSUVv2px5LYifLefK7tSyhS1hrY/K7cYRfEURai0a1mYeETA
         9aKwUsexp/K8k48LoGS8gRZGzTxA6kz63yqacdEqnVBdOwvAtsbwguxZVJ/d8s/of676
         uL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vn9bvwuSnFrh1rfvBJWnxWxgqxQ6ttruWdgg8+YeWQo=;
        b=FIAuXXwb+1+xqSxySIn7e8q+xE9Wu30W2lkO/kdsFpDlmEBwXsuFISptaBWmBHQmww
         ca1yANGj9SgwBkOlRYL60RKBezbjothMDPj7LRPQ0PfVLYHiLd2iKqj4a275GALPs/l0
         mBNMPNK74riCfQm+a8vhpwW52OxcPYfqMMiDooLk4x6KPZnydPPNuSAnvDnZiiejoFYo
         CeAWHnSqNfqD2gD1bbxP2lq/Zamn4SSgh+9w8SW3ONS7ASfy06cn2j4lsKkWzuXY+QtW
         FH/Uc+mmtholGOckr370kevvyI62Qy8aOUIDEFFdNxJwS4wx94W5M5VyUUj8QL5Aa2OZ
         /tdA==
X-Gm-Message-State: AOAM532MY5HNtq9xoVNGkYgrpSnOkW3Ou8BI3U95eMVXdi7SDJ6vjHrE
	ZjfrZvo5IzrveOKWhyyXTU3avA==
X-Google-Smtp-Source: ABdhPJzjiST8k2Rnflr2y+oZ+zZq/hFWFzAChwT6eOeC43xwQxh3mIw9xnCsgAukbVqsOfco3KwlhA==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr81808692wrw.151.1636240598837;
        Sat, 06 Nov 2021 16:16:38 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id 4sm16320389wrz.90.2021.11.06.16.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 16:16:38 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 1/2] staging: r8188eu: convert final two MSG_88E calls to netdev_dbg
Date: Sat,  6 Nov 2021 23:16:35 +0000
Message-Id: <20211106231636.894-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106231636.894-1-phil@philpotter.co.uk>
References: <20211106231636.894-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert final two MSG_88E calls to use netdev_dbg instead. They seem to
contain useful information so rather than delete them outright, it makes
sense to convert them over to use the kernel's dynamic debugging/logging
facility as other network drivers do.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 8c00f2dd67da..c12c3b37d889 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1660,7 +1660,7 @@ void rtl8188e_read_chip_version(struct adapter *padapter)
 
 	pHalData->rf_type = RF_1T1R;
 
-	MSG_88E("RF_Type is %x!!\n", pHalData->rf_type);
+	netdev_dbg(padapter->pnetdev, "RF_Type is %x!!\n", pHalData->rf_type);
 }
 
 void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
@@ -1713,7 +1713,8 @@ u8 GetEEPROMSize8188E(struct adapter *padapter)
 	/*  6: EEPROM used is 93C46, 4: boot from E-Fuse. */
 	size = (cr & BOOT_FROM_EEPROM) ? 6 : 4;
 
-	MSG_88E("EEPROM type is %s\n", size == 4 ? "E-FUSE" : "93C46");
+	netdev_dbg(padapter->pnetdev, "EEPROM type is %s\n",
+		   size == 4 ? "E-FUSE" : "93C46");
 
 	return size;
 }
-- 
2.31.1

