Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE029CA
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 07:07:01 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y74-20020a1c7d4d000000b00322f53b9bbfso1487227wmc.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/sDp3v+VSf+a7YBqYmz/bE/XvSjEEZw7HncYzMJdqvQ=;
        b=HR9qt+RxuTEhedHkjx9KScA3/O5PgU4hsScpd21JgPbChjBPUtysUc+MVNnximADtb
         szFYsD4ThgK52zv7+juNh0VXskRODRRqO/22vcE9s0HgppUsLQV88N+GsBPVwLS+3wE8
         wPiyqljKqYq7BiPvzjqX1azEUMHXyvAx6BCrV84ATTekinkID0pmiy61MmVKDry1jTkd
         uXXw//8loW/tZJtaOgsoSPImMJEp3cZzR5WVfqsZzavRnPsddl2OphnhvUNdZF8h/z4q
         VMBKOTnoNPR/6ZbRlmCvuuo0/sgMMW7PT/G4qURmSLoXRY9gM8BlSSRqzT2aSCI1OCPb
         IMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/sDp3v+VSf+a7YBqYmz/bE/XvSjEEZw7HncYzMJdqvQ=;
        b=tLvaLcmiRmLmcBJDwdBeBminrY1YodFpoE305272jEh0svbaTZ3p7JqNE7+ouo9geu
         3A8pyUiGqXcug8EAmKlEK9GXvnzbDLIYcpIkZRYCQuTUb1bu83/t71dq1zp3md2r30tA
         HcPgjGKyEM1qfV+7hf30hU3xvSa9xaYBJdyOuYo38S1IgyIHf/1RNFs96/2uSS/x7mVc
         wXBrZxgUmxOnAGlmzG0oiorbUdH9Q99oz3zwA10C3d76jYxx9H0TCg9YPZ1CUIuNh6wb
         KRRHdPmYtXLsLtFIA085WWBZsZGUHmKp3QTunJ9HqnuI7ETONG4rIQKqhm6aqda5bRxj
         LB2Q==
X-Gm-Message-State: AOAM531GCkcnNKQ8QLmdllFg1ezcphGTKwAxT+YhjtX3h2lX8lnAJbdY
	kcQKl5a41visUxRxj3yhjmI1udb9TYA=
X-Google-Smtp-Source: ABdhPJwOsFaD9j+VFWgPC9N13V9olvpWA0HBBjdzHn3unMBYcbKDEy6NbpqO2IdQg6xRHh4WsikGGA==
X-Received: by 2002:a1c:14b:: with SMTP id 72mr22648262wmb.158.1634454419310;
        Sun, 17 Oct 2021 00:06:59 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id c7sm11474271wmq.13.2021.10.17.00.06.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 00:06:58 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH 2/2] staging: mt7621-dts: change some node hex addresses to lower case
Date: Sun, 17 Oct 2021 09:06:56 +0200
Message-Id: <20211017070656.12654-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017070656.12654-1-sergio.paracuellos@gmail.com>
References: <20211017070656.12654-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hexadecimal addresses in device tree must be defined using lower case.
There are some of them that are still in upper case. Change them all.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index fd4ab4006ed8..787220d4d3b4 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -48,10 +48,10 @@ mmc_fixed_1v8_io: fixedregulator@1 {
 		regulator-always-on;
 	};
 
-	palmbus: palmbus@1E000000 {
+	palmbus: palmbus@1e000000 {
 		compatible = "palmbus";
-		reg = <0x1E000000 0x100000>;
-		ranges = <0x0 0x1E000000 0x0FFFFF>;
+		reg = <0x1e000000 0x100000>;
+		ranges = <0x0 0x1e000000 0x0fffff>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -266,11 +266,11 @@ pinmux {
 		};
 	};
 
-	sdhci: sdhci@1E130000 {
+	sdhci: sdhci@1e130000 {
 		status = "disabled";
 
 		compatible = "mediatek,mt7620-mmc";
-		reg = <0x1E130000 0x4000>;
+		reg = <0x1e130000 0x4000>;
 
 		bus-width = <4>;
 		max-frequency = <48000000>;
@@ -292,7 +292,7 @@ sdhci: sdhci@1E130000 {
 		interrupts = <GIC_SHARED 20 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	xhci: xhci@1E1C0000 {
+	xhci: xhci@1e1c0000 {
 		status = "okay";
 
 		compatible = "mediatek,mt8173-xhci";
-- 
2.33.0

