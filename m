Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FA2F80
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 06:52:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id a10-20020a05600c068ab029014dcda1971aso6179203wmn.3
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 23:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FOVnFr/nj3QWdNJlIgekW/kswIF2a4pE9kCJghjF1wk=;
        b=RNrV+8KPF4RQbDUoE/C4kEXsBDvsBWPCBgUUGzbcOX4dgaJyyZM4Tyjz46xR6nZtr+
         1a0PXZLVhyQMbknf9ZzOEl8lnfxEkHfcfLYuYIIi16sSpyzQo5BBtICKtRSvnRvc02i1
         qqoDw5ETGX9Tqk4x6zBiogfNgjMmD5ngR0k8NdKDIW9VcCpijqksEGgZGhAtyJtO7z05
         AAe1goG3fXoeyly02qNdOvnw5VKOwcLy9Js0mTPBqlYx/1jepwFqjPo6zB4QMA352L0R
         ApjLreWZEev034EQ/D1GMSHqngbhZ5a5xInKU6DKmdiDzv1mFgc7XVPC9fp0R3b758Ck
         L1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FOVnFr/nj3QWdNJlIgekW/kswIF2a4pE9kCJghjF1wk=;
        b=Qu5jlgdHpsMGMxOji4uaYMqkGmxh0QxLG/REglmyeQ3Hg0GOQETcABIRvgiPkklgC6
         IJ+GbcJR68MF/Ds4aD8O/4/hu6NrUvpO3I8QTgXgrxfxBqeOz121UKmdgWwYkYW+cCiZ
         ALhOrocmXJ4t06t3/9U7EmqEyxqvrLLYvUk/tWQpcIBgusG7kAz+ZyuzYwETulh3+AR8
         I5vjBBUZCs0m2HaI+SAZnctNE9k0Y6z3rDlG/i3YBAoLxet4BPt6zfqPCDEXvApnrtWV
         rIfBAyK4evUQVJtD0qVUgE15s8qSB0GnY6AQFJ3Plsc4loJeBquS5G+hDTPBLKfmZG8D
         h2eQ==
X-Gm-Message-State: AOAM531wC0CMn59+RjlFzsFFHkxfddzjmJP0PfV4/5L0L8ZYZ6aaxDOe
	qSEkOTNJAfPC2cqN8ULYNSA=
X-Google-Smtp-Source: ABdhPJxBzYTMkYXsqVIu+tuk1PbOpRnhrqpL/d3bwBEyvWL/IwJSj8T10XNSxMuaGH39Xj/339rgzA==
X-Received: by 2002:a05:600c:350a:: with SMTP id h10mr1867908wmq.154.1620456756289;
        Fri, 07 May 2021 23:52:36 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id b12sm11638010wro.28.2021.05.07.23.52.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 23:52:35 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	kishon@ti.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com
Subject: [PATCH v2 1/6] staging: mt7621-dts: use clock in pci phy nodes
Date: Sat,  8 May 2021 08:52:27 +0200
Message-Id: <20210508065232.4882-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
References: <20210508065232.4882-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 SoC clock driver has already mainlined in
'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
Hence we can use the clock in pcie phy nodes to
be able to get it from there in driver code.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 9ee11adefa79..840ba0c3ffed 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -548,12 +548,14 @@ pcie@2,0 {
 	pcie0_phy: pcie-phy@1e149000 {
 		compatible = "mediatek,mt7621-pci-phy";
 		reg = <0x1e149000 0x0700>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
 		#phy-cells = <1>;
 	};
 
 	pcie2_phy: pcie-phy@1e14a000 {
 		compatible = "mediatek,mt7621-pci-phy";
 		reg = <0x1e14a000 0x0700>;
+		clocks = <&sysc MT7621_CLK_XTAL>;
 		#phy-cells = <1>;
 	};
 };
-- 
2.25.1

