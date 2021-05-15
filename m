Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885A772
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 12:41:03 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id x8so1739572wrq.9
        for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gl0Loi45vxYJXDAYqv7bhXjrZcnq3MqdAuvq3JLbE9E=;
        b=cLwjdzAiJZXo6DcfOhUjRre4kKcmKK3cm7NVcKaIOQoPIBjPn56kNm3XQv4g12FLO0
         WlO6gF1mvd6xAa/LKboqbIcZFeGQEu0LJ/fhebUwUV2ME+im/jOHuENc/5KTEBk2wG75
         XBacoJ+oA3qsJcIDyFb9/+OzFw9lUrK6mI0Ti+js2B3LAAURbc6Fa1vgdMPeOv2UpbWy
         IO6Aaj20ZOPg/Mus+DnR+hH3m1vVcPNSiBj5rdBnTWZRQDa4lZbjMaxiBn5peUqElT8i
         QfAxTYvpkclodRqjto5+jykKe0vgAfvL6dq/0yD+GycNKU49/MjQFshM1rheJXSqi6Gq
         lEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gl0Loi45vxYJXDAYqv7bhXjrZcnq3MqdAuvq3JLbE9E=;
        b=jJnfjgHDYMlGtjZxt9LlPh4YpwTVyFTO6HmyNFGptt5a2g8QwdadaGKeJCeJcz6ufJ
         /7ogmCfPpmW8gHjYuZL7N3AFnxIqxxtEY5o2BAT+4N9H8z5KxCiaOZWOdPIhIMo8WjqU
         /bu5Z/bNz0nDbneHGH9fXgArTjvYY/QJE2kHI1V9pSWKDRsbz058hq3zpw7jOWpOMy8Z
         6JO2uYxayMn1hMN8KyJxUpHhHWSS61ja6OjRud/3udU/75IGFcvOXCt9wHEnKMKw2ViK
         6R09KG0fVBM4P6/ZzAQBlfwA0QF6uxDTtkZZ5EaRl15gJfodc2Mz2aEhOyairMzxF0zn
         y6QQ==
X-Gm-Message-State: AOAM532dbh8wXKMlu0ykmR7xxQAcQGIH1kru3UKqBs6wUTEE9azO0mw0
	hsZn/+RSwJ+Sffen3W2oQKE=
X-Google-Smtp-Source: ABdhPJx83NTgI2UIBF3sR+lRqH2zho+b7ycTz3fiD63Xfzb496ZnvCT/HGS5hs7668YR4nCdyZI79w==
X-Received: by 2002:adf:ebc4:: with SMTP id v4mr5585940wrn.217.1621082462223;
        Sat, 15 May 2021 05:41:02 -0700 (PDT)
Received: from localhost.localdomain (29.red-83-49-33.dynamicip.rima-tde.net. [83.49.33.29])
        by smtp.gmail.com with ESMTPSA id w7sm9472749wru.51.2021.05.15.05.41.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 May 2021 05:41:01 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de,
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
	linux-pci@vger.kernel.org
Subject: [PATCH 4/4] MAINTAINERS: add myself as maintainer of the MT7621 PCI controller driver
Date: Sat, 15 May 2021 14:40:55 +0200
Message-Id: <20210515124055.22225-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
References: <20210515124055.22225-1-sergio.paracuellos@gmail.com>
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
index bd7aff0c120f..312ea2cad79b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11562,6 +11562,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
 F:	drivers/i2c/busses/i2c-mt7621.c
 
+MEDIATEK MT7621 PCI CONTROLLER DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/mediatek,mt7621-pci.yaml
+F:	arch/mips/pci/pci-mt7621.c
+
 MEDIATEK MT7621 PHY PCI DRIVER
 M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
 S:	Maintained
-- 
2.25.1

