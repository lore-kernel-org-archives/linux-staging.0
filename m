Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC81B2C9E
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 09:35:19 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so11424987pjj.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5JKd00F5jvr9Z9TjwluoZVjXwDya+OmfirFHabukgCw=;
        b=TpoGRBay8kyuDQgl9l3hMCrpRMCiVmjg9kc+zX1/3QuOemRZW2T2WU/XpgSkR39+nQ
         ygAY8kCRcoLu7/KXksnzMNJ3WRvsYVKMjGllh/R8MDMJo27H66WJgkbCCByezTpuIN5o
         kBp4e4cdQtyoK5u4PxYHAPX7VF5eIfr2Zcrhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5JKd00F5jvr9Z9TjwluoZVjXwDya+OmfirFHabukgCw=;
        b=uHrZVYoekj83KnjoRHHHG7AL6jTM43kOFL8d+AqGjBNRqdusGMJnEYn1O27o+V6ILs
         +2yJ5yXT6ZKfJ51x2tArdrQV1BA3ZBqLzj5SqkLY67IQo2aC/kEfaBr4kXEw9JNbSRRY
         c7Y7qKMIlELKIQRfscsmHAgeijZ8f7svVwR4B7GK7cPDAwcPcnRK5auxrauEOXuyo5ID
         iP+89MSRGoq69paT65bPInbf85B088xTUI94vYMnUFEag/LhGBnWgBGE47e4KcVSYdAu
         j6mxryCd2R8EsEOoNhAJ8KsWbXPOod217lsInZ+mCx/2RoKPF8CRBQ9bw/pmUcRP13oG
         ahkA==
X-Gm-Message-State: AOAM533ZX7tZUKzx+RqjJaEZq7dUfpPD+SOm6ZwowDgTCURjs/1IV0z4
	znD1OGwzLflml87dqGL5nAxLmQ==
X-Google-Smtp-Source: ABdhPJy9cbGsq9beDGhZ/ZOG4BZHJ6JEA06Q1icCuY3jWe/IhWGfFHuALc39aWFrIsgILMTtfQucaA==
X-Received: by 2002:a17:90b:248f:: with SMTP id nt15mr3348566pjb.137.1641548119363;
        Fri, 07 Jan 2022 01:35:19 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8f6b:ee:64d8:ae81])
        by smtp.gmail.com with ESMTPSA id j17sm5269192pfu.77.2022.01.07.01.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:35:19 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 6/8] media: hantro: Implement V4L2_CID_JPEG_ACTIVE_MARKER control
Date: Fri,  7 Jan 2022 17:34:53 +0800
Message-Id: <20220107093455.73766-7-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220107093455.73766-1-wenst@chromium.org>
References: <20220107093455.73766-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hantro JPEG encoder driver adds various segments to the JPEG header.
While it would be quite complicated to make these segments selectable
to userspace, given that the driver has to fill in various fields in
these segments, and also take care of alignment, it would be nice if
the driver could signal to userspace what segments are included.

Implement the V4L2_CID_JPEG_ACTIVE_MARKER control, and make it read
only so that it always returns the set of segments that the driver adds.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/staging/media/hantro/hantro_drv.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 6a51f39dde56..b376b9d94b01 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -332,6 +332,11 @@ static const struct v4l2_ctrl_ops hantro_hevc_ctrl_ops = {
 	.s_ctrl = hantro_hevc_s_ctrl,
 };
 
+#define HANTRO_JPEG_ACTIVE_MARKERS	(V4L2_JPEG_ACTIVE_MARKER_APP0 | \
+					 V4L2_JPEG_ACTIVE_MARKER_COM | \
+					 V4L2_JPEG_ACTIVE_MARKER_DQT | \
+					 V4L2_JPEG_ACTIVE_MARKER_DHT)
+
 static const struct hantro_ctrl controls[] = {
 	{
 		.codec = HANTRO_JPEG_ENCODER,
@@ -343,6 +348,22 @@ static const struct hantro_ctrl controls[] = {
 			.def = 50,
 			.ops = &hantro_jpeg_ctrl_ops,
 		},
+	}, {
+		.codec = HANTRO_JPEG_ENCODER,
+		.cfg = {
+			.id = V4L2_CID_JPEG_ACTIVE_MARKER,
+			.max = HANTRO_JPEG_ACTIVE_MARKERS,
+			.def = HANTRO_JPEG_ACTIVE_MARKERS,
+			/*
+			 * Changing the set of active markers/segments also
+			 * messes up the alignment of the JPEG header, which
+			 * is needed to allow the hardware to write directly
+			 * to the output buffer. Implementing this introduces
+			 * a lot of complexity for little gain, as the markers
+			 * enabled is already the minimum required set.
+			 */
+			.flags = V4L2_CTRL_FLAG_READ_ONLY,
+		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-- 
2.34.1.575.g55b058a8bb-goog

