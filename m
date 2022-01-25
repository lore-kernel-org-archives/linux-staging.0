Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FF62CAB
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 17:12:46 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id x3so2698190ilm.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 09:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RU3KIa4qrZXY9R48xjJEZLxL91fbwb33hYcDZGPVEeA=;
        b=KHvX4bjGcFWJPXQ91el6u/lSljusxx8pbcvu7lMe5WJ9FwnlTXtJ69WFqEVLsE4976
         RuF7fIouyHo1iSezLZbFkPem8wnA2SDnrF6rDwwnYZfdIbwv1dXNCkLCBTy+WpJydfm5
         EqcVwTs5S1iFUN1XY7i4NIgw7SCwiNg0+j7y7/lWwOjBk3HPSxr9t9cYTZpcSGbPaIIq
         or0eYS9JxmErq4ojq2ZQyvjFRmkcNA8Ava9Sm0s2Jg//dgpzGKZYQtbJibU+RLiyb1jV
         SHJnDa+wuTcz0PNhOea/uzau8fwSq0CQtWw5Q1KBWhJunAzkSrfVScL4LrwCdHeluWx8
         /w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RU3KIa4qrZXY9R48xjJEZLxL91fbwb33hYcDZGPVEeA=;
        b=eK7tYX2rBoEs/P5LCZdROwt4OiKTFCHF0t1l5dnlaS/sEADH7FLBDG2Wwc608kSXa+
         lDb99sohrm+w19oNRm4BibRlV28ea+iRs4sz/6oz7cMddRW3TRvLHaYGkX8QBtG+9K/Q
         MJ4Ebj1c0HyVhn14VjW1dLMbUwOCItv1D163bhN2n+Tu/sgq+AL0pW1vuZ5OxfrpKilh
         jfb98zNiS6B5hjBOxySpJyFIWMBeC+vIFT2IJ0rJoaYDGaDjQxAIn4VZykw/Z4G2+c6y
         i3d6ooWuDSqO0HwKXR/GxNtCFtGw5sIPPE+c7RzKbfxqWPZotQ1iH66kAdPZMDoCwxuA
         ab5Q==
X-Gm-Message-State: AOAM531j22YYde17yoTeQO/mnU5ve5vc2tFLW5v6pd3rT7GjFlhgs2rw
	0DvfiF6JXTWU1Oys8ezvg1k=
X-Google-Smtp-Source: ABdhPJysd/AktlKpxM3/2Jwk3iYtFwARQhWgrwR964Q7bKGasZLBkRVo7UQcFFUdCsdTaVEYa5IG8A==
X-Received: by 2002:a92:cd85:: with SMTP id r5mr12345147ilb.182.1643130765506;
        Tue, 25 Jan 2022 09:12:45 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:6592:b6fe:71b1:9f4c])
        by smtp.gmail.com with ESMTPSA id m14sm8090291iov.0.2022.01.25.09.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:12:44 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: aford@beaconembedded.com,
	cphealy@gmail.com,
	Adam Ford <aford173@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH V4 09/11] dt-bindings: media: nxp, imx8mq-vpu: Add support for G1 on imx8mm
Date: Tue, 25 Jan 2022 11:11:26 -0600
Message-Id: <20220125171129.472775-10-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220125171129.472775-1-aford173@gmail.com>
References: <20220125171129.472775-1-aford173@gmail.com>
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
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

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

