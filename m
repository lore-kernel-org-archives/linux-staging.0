Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170356D0F
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 12:41:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r12so10081463wrp.1
        for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcTo/xjSai7+osUF8Q2k+rYqy/qwu121JkrPDsYsoVo=;
        b=pr081h7fpAVj/o9r3RNVCDtocZcHc52z9gfCDqd19RovMZYw8oen9DJqpPkVaWGh8i
         FEB7DK2vrVLByswr6xk389k8n8Rdwodrwa5cpRzQ9hkL0Nt4ZNI6hxQNZXmoovR1bxjd
         54C3dHpIdR5Nq/O4Jk3Db7mPwzQyCk81yZJq+JlqdsFXl6bO2bpFhHhDbkumwzvXHH5M
         euwpR5uckFtuXal20JAcTIcMeJ1JpKbQ0QkSCUrlGNDeh06A50i+UH12G2ef2M0ptSNd
         bBFE6WbaBSONIQkD3uJGw6xhzeLeb1hsz20ww6vv3oww4jhdNJxeTgQi7mcQfAKYoGyJ
         Jf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcTo/xjSai7+osUF8Q2k+rYqy/qwu121JkrPDsYsoVo=;
        b=TOxKzao7w3X57+z1jrYZvIt7aT0qewV56tOGiF13Nur+FtLbxLw6+265gJHU3StTei
         g2qHrActWhtW41kD83Ru1FJjdRkzDESzw5l9z/DaEx8ZBtH4ssDpBCI1BHB4P9/9h0rD
         /bZhHmzuw8EyvTx+CqunojUrGfO3OyXmBDQ7LergVWEnoyjslgG/wj6TIwmue9OeZse/
         jg7Fio3GsOUDKjQoSjgUfETy3ZnVulhkdx9DEGD+bd+YisJlKUA5JT4Us/mp9drEyq0L
         eG+oCXu3zedOJWByk/GjuSlRXnLJmAmls0d/CgWk3ndT1SYEgqYNRr09/RzESwxZ1NYx
         eB8w==
X-Gm-Message-State: AOAM533MBVTKV2DLRDirAvi5XhzaMnhLyAgEWs4z5tsDKxLP0l9SF+gN
	2awWzCNs5Hw2aI8yg6RIbXFhYg==
X-Google-Smtp-Source: ABdhPJzDn6VQiLsCOZzSSM0fFq1gVT+7Ow6q9E78vsMn8Fg5W5ywkxmuYsbzc28hgCwySs2sVccaiw==
X-Received: by 2002:a05:6000:44:: with SMTP id k4mr6816431wrx.76.1621341682565;
        Tue, 18 May 2021 05:41:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3sm1677239wrq.42.2021.05.18.05.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 05:41:22 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 3/5] staging: media: zoran: remove blank line
Date: Tue, 18 May 2021 12:41:11 +0000
Message-Id: <20210518124113.1823055-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518124113.1823055-1-clabbe@baylibre.com>
References: <20210518124113.1823055-1-clabbe@baylibre.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor style fix by removing useless blank line.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index e7fe8da7732c..b1ad2a2b914c 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -158,7 +158,6 @@ struct zoran_jpg_settings {
 	struct v4l2_jpegcompression jpg_comp;	/* JPEG-specific capture settings */
 };
 
-
 struct zoran;
 
 /* zoran_fh contains per-open() settings */
-- 
2.26.3

