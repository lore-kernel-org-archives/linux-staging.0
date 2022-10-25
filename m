Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7447B;
	Tue, 25 Oct 2022 00:13:22 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13b23e29e36so13063031fac.8;
        Mon, 24 Oct 2022 17:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGPioqrvo9StUbHADKkHl19MNXlGRLsr8yyQyLq+9dw=;
        b=fw426MFVi8E8FV5waIk4Oob4n7Z60FaIvxuxFizMZl0Bqjgu6QzlV08gF9kneZoYMm
         aM3Nw2cEIDRftpvXafrojAp2ttB3ExekuZm6uEu/dkvjs/r5sEka0OeTmTHUR/G6vTZh
         Ubcx2hEBP00PzwyTFlvbwPhRoV0WRxQkwcoknaqUDOHz2afOVF08TOaj8NF9pw4yvQbC
         f4gge7qgH7clv0bv5m2IsWrdz0TYehwQr6r4CcSzgrcCL62nIXmmJwAlAvUAotzyPk/Q
         nFhEU4//YOMAU+BxrcC/UKKbpafDL7QclxfAopSt+u4dxWj4PAAIZUTtPj4v+pjgS355
         k5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGPioqrvo9StUbHADKkHl19MNXlGRLsr8yyQyLq+9dw=;
        b=Tf72PsIW3O7cCwYI9mOeg8Lg0Aebj7kCBlgIKCq7gliK5lHUqazlVbNIqgRXdAk0lA
         6aon8eP6NiOUDbG4ZtFb1/tVf+CSRD8NirZRCMAKzddh5d7lIk+rierW3g/NlcVkewZT
         3Xuqfi/Aco1oOJmklBIC5WiuUAE69OC6HPty9aBw3ax7Vxdegn2gpsEXmrjKX4/BGQhX
         OA7uROBJqbbrPDXuhvkjyVqtyV7MJQCjTZuUF8SX0xoUslaQnJPBJ5utSDBhOhs3qU7z
         yqgg5ZjH3ykY3JQ+v9POhUhS+g5+KQLLNYPlYpVSce6Rh2gqWgt76cMfJkju3JxAClRK
         NXfw==
X-Gm-Message-State: ACrzQf1WLDn0k9GfvOr9NiginsYbOg303HqHLKlienm0ox2ZZ3IRhmqs
	QOj55UtXstTKgI1o5S9DWwk=
X-Google-Smtp-Source: AMsMyM568uBoXBTKTQH5tI8SsoA5Gk98p6XETIY9iE85DbOALaC6GXX/8hoMHb4avmS4PetrB7QuuQ==
X-Received: by 2002:a05:6870:4284:b0:13b:91b7:89a8 with SMTP id y4-20020a056870428400b0013b91b789a8mr5715289oah.284.1666656801702;
        Mon, 24 Oct 2022 17:13:21 -0700 (PDT)
Received: from gabriel-Nitro-AN515-54.. (201-27-204-68.dsl.telesp.net.br. [201.27.204.68])
        by smtp.gmail.com with ESMTPSA id k41-20020a05687095a900b00131c3d4d38fsm757823oao.39.2022.10.24.17.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 17:13:20 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: imx: imx7-media-csi: Fix parenthesis alignment
Date: Mon, 24 Oct 2022 21:12:39 -0300
Message-Id: <20221025001239.16345-1-lima.gabriel.luz@gmail.com>
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
Altered changes acording to feedback for a more readable code

 drivers/staging/media/imx/imx7-media-csi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index cbc66ef0eda8..b241b68f456c 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1704,7 +1704,8 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 		mf->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mf->colorspace);
 		mf->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mf->colorspace);
 		mf->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(!cc->yuv,
-					mf->colorspace, mf->ycbcr_enc);
+							mf->colorspace,
+							mf->ycbcr_enc);
 
 		csi->cc[i] = cc;
 	}
-- 
2.34.1

