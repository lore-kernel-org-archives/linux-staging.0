Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352252F80
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 07:09:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so6022780wmb.3
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 00:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnhsZglV9Tim8CW0KmXYUH85PSzSV/y0PNcnH/Ygu/E=;
        b=YLg1H8X1j8kxUMAwnZhsSw/AkR3W4e1l8e6kRcSupQ2mSM9AU9BScMbsuG54kJlJxr
         5teQ4DCcfgqhMz/wfJprNpVtpd8eigd6YcyD+U2CkSgrzer0G9+YOUnxvxw8/3Ez1pTT
         c2nXftEVH8gWQYBJvkTo7akxHI7hHE3MgsKrSLV4l/aHDaDMfZWvmdzxQfSEv5dZD3Nb
         C4aT/rUFgJjFMCvufPdZ6rhO68m+/fcVhGOt0FehxV7+4t9hCaaf/c8XFQQ3f1KSZb5F
         4lP1/E2tDny2sLb5scTUNuliBI2s+ppzvisEHbyrWNtknRIe7AwSpAzqvQ/UA17XQ9Hc
         vVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnhsZglV9Tim8CW0KmXYUH85PSzSV/y0PNcnH/Ygu/E=;
        b=MDJu7RN3eBmXcdMt6kgbr1CSQd3V81MM0/C6OcD5BdN5j0Qu6sXkFIP5MV5I/RiijD
         08zk2g5FircQsr0yVAYaYt2VBq1XSzTZGPvoVrwksjAiDmQKlyBvsrBufw075zyrGQj/
         Qm9YiSMFkKxRw1yryzq/7KDF5ZxU7wG3vxv7DPlsbvorQdO4C/ch5tV+axcjbs1eTXgp
         8W7dxEyg4Dj9rIabxOoaod/TDu/gNzXJM8r9zwnRJVZ9fQ5BTnozXEYCp/FOcIXSJ4eK
         4wcveWvvQzNYP8MJfexkKKJ7bd3Eld5UyTkHWYh+2lXYVPjvuYAKsEOi9RkNRo1EfDW2
         0h0g==
X-Gm-Message-State: AOAM530Dudx/tuTt194rNNQ3cN824v3WmoNw3/jAfMOCnGrnnOnJ4XlH
	xVtoRdtWLPvrZwTUvuIjdKk=
X-Google-Smtp-Source: ABdhPJyi+7UG69Vr4iIbxkAYCyKrApkNdVexRvTWHId3nfd9GQLU8QIDLtXsgRizPVYG2wq/iAbBFA==
X-Received: by 2002:a05:600c:2315:: with SMTP id 21mr14259673wmo.39.1620457776835;
        Sat, 08 May 2021 00:09:36 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id s18sm11740345wro.95.2021.05.08.00.09.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 00:09:36 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: kishon@ti.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH RESEND v2 4/6] phy: ralink: Kconfig: enable COMPILE_TEST on mt7621-pci-phy driver
Date: Sat,  8 May 2021 09:09:28 +0200
Message-Id: <20210508070930.5290-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
References: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
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

