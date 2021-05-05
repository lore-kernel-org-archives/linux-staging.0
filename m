Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D134871
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:50 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id a4so1606681wrr.2
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ev7PxqRffrNUfDWm7SspA5tsYOydF1/bbdBaGdLiN04=;
        b=WdFjoLo4eXGlPIIb8u8OOqBmHNjKh/+mgxMWfcV4/MXLyiJ+caaPAywbdD4sUVpqD6
         mqYRBKftmEqndIO6RznsAu+nmRQCaSFRVGTo6wlgVfJT018lZItF21MuVPXNIe2+bFGr
         7Zbr/BkoSnnHmwSWqXn5BXHExiKwIL110rjr9FjpSgfQqVCgfdpRmghthxnrk5heR+0e
         kqvGGIcW2mvihBNQjRTofF1hgwu+R3brOWPZlCvuQ/IShzyrfkPDgKYak9osg59QJ3s1
         Lfgy0xmzqR9SKEEUdzbgsLCgl3FYqRdR8EGWcFspIPj+9vX8fyzHOF9tRRo4hp8BwC3J
         S8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ev7PxqRffrNUfDWm7SspA5tsYOydF1/bbdBaGdLiN04=;
        b=LbgJcsqtIGTBMD/ojdrPWe6t2IkwkczWcJ4WYQQ6SG196Ta71Nbpxed9l+XKw3Cvsd
         Glm4Z+ZM2XVIhXTGIVwsV4lDxwj5xWj7qgcVNt7kt+BNB63HjiCMlsMOb1+CqC8XjTJv
         mlZMx396ICZjbOwFpizCsJlVZYaUb6XB8LJQ882JulWwWLWGp9/dds2U+hRb22lAs1f5
         6r44RmCpYurXOvzWxL5XEB9qhx1fS208p18v8NEODrV8+aR/E2rjD/CxEUskTooRBCTg
         7pf/haDSsXUaiLoZm1+ovZKgzgU5hdraWZarpAb1tloYBADb5iSYPxUOdUK4vEkyoHsV
         QVkQ==
X-Gm-Message-State: AOAM530PXLotoe7lPY2Zz1xZIFAAA2VllmWgXJIDCv3GNLk92gLnpjlF
	wAwOFgTJ2dxfDbJPFqtdCP6flq/oEbbF/w==
X-Google-Smtp-Source: ABdhPJxFmoT7olXeuAYPMXsUrOnxpJDc1Dt0jGYfTrFkaQXFK3xcGyy2fuSC3kpjqZsd54wzt8OrCQ==
X-Received: by 2002:adf:d215:: with SMTP id j21mr39079209wrh.251.1620217069203;
        Wed, 05 May 2021 05:17:49 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:48 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 10/10] staging: mt7621-dts: properly organize pcie node
Date: Wed,  5 May 2021 14:17:36 +0200
Message-Id: <20210505121736.6459-11-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device tree pcie node for this SoC is using different
styles in its different properties. Hence properly
unify them to be able to write a a proper yaml schema
documentation.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index fadc76fdcaf1..5759ba8742ca 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -484,10 +484,10 @@ fixed-link {
 
 	pcie: pcie@1e140000 {
 		compatible = "mediatek,mt7621-pci";
-		reg = <0x1e140000 0x100     /* host-pci bridge registers */
-			0x1e142000 0x100    /* pcie port 0 RC control registers */
-			0x1e143000 0x100    /* pcie port 1 RC control registers */
-			0x1e144000 0x100>;  /* pcie port 2 RC control registers */
+		reg = <0x1e140000 0x100>, /* host-pci bridge registers */
+		      <0x1e142000 0x100>, /* pcie port 0 RC control registers */
+		      <0x1e143000 0x100>, /* pcie port 1 RC control registers */
+		      <0x1e144000 0x100>; /* pcie port 2 RC control registers */
 		#address-cells = <3>;
 		#size-cells = <2>;
 
@@ -497,10 +497,8 @@ pcie: pcie@1e140000 {
 		device_type = "pci";
 
 		bus-range = <0 255>;
-		ranges = <
-			0x02000000 0 0x00000000 0x60000000 0 0x10000000 /* pci memory */
-			0x01000000 0 0x00000000 0x1e160000 0 0x00010000 /* io space */
-		>;
+		ranges = <0x02000000 0 0x00000000 0x60000000 0 0x10000000>, /* pci memory */
+			 <0x01000000 0 0x00000000 0x1e160000 0 0x00010000>; /* io space */
 
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0xF800 0 0 0>;
@@ -510,7 +508,7 @@ pcie: pcie@1e140000 {
 
 		status = "disabled";
 
-		resets = <&rstctrl 24 &rstctrl 25 &rstctrl 26>;
+		resets = <&rstctrl 24>, <&rstctrl 25>, <&rstctrl 26>;
 		reset-names = "pcie0", "pcie1", "pcie2";
 		clocks = <&sysc MT7621_CLK_PCIE0>,
 			 <&sysc MT7621_CLK_PCIE1>,
-- 
2.25.1

