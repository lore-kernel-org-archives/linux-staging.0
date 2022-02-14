Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A6A35;
	Mon, 14 Feb 2022 19:08:44 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a8so39482648ejc.8;
        Mon, 14 Feb 2022 11:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=99BahZfDqfQoln2rf6Bj3xU3QXecprDtHuHMCBkgrcQ=;
        b=qhf19N3SLoLekl8nSgEbpHiFYk6ResBtkXfsJl63wafe0VQ0y5uwdcbx4dh7Api/cr
         pq4kpVN3rz8ufkFRa9PQhw12DgU06aBBMlGjIZ82TXZkn5kbidmhueb3xMvAz8cyvLFK
         23OCsQ5snWWXIQrfygum5Ml7tz1ev7oa/U9muYVV8pA1ru4b2uJnVoNiHqJAUlw6HTVD
         4YwuEf7WP8XA/Rm/UEIkIOK+MRnmJTKW4dRGuT49tZEp3Adgnjs0GNTOr22NQe/Yb5r4
         ZRdbMxoYgxE3NBz9Kcl1JoZpZ2VWWqZLEqmaXpiuwLy5eS4Rlf+vH+mqr6eGRoqwxN34
         hTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=99BahZfDqfQoln2rf6Bj3xU3QXecprDtHuHMCBkgrcQ=;
        b=qdf6htQol0ZYbt2z2pq32Mj9/PojwZTV0PHP10iP858H8P8qBf0K8epAZ5bk8IXobP
         sflmxWfazDYn7kOtpE1VciG/wVJp0jG6a6oZx4aYXqtnvFTJ7l5lMP9ifoIJ/+b9fogJ
         RcL8+q2xfEHMdyDXMk6BiH5kTW6tm4yrccMzS7AgPRzaiZUrqa7suDnfO7nTgxzdeuNS
         aW+iesECX894VRwmwN3p0ljchZ3RZ60Y2mdXXhiGhwrEM6iMjWnZ4Lwd85P5k/UoiGdZ
         qYNDEpLVlQIbpys+4C8jiC2AqCG1idlF2DYXHQxk/k7lLCp4x/UAbU7mQyxYheepCsbS
         t4Jw==
X-Gm-Message-State: AOAM530aQBVkCOlxkZt8fY9xF4juRhJlb4r3sRl/1nJA3fGx8I1XHbPV
	+2+RLFN3gSSn3KHOOWDBoIw=
X-Google-Smtp-Source: ABdhPJwiFYCfncVtqTqjdVCBhQycol1aX209bItLXOycZar8UGc4dq3/BcvtHafFwyhS52svnZjIdA==
X-Received: by 2002:a17:907:16aa:: with SMTP id hc42mr167762ejc.307.1644865723011;
        Mon, 14 Feb 2022 11:08:43 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id m17sm2316338ejn.118.2022.02.14.11.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 11:08:42 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	wens@csie.org,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: cedrus: h264: Fix neighbour info buffer size
Date: Mon, 14 Feb 2022 20:08:39 +0100
Message-Id: <20220214190839.707889-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to BSP library source, H264 neighbour info buffer size needs
to be 32 kiB for H6. This is similar to H265 decoding, which also needs
double buffer size in comparison to older Cedrus core generations.

Increase buffer size to cover H6 needs. Since increase is not that big
in absolute numbers, it doesn't make sense to complicate logic for older
generations.

Issue was discovered using iommu and cross checked with BSP library
source.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index b4173a8926d6..d8fb93035470 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -38,7 +38,7 @@ struct cedrus_h264_sram_ref_pic {
 
 #define CEDRUS_H264_FRAME_NUM		18
 
-#define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(16 * SZ_1K)
+#define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(32 * SZ_1K)
 #define CEDRUS_MIN_PIC_INFO_BUF_SIZE       (130 * SZ_1K)
 
 static void cedrus_h264_write_sram(struct cedrus_dev *dev,
-- 
2.35.1

