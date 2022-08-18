Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE27C5C8E
	for <linux-staging@lists.linux.dev>; Thu, 18 Aug 2022 06:54:48 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 317063FB94
	for <linux-staging@lists.linux.dev>; Thu, 18 Aug 2022 06:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660805300;
	bh=QSepvCE+QvU8qyq2q6n9pYjju+rfRtTHn1zPijhNAtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MkLeM9DiFceJvV9eQNmqI5htzFVW12Rz34VACGIxMtmdF4FR0Fb62eFYcrjjhISqa
	 ZMmw3PjzA4qXkgbb774NQJ1zqu4PU7FAFov0SlpFoaZcZWHaX2p6jwqKxwO0zEzu4J
	 ETIGeJcfvcYAsodnMMclhOXjqePt5NUBj7C738cQhE971+G/z6mIVbaq7xBEHYNV8P
	 pUhT66PT8RPbiXYy7xpvRWSaA9LPgICjbCnODeMLnwR2/VTLtpi9eesOy4XAIU8W6F
	 x2hDG3QrNHuLQeM+dMZHFLaDsudxvwxpcsDZFbbnPDIMVm47fL55mqW9qXfd18S8cD
	 +5Hy3ofwfc7lQ==
Received: by mail-ed1-f72.google.com with SMTP id z20-20020a05640235d400b0043e1e74a495so392603edc.11
        for <linux-staging@lists.linux.dev>; Wed, 17 Aug 2022 23:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QSepvCE+QvU8qyq2q6n9pYjju+rfRtTHn1zPijhNAtQ=;
        b=oghKkV9WyNUSZLXdvgwK6CvMzF+camgFkavNNgCunJJgDGE/OyhVWKnNa2a+kSavuP
         YeDoqBiv1jZ83dhHVeYkzAO/cXdQ7LAmS90swv/Cr6adJop44loXK1Cyql2xHED5SlAR
         edI8D9Y747J8HZpDJ+zJUiIddk5IBul7VtixTO9Zpaf/YGzSMie2ic5Fb3bWGkwgpG6f
         kQ+Bvmgwm4iCD5Iz9ZoHkVpvv0mRXdkI4jQOdSxof/LensM6pzor6SOEm287fa+AQjuS
         8yDvL457crQALVfhLx76eIuXLzoFJJAR7Yaeaub48sAVnh+nAg2Og+/JlT133T/UiMpk
         ZdUA==
X-Gm-Message-State: ACgBeo2VlgsXkKHSYXqbjHBwJj8TvBVwUhwWLTfYwxYh5OO91jH7m/LF
	lL7eIAZoRGGkz94JOuq+egF83LXu4xxdZ9/pqlen75V2/xnq0XjEvp9+AFS0UslxuTYFYAHmlpO
	m29pGwjvC6BbmvVAeZ3VDK8Zz1v6nhEDhLQfix2lN1J0=
X-Received: by 2002:a17:907:2c48:b0:730:cdc9:2c0b with SMTP id hf8-20020a1709072c4800b00730cdc92c0bmr1021425ejc.482.1660805299877;
        Wed, 17 Aug 2022 23:48:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Dbe0SHDmhO81TnTzDYpNAjxnqwXxvYkMUgdOn4rij2A9rkDj6mEyDGejb4El1ju108l/O+A==
X-Received: by 2002:a17:907:2c48:b0:730:cdc9:2c0b with SMTP id hf8-20020a1709072c4800b00730cdc92c0bmr1021416ejc.482.1660805299753;
        Wed, 17 Aug 2022 23:48:19 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id g20-20020a170906539400b0073c14e7589esm59157ejo.161.2022.08.17.23.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:48:19 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: narmstrong@baylibre.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH v2] media: meson: vdec: Add MODULE_FIRMWARE macro
Date: Thu, 18 Aug 2022 08:48:10 +0200
Message-Id: <20220818064810.17856-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817140539.150013-1-juerg.haefliger@canonical.com>
References: <20220817140539.150013-1-juerg.haefliger@canonical.com>
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

