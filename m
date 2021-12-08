Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155702CB3
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 22:50:58 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id z18so4604190iof.5
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 14:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5uDGT+bQdOGd9jInpMhbePhooiUuliLL4k3ARcsSlNE=;
        b=SMrAIUyTmmwqq2KE5GitKXfURAPHk0xEp2DVv8M6//mv/uHw1hSIFsZ95PEHPiUUFr
         KpIizsH+p/xMLD8jfZiYd9/1Kqc0Glt26WUGdmpb1qnAB+gAjxwklaY4KS1yKOhY/7Tt
         9/b2Ctl7g9uhk6aCy2qxaH1JX1xbvvy7b/gXAF3SjLJqmuruA14QH/zL25f/rL9dbdPB
         gAB94PIy3CnlEB9M4HXQt/BiSyBfOQt3ssknZkE/fhXXfB6jt4TVgd2R/XppIocMvUWT
         tnIJ1BM6sybxx2Go9kNp7yu8VmuTlh19RBGTTLNAvz8GhZCYwd/AF6cDn0WIadvqji9O
         581g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5uDGT+bQdOGd9jInpMhbePhooiUuliLL4k3ARcsSlNE=;
        b=TOo83x0kCBTOyQZHpj1GmeIstvjGfw6dVw+knSxlBV46BTBeV1b0VFoZgKa6/pAy05
         j/XNtYbaarSTFUlj0+lumCcQyTS5MKd/0SYCSBfE8emOcG0EaB/mpY0mzc6P/v1jCsiT
         4FAzCOODwRw8EdkALddb7BLiwDkIQbkIIvx61dFiirVf1nKBpgmtq1iBF8h+dABMIzBP
         xxyhgrvsGaX63pjHjs0mWsAI5iJOFLzITr8tslktTU75r9Ojeixd/PnNNrnfEJsOCP27
         HNa2NZLRbpK/lNgT7OvHqV+K20T0o9hXoocH3QuWN/a5OLhO5vxm9d788fAuINE3fZml
         /35Q==
X-Gm-Message-State: AOAM531JN3sFtvzo4S51omScVq5C18v2rOGotONp4CWdd+JExKS9HMhl
	t9fm3JrE+4VhKSpkGWi94bQ=
X-Google-Smtp-Source: ABdhPJzyhQ8e0ZLCj/Du9L9st0l3VnW5IAfRW7Fn4vUJ5oaWO5af3oiXkAFyrdj38nTMLmZxbd0vtA==
X-Received: by 2002:a6b:8ed4:: with SMTP id q203mr9777949iod.200.1639003857077;
        Wed, 08 Dec 2021 14:50:57 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:269a:1aa2:f1d9:8dbb])
        by smtp.gmail.com with ESMTPSA id t6sm2378751ioi.51.2021.12.08.14.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:50:56 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: benjamin.gaignard@collabora.com,
	cphealy@gmail.com,
	aford@beaconembedded.com,
	nicolas@ndufresne.ca,
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
Subject: [PATCH 08/10] dt-bindings: media: nxp,imx8mq-vpu: Enable support for i.MX8M Mini
Date: Wed,  8 Dec 2021 16:50:27 -0600
Message-Id: <20211208225030.2018923-9-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208225030.2018923-1-aford173@gmail.com>
References: <20211208225030.2018923-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M mini appears to have a similar G1 and G2 decoder but the
post-procesing isn't present.  Add compatible flags to support
G1 and G2 without post-processing.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index eeb7bd6281f9..fb6c2ab1b2dc 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -20,6 +20,8 @@ properties:
         deprecated: true
       - const: nxp,imx8mq-vpu-g1
       - const: nxp,imx8mq-vpu-g2
+      - const: nxp, imx8mm-vpu-g1
+      - const: nxp, imx8mm-vpu-g2
 
   reg:
     minItems: 1
-- 
2.32.0

