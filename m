Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E9AA4F
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 09:43:07 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d14so6498987wrr.9
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6BjjeXL8yTJMC0wJlFe+I8I2MsrGeDOh1B+2LIf6wU=;
        b=agILq6o+GWk4tuFzspZR7fsDXjM2H4OVKJfjyuwFl2UcLwWyZ2gq7A11/LUvn1bsmn
         cX41gI3USsqEo0h0SFKIGzPQ4sC3hNZ/K08K37HYaJzs6Z3ZhJjVH/uQvO1vLX4IDDHl
         /g2DEbESv6pj+qqudSDlv6MAt+AlSpUR1KpXm+3FLQe5PpuJEGO3zY9lpIRDMqjKTeFO
         XotsdfsHHtfNezyDvJY1OHuaoiJRpa0zmozqH+YyBYsujIa4rpPBtflaAaPtoOWR6iFu
         RzXnWGgaFWcpcV1C48Jrgp7rvQNRLhEOgm3rdbgxY9gO9EJKf00fYME0iYTqR4FnwBNJ
         ATXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6BjjeXL8yTJMC0wJlFe+I8I2MsrGeDOh1B+2LIf6wU=;
        b=Qvy/axs6cvp3PP2q8RMCvlhziN6hgOfVnkrnEfhF1q0r1YP5tJwoS2O4+k2le/EoW/
         xHBqUxWoEpy2oHbRjltykFMT3+IsYSjEgHKISF9eMKtOKxJXhqtPudylZ6uJRKL7yAeo
         h+7Jxtwoa+n25IRl/pCdZBkzDgbrCN00ebz/xvAYBuor12h5stiex0Bi2RiTKpwt4ExJ
         W1qm+TEcajlJZAswbDUobQMdRbgPQMdc/uoSQfqxVQSQ7fKhw14d2Ai3QGvd8T2J98CP
         tE477HXsofnMQK0Fpvfnr5LeWcfdgiuNqr9epkdnWfSAWLGTLIoFs9TxFplYvyZYC821
         C6iQ==
X-Gm-Message-State: AFqh2krva5caqC05jXyCI/Lan5UhPm7SJgPeuY4iWWGGx2OagvLWXh9h
	XFnc7uM64cVpK71/94GTWAs=
X-Google-Smtp-Source: AMrXdXt5fyhf1LiEcRZCoHd5aZVrC2fCwIs2S4ezPycbnFeLgplLPKiVW0DzdP6j8gCMA21I42WBZw==
X-Received: by 2002:adf:ce01:0:b0:2bd:e208:1e4c with SMTP id p1-20020adfce01000000b002bde2081e4cmr23690706wrn.11.1674466985537;
        Mon, 23 Jan 2023 01:43:05 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id e12-20020adffd0c000000b002bf95821372sm6178158wrr.42.2023.01.23.01.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 01:43:05 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] media: meson: vdec: esparser: check parsing state with hardware write pointer
Date: Mon, 23 Jan 2023 09:43:00 +0000
Message-Id: <20230123094300.2816812-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Armstrong <narmstrong@baylibre.com>

Also check the hardware write pointer to check if ES Parser has stalled.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index df5956c6141d..41b705f999b2 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -300,6 +300,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	u32 num_dst_bufs = 0;
 	u32 offset;
 	u32 pad_size;
+	u32 wp, wp2;
 
 	/*
 	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
@@ -354,15 +355,21 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	}
 
 	pad_size = esparser_pad_start_code(core, vb, payload_size);
+	wp = amvdec_read_parser(core, PARSER_VIDEO_WP);
 	ret = esparser_write_data(core, phy, payload_size + pad_size);
+	wp2 = amvdec_read_parser(core, PARSER_VIDEO_WP);
 
 	if (ret <= 0) {
-		dev_warn(core->dev, "esparser: input parsing error\n");
-		amvdec_remove_ts(sess, vb->timestamp);
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
 
-		return 0;
+		if (ret < 0 || wp2 == wp) {
+			dev_err(core->dev, "esparser: input parsing error ret %d (%x <=> %x)\n",
+				ret, wp, wp2);
+			amvdec_remove_ts(sess, vb->timestamp);
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+
+			return 0;
+		}
 	}
 
 	atomic_inc(&sess->esparser_queued_bufs);
-- 
2.34.1

