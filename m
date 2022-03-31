Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8338E7F6
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 08:49:14 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id o68-20020a17090a0a4a00b001c686a48263so2593696pjo.1
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W056jK4JO9Wem+3qlNSvwaayL2PwMR77g5EtZS2gUYw=;
        b=WmCBHXFFuScgmmMGMP/VH609AxnAySmVJWaJZ62cOndAUFjHiwuhvCMbqdzYxL0PqJ
         O8RwQn+EO5U1GQpLfh2uEeY3psnAoZeQKIzE53AC53docGkPbTd37tJD5jjYxV5T0jcV
         17l9p2c+I1LPqJo4fyJQjnK3ZbZE0HKbzk748=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W056jK4JO9Wem+3qlNSvwaayL2PwMR77g5EtZS2gUYw=;
        b=c29ym2bfg9rvjW5gpGalxkMUkK3sM4tpxVlau6GBOpvJ5U4SltTZq2CVPHUjXpCvGO
         36rB250ZxlL1YI2wLzxaDV0ipIqrYPeVnhLLZuxSRq0DhYB8YbChDV/RmDyMb+wSP6md
         RgXB+xsAJ00JaUNiZvQb0TEuvbwCCHW/AenjVd6GPL1oYdLTO8tz733r30HaLyt+8s08
         fdmviNQRCJPoIc1mnx8PACjX7z16hENJXgjL+7EHpoMeDSeEzGN/NoNvfMNRwg6JNksi
         x0lgYfPnJwF8wW73KlG+v+QhaQzRZR/qS5yNkYTYWt7hCc7lTQlTOBBdX6aHe1Kk/VhC
         g9Lg==
X-Gm-Message-State: AOAM532atcxkSSctYMiKvKZOaWNKDhPm0Qw8z8v/xAD9NGAKfow9vDQM
	wApAJpLbrcx3iE4g3bEJoHKPlw==
X-Google-Smtp-Source: ABdhPJyIyUj9Alp436tInM7YNihHEEDUYPNgqt+AGVoPl3O5jctUXjLSQUMXrAN+OoCit0uHawL0gQ==
X-Received: by 2002:a17:902:ea03:b0:154:4af3:bb5e with SMTP id s3-20020a170902ea0300b001544af3bb5emr4124775plg.95.1648716553888;
        Thu, 31 Mar 2022 01:49:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:deb3:b2d3:c33d:e877])
        by smtp.gmail.com with ESMTPSA id mw10-20020a17090b4d0a00b001c7cc82daabsm10408026pjb.1.2022.03.31.01.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 01:49:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: hantro: Empty encoder capture buffers by default
Date: Thu, 31 Mar 2022 16:49:06 +0800
Message-Id: <20220331084907.628349-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The payload size for encoder capture buffers is set by the driver upon
finishing encoding each frame, based on the encoded length returned from
hardware, and whatever header and padding length used. Setting a
non-zero default serves no real purpose, and also causes issues if the
capture buffer is returned to userspace unused, confusing the
application.

Instead, always set the payload size to 0 for encoder capture buffers
when preparing them.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Fixes: 082aaecff35f ("media: hantro: Fix .buf_prepare")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

This was previously incorrectly squashed into my Hantro encoder cmd
patch [1].

[1] https://lore.kernel.org/linux-media/20220301042225.1540019-1-wenst@chromium.org/

 drivers/staging/media/hantro/hantro_v4l2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 67148ba346f5..261beb0c40f6 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -733,8 +733,12 @@ static int hantro_buf_prepare(struct vb2_buffer *vb)
 	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
 	 * it to buffer length).
 	 */
-	if (V4L2_TYPE_IS_CAPTURE(vq->type))
-		vb2_set_plane_payload(vb, 0, pix_fmt->plane_fmt[0].sizeimage);
+	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
+		if (ctx->is_encoder)
+			vb2_set_plane_payload(vb, 0, 0);
+		else
+			vb2_set_plane_payload(vb, 0, pix_fmt->plane_fmt[0].sizeimage);
+	}
 
 	return 0;
 }
-- 
2.35.1.1021.g381101b075-goog

