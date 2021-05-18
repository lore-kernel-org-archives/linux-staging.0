Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7356D10
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 12:41:24 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v12so10064958wrq.6
        for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1eI4NCY1wQwQq8OfRG+T0AfeGqGVQTSTyL0bsuhMZB8=;
        b=yu5pawqC8M2REqbBEFuwQZL8cBrGJyxAieUo13G6RU8vAl1SoLrla5oPrYV0mChnkx
         dascTGzxh7OrTU1IeB3GqPqHrA0q662WPAiiJyxfJ80/a67A0K54S78j41h+gualFQD+
         vsJFynoIAGViRx5tkMS8n87BVLJOO8mMR8bAqPXqY+253iD7WNE5EcwpQ3oFVUCf5fma
         +ikjj8YZsqSxvveVO7bSyOnpxfpjIVqfSXK+3BDuRwHmgndy0sDFkg7Y6J+TlAUT2Rv6
         HYTRlHyymmI4qIc0q+9yREz5t62hGCnkPb8pQqffrFDu9HX2R34FeAXz3/udPF4Xmeeq
         dqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1eI4NCY1wQwQq8OfRG+T0AfeGqGVQTSTyL0bsuhMZB8=;
        b=CJPUYI37y/gogSRDg2oCIeandqFNdYIOTf+ivqaCuyJKJkbw255Iu7Mo/BV2MWeHSe
         VrYBVCdoShOgbWgkT78hh/WlZE3zAXK331AQZ1MqqbX1NLavi7TUzYvL6bAR74HUASRk
         XpLVSW+G53zNIyL++ffEcrUDeikclbwDKu49afaV4zLa9pByXWScYFnLofH1H9eO8Ska
         A+Z+w/U3d5ceBJU9ea3JvAJmDVJE5s2tZ+cMKgyGnsZn73fI3tR2WlH/WZhoZ7qOfmG5
         m20MlnI4vjxxCOFviaF7TUU8fYpNIPmqgXFkTg6ypmFxfCe+e8Nipy6+jtYy1ziUJbcv
         GN6w==
X-Gm-Message-State: AOAM531BLxWP/Rd+E+oDtLninkYp4GmnVtYwP96+1kS7lAeUmpkhK8gb
	61INSiGCcSoo24Xk8enG5jjU+A==
X-Google-Smtp-Source: ABdhPJxZX83kJ5tUhAZjMNRQvqz0QsKGh6CTOjOc/hTJv/kQUreJ7t63expdHC0sS5c3Gneo8ypwzQ==
X-Received: by 2002:adf:e781:: with SMTP id n1mr6624991wrm.136.1621341683298;
        Tue, 18 May 2021 05:41:23 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3sm1677239wrq.42.2021.05.18.05.41.22
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
Subject: [PATCH 4/5] staging: media: zoran: fix kzalloc style
Date: Tue, 18 May 2021 12:41:12 +0000
Message-Id: <20210518124113.1823055-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518124113.1823055-1-clabbe@baylibre.com>
References: <20210518124113.1823055-1-clabbe@baylibre.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer kzalloc(sizeof(*prt)...) over kzalloc(sizeof(struct.../

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zr36016.c | 2 +-
 drivers/staging/media/zoran/zr36050.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 82702a13b05f..9b350a885879 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -361,7 +361,7 @@ static int zr36016_setup(struct videocodec *codec)
 		return -ENOSPC;
 	}
 	//mem structure init
-	ptr = kzalloc(sizeof(struct zr36016), GFP_KERNEL);
+	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
 	codec->data = ptr;
 	if (!ptr)
 		return -ENOMEM;
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index a78862852a47..8bb101fa18bc 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -754,7 +754,7 @@ static int zr36050_setup(struct videocodec *codec)
 		return -ENOSPC;
 	}
 	//mem structure init
-	ptr = kzalloc(sizeof(struct zr36050), GFP_KERNEL);
+	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
 	codec->data = ptr;
 	if (!ptr)
 		return -ENOMEM;
-- 
2.26.3

