Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EBE2CAB
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:31:34 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id a12so17770252iod.9
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fa6XTevFEqtbC/DVeN/V/vlo7FN29Xl+JkqDuO3dnjc=;
        b=EZqSX3m/b79QIHHKJpNK7iciDNnVqv2GsxsNslHqcu+b2/SVqWynl3l15N0qCsVK/I
         Yx1eudSWla7Dd8qyzF5qAsiUpkVMyj2XJDrDr9HOWdJKc2E+ay069qw97DTs4bgISlFK
         03jL2XfE5E5sojSaVA4Y2QJO3McRJH0rg5E6MWnvvXqclq4FjCVS46AOUKMIhxg6kSHH
         ewK2KmoE9/IIpVFqmdwY5A+xkX0aM0/ibEuwupB4bQ1AEamqEVi0LPEW1oZGkBWyoRyO
         RW2MUulcBjX1lu2hG2irWeKiLysinNyNDbhVT0EOvKcB/VaUalJqUqaPzAw1bH4Z9bQP
         NX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fa6XTevFEqtbC/DVeN/V/vlo7FN29Xl+JkqDuO3dnjc=;
        b=pg6pkvbV8qss5hJisAoOWHGD9VR6v3WtgDQ4VMG3lmdghsY0dPyvwSxzSNZVXc7URX
         H4PRlvmzC/624qC+gdD/Cj2YfI82fBy1qzzHPeS2nBKzgTiZfjMSL5SInDauVxXdopUH
         dV9m3Q+PWeL+lqbymmq1H2AkgF+kMKrzdO+m+EKwPmKcxw/3YUzsNd2wGlRJZV5gMo/R
         nta4194mVzuIDtJQqFq6m1M9zOSG07uG7Qxj5VoWT6egdcf2YMwF7Weca/7EaVVhKfK5
         UOWDmydfuw1uivjxyj4ChvRiKd1dterXeM9inDSAN42J7zgAsYMwqigQHEw2Sg/iaLhW
         kxXw==
X-Gm-Message-State: AOAM53055wigFJMu/9d6w8srHenO2HsS8FI0/ztX5UcP1zYO9udRV6A7
	P3wJhEqpVIMK85gOIqS8fYE=
X-Google-Smtp-Source: ABdhPJzZXrS5FylPpYYU4zVBZQCSvGD3wFbcXnczpoUHVM/tfgVP3PLph+WJ6MmfCFVpINI7srDZMg==
X-Received: by 2002:a05:6602:2e8d:: with SMTP id m13mr7155501iow.68.1642991493493;
        Sun, 23 Jan 2022 18:31:33 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:582d:ad0e:e5a6:94b6])
        by smtp.gmail.com with ESMTPSA id w4sm6625633ilq.56.2022.01.23.18.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:31:33 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	aford@beaconembedded.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V3 01/10] dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
Date: Sun, 23 Jan 2022 20:31:15 -0600
Message-Id: <20220124023125.414794-2-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124023125.414794-1-aford173@gmail.com>
References: <20220124023125.414794-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Stach <l.stach@pengutronix.de>

This adds the defines for the power domains provided by the VPU
blk-ctrl on the i.MX8MQ.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>

diff --git a/include/dt-bindings/power/imx8mq-power.h b/include/dt-bindings/power/imx8mq-power.h
index 8a513bd9166e..9f7d0f1e7c32 100644
--- a/include/dt-bindings/power/imx8mq-power.h
+++ b/include/dt-bindings/power/imx8mq-power.h
@@ -18,4 +18,7 @@
 #define IMX8M_POWER_DOMAIN_MIPI_CSI2	9
 #define IMX8M_POWER_DOMAIN_PCIE2	10
 
+#define IMX8MQ_VPUBLK_PD_G1		0
+#define IMX8MQ_VPUBLK_PD_G2		1
+
 #endif
-- 
2.32.0

