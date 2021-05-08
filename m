Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834EF71
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 06:52:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 4-20020a05600c26c4b0290146e1feccd8so6008652wmv.1
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 23:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnhsZglV9Tim8CW0KmXYUH85PSzSV/y0PNcnH/Ygu/E=;
        b=LQcyHlKI3cmGbxplDQAJgFpcZ2vWNGbNxmmwsnLjSwGKYDbEK896BewQFECt6Tu7d8
         S7kau4cHh3oqU2TMv6GgeZE/A7mO+Kaux1/fnFpzeNw72D+/pfY/ZBC3iHOmndxctgrn
         XTA643lzwlo1D7JXYKYEZNYfs1f9TGMPOxhqwfaOBfP2MOfxSyYRLx8oSjaV+uIX0Yct
         t2/ZXVGzj2j9kIgFjNDpcVuVtZmN5HP940DXu+HxfH/8T3PCqwJDTttrQCDMNUcJa2Ky
         IJxHQM0w00U84RP/N2+m0Cspx1eXMy5w2nkWjpmnn8h4YnbzVNm0HCVPbk7gjad32acW
         LGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnhsZglV9Tim8CW0KmXYUH85PSzSV/y0PNcnH/Ygu/E=;
        b=ItzelF5mjHpcZhkZb7LDDu6lki/jIw18QYTTWyae33YCbcqnnj+TKIU9EthBCs1Apt
         nIleh26TJ+Q8d0fXQzbkS5HoJA0HSL2w0OUThkuStI/qXg6H4Am2Kv4SpDhPvWLsb7Bw
         DD3xvL/PuaEwBL9i+WXNcdwIinuBCrWxMzPO/Vtvp+UtQqQ7VwWmHX2bqSIL4sUMNsVo
         QiyMKCeoxMUO1cJ2Xt+fi7lG1I1vYeVxECybmNBIPgzBtic2tABj8aLMSjLTNAHW0HXg
         Zh3nwW1jiz7QHCVQm9aGgxwtzYSLBt1z3aEmoMnDsmWcdkYqTpJytu+p0qXqlw5DbyG9
         Zk2g==
X-Gm-Message-State: AOAM530xWkW8AAE7W5zZG+JxDJmUS9bk/qyfLwD3a/nCBO+ozI3gA3Pd
	vixKwhIyBrnnzoUHZGgE8H8=
X-Google-Smtp-Source: ABdhPJxfPpdspV0gYutpfTe5YchDZnQYJXqPP4rbHosmjZFV1JVsgOuTaJWVJflzXrejLiFn33yHtg==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr25250444wmf.145.1620456759167;
        Fri, 07 May 2021 23:52:39 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id b12sm11638010wro.28.2021.05.07.23.52.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 23:52:38 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH v2 4/6] phy: ralink: Kconfig: enable COMPILE_TEST on mt7621-pci-phy driver
Date: Sat,  8 May 2021 08:52:30 +0200
Message-Id: <20210508065232.4882-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
References: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After use the clock apis and avoid custom architecture
code this driver can properly be enabled for COMPILE_TEST.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/ralink/Kconfig b/drivers/phy/ralink/Kconfig
index ecc309ba9fee..c2373b30b8a6 100644
--- a/drivers/phy/ralink/Kconfig
+++ b/drivers/phy/ralink/Kconfig
@@ -4,7 +4,7 @@
 #
 config PHY_MT7621_PCI
 	tristate "MediaTek MT7621 PCI PHY Driver"
-	depends on RALINK && OF
+	depends on (RALINK && OF) || COMPILE_TEST
 	select GENERIC_PHY
 	select REGMAP_MMIO
 	help
-- 
2.25.1

