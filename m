Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D9872
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:52:06 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z14so2900722wrg.6
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f+V5SiVl2kkOy/yYlwXKZzNOprDKJ5dTKmoAKTfv3aM=;
        b=bucdP24HYxlT6TWEjXyUPvONVNb0JpxiZu8/loONFSZ92rvIOC1x0BjqvMLT2LPYBX
         TBRLmgHfnOPZHqyZVHM5j05x58PuBHzojsDhVKzF1zzIS9RbbplR7cUMkhepW1fqaGRZ
         q2IjGoL2zoXHvm4nu3zXkAedks01nR5nIRvXhMKEL4uXM9PJ9N7S9YuvSbRS+Q55LoJ1
         j/EloDcX2+iQNZzotF3dLzVEnw/P9Xan03UEtIGrPDo336jNCXF/cVRuYhTqv7Kc2Ul7
         I/8AvgC37NOnfmp4E0w84tnuVzH9ADTN4Htyk4uWcsAqfb003qmDp0vUqnWVmRTCydVx
         GwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f+V5SiVl2kkOy/yYlwXKZzNOprDKJ5dTKmoAKTfv3aM=;
        b=IKCuRde9z9+KNAEtR5NsR3hF3HzqMvzY0tuGZpmEwyXTk5Dcb74fVbP3sIN+/cmFmO
         pQHRH83ZSdJ9KESuh2XITb5A9jyf0BZmtu5qKcFQpZhjOUHw/RgX+75+7Bbogwj6SrSv
         IUL62vmT+h7XKVm0fGKOJe6PDJxthDkqJGK/mqFNmginQi/LQJX83vrAutpTtWWDPxve
         +BcyJAbShIgRBeQVeO2DtnIaQgvnkQ6YpXZpsnmTVpiRVUw+n6avLStXqFU7PPx46qTV
         59DiFG6VvYnOYcTqrW1r7xF9uuqWz524ChAn/7Vaj5i8heiyNDEbvtvXFzfD3u1KJsUY
         1lZw==
X-Gm-Message-State: AOAM532Kis0O0IpEkmDTJt7ROxqsWZRuxWXbghzdeu+1eGdi9/AHdEs4
	URAw8iFrgK6TGkrurNKT/KLH2NJIms8=
X-Google-Smtp-Source: ABdhPJyZwEbzW/If1+5CApn4tyveHXYMBuh4Z6UsMNKJKSztWOBa1HTT6VG8T6x/6yttPUTnlpAcgg==
X-Received: by 2002:a05:6000:1689:: with SMTP id y9mr14277946wrd.52.1634896325011;
        Fri, 22 Oct 2021 02:52:05 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id v3sm7738140wrg.23.2021.10.22.02.52.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Oct 2021 02:52:04 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	neil@brown.name
Subject: [PATCH] staging: mt7621-dts: complete 'cpus' node
Date: Fri, 22 Oct 2021 11:52:03 +0200
Message-Id: <20211022095203.9343-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some properties missing in 'cpus' node for this SoC:
- '#address-cells'
- '#size-cells'
- 'device_type' and 'reg' in child cpu nodes.

Hence, add them all to the device tree file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 82b64d4aab2e..f5c0df78fa6b 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -8,12 +8,19 @@ / {
 	compatible = "mediatek,mt7621-soc";
 
 	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		cpu@0 {
+			device_type = "cpu";
 			compatible = "mips,mips1004Kc";
+			reg = <0>;
 		};
 
 		cpu@1 {
+			device_type = "cpu";
 			compatible = "mips,mips1004Kc";
+			reg = <1>;
 		};
 	};
 
-- 
2.33.0

