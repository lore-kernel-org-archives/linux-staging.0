Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE4E71
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 17:07:48 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id l14so6412138wrx.5
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GhpKiSIHcYPBMA28x88TN6NEWNsn9NQ/VUyCksDfE6g=;
        b=ICNNMM9znE+LOmn/MUlBOxnXQ3lIQmNwPY9AlWz23iBkWmgtaJ/FARmcNWDf8ZWmO2
         ktWrkRMKmu6UJmw4g1tLitqNOO+wp6IUYX4wO29enbw7gZNRpc4V0zy/stWsm+oGbkYk
         2XF+mFNhXrHcdHrgH9oPfTEDXEtvDy+DW1u33bgrl6B4ouTDccy+G0P5kcYHza+lFfyY
         PVal2XWHnck3gMX53LW692Glpu/oTaS/nghFXDpUFSJ79OKsbn3JB+B4rvSjsomYc1bj
         3roeM4r7b/+IO5QCFztZwptDRR/gMsTkP3dzGO6zcx7f5+KS3hW2KQNmagmsiLPSFMF0
         Mn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhpKiSIHcYPBMA28x88TN6NEWNsn9NQ/VUyCksDfE6g=;
        b=nqnpFYgD+6vbstgOZzfYWBeytn0gKXIMHG2nxseYSV8gojWfZ0f3kF74MQoZI17YUa
         NsmMyL8osEuSfRToF2qpqVEb3DMRmxz59x16yjxEgD9qnLmPCCNXrPdVna86zqNxky7y
         Go77KW+Ww5wzlYoPfJLoxkAPv74BbEDTIm4FYt94S+eDghuBrQYnKF+lFVtF+XaUwaJP
         ou35XayBn4KqKQGgcL+3eST+OyHxOvFFAu3NzefeP+0+UQ/idIwiRt3CJIz04+zowcvd
         SobrDOLT2mFMLjxCzqfBcfz8BK+1CF3gTYhaWRnFepWKdFYGAh4eUfhwNEhnZIOnm+pA
         1kYg==
X-Gm-Message-State: AOAM533xKSZAto5ZF1ThCA6xeN25mflw5+WolASVhmjuS+HKzmDjjeyb
	1RTkIno2+X9hE7EPUhAkOOH1NBx5092zFw==
X-Google-Smtp-Source: ABdhPJxQjVzNt1wuo5qPLTEELvhQqrM+nVSxsx34ZPOY3tqkYT+dbjzHXQh+cZyAyYSlXZ8PwqcmOA==
X-Received: by 2002:a05:6000:144f:: with SMTP id v15mr6511049wrx.182.1620320866723;
        Thu, 06 May 2021 10:07:46 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id w7sm4986378wru.51.2021.05.06.10.07.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 10:07:46 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 2/2] staging: mt7621-dts: add missing device_type in pcie root ports
Date: Thu,  6 May 2021 19:07:42 +0200
Message-Id: <20210506170742.28196-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506170742.28196-1-sergio.paracuellos@gmail.com>
References: <20210506170742.28196-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the YAML schema 'pci-bus.yaml' the 'device_type'
property is mandatory for all pcie root ports. Hence add it.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index a208fa4b8332..ea0a803ac66f 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -515,6 +515,7 @@ pcie@0,0 {
 			reg = <0x0000 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+			device_type = "pci";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -525,6 +526,7 @@ pcie@1,0 {
 			reg = <0x0800 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+			device_type = "pci";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
@@ -535,6 +537,7 @@ pcie@2,0 {
 			reg = <0x1000 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+			device_type = "pci";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

