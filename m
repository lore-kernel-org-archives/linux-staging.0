Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E93C0F;
	Mon, 24 Oct 2022 15:08:26 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13bd19c3b68so1481420fac.7;
        Mon, 24 Oct 2022 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf1QpnlooM/EzBO71nDJaALY4Af30m+RUToV/sEcQc0=;
        b=YWb/8dOxbdWFi4W7XwLCdMiy/5vsnQT8eIL9iFMK1j1zGHbcH8zlhIrf2maHvqZxWd
         oXNooHcb+yWL1U45waazeowROIGQd7Opoztx9JkTr5CXm7YXwfkNq9uZxy19vgCpYoZc
         +D6jAY30f5t9XUbRvHErE3uyr92pqndnuW3B+graI/nmQAZZzZtKSSo5ZeBdMEdJjnZa
         IkqKtQ9YM2lhnJpZcwB6vcZpn0138OfBhnxoj9zBFEcnowyJ1GIHob6C7oUe8PAzCUOV
         shDXtPOYUIy8/3fp5UcXXxnQbWXJhO81EVz0OLw9904X5s1+AQvgnFws0JLZjCJXOJD/
         +FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xf1QpnlooM/EzBO71nDJaALY4Af30m+RUToV/sEcQc0=;
        b=1WB2TtFRPuzd4UzY0N79uXDTsYI/KmYZD6b6usQZaG436AaQIfc8CAy7yvE78OQkg7
         9AbAaM7fwuBmP/rrdyllGJwQQFtEE+ZGiQsLED76RPPMn7N/rE5MQxhcP6UWX+Fgz/Fl
         18WNLaEoJNYtLcPsg6bywzqvTtChq/Ipb5SjkRIfCuot15AugJXcrYkziNIBr7oJUu6E
         pxJWslSMu4tWj3yWPTCI0zdVlvCqCbjcc+ft1bzwHJ+ahgidla4ks1dhhyyz6nnzqFi7
         3jLbu7wG7ux7pJ0nhk7LTCC+qCSSbqhHsonMHjd1LpC8beIQKU+/nkjUOmfD+Vq9dLRL
         Xs+w==
X-Gm-Message-State: ACrzQf16+lwRgxTGyVyncNOV7JM7mkLcatlh0KqQkxwWwTSDqZPOBHzC
	RScSJUJQ8lZ9r06b3Ms+EY4=
X-Google-Smtp-Source: AMsMyM5RpJNF3gJeZ9+k4mWvaTefhcNVEdR3otp/3VizCshKQP+5vqFHs/wyK0UugSqNcNfbJ+mZvg==
X-Received: by 2002:a05:6871:112:b0:13b:99e0:2be3 with SMTP id y18-20020a056871011200b0013b99e02be3mr4297213oab.299.1666624105441;
        Mon, 24 Oct 2022 08:08:25 -0700 (PDT)
Received: from gabriel-Nitro-AN515-54.. (201-27-204-68.dsl.telesp.net.br. [201.27.204.68])
        by smtp.gmail.com with ESMTPSA id e18-20020a056830201200b00661ad8741b4sm4532583otp.24.2022.10.24.08.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:08:24 -0700 (PDT)
From: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
Subject: [PATCH] staging: media: imx: imx7-media-csi: Fix parenthesis alignment
Date: Mon, 24 Oct 2022 12:07:44 -0300
Message-Id: <20221024150744.72641-1-lima.gabriel.luz@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index cbc66ef0eda8..9ad7205a3f2f 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1704,7 +1704,7 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 		mf->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mf->colorspace);
 		mf->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mf->colorspace);
 		mf->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(!cc->yuv,
-					mf->colorspace, mf->ycbcr_enc);
+								 mf->colorspace, mf->ycbcr_enc);
 
 		csi->cc[i] = cc;
 	}
-- 
2.34.1

