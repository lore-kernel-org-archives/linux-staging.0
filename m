Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E27C3222
	for <linux-staging@lists.linux.dev>; Thu, 26 Jan 2023 15:40:30 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0BD0A3F204
	for <linux-staging@lists.linux.dev>; Thu, 26 Jan 2023 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1674747224;
	bh=QSepvCE+QvU8qyq2q6n9pYjju+rfRtTHn1zPijhNAtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ijgx39+VBq9sUrjt3SOa9rbWj7biMIbHpi0UNQwzVE1GxztYF3gkW5BTJR4J6zPvy
	 MW28iwbGHEWV1g49SG7sKN/H5idazvjBGcg4aOl8OI0pctOpswugj68VArwuydZYhB
	 3N89hNmMCnDh45VWG2jPpVO6dj9nw8Xz5fpIab+BBUs7xbz/1FwiSHyIjAPVDHwgfm
	 3jBYZ8y/erspI4EahnHncVA+Oz0YGggxhEbm5GqYYUTv6BQUGhnmwyPqa/TlwKJDy+
	 bW9QlOBfQWZIrKgT3Vlc5aUQHP0gA6dLRO7kEO1JaWz0Lni/LNuTeHSc5dX1RaVh+T
	 iBKaybPTqNitA==
Received: by mail-ed1-f72.google.com with SMTP id m7-20020a056402510700b00488d1fcdaebso1632825edd.9
        for <linux-staging@lists.linux.dev>; Thu, 26 Jan 2023 07:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSepvCE+QvU8qyq2q6n9pYjju+rfRtTHn1zPijhNAtQ=;
        b=TLFhCxKYgdcenLem/920FhaFXslE0TDmLl/xOQ9ClPCoDjfNbHCshy2H/4paFKM8qc
         xEpvb7Ho2hEkDr43ZLC4B8UMhlWyThnnqGtcaic8pDV6fSdwW/dIomZR9FJIjLgcY7ep
         Dsqkk0uEd813kUitXZzXB9QvgL64ZPsHU8hTCrKJjweUHfwD3zJcKDNr9W272xNfx8Ks
         woOSToGNnE0D3YYPfL+t8+ziC8D8SCfShcChCnWrTXBJfA8lA2rI/Xs6w4xkYsDuqcnA
         nGWQq/7WPcK+3B/f7a/tR+km3DhyEhfbRt8oRTsuoyHyttx668rbgo5XZ5OVuxFgpyye
         lapg==
X-Gm-Message-State: AFqh2krHzGhsYTACt8FTt2VxTTgYbOn+BPaXEB2GCoPtHw+pd+1NyrRG
	4NFfBGpQ5CqVRr/nEF3yeJq1NiJ5atAZ1yCQXDmNwXc+B3MiVfEu1A86mIV046wYw0YVI7IAfac
	VJ9y4Ni2KPOQKsX1+sVPc0v2Xw9FPuxQrSf9PvZWNoqM=
X-Received: by 2002:a17:906:25c5:b0:84d:47e3:fe49 with SMTP id n5-20020a17090625c500b0084d47e3fe49mr35905478ejb.39.1674747223480;
        Thu, 26 Jan 2023 07:33:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsAha39SMJh+dIs31L8P5oRWYkNCJsasKCeyOKDBVSTao7E4ia4lwRK4rgCwDXA08+pLu3zqg==
X-Received: by 2002:a17:906:25c5:b0:84d:47e3:fe49 with SMTP id n5-20020a17090625c500b0084d47e3fe49mr35905463ejb.39.1674747223261;
        Thu, 26 Jan 2023 07:33:43 -0800 (PST)
Received: from localhost.localdomain ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id ec14-20020a0564020d4e00b0048c85c5ad30sm876174edb.83.2023.01.26.07.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:33:42 -0800 (PST)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: gregkh@linuxfoundation.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	mchehab@kernel.org,
	narmstrong@baylibre.com
Subject: [PATCH v2 resend] media: meson: vdec: Add MODULE_FIRMWARE macro
Date: Thu, 26 Jan 2023 16:32:58 +0100
Message-Id: <20230126153258.1558471-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818064810.17856-1-juerg.haefliger@canonical.com>
References: <20220818064810.17856-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
provide that information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

---
v2:
  - Drop duplicates
  - Add Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec_platform.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 88c9d72e1c83..70c9fd7c8bc5 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -280,3 +280,12 @@ const struct vdec_platform vdec_platform_sm1 = {
 	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
 	.revision = VDEC_REVISION_SM1,
 };
+
+MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
+MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
+MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");
-- 
2.34.1

