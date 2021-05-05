Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF02F80
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 13:21:58 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l13so1802407wru.11
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7qD0cEyhcQ8HWnubOgPoQoP4NJnDa0/52oCiQhlPNOk=;
        b=PEhq/XJZErg4iw54aIwkPDWQs8cHzu+OvQgLxyDzS0PBrKm65TvKzp+4bbAq/8Dsa4
         BnWsFpVFKe4UUfOAefJ5cm8Szk5p1AikvDkoitX4fif22oiffTu5Q1exXxzwgmko45v4
         UsNqnhjJnPCtjGhTWi+zrpJvPrOp0cjYuUrMiFnvb/fl+geNMr+DsKCjFlLR755sY8qM
         AKhF20qdIpvm8d8aQGxFJqyfqFO/7VC10CjMqfm04Srr5gDmg05RlN/9+ENJ+44nujun
         8gIG5NPzreUDakQuCuPZEOWoCDtXdB8tKXJ5pzpkCdB/iasmkn9CmQi5H7qtaZ02c1vS
         /Xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7qD0cEyhcQ8HWnubOgPoQoP4NJnDa0/52oCiQhlPNOk=;
        b=dfI4UaMN4XY/NrGSSvYT7s8LI+jB5KH189amHSj8/+/EcnX5pvB//fDuUyZ//fHsKD
         ruHbRt+pgNghEOdG5f7BZsq9hs5CfhXlELPA2RhcN2a1A0VwNtZQLbr2uGk6rtb5etYC
         zwiQsKMoXsEaMPs4amvc4C+LX9RWXyL2ZpqjruRs9q9f99svYcTjbxvVUzDxNBqWkyyd
         w7FtnAk65QJtkOTmk4XokaIH8S/mB21S2BGCYXHZUb9b0ymIVOU2C0jTIOWsZMMA9Z6M
         c9la5OSRuQRMNoLY0R4vepXBZag6bEWZwAJf8CWdU5gykua663bLg7zIhje3S1JQMrs3
         qHLg==
X-Gm-Message-State: AOAM530+vpwkv2xHAAm8AVWevZ3F/4VZFm6tZ5ht5/TKIMbAR8AitzgW
	QFAUtJXVB47v014TdZOu3x40aiiKO1AqOw==
X-Google-Smtp-Source: ABdhPJx/G7dX9QPX66iWJ21UvrUj58G5tl1vxBrzwAYiILD6L1E3ty4Di1gP3a6HaDq3RmNfR6UMEA==
X-Received: by 2002:a5d:4888:: with SMTP id g8mr9992320wrq.384.1620220917158;
        Wed, 05 May 2021 06:21:57 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id a21sm5905796wmj.34.2021.05.05.06.21.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:21:56 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 1/2] staging: mt7621-dts: remove ethsys node
Date: Wed,  5 May 2021 15:21:53 +0200
Message-Id: <20210505132154.8263-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505132154.8263-1-sergio.paracuellos@gmail.com>
References: <20210505132154.8263-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

DT 'ethsys' node is being configured as a syscon
to get access to reset and other registers in the
'mediateķ,mt7621-eth' driver. Since the 'sysc' is also
a syscon, provides the clock and also is virtually
mapped from the same physical address 0x1e000000 we
can just use 'sysc' as the phandle for the syscon in
the ethernet node. Compatible string 'mediatek,mt7621-ethsys'
of the node is not being used anywhere inside the kernel
so, this node can be safely removed.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 5759ba8742ca..b39c7968239f 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -372,13 +372,6 @@ nand: nand@1e003000 {
 		clock-names = "nand";
 	};
 
-	ethsys: syscon@1e000000 {
-		compatible = "mediatek,mt7621-ethsys",
-			     "syscon";
-		reg = <0x1e000000 0x1000>;
-		#clock-cells = <1>;
-	};
-
 	ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
@@ -396,7 +389,7 @@ ethernet: ethernet@1e100000 {
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
 
-		mediatek,ethsys = <&ethsys>;
+		mediatek,ethsys = <&sysc>;
 
 
 		gmac0: mac@0 {
-- 
2.25.1

