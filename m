Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159829CA
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 14:20:24 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id x23so27302334lfc.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 06:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1DmVvauQogPdSOmMYGT0+c2REtcYPYAhJ2C4GBTFK30=;
        b=CnVeLw94cVE8wp1I0kVfya/qFwXTtg7iHHYV01GdMNk+F7D/oT9bCwgwB7aX5nx9k5
         L8CkRIw+dwBQOE0YkE3PiK5Ni89obtbAaZPp9/P/Dm3rhlZil+TACFihNXsLUkC6hnFY
         /R03waGawnU/WJuy9qvO8gvFKUVprj7bb7MrFLDbR+04L7v1FFTWYUNuuDjanskS8rJo
         GzIZy63aOyVzMdzOg7ND3J/sLgOj8I/wPctYKDppNkXW2gVzqKPIUAuggUqp3zyO9P4y
         ZSBTUNXDskwYbJp8u4EUaVe9+TsOisynY+hEnAC+2vCtXda0QpI2YJvQZboKS0V0xj1Y
         SPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1DmVvauQogPdSOmMYGT0+c2REtcYPYAhJ2C4GBTFK30=;
        b=rY3Y8XWTYiXKDI+Rzz6ZXkoSOlJhwmwUZuEELks75f4s+ftKZJSJyH8/DyWj2qC1/b
         3hl29YpRB7CtqnFdWH0knU2iBVrYGRSjGf7dGQS/a+M1J/yuEkAzJ7+SuFvG4H/LX8jR
         gfPFrnP2Llir36f4/uzokj+rxe631s5A9miaooHGeik8/jj61df8EtbxRqBbmhU7qp5m
         PfZyNGitY8GOCbR9KQd5Le838+wkgblLw1pkjR31kzOIVk4FjKeoETBffXzv773jbsAr
         31Zu0AdLv06szXua8oksaFZgeFR9pj1t3W5GxMisU0PrkATP14akXYkJ5k3dRLHMLstc
         OfhA==
X-Gm-Message-State: AOAM5333S3Tsc0nLTADDsW+0RGHoA1TyJAZ6BtULCRyT0YTmgDz3F89/
	+jiBSW4DqUY0KD+x+ENhJzo=
X-Google-Smtp-Source: ABdhPJxvM5gUBekTZyRtGOm7YurnBNVe5BKjYWy0gnPR9eGrgX1FB2eAMv4Tl6pIecOFJrpQTaSkMg==
X-Received: by 2002:ac2:46c9:: with SMTP id p9mr8527758lfo.365.1644243621652;
        Mon, 07 Feb 2022 06:20:21 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id t13sm1515599lfl.94.2022.02.07.06.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 06:20:21 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] media: v4l2-ctrls: Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
Date: Mon,  7 Feb 2022 17:19:34 +0300
Message-Id: <20220207141937.13089-2-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207141937.13089-1-digetx@gmail.com>
References: <20220207141937.13089-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags that are needed by
NVIDIA Tegra video decoder. Userspace will have to set these flags in
accordance to the type of a decoded frame.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst   | 6 ++++++
 include/uapi/linux/v4l2-controls.h                          | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index cc080c4257d0..f87584ad90ba 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -616,6 +616,12 @@ Stateless Codec Control ID
     * - ``V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD``
       - 0x00000004
       -
+    * - ``V4L2_H264_DECODE_PARAM_FLAG_PFRAME``
+      - 0x00000008
+      -
+    * - ``V4L2_H264_DECODE_PARAM_FLAG_BFRAME``
+      - 0x00000010
+      -
 
 .. raw:: latex
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c8e0f84d204d..e3d48d571062 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1563,6 +1563,8 @@ struct v4l2_h264_dpb_entry {
 #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
 #define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
 #define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
+#define V4L2_H264_DECODE_PARAM_FLAG_PFRAME		0x08
+#define V4L2_H264_DECODE_PARAM_FLAG_BFRAME		0x10
 
 #define V4L2_CID_STATELESS_H264_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 7)
 /**
-- 
2.34.1

