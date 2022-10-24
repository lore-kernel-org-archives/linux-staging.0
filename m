Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A83E6AC2;
	Mon, 24 Oct 2022 20:15:38 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id t25so2108194ejb.8;
        Mon, 24 Oct 2022 13:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPbmxwiilRECyAIkSs4T2Anmm0TE3NuNMWpiALbuPqI=;
        b=GIk36OGrdtY37JF3S3GWILVLqs/z6Tx/vMuvomKPwWWFbc8epqiGhafuZSUiTXeDi4
         VfM+L4ZQ3R/dsL85E8/1Csd5n+kC90guEPjPO4pooOftswdkn2vsLkK2uLg/R8p5YgRM
         W98Ej67KaWeHMEuW3dXygcLk7CLlcKG7RsA9nPaPS60ZXdmIlFF988HbITAJEb9/pf6c
         OOP+uRyeb9CxtcY8j39yKzLKfVGtFKmQOGzpcl8dK6N462ykSgYRn5eyDzhTtXbtAjyw
         q8zxm4ScQpQj/A2MimnI08GgnAxiooJRXtzch64T5O2v1B1MP3BlO/C0rcGaLR9135qK
         JdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPbmxwiilRECyAIkSs4T2Anmm0TE3NuNMWpiALbuPqI=;
        b=ljuAfhly8MFfegWUtUoBChv08JG32r82GA9TSVXi8D1plOR0p9GCt2sAvDzH6XocHz
         jOeMN+7YAi2bMFuBcMTgsE3rkG9Cyj4221pEdSwDwBhXAnpycBaA+x1z5afPuNms21xv
         s35fpDua/LkqvV7r1kFgh4YeZrPCdyG4UqQaDADiqdgChdutE6BbctED3nrTs4x9axis
         dxi3GmUyoxlOyqJ955J0fvHsUEgoi78ddDGkT9yXgoxWovZp+Sz4yrgA1b0ApiOjHeRT
         WYdTWnzRsey4LWb7lLJu9Ng2XLT7maqfN9XapumyZKv+vh1qm17C7QXTwD2FKHgXU0y3
         5xXw==
X-Gm-Message-State: ACrzQf1P2FAzSSfqKWfSZ2JKhOekQ/1Z1PnflYyRTbO/SUqF94HkP8my
	YIvw2As/QRRtphQ1ibDy8es=
X-Google-Smtp-Source: AMsMyM6PUAl4L7z6RwxqnRwFEFc9HLFtuy77IQrlINTsMGCNFqjNlZjrA6yVeDWrQfowUtkWMMkf4g==
X-Received: by 2002:a17:907:7611:b0:78d:9d69:adf9 with SMTP id jx17-20020a170907761100b0078d9d69adf9mr29603251ejc.283.1666642538198;
        Mon, 24 Oct 2022 13:15:38 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id op7-20020a170906bce700b0073d638a7a89sm332023ejb.99.2022.10.24.13.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:15:37 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 08/11] media: cedrus: prefer untiled capture format
Date: Mon, 24 Oct 2022 22:15:12 +0200
Message-Id: <20221024201515.34129-9-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024201515.34129-1-jernej.skrabec@gmail.com>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While all generations of display engine on Allwinner SoCs support
untiled format, only first generation supports tiled format.  Let's
move untiled format up, so it can be picked before tiled one. If
Cedrus variant doesn't support untiled format, tiled will still be
picked as default format.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 3591bf9d7d9c..f9f723ea3f79 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -56,13 +56,13 @@ static struct cedrus_format cedrus_formats[] = {
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
 	{
-		.pixelformat	= V4L2_PIX_FMT_NV12_32L32,
+		.pixelformat	= V4L2_PIX_FMT_NV12,
 		.directions	= CEDRUS_DECODE_DST,
+		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
 	},
 	{
-		.pixelformat	= V4L2_PIX_FMT_NV12,
+		.pixelformat	= V4L2_PIX_FMT_NV12_32L32,
 		.directions	= CEDRUS_DECODE_DST,
-		.capabilities	= CEDRUS_CAPABILITY_UNTILED,
 	},
 };
 
-- 
2.38.1

