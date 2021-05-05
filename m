Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9851B71
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 12:17:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so998464wmh.4
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 05:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/gQ0H9ynUrckQAV8IhVE3TvvxaEE6byRIc9qf4DIo6I=;
        b=XVthhm21eyhKik7ddZk/TQeHHVfU0evv0Xsb6OYDhDOivNWwgmiIzMeVzY+qDCinDQ
         ShSXZ12SiW2Vh89NAjGEDEF16hmorog4nqrqwxJlDI9n7l4wz/a9s0mz/ECJqesWDLlj
         riibFXFw115brcxndY88J5eqwghz5uljs+fS32peA7qzeNpuSv05Z9KDz6OeJeEShiLc
         M1ZxQEbBUci+q3tyrV+sFhoJPCsneYiA9qckEPB/GV67veQKFXf1ZYOzwbQRHWVBcboN
         5UhvWtORYXzinXjznfkwb5bOd5fcSVYHzUsQVXzbU0VuFeq0/FEswIpcxo3UWbO6HuTE
         gtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/gQ0H9ynUrckQAV8IhVE3TvvxaEE6byRIc9qf4DIo6I=;
        b=etFgHDhGdKvsF9bERril1KbMMWB21c0ysO0oEK37KXBmrXwxDzo71Se1A3CW51Gqe9
         FfluHVBzTPCjGKEaWzPNlc/LATOTC2JbqMkaQeo320xBNfOxqaPpz2PQhc2FXAlmGWXy
         At0dNn834ieoSNUDBX43Cdlj1rulJczRPhmd3OEbwRRBzWDcojHC/HRS+x8qy4XcATYV
         MruhRFa9FdV4Yzdtj8Zr7ATzc5X+fqXQJo1u4lawOgjFOPD0lKAXS1R9oq23srDFIFQj
         fPnfllStjQ1FIXults7Rj+39kiJ6X0cugf2p0n3McDwjTKKAI/NToENNRmnU9HkR30kt
         OwQg==
X-Gm-Message-State: AOAM530wuTC9VEo+MSJOs9AIi6kDNtoj4DXNrttKlwWzRklEX9FmGNVY
	cMCr955cs0enRB0D88Z7b1+ydpfYCntmAw==
X-Google-Smtp-Source: ABdhPJzHbJ3hhs22Tb/mlxoOVtt2qZ1TzUxzWHfaK3pgO2JB9f4O+/kfsx8dkv8HqHnImgG94187eQ==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr32524650wmc.126.1620217067989;
        Wed, 05 May 2021 05:17:47 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id p17sm19067896wru.1.2021.05.05.05.17.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:17:47 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 09/10] staging: mt7621-dts: use 'interrupt-map' and 'interrupt-map-mask'
Date: Wed,  5 May 2021 14:17:35 +0200
Message-Id: <20210505121736.6459-10-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
References: <20210505121736.6459-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Custom function for 'map_irq' was introduced in
commit fab6710e4c51 ("staging: mt7621-pci: fix PCIe interrupt mapping")

This is not really necessary and code has been fixed to avoid
custom configuration of the virtual bridges and make possible
to properly map the root ports interrupts using this standard
properties. Hence properly update device tree accordly.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index f0c9ae757bcd..fadc76fdcaf1 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -502,10 +502,11 @@ pcie: pcie@1e140000 {
 			0x01000000 0 0x00000000 0x1e160000 0 0x00010000 /* io space */
 		>;
 
-		interrupt-parent = <&gic>;
-		interrupts = <GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH
-				GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH
-				GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0xF800 0 0 0>;
+		interrupt-map = <0x0000 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>,
+				<0x0800 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+				<0x1000 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
 
 		status = "disabled";
 
@@ -524,6 +525,9 @@ pcie@0,0 {
 			reg = <0x0000 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
 			ranges;
 			bus-range = <0x00 0xff>;
 		};
@@ -532,6 +536,9 @@ pcie@1,0 {
 			reg = <0x0800 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
 			ranges;
 			bus-range = <0x00 0xff>;
 		};
@@ -540,6 +547,9 @@ pcie@2,0 {
 			reg = <0x1000 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
 			ranges;
 			bus-range = <0x00 0xff>;
 		};
-- 
2.25.1

