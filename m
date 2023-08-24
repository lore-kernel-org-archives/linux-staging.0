Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC11AD2B
	for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 08:03:42 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5DF998159;
	Thu, 24 Aug 2023 16:01:13 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Aug
 2023 16:01:13 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Aug
 2023 16:01:12 +0800
From: Jack Zhu <jack.zhu@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss
	<rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	<bryan.odonoghue@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<jack.zhu@starfivetech.com>, <changhuang.liang@starfivetech.com>
Subject: [PATCH v8 7/8] media: staging: media: starfive: camss: Add interrupt handling
Date: Thu, 24 Aug 2023 16:01:08 +0800
Message-ID: <20230824080109.89613-8-jack.zhu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230824080109.89613-1-jack.zhu@starfivetech.com>
References: <20230824080109.89613-1-jack.zhu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Parse interrupt resources and register interrupt handlers.

Signed-off-by: Jack Zhu <jack.zhu@starfivetech.com>
---
 .../staging/media/starfive/camss/stf_camss.c  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/staging/media/starfive/camss/stf_camss.c b/drivers/s=
taging/media/starfive/camss/stf_camss.c
index 75ebc3a35218..918b8b2a7713 100644
--- a/drivers/staging/media/starfive/camss/stf_camss.c
+++ b/drivers/staging/media/starfive/camss/stf_camss.c
@@ -35,6 +35,12 @@ static const char * const stfcamss_resets[] =3D {
 	"rst_isp_top_axi",
 };
=20
+static const struct stf_isr_data stf_isrs[] =3D {
+	{"wr_irq", stf_wr_irq_handler},
+	{"isp_irq", stf_isp_irq_handler},
+	{"line_irq", stf_line_irq_handler},
+};
+
 static int stfcamss_get_mem_res(struct stfcamss *stfcamss)
 {
 	struct platform_device *pdev =3D to_platform_device(stfcamss->dev);
@@ -157,6 +163,21 @@ static int stfcamss_probe(struct platform_device *pd=
ev)
=20
 	stfcamss->dev =3D dev;
=20
+	for (i =3D 0; i < ARRAY_SIZE(stf_isrs); ++i) {
+		int irq;
+
+		irq =3D platform_get_irq(pdev, i);
+		if (irq < 0)
+			return irq;
+
+		ret =3D devm_request_irq(stfcamss->dev, irq, stf_isrs[i].isr, 0,
+				       stf_isrs[i].name, stfcamss);
+		if (ret) {
+			dev_err(dev, "request irq failed: %d\n", ret);
+			return ret;
+		}
+	}
+
 	stfcamss->nclks =3D ARRAY_SIZE(stfcamss->sys_clk);
 	for (i =3D 0; i < stfcamss->nclks; ++i)
 		stfcamss->sys_clk[i].id =3D stfcamss_clocks[i];
--=20
2.34.1

