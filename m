Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923162C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:35:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id o20so42278693wro.3
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dpCU4j+oM9YGOD4y3y7Oa6rUUpPPKjDrlLRmqOR36sk=;
        b=gmMBoPysc4kvsESWsZZdHh22eUA255SNR+jkgEUFspqHofVglVQt0hnpKuFIR6/DMF
         VBfmu2mId+y5m3F1lEjM/L53/0TztYg2eyb3NAQY2OClYj0ikxlGgiue6ZkR3+Iw1842
         rEurcbc0uJaIweu+ab93w5b3Y1q+VFAkIwQuqjC8rbm/uRVuz8Xn3o9koR+yTr3b92DS
         CF3p8baehx7r3IypuQHVWPIp0P/C6sUOvmV+8eJUTWWGuEDYyDQBrbi6Tkot/n+O1gEe
         Cmpn6OSW80dPvGQINF84/7GbhjRE2BmzURAvUKqJCsskk6F1YxHFh/nkOCfkaQPa0xrE
         Unvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dpCU4j+oM9YGOD4y3y7Oa6rUUpPPKjDrlLRmqOR36sk=;
        b=ZPgbuop8DQ66N2EIwryWxjKPlYdbxR+iZU1HnHJL0014EAOcMLwz5yLy+9pYRx0vaS
         iUHL1EEwVBYlThT2sG2Q5QRURHDxdvjzhPUeH9GPa5NrRuU28LLD7vUJBbmIoZwAX9kw
         gQ9O0ks13VFi2pcWqHcDPd2hfscoEvt/7ibbsuR0kxbqauSOwzsZ2ZBbvX9eaQ1nWywr
         7q3OhTtfMAA5qb6nptp4KyXYcd46yZEUQcMnsJCfWZuVqH2Ze7Z4gsYl7ErpQ4nEFiZP
         g/YGXP1jPsz/GJGT3HwCes7QnoG8u5hdcm6T2OcPtbgUfypHQ819sVcykMdo6m0srUHW
         UXUQ==
X-Gm-Message-State: AOAM5332fOx5dSj7eZIFe50qp557cO2b6yQkQizoo7oqiR4tDLPgjzKi
	ZTXoJ+Y4e5xvgG4RJfICW4O09NFkh38=
X-Google-Smtp-Source: ABdhPJxOyL/nmba1yxXH/QXBt/OcGpvoghc7b9lu2rIUVm40myTjyB5MRUjfcuiBowV3ZFXXifpE4A==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr27068190wrs.251.1634571357599;
        Mon, 18 Oct 2021 08:35:57 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id w2sm12798647wrt.31.2021.10.18.08.35.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Oct 2021 08:35:56 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH] staging: mt7621-dts: get rid of nodes with no in-tree driver
Date: Mon, 18 Oct 2021 17:35:54 +0200
Message-Id: <20211018153554.10471-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211018153554.10471-1-sergio.paracuellos@gmail.com>
References: <20211018153554.10471-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes for 'i2s' and 'nand' have no driver present inside the linux tree.
The normal approach for a dts file to be mainlined is start with those stuff
which is already mainlined and get rid of the other stuff. If needed it will
be properly added afterwards together with the suitable device driver. Hence,
remove both nodes from the device tree include file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 36 --------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index dd7d06c5f234..787220d4d3b4 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -102,28 +102,6 @@ i2c: i2c@900 {
 			pinctrl-0 = <&i2c_pins>;
 		};
 
-		i2s: i2s@a00 {
-			compatible = "mediatek,mt7621-i2s";
-			reg = <0xa00 0x100>;
-
-			clocks = <&sysc MT7621_CLK_I2S>;
-			clock-names = "i2s";
-			resets = <&sysc MT7621_RST_I2S>;
-			reset-names = "i2s";
-
-			interrupt-parent = <&gic>;
-			interrupts = <GIC_SHARED 16 IRQ_TYPE_LEVEL_HIGH>;
-
-			txdma-req = <2>;
-			rxdma-req = <3>;
-
-			dmas = <&gdma 4>,
-				<&gdma 6>;
-			dma-names = "tx", "rx";
-
-			status = "disabled";
-		};
-
 		memc: syscon@5000 {
 			compatible = "mediatek,mt7621-memc", "syscon";
 			reg = <0x5000 0x1000>;
@@ -355,20 +333,6 @@ cdmm: cdmm@1fbf8000 {
 		reg = <0x1fbf8000 0x8000>;
 	};
 
-	nand: nand@1e003000 {
-		status = "disabled";
-
-		compatible = "mediatek,mt7621-nand";
-		bank-width = <2>;
-		reg = <0x1e003000 0x800
-			0x1e003800 0x800>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		clocks = <&sysc MT7621_CLK_NAND>;
-		clock-names = "nand";
-	};
-
 	ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
-- 
2.33.0

