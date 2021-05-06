Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780862F80
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 17:07:47 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id s8so6400956wrw.10
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w13kinq2wNVFpWCwyDgluHjG/I2taAYNVK6GnqwpNPo=;
        b=qJwqGkFD/BOq8oFeJnc8/XXHIeyBnhWdk8hEYTOLpwdKjO7+GTl2iGg6D+LOupWAZt
         QfTBHGbTsIv6S4Yln19KWBxSEH7ZZMSJBacPcu9hK4QS8CjF2imWcUC9K6VHH6qDlboV
         wFZu9guBXoBSEA3ISA4XM0UrnEP2BboVKWRmePGWM153Zsz0kOx5vnl1wlFr85i2gk2G
         BjfPwzGndYUyFVdWstLve4J+cWN73zhSq4RbMtuc+QhBciWdnhuiTG5HUY91xvC8Zi3y
         fFEKwxV9wrkh/QuWPv8YYPRCqRKiDedXWg02q6IZ+kW8HtxcNA3wz7QMm5L7P4pMt0OD
         KWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w13kinq2wNVFpWCwyDgluHjG/I2taAYNVK6GnqwpNPo=;
        b=j+GjmXTwnyXCaXyMat7NdotAxosvh1dJK8kw2DPD3pB4fTTSBlTZXFC2H6mEZwMweS
         stDH5cSWio0MldenFLpohltIrAYV2cuae6wvV8c/sUb7f1IccAPMelabJWel3Z+++62Q
         9yIuSfqH6KOH5U0BKz0/GtiEVqHJV3jzr8HKpFOTthTygLVEchGNHCUfN8kpXtuD/WFn
         R3iz0NrLFJ81HDQqT/9h5zJE5C5QZdhkByDs9yLTm+NINJo00fvx0Wco42Ht+Ta8jU7H
         wTsHHW+utw2UMzvathXrjwRp2QoVLzd+Hv6dPYpBSNDuMEdFBIaN0vjoYkjF7LCeWfhl
         pL0Q==
X-Gm-Message-State: AOAM530/v/Pns+I7xYSkgBTAu2ag+Ec7py9RmyNVok/YR9GTEx1m9C7n
	aV1D6e3cAsQPsZ0hvFEnIvFdzczw67TD1Q==
X-Google-Smtp-Source: ABdhPJyN8I1Wzk4CF4P3T5T4ZQppTwryy3XRbXu4EC+xB8hVXo5wbl1s7LqSp2C+zB5FqSHyq6YUmw==
X-Received: by 2002:a5d:69d2:: with SMTP id s18mr6575526wrw.241.1620320865841;
        Thu, 06 May 2021 10:07:45 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id w7sm4986378wru.51.2021.05.06.10.07.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 10:07:45 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 1/2] staging: mt7621-dts: remove 'bug-range' property
Date: Thu,  6 May 2021 19:07:41 +0200
Message-Id: <20210506170742.28196-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506170742.28196-1-sergio.paracuellos@gmail.com>
References: <20210506170742.28196-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Property 'bus-range' when values are the default are
not necessary to be defined. Hence, remove all of them.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 001ff8f51033..a208fa4b8332 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -489,7 +489,6 @@ pcie: pcie@1e140000 {
 
 		device_type = "pci";
 
-		bus-range = <0 255>;
 		ranges = <0x02000000 0 0x00000000 0x60000000 0 0x10000000>, /* pci memory */
 			 <0x01000000 0 0x00000000 0x1e160000 0 0x00010000>; /* io space */
 
@@ -520,7 +519,6 @@ pcie@0,0 {
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
 			ranges;
-			bus-range = <0x00 0xff>;
 		};
 
 		pcie@1,0 {
@@ -531,7 +529,6 @@ pcie@1,0 {
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
 			ranges;
-			bus-range = <0x00 0xff>;
 		};
 
 		pcie@2,0 {
@@ -542,7 +539,6 @@ pcie@2,0 {
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &gic GIC_SHARED 25 IRQ_TYPE_LEVEL_HIGH>;
 			ranges;
-			bus-range = <0x00 0xff>;
 		};
 	};
 
-- 
2.25.1

