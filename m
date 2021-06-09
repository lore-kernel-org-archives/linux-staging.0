Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ADB2FB3
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 14:02:07 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id o3so7253762wri.8
        for <linux-staging@lists.linux.dev>; Wed, 09 Jun 2021 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AYWDI6BG8IdRoFPaJz/bP9vC9WkcUEC9Y1+RTob9aXc=;
        b=b5m4IM3yjBet0AWST2O9Jpwxqjd2kDUCn92XMVhC72ujjOfkDoVI4N41Z0NTFy5VpE
         OglH+M9cHy9M3rUqXKcFYPNr3qBW51d5WebmAHdVIjFkUcfVn3F3Y8Q6Rxt5HpJl2DK7
         PFdUjeD0uO+NFVCQJHsP2sUMqtC5aA3tbVEKs9gJNFHh3c4rkVAe7k8QLlKkoK5QxtkU
         o3Gdi6kAVjOU2MnTvDPB5oFQT3IhDOoM/eJyQK9ABnYQvXqYBgT09bo29dStiR32Hakl
         onIiJnMpNpr6WheKCJTWb8PyeY+SFdBNaflEzsojeh306rMxNJh+2ipkEMCRXTL6/bRb
         6M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AYWDI6BG8IdRoFPaJz/bP9vC9WkcUEC9Y1+RTob9aXc=;
        b=SUp500aJyQ3Zho2hGcxCHzHYzWJZSbl/GXUHzR78EOkWgEDXU9tpIfZgRpete8S72R
         47GKoDwhythM0OVafGrHdJyxxbUu5NQGK0UFcseYj79bF5n5dLHrrb2TGzpBJzBQUJRK
         x7bw+y9QcPgNrDSQmABuaBsI6Hil2JeQPjKPw3lt5ep8qnkCSpsiHOVMAAH8cofr+Vgd
         qFyo/wwUdJ81wl7vLpFwsAtEjl+lhxEYuO9U2d6gqwJAw2OO0m97hqWNguquA4csE44Q
         8GCQp5tMCx+AsvKn8JhTwhbwn+tlQaaiP6ky0/NGzBpdR6r+6T6FDVBKwbqMcMxds1e6
         cPFw==
X-Gm-Message-State: AOAM5301xNm4HwN86ug5Z2dadOFjIerTCVS2dmt38I+mBVJFlPKCCcqz
	n0CW4cI3lSXrG9CgEQOPXgQ=
X-Google-Smtp-Source: ABdhPJyyaptNj1K8oWVB9T8IptJSFw4/2SNsjIpbwawKmVfW8s1K4w8ilEL0kkh4lazfgShnc3pfhQ==
X-Received: by 2002:adf:e401:: with SMTP id g1mr27533771wrm.415.1623247325881;
        Wed, 09 Jun 2021 07:02:05 -0700 (PDT)
Received: from localhost.localdomain (103.red-81-47-144.staticip.rima-tde.net. [81.47.144.103])
        by smtp.gmail.com with ESMTPSA id m23sm5673912wms.2.2021.06.09.07.02.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jun 2021 07:02:05 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	john@phrozen.org,
	bhelgaas@google.com,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com,
	linux-kernel@vger.kernel.org,
	pali@kernel.org
Subject: [PATCH v2 3/3] MAINTAINERS: add myself as maintainer of the MT7621 PCI controller driver
Date: Wed,  9 Jun 2021 16:01:59 +0200
Message-Id: <20210609140159.20476-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609140159.20476-1-sergio.paracuellos@gmail.com>
References: <20210609140159.20476-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the PCie Controlller driver for
MT7621 SoCs.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c55fdcc1514..2e58fba01289 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11574,6 +11574,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
 F:	drivers/i2c/busses/i2c-mt7621.c
 
+MEDIATEK MT7621 PCI CONTROLLER DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
+F:	drivers/pci/controller/pci-mt7621.c
+
 MEDIATEK MT7621 PHY PCI DRIVER
 M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
 S:	Maintained
-- 
2.25.1

