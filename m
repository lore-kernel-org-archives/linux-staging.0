Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6E2C9D
	for <linux-staging@lists.linux.dev>; Fri, 24 Dec 2021 08:43:29 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id k64so7281759pfd.11
        for <linux-staging@lists.linux.dev>; Fri, 24 Dec 2021 00:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eVYg6vqK0bkjeQRhVKIbYAOnwHGxgaBimTUyzl5wfWU=;
        b=DSi9fT87X/aQ8j99LRzb46Wq1GH2EqAtDCrJVsAMspshyX9URQfBz6K+q5fJwVCHCb
         e46+U5RO2/BSYx742BVsAROr8Xn3nEPAx0d+GnFEf7cu5S+E+qbRxAEIaGb9HMSi/CPU
         3W2UEziHeqoFpnqAvvSCfeYnqfr1K91xIZC/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVYg6vqK0bkjeQRhVKIbYAOnwHGxgaBimTUyzl5wfWU=;
        b=lpSTpKK3hraBRivF/fTvUYrO3HutgH4sOMVZzXmbBJT+YyGK+ZINvzXCfPbGx3wZl4
         QnSG1Ae+TiwBihCfMzW8KszR3lfaACRkgD33I5HM9f3JzqwQR/mdbV3bGJSLVZX51Ziq
         cmn6Krd3B8SGVzSBRWIiRSYlykerzMNIxgObVwX2BBVlx5h+OuVt9zmZSiggTrxfLoc3
         gnpyEzG6YxMq7hU0Sq9wNgzHfTXI2CPQ0Vb/cHMKwzMb01KMM63l7CRhek7b7Kljl0jG
         8XXTg0aO6PBdYCo+AGfh2Rri1jE2g8/BRSWL0aYtfIdNKHHqznWVqowE9KeBixjD5p7V
         m0UQ==
X-Gm-Message-State: AOAM532eHbWqXIt1IwJhrsfxGxlr6hzg7LfPYiw5IVWHdjMudlI2NfIM
	1mtUsdT9D7624GSPxL2IkbZUmw==
X-Google-Smtp-Source: ABdhPJxZbbX4Ne8SBwTui1zct2EjoGavD3KorLUC07IOY5SGzG1gbt9det+g1w/jEAaZ0gxMh+oSgQ==
X-Received: by 2002:a05:6a00:15cb:b0:4ba:edb1:c03c with SMTP id o11-20020a056a0015cb00b004baedb1c03cmr5970245pfu.54.1640335408697;
        Fri, 24 Dec 2021 00:43:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fd40:cbd0:c42a:3c26])
        by smtp.gmail.com with ESMTPSA id p13sm436369pgl.23.2021.12.24.00.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 00:43:28 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT 5/7] media: hantro: jpeg: Add COM segment to JPEG header to align image scan
Date: Fri, 24 Dec 2021 16:42:46 +0800
Message-Id: <20211224084248.3070568-6-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20211224084248.3070568-1-wenst@chromium.org>
References: <20211224084248.3070568-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JPEG header size is not 64-bit aligned. This makes the driver
require a bounce buffer for the encoded JPEG image scan output.

Add a COM (comment) segment to the JPEG header so that the header size
is a multiple of 64 bits. This will then allow dropping the use of the
bounce buffer, and instead have the hardware write out to the capture
buffer directly.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_jpeg.c | 3 +++
 drivers/staging/media/hantro/hantro_jpeg.h | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
index 7d4018bd6876..51e67e5cf86f 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.c
+++ b/drivers/staging/media/hantro/hantro_jpeg.c
@@ -247,6 +247,9 @@ static const unsigned char hantro_jpeg_header[JPEG_HEADER_SIZE] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 
+	/* COM */
+	0xff, 0xfe, 0x00, 0x03, 0x00,
+
 	/* SOS */
 	0xff, 0xda, 0x00, 0x0c, 0x03, 0x01, 0x00, 0x02,
 	0x11, 0x03, 0x11, 0x00, 0x3f, 0x00,
diff --git a/drivers/staging/media/hantro/hantro_jpeg.h b/drivers/staging/media/hantro/hantro_jpeg.h
index f33c492134e4..0b49d0b82caa 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.h
+++ b/drivers/staging/media/hantro/hantro_jpeg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 
-#define JPEG_HEADER_SIZE	619
+#define JPEG_HEADER_SIZE	624
 #define JPEG_QUANT_SIZE		64
 
 struct hantro_jpeg_ctx {
-- 
2.34.1.448.ga2b2bfdf31-goog

