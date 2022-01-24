Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB192CA8
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:31:51 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id d188so3437774iof.7
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 18:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wM27uiC4jZN6SIACqztmxLT6jE1eUS0JxDrZiiXzyRg=;
        b=OeEzUz+xSnEJ37CVSWNU73LKZ0yZoFVZW300ZrxE0zAlrUsF5B00SQDxDtIgduR0qe
         wjo+DFeHXaKCvIpUxXIFbK4SgqgFafQY2aFDBZtoanjokOm2VxhV7DApE36kYOI+qqk3
         qXdObbAmy7fUyTuApsbsl8TCJxZuO/SnVDPIuV+Dstc4lZg2GlxRZUcgU9Y20Hji7HZ4
         wzL/MIagejiycvC0z9eb39TB+hjzYvTywl7dF52F2Q+xmkcVkngQAHohfaqN2TiMSoKF
         kqZB5Unnk90Jlk5hThs1ymZYgncn4s9DwQzGWnmiI/JdMHdhBPu4x4TEj4WuUQ6wN4cS
         uOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wM27uiC4jZN6SIACqztmxLT6jE1eUS0JxDrZiiXzyRg=;
        b=W7MnTblTWF4/yeuuRd24cm8eAGtIq6rVRb0p3O/gbLd9ey52hqgoiD/bkc4VRd+frp
         AiQbS+BXQ+a9Kj2nYxFsvkgOKbs+BrYCEdZHtes3gcOwdZrakzjaXmdNDhvK/gViVoX+
         KHif6UhBvjujFspZjjooyusqfjbBrSCybDbxYhKIu2E8+pSYuK/ncE5jtoHtZ1NSbKos
         Ag49nOgooj8VX1P3+MsSeAtwKIgVyxz97lUx1Vx8j+4ldEGywmb4ZUTdAxvBUwhCwuTq
         vr8OokPimKxpcKbnGJ7vTGV64xm64gwl/bWCjMQLiwz8Gkejk4dvfzxpqVYYjwkplTWT
         K+6A==
X-Gm-Message-State: AOAM532KRzEjQMJz4N+g61hnYwZ2AGFpZdQR7TvDQZsD7FuSFFSuXWwN
	GGTKjJpcVg0OujeQo14ArhY=
X-Google-Smtp-Source: ABdhPJwVCAXerAQEZRw1wksjIQuYDlek3Gm5nUOSoAy/LVpBfHxOaxA2QAELIH/ZTZREKTlcu6u43w==
X-Received: by 2002:a02:3904:: with SMTP id l4mr5957775jaa.161.1642991510607;
        Sun, 23 Jan 2022 18:31:50 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:582d:ad0e:e5a6:94b6])
        by smtp.gmail.com with ESMTPSA id w4sm6625633ilq.56.2022.01.23.18.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 18:31:50 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V3 08/10] dt-bindings: media: nxp, imx8mq-vpu: Add support for G1 on imx8mm
Date: Sun, 23 Jan 2022 20:31:22 -0600
Message-Id: <20220124023125.414794-9-aford173@gmail.com>
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

The i.MX8M mini appears to have a similar G1 decoder but the
post-processing isn't present, so different compatible flag is required.
Since all the other parameters are the same with imx8mq, just add
the new compatible flag to nxp,imx8mq-vpu.yaml.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 9c28d562112b..7dc13a4b1805 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -5,7 +5,7 @@
 $id: "http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: Hantro G1/G2 VPU codecs implemented on i.MX8MQ SoCs
+title: Hantro G1/G2 VPU codecs implemented on i.MX8M SoCs
 
 maintainers:
   - Philipp Zabel <p.zabel@pengutronix.de>
@@ -20,6 +20,7 @@ properties:
         deprecated: true
       - const: nxp,imx8mq-vpu-g1
       - const: nxp,imx8mq-vpu-g2
+      - const: nxp,imx8mm-vpu-g1
 
   reg:
     maxItems: 1
-- 
2.32.0

