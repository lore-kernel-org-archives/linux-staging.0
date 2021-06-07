Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67142F80
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:01:58 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m18so17307438wrv.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 05:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MoitULi38CJJXeZlMzfQ2pvR18AZWjF68eD2xzdCDzs=;
        b=a4o3vW7IyBeuE0k9PdgQuKVB0D4xOQaz4/gLiyWcYPAsl7MmdP+taRO/QbaFRBtFaD
         XmOxb5umiXtkLrl8+BOiuEuAVxdqOgJ6QCsd2oNqJ+th9EWu1T3i2wTZr/uM1YIuGGjx
         hlxdE2MFifUGRhrMfn5Qpv46OuaJeoKCnNFTXbV1gVYsIOaK8jBxQV75LBFI7OTo/FjO
         md1IwiYWSuM5faLTNYdt7Gnh1sXIrCOoS4myAUxSDoHcwuRLshXmDT0figNiGQF9ahFD
         kMVCIxt43zsUXM8ETXtAjMiZ3q9E8Do5AaM8ShsT8UychtJp6OZWMgZpBf8HdJkEPSsA
         8AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MoitULi38CJJXeZlMzfQ2pvR18AZWjF68eD2xzdCDzs=;
        b=mLktxJiP6R5LeXTsxi/fx6aXI76oKgzyrv6ocyAJyq/lcGkEM4Xp4mUmzJ/Zc57FDB
         ISJAY73Ki78QTYG33k+sc8qFIq+Olvhq2Qh2SHprFSm1ZnLtFL7dcGSlX57jusyY4gB+
         TLMdyCWLzCdwJOEnGGnl9e8VhW/4paCFtOzVhuPCvtad8WTrbZ/gfkCdvZi3KGlrzn/B
         6p6k8CiHCQ1Qv2Ju1BVOhfb15EMOP1Cr1NG4uUNAwsn3jqtWbVOCKCCjCxRpooMkU5A4
         gn91MzbhViO11SxNk3hujh9/cdArGgTXL7OndM/B1iFKXOUq+b4mOhTzSaK2wqeENhlI
         xwYA==
X-Gm-Message-State: AOAM530LZmnfepMOme/xCUPH7A1jqyKoUOtVaRMILI6o7vVDOcjCAnvh
	RH94TB6wMEg4RQNYcKjxjoFjgpj0JjHDWQ==
X-Google-Smtp-Source: ABdhPJxG3E3JydanbR0KzCieEkzaMGL9meTNIRtepYoqdEYy6STywG14v+cBWhxsxoU13s+AZPBwVg==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr16412094wrn.202.1623067317028;
        Mon, 07 Jun 2021 05:01:57 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id r4sm7595408wmq.37.2021.06.07.05.01.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 05:01:56 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	dan.carpenter@oracle.com
Subject: [PATCH v3 2/6] staging: mt7621-pci: remove 'RALINK_PCI_BAR0SETUP_ADDR' definition
Date: Mon,  7 Jun 2021 14:01:49 +0200
Message-Id: <20210607120153.24989-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
References: <20210607120153.24989-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of define RALINK_PCI_BAR0SETUP_ADDR just use standard
pci defnition for this which is 'PCI_BASE_ADDRESS_0'.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index c14fc48e74fc..b83c338a2e3d 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -47,7 +47,6 @@
 #define MT7621_PCIE_OFFSET		0x2000
 #define MT7621_NEXT_PORT		0x1000
 
-#define RALINK_PCI_BAR0SETUP_ADDR	0x0010
 #define RALINK_PCI_ID			0x0030
 #define RALINK_PCI_CLASS		0x0034
 #define RALINK_PCI_SUBID		0x0038
@@ -494,7 +493,7 @@ static void mt7621_pcie_enable_port(struct mt7621_pcie_port *port)
 
 	/* map 2G DDR region */
 	pcie_write(pcie, PCIE_BAR_MAP_MAX | PCIE_BAR_ENABLE,
-		   offset + RALINK_PCI_BAR0SETUP_ADDR);
+		   offset + PCI_BASE_ADDRESS_0);
 
 	/* configure class code and revision ID */
 	pcie_write(pcie, PCIE_CLASS_CODE | PCIE_REVISION_ID,
-- 
2.25.1

