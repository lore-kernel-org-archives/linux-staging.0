Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945472F9A
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 11:15:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z6so5182893wrm.4
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MT2OIJc0hWlPnCiaadINGKimv/o5gd+Xz7S2c7tjZ5A=;
        b=h2C/opMO/xlErlLNdiKWB3MBoV9Axf3M2fUjM5MeerPmbEYvsRMkdruuYJ+Us0E5yq
         FT/fa11B721XvsrdmV6OvnjhXN/xlJV5b2XuhiTGHANyvmiejdl8nMKH58WacAG9RTRz
         SwtigXWJKmFu+uwaQFVuMYeshCZgBeEdpYhfMP183k7c8uyMcXLS1uKBUpUPT1FoqJcL
         A/muttqnqY2WM+XULu4FuRtd6y2UXI9udvDwYHZAGYunuKQnbr7toKT2EMyT6wSZXGj4
         0SThp8n/d6QywFcL8KaXTmFex/ziy1EpTG8pHgBvVtPTeJSpBtbsCmOirP+4mpdZ0Irc
         ydNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MT2OIJc0hWlPnCiaadINGKimv/o5gd+Xz7S2c7tjZ5A=;
        b=BTi/GKCwSMwDldCUcxA5HHREl5NslosUyd8HUDD5ecEqLxYA0DoZ8LeBA42vkctAgc
         //emzfYcoth3cV/+KxKbS0HqTR99D5bp6Npm42jQOW9jgfhtASmNcVX14J4TUggcQMty
         tIo1/tmQYsulAoS338WbgvN9O9dW5f6y1mSV4grAYSkiNMmD095kGH4Yppdxgwmnrjdx
         4/d8IuA+NWqaR8UUvnZ8Yf7IemIVwb/to5++gs29PP7qIN7YcCfQ5vSWKLdnmjn1YIGJ
         C3JCe/BY9EWJ8o/AAuGHi5Jlt1yXmV6elvq3oBysUBdAIRuQ4Gym6CfhLz3OaHwIIaG7
         nGKw==
X-Gm-Message-State: AOAM532KlJOa9uR/5aL8y3sd13EhuVY20aCLUkTFHcatDtFUAyKoDpPM
	wTRFmU8TCRlJxN7hocFJOsE=
X-Google-Smtp-Source: ABdhPJzGyRIuyk5j7KRK+KqSfoclECQr1Gfb2VaxcdMsLESXtKRSzk91U979iL7Z8FNB3REDhwBNRA==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr4479506wrn.122.1620299739235;
        Thu, 06 May 2021 04:15:39 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id u5sm3642433wrt.38.2021.05.06.04.15.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 04:15:38 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 5/5] phy: ralink: Kconfig: convert mt7621-pci-phy into 'bool'
Date: Thu,  6 May 2021 13:15:31 +0200
Message-Id: <20210506111531.21978-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
References: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make dependant on PCI_MT7621 configuration option and mark
this pci phy configuration as bool which has more sense.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ralink/Kconfig b/drivers/phy/ralink/Kconfig
index c2373b30b8a6..ed0c71eff2c4 100644
--- a/drivers/phy/ralink/Kconfig
+++ b/drivers/phy/ralink/Kconfig
@@ -3,8 +3,8 @@
 # PHY drivers for Ralink platforms.
 #
 config PHY_MT7621_PCI
-	tristate "MediaTek MT7621 PCI PHY Driver"
-	depends on (RALINK && OF) || COMPILE_TEST
+	bool "MediaTek MT7621 PCI PHY Driver"
+	depends on (RALINK && OF && PCI_MT7621) || COMPILE_TEST
 	select GENERIC_PHY
 	select REGMAP_MMIO
 	help
-- 
2.25.1

