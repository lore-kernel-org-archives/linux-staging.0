Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B1E3205;
	Mon, 20 Jun 2022 17:55:38 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n185so6220361wmn.4;
        Mon, 20 Jun 2022 10:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rO76farMqYrPQC4ew78x4uRO3kIuRntTwzkVO3g3BmE=;
        b=IXKYt1GNB0skST+g+G4WX5y6frV6Y4HqH2GhmT+UmjHsf9n/eI/8mQ/1U9DblJ6nA+
         EuQQBR7A64ljTuDVW0sTn1xiDxxQCPWO8F5rfuzYDMXiCFM+o5ZCoJHN9uhhUWbNC/ma
         Cy12wOo2F6wvVmCZc8uA73rbiBazH+msWsg66pnnXJhV3hyoRqDw8eVrI/KkeWDFyNoj
         JUHYPoUJjygpC98Hd13+KqHXDnQEkd5ywSFlDtsbDwPzT5Tciop659ZSJ3q2yNV3IP+7
         KaaYG2DOOU60fAyt7bmRps3R+IZzONdJS5MaxDw4ryX58jj8QbNzXmXO+wmzKVLghsqc
         dyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rO76farMqYrPQC4ew78x4uRO3kIuRntTwzkVO3g3BmE=;
        b=LAC80BBFX5USatkcXex9NeGvbMIr5U3ik/+Q8XeXV1+5kCWtDjrPlVpUu9mOZgQoyD
         vR9Fdnk+kMnf7e/UjUHirqqEQZrJQxx3QhkbQJ2NnonNyuo/rS12LpVVjQuZFjlHvuzG
         6Qq0O0hTS4SKz2yJTND96SvOXWYT0XdV03TNonf9EMXQLmBg+0KQGAzdMHtys2b7zaR5
         74nLSRChirViIpJdyXu/3wo5guPiOmUPHR3nAJKigUg+ewAWmVhP6siKNJgocOt0TeCO
         oV154AIgN4uWTVYH0cNaAUdLq5pgeHr4G+M6qTNLuKM1jq9xe+a8aDZQp2LNfwMScN6q
         vmeQ==
X-Gm-Message-State: AJIora89d804Y6R+1sFpdd/ssZNcAzOLYBqzTA0cmBAWGP6J7Gv1rQMm
	Gv12+q5kjb0W0zA3F6Ncq6Q=
X-Google-Smtp-Source: AGRyM1u30Dw+JFAP13t7yhgHTvIDNuEJxA8aQ+DfNlPldZrFipM6Pgrn21E14dvHe/90gjXmt5wvtA==
X-Received: by 2002:a1c:4e15:0:b0:3a0:1990:afeb with SMTP id g21-20020a1c4e15000000b003a01990afebmr4215164wmh.137.1655747736907;
        Mon, 20 Jun 2022 10:55:36 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id 184-20020a1c02c1000000b0039db31f6372sm19620752wmc.2.2022.06.20.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:55:36 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	samuel@sholland.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 6/7] media: cedrus: Add helper for determining number of elements
Date: Mon, 20 Jun 2022 19:55:16 +0200
Message-Id: <20220620175517.648767-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620175517.648767-1-jernej.skrabec@gmail.com>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that controls can be dynamic arrays, we need to know how many
elements are in such array. Add a helper for that.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 11 +++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 99c87319d2b4..b855e608885c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -232,6 +232,17 @@ void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id)
 	return NULL;
 }
 
+u32 cedrus_get_num_of_controls(struct cedrus_ctx *ctx, u32 id)
+{
+	unsigned int i;
+
+	for (i = 0; ctx->ctrls[i]; i++)
+		if (ctx->ctrls[i]->id == id)
+			return ctx->ctrls[i]->elems;
+
+	return 0;
+}
+
 static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
 {
 	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index d2b697a9ded2..15a1bdbf6a1f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -261,5 +261,6 @@ vb2_to_cedrus_buffer(const struct vb2_buffer *p)
 }
 
 void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id);
+u32 cedrus_get_num_of_controls(struct cedrus_ctx *ctx, u32 id);
 
 #endif
-- 
2.36.1

