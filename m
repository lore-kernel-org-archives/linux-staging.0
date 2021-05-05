Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE1372
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 13:21:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s8so1808036wrw.10
        for <linux-staging@lists.linux.dev>; Wed, 05 May 2021 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0LMGdiM1XJ6vNggAu/N2nQPAdXKdjBOTMVMf4d391FA=;
        b=hM18wzrU9Uzhl/GGIMr/Q1eXk8TM10zISybZsKL+Fb+nefclzeVB11UKGEuYn73Lfr
         KWGSlj/L8M9GlwAMONt3GPFskdmJ3GuwBTKg7ncdiVaPO/YqxAj1URDu61/J5hccOmz8
         tOsevTkePtUR1hAd6BvJwA76dc+lhCV3uMIfgWQeYxCfBskgtAlk2Mo6ZlxfMPk8H2GC
         A8tsG3iqzTPC+NSCQdA9GUSM6XzR1o2KBRSdfRv5HdyqqlXDzqPkyKm1eKpx9Bw/8HaZ
         DSYBlJwVfT07iwd23F7nn70XM808o2CPpygLNOoMy3WRblTvInk9TTR7OCmFLru0Sbam
         XQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0LMGdiM1XJ6vNggAu/N2nQPAdXKdjBOTMVMf4d391FA=;
        b=kxRudZlQHwUte1NdBu7fUML4OsClw+eoPMlb6cs6RFfmfxpEa1t0liiBDLaIb3bN0+
         1Cvt9S8DBhmQO0bS+mQvwWt4eTrJ+X238neHfhyL9Y8wwBmDuCKu02so7TaQg2AULjUV
         ZGQe2vFlCumCJn5dNh5dXxDOWBNeJgmJ8/wHhauG4HuCq8vnT9LEFTpTwR6YZSy/HtQp
         Gnk7STuOvsax1rVDdrhuXYHHNO7MeqhfTIjrVOKoNLnV8YJ55CM22GHlbLjvSGVPIFvf
         BoI7X/QjarkedNdIa18GnmMR/jeJKGsfCoawbGjszwpSQEpJVjduV4LGiHPlRmsCFdZP
         LNrw==
X-Gm-Message-State: AOAM533+0RWwjY4xfYadm9T2G94LT+CtyUrbcSJLKDYqXN1PMeR5us+P
	STyNRo6oYlvVIPe3tAPtcYpFcrmduMQhGw==
X-Google-Smtp-Source: ABdhPJw81zUtp86GJROvq5dtaRnni+OHaNPlPiZLuZkT/yg9i3EIkFABnCPIZKN/pZhXQTLFqOnGRQ==
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr38692581wrs.343.1620220918185;
        Wed, 05 May 2021 06:21:58 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id a21sm5905796wmj.34.2021.05.05.06.21.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 06:21:57 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH 2/2] staging: mt7621-dts: use standard 'syscon' string
Date: Wed,  5 May 2021 15:21:54 +0200
Message-Id: <20210505132154.8263-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505132154.8263-1-sergio.paracuellos@gmail.com>
References: <20210505132154.8263-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both 'memc' and 'sysc' nodes are not using 'syscon'
as a node string which is the standard one to be used.
Update both of them.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index b39c7968239f..5623d542bcf2 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -55,7 +55,7 @@ palmbus: palmbus@1E000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		sysc: sysc@0 {
+		sysc: syscon@0 {
 			compatible = "mediatek,mt7621-sysc", "syscon";
 			reg = <0x0 0x100>;
 			#clock-cells = <1>;
@@ -122,7 +122,7 @@ i2s: i2s@a00 {
 			status = "disabled";
 		};
 
-		memc: memc@5000 {
+		memc: syscon@5000 {
 			compatible = "mediatek,mt7621-memc", "syscon";
 			reg = <0x5000 0x1000>;
 		};
-- 
2.25.1

