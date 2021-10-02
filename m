Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7B23FDE
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 06:07:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so12958656wmc.0
        for <linux-staging@lists.linux.dev>; Fri, 01 Oct 2021 23:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/f3cET730JLDMY36uwaulpDPaVnp+c77Wg4eA5v2Om8=;
        b=QNb1H4oQn/EZNVzn2DPSmKT1Yyxg1xtu+tUIU29mQdWvlNq6CWUthtxLH66KyUPHfB
         LP+ztW6JXQvQ6TSb7n8xui92QN65Jx4Fgyp4OtJSwKZVtV+o+9Dk6o62FD3K/atUYjZY
         Sc9y3kOxvfsHyJ6VVpGV3KxEIgAO2FHsjVeRsyBY1+JTGyYC7pLpY3ODDEbLJBynQIrO
         iXsXjY7bNV3IRARZsr5ZBHYnZXWDEQ3nPw39PxMBah+ZIY7JIkdK7CnZk1RdLBBheEdp
         KUebJGxI2C1VsV9vD62L1sLSpmQ4kV7eA35FqO1sGi/4wWSLIHK0VT/0lW0kRWFyHJ7n
         9ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/f3cET730JLDMY36uwaulpDPaVnp+c77Wg4eA5v2Om8=;
        b=sU2pqjB2QYFp8NtGd+PlCFBPWhos6shyZFZb5xxHqn2w2dvb6lNwvVY+MUBFckW7JK
         cGCrCZfsFEflNCudZr/l7xoY8MyGp+BH3/QvNko+/i6Dx1Oixh1lb8wTri7x99g7uw+5
         zUvc3wKBRzBir+CEv0vn2k1CHR2+0drc+uuzr+4/AcQYXpO277XKcD7/wUD3LWr9ijDK
         q/VMLD0oMQLCwt4O+5W9TGiwoYCvDd+fhEdv4xonHMpihRoym4RsKvSvWSYAKqccTo+R
         +p4PPw9ITcuU2jTYt9vGqeVtk5akukXwbVneL/G2j7b/fh0mcOME3YDdDyGbyuvSEl7K
         DP5w==
X-Gm-Message-State: AOAM532Eq8tYmY6C008s5ICK357bwd/LGIK4jEWixPj3RtzYFH4SvASu
	beIGxl3eFXibLm+SVaU9Zwm3WWJNlvA=
X-Google-Smtp-Source: ABdhPJw5tX+f1aPpHSxdOxNJrqI0kJjNNocU2eBQrcQ7H4M81Jppt4xC4GBtqMcaMdCz9iBFzQZE2Q==
X-Received: by 2002:a1c:2785:: with SMTP id n127mr7742498wmn.155.1633154828694;
        Fri, 01 Oct 2021 23:07:08 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id l18sm7594822wrp.56.2021.10.01.23.07.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Oct 2021 23:07:08 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH] staging: mt7621-dts: properly define 'cpc' and 'mc' nodes
Date: Sat,  2 Oct 2021 08:07:06 +0200
Message-Id: <20211002060706.30511-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'cpc' and 'mc' nodes correspond with the MIPS 'Cluster Power Controller'
and 'MIPS Common Device Memory Map' which are present in some MIPS related
boards. There is already bindings documentation for these two located in:
- Documentation/devicetree/bindings/power/mti,mips-cpc.yaml
- Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml

Hence, properly update compatible strings and align nodes with already
mainlined bindings documentation. Also, move their definition to a proper
place since both of them are not related with the palmbus at all.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 40c594fdad5f..c0fcbbe72e64 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -128,16 +128,6 @@ memc: syscon@5000 {
 			reg = <0x5000 0x1000>;
 		};
 
-		cpc: cpc@1fbf0000 {
-			     compatible = "mediatek,mt7621-cpc";
-			     reg = <0x1fbf0000 0x8000>;
-		};
-
-		mc: mc@1fbf8000 {
-			    compatible = "mediatek,mt7621-mc";
-			    reg = <0x1fbf8000 0x8000>;
-		};
-
 		uartlite: uartlite@c00 {
 			compatible = "ns16550a";
 			reg = <0xc00 0x100>;
@@ -359,6 +349,16 @@ timer {
 		};
 	};
 
+	cpc: cpc@1fbf0000 {
+		compatible = "mti,mips-cpc";
+		reg = <0x1fbf0000 0x8000>;
+	};
+
+	cdmm: cdmm@1fbf8000 {
+		compatible = "mti,mips-cdmm";
+		reg = <0x1fbf8000 0x8000>;
+	};
+
 	nand: nand@1e003000 {
 		status = "disabled";
 
-- 
2.25.1

