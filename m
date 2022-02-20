Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D635EDC
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:46:42 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id r20so11878749ljj.1
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MfNLrW8iqBQsbuSrzEGTeEHosap22UQqZ1+HJnuvOZs=;
        b=PfGxrADPB6mhlOpeWEyWO5AzrcYFLDV02zdvc+QHYuU4DcBp7BZBlQp+WW8/4cz+44
         0+yGzk/r/24AUe+gCRqSYC5Zo/zzb0SUmLuw1hnmx6NsYj8EvZbF5TVMuPS4j8bAXbaW
         mkMPuuSoW1PjfInsi3yx3tbUu5B9iBKlPDHprWnuGLCI1zDqt6+PydMVrzAJ+2tWNjho
         WdcPvO+aiWx+MdbW+YKMtVzbIGUJPWCvH7eQr1DAUYKr62VhPrVwZv/GTNTqCtZ15Tos
         1v4BFBqH4sNim7MOxT6/pVotL2LEha6Yk2XNN8C0hr7vv/Bq9a5jVWe4ITUNLa5vB1fz
         UV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MfNLrW8iqBQsbuSrzEGTeEHosap22UQqZ1+HJnuvOZs=;
        b=G3y3OUeTtdaPAYbn8ylmvx0Ocp5ZN0lXQR4h2gs4Pm1YTcfHScIJe3mNqQnkBleJ11
         mWxjfc4mxWG7ESi+StEY7vFNddPG3PSKRtg3RjRx+fVf4E1u3kLVt45zEd+bAQGLXzS+
         pY0pp4M03HqvFQ4hZHfhK4AqChxLDmGDyUvzvLfz5ZolLf3uZyGdVL1Aq4SUM2vh4gnH
         nBoBDzhLrc4a+o09miV4JqLGuaem6O20ULUCEX5NPArWLxTitb/Yuh+k8xcadjohng9W
         3a3uRGunecW0JjaaXm5RleFeixEXbrq2MzN+WYCDbPy3SmNIkASF9wubB8Q91UnD/K5h
         w5tQ==
X-Gm-Message-State: AOAM531BYY7kuVHkMZHajG8ati2SDT2pYeghNt4cWwhd2HY/S2pLLWar
	B46AzDwTxViu/FQJvbLWHL4=
X-Google-Smtp-Source: ABdhPJzXxCc5Z27UtlP/L0OJQyfw4lL0OQBW35y9EZ+Y87DGJO3eBPZfPrOw+S07A3MOGQO6vOT2Qw==
X-Received: by 2002:a2e:819a:0:b0:240:8b4c:ef10 with SMTP id e26-20020a2e819a000000b002408b4cef10mr12697127ljg.180.1645390000525;
        Sun, 20 Feb 2022 12:46:40 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id o14sm913955lfo.117.2022.02.20.12.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 12:46:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/8] media: v4l2-ctrls: Add new V4L2_H264_DECODE_PARAM_FLAG_P/BFRAME flags
Date: Sun, 20 Feb 2022 23:46:16 +0300
Message-Id: <20220220204623.30107-2-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220204623.30107-1-digetx@gmail.com>
References: <20220220204623.30107-1-digetx@gmail.com>
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

Reviewed-by: Nicolas Dufresne <nicolas@collabora.com>
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

