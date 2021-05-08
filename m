Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940071
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 07:09:39 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id m9so11388732wrx.3
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b+GCOf42Gs4UdMdK0477XZHtOpuU44Ecgu3QGsmZOXI=;
        b=bbTI9rbfa2hFA8sWR0y2bKXkMoIo6lVovlUGSGjC0ORfoxbvPR93j6krx4kaUygRfd
         poxvM6vH0MqvWkrlwr2vzHcpmYVIfoL/H4gDEqidJG3r0xJof8EipjMlucnWZcuGS1cj
         yALWhbYzKOcCWElu1TUVMBESQ4n+GNf9bX+mZ0EcISpMTRS5mcz5uKIdVfp7W52e6vE0
         mMj/UshBOJd3LcF3oU42XkMK+V6eMOebzIjCySz2mopl0Eqdy7rQ+wlk6PBfB8wBhJTR
         UMJs+4frkCXHfokVeCQy+agUaUiKY408rhled2W4kVJIOkiQuVQr+YkFCgKc+vCMbgX9
         ZZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b+GCOf42Gs4UdMdK0477XZHtOpuU44Ecgu3QGsmZOXI=;
        b=UFcTh5IW4ON4tH5XYjooyibwUiVQ43UuEgFK878vuLUI8gpMBHWS6qAZ+KMB/AvIHc
         WOL1RgfDPQrPWjcsh15cIvb15nO41A7WZ8QHrOdg8/kydMVJK8szI046N15z9qOVwjHC
         Im+t3Zwib1OSBy0p3uf3xYdBaSWIgV30PV8RzvAqkUnVycfxtDG6X72nUppvnmtn1JO5
         vz3Ru0UYmx/28AX2NiT8nbsoU4nC6eJPdpKaGMXrWt2mlVAL9TQzbF+pRIgt3W0Ku0qq
         K110tCOkaHqwzFgsprY8f5eybOq8Tdkzhgtl+5hlsh6YCknf6NBvwloRCaYaUBZTwnd5
         xynw==
X-Gm-Message-State: AOAM5338NCL2hGrZzwyrzUsY4P8TA6QHtH93itCIENTfK5JvGZnnWWnT
	Ha/8fjjz1YnzJZUZsQtk0Iw=
X-Google-Smtp-Source: ABdhPJwJtfMcnMXZ71LUD3G3ySl8yYxNXaIZjyjmjxHNi2uX6EC9pMnol3hqM/xKNx6PUUK3mxZH7A==
X-Received: by 2002:a5d:6a47:: with SMTP id t7mr17397147wrw.117.1620457777816;
        Sat, 08 May 2021 00:09:37 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id s18sm11740345wro.95.2021.05.08.00.09.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 00:09:37 -0700 (PDT)
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
Subject: [PATCH RESEND v2 5/6] phy: ralink: Kconfig: convert mt7621-pci-phy into 'bool'
Date: Sat,  8 May 2021 09:09:29 +0200
Message-Id: <20210508070930.5290-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
References: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make dependent on PCI_MT7621 configuration option and mark
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

