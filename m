Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3EF2F80
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 07:09:40 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id x5so11362184wrv.13
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 00:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5j0/SkQ5MnH/k0JVcJB2AM+3scDK+wjHcTxj/JFadC8=;
        b=GA+TKHud80mn4qE30fVhSRtcBi0OjBR1MavRxpfJqh0LQSgNZdUJOY80kToQ1cYmNG
         f9J159mvua6gFHdBOpfBuF0nXdkmsQEcbmAzpJqpGOhjfncF7mXYrkJDcw1A4+bDvBA3
         x68H5TAhq8jY2YgIHk345vZUN/+UAu4VJHd5x2gJrUDfLwyuLr5zqGEJuFe3NrvQPjk+
         5CXvMW3rt3dz5BjNR2nAZ9vwAe8vLEkuw+jmZI4zGInQAqH28zJ/uBg8Pno9/oE57h73
         fQDEDMijv6fQPYdxUcdzZ7TgdE6hT333DkE3sIssI0D15Jki6gCEqA4N3VKyfMkCmAMF
         /dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5j0/SkQ5MnH/k0JVcJB2AM+3scDK+wjHcTxj/JFadC8=;
        b=th8qi0RuJuY+cHCCUFZ1OM7pmGccOoJXN4rnstcBV+ca4Ag5XCmHmq6H6xtDzbdsAA
         w7flskhs3hiqNhXIHCXgN8XIEy/pz5taPoaRjvt5MHgMKVpIs2jI7reDa+umkJZ7go+2
         D/bR3cyB6DxBdLzlY+EA7TqT3F1tqqQLOvkw69eh/hIyLV64nCpHejLqquObsCKFbJVv
         l2AkUOrtQnzwkez8fvtroyMpAaPlJl26l+fN21KObnpsSm15PsI+YinT9I5KBS5UmSxC
         yGZcdu5CLGQNb5+sQJsJx+Xa7WR9Ld/W5fY8ZfKJ0kwayJOgg7nUUy+xnD+UHavJ96Zp
         7jJw==
X-Gm-Message-State: AOAM533RvOamqNl5Qvf5ZLsn/9Wt+iS9+8JfV7bEs+CBs2oxoETWen3l
	5atgrwSJl7J3KurxPixwLo4=
X-Google-Smtp-Source: ABdhPJwjBXqL1KZBUhuCyAQwuynl0Jh6CqAysR/8Lz1mlmCIOEzf0l/RQ+mHfVULZtM07Z2hKEIZDg==
X-Received: by 2002:a5d:525c:: with SMTP id k28mr17406270wrc.158.1620457778811;
        Sat, 08 May 2021 00:09:38 -0700 (PDT)
Received: from localhost.localdomain (231.red-83-51-243.dynamicip.rima-tde.net. [83.51.243.231])
        by smtp.gmail.com with ESMTPSA id s18sm11740345wro.95.2021.05.08.00.09.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 May 2021 00:09:38 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: vkoul@kernel.org
Cc: kishon@ti.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	robh+dt@kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	ilya.lipnitskiy@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH RESEND v2 6/6] phy: ralink: phy-mt7621-pci: properly print pointer address
Date: Sat,  8 May 2021 09:09:30 +0200
Message-Id: <20210508070930.5290-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
References: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The way of printing the pointer address for the 'port_base'
address got into compile warnings on some architectures
[-Wpointer-to-int-cast]. Instead of use '%08x' and cast
to an 'unsigned int' just make use of '%px' and avoid the
cast. To avoid not really needed driver verbosity on normal
behaviour change also from 'dev_info' to 'dev_dbg'.

Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/phy-mt7621-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index f56ff10b0885..242c5d8b8635 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -273,8 +273,8 @@ static struct phy *mt7621_pcie_phy_of_xlate(struct device *dev,
 
 	mt7621_phy->has_dual_port = args->args[0];
 
-	dev_info(dev, "PHY for 0x%08x (dual port = %d)\n",
-		 (unsigned int)mt7621_phy->port_base, mt7621_phy->has_dual_port);
+	dev_dbg(dev, "PHY for 0x%px (dual port = %d)\n",
+		mt7621_phy->port_base, mt7621_phy->has_dual_port);
 
 	return mt7621_phy->phy;
 }
-- 
2.25.1

