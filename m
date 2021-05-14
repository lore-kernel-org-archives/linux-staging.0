Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF270
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 11:28:24 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id z17so10651551wrq.7
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 04:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FOVnFr/nj3QWdNJlIgekW/kswIF2a4pE9kCJghjF1wk=;
        b=bxT9Z5VylJKfnIRa6U+SlZjgVgH6H1klVz+DLSYbh9s5WUmaS1+hiToIhi24+Bw2oJ
         4CEV7YqV4RWUY7Y0Tq1WQv4FmhTdS6OVNZseL9UO0HyPEZOHSUkCsTtuuMJVkqtbPSKB
         /2Ltlg2I77IUszEciyaWhUY3QLoJhF7nXIhpNds8ea9KlEFBZ0QFU1+KWqyOsjQKq73+
         vKZxpJBEiuR+yIFXK+5Vn9JffnsRwogVtNQeSH9Qjmc1yTGT3ZyahF2yw3AUZaMMMIA9
         GCvz5qtRAkyyGDhzPIJaewrCwsO0+bUAtHJHn2UUiF+kbKyjkPQUmhOC7Lkx2F5IHOaS
         2qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FOVnFr/nj3QWdNJlIgekW/kswIF2a4pE9kCJghjF1wk=;
        b=lfqQVPWmyemqGGnL4ZAJDHoNZQH0SBzuPpsZVWlItB6UXVJo6ec9nj3hH01W0/i6bS
         92VDI4ust1AXoeRAGUB6UabGwfG6JnjSRFaAjDE9S8IxLHCD0cJG3kExQLiCOcZLiNT0
         1bGbS3YIFETSgaB9NnNvKD2V1eGE96QxkJI/rF+q4JgW4XubMcH7BRRp3UKDwpanZT6r
         hxCH2udkVbtrdxHusv3B7rE8pEq1J8j0uY3ON8P/g4Zaqe7J81EvZ3GZkXIpmtarEsv2
         XvNVXwJx2ud4EnThFtuaS4zjUdDVo7G4MjxM0dQtluRVKUEHFTwVOHrf3OGRsaRoW5/7
         ttnA==
X-Gm-Message-State: AOAM5308Y04diLmCGFlnpmZK4m3JZXJFS6nq5ccUQxe28+MMl8hyKk1V
	Z0N8pDjtrhNOE98vrkKfTyY=
X-Google-Smtp-Source: ABdhPJzXC6PH31xSkMc/aeQ6gy/0dHlfwqd21eWIqFuML9q1m71jVSArlkMfap+0T5Z1m42HvphroQ==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr59084603wrs.204.1620991703262;
        Fri, 14 May 2021 04:28:23 -0700 (PDT)
Received: from localhost.localdomain (29.red-83-49-33.dynamicip.rima-tde.net. [83.49.33.29])
        by smtp.gmail.com with ESMTPSA id f203sm11132453wmf.20.2021.05.14.04.28.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 May 2021 04:28:22 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH] staging: mt7621-dts: use clock in pci phy nodes
Date: Fri, 14 May 2021 13:28:20 +0200
Message-Id: <20210514112820.32499-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
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
 drivers/staging/mt7621-dts/mt7621.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 9ee11adefa79..840ba0c3ffed 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -548,12 +548,14 @@ pcie@2,0 {
 	pcie0_phy: pcie-phy@1e149000 {
 		compatible = "mediatek,mt7621-pci-phy";
 		reg = <0x1e149000 0x0700>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
 		#phy-cells = <1>;
 	};
 
 	pcie2_phy: pcie-phy@1e14a000 {
 		compatible = "mediatek,mt7621-pci-phy";
 		reg = <0x1e14a000 0x0700>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
 		#phy-cells = <1>;
 	};
 };
-- 
2.25.1

