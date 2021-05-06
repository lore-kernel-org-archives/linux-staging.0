Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9022F81
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 11:15:36 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a10-20020a05600c068ab029014dcda1971aso2999845wmn.3
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yB+63PgRDM1iyviDORNDC1cNZU2QIzi0OniCvWqYcas=;
        b=r5MNcwCk/unl+3evjl1ScAq7BM1g7s0th1VDYBoe31faBujaA8UxZV/AxfibTG4gdg
         2CVeoKS2qXJun3cABqZGXijgW3sp/MQbDojoMTOb578htTrFotqlGRUdm9LyvRnVOrgU
         PJJD7mre6+zIyjlLZj5TLbGfZL0mYCHSDrO8yPS3tumjtsUx3Ydf1noHAYFuTS1YKT0m
         /oS1eUXTCekbWsKcw/6MHZeNB04mHSc0HxI1njeK3md3VN6LZMNPnK94HPEDGv+zeD4Z
         nBID16zPinnRGBpsxUPBxUt7xeo+K9oajkJjjdSdH3tot4/a/KffYdjcAnCf55IyNvkK
         /uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yB+63PgRDM1iyviDORNDC1cNZU2QIzi0OniCvWqYcas=;
        b=XWA/yHBJVNfnzz1PVDBa/75InuZ+ReFZlFMhSJ2fQigVB0f3OZ4HvFyrYEcO6RsjML
         9tCpqNnhmow6lhKPDGAmV7Lu11Uq8l1uC4TpbUqDol4Qu0QELTe/ssVV6UXoVJbDQ9Sw
         CF1NMR2ELdvtitETOvTcZg8KeE9v6xARnjPWANsFinE5x/UA/fJIgheKjJ5IqWRlAm8f
         QmL6CaGo4iRuM57QCyAK2jKMRJflM5j+62bHCyn+nJaMSW+IQBxMv4f3eIFRz6WNHzXd
         Vr17kFbwbxRvgZc9Lt0ASIT1XOG8lcBtvIB92zPuJv7onHpvDA24xIJMlGLOyOIRsB/2
         08Ew==
X-Gm-Message-State: AOAM530ZNVPaVT3aW0kf6RPIB2HDXFkTXmMWidLfpPkcXf5r38rdJs+r
	1fyb3Lcq9af5UnOKSbBGcE4=
X-Google-Smtp-Source: ABdhPJwQfzxRYHpKnPIQCx/PqOoEanXnfY+4NyrQ2w7d5BnNcUH2wVkxSbnS4mrZ1TPCAsEetdFZYg==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr3374846wma.170.1620299735254;
        Thu, 06 May 2021 04:15:35 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id u5sm3642433wrt.38.2021.05.06.04.15.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 04:15:34 -0700 (PDT)
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
Subject: [PATCH 1/5] staging: mt7621-dts: use clock in pci phy nodes
Date: Thu,  6 May 2021 13:15:27 +0200
Message-Id: <20210506111531.21978-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
References: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 SoC clock driver has already mainlined in
'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
Hence we can use the clock in pcie phy nodes to
be able to get it from there in driver code.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 5623d542bcf2..001ff8f51033 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -549,12 +549,16 @@ pcie@2,0 {
 	pcie0_phy: pcie-phy@1e149000 {
 		compatible = "mediatek,mt7621-pci-phy";
 		reg = <0x1e149000 0x0700>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
+		clock-names = "sys_clk";
 		#phy-cells = <1>;
 	};
 
 	pcie2_phy: pcie-phy@1e14a000 {
 		compatible = "mediatek,mt7621-pci-phy";
 		reg = <0x1e14a000 0x0700>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
+		clock-names = "sys_clk";
 		#phy-cells = <1>;
 	};
 };
-- 
2.25.1

