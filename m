Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687D4E4324
	for <linux-staging@lists.linux.dev>; Mon, 28 Sep 2026 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614252; cv=none; b=JM2LYRl+9X8Ay90V5kpbNcHQUWc5Q/v76TyrpLDEI3oiI2bEEmGHRLDO630oscqKEHKQAOpkiGTNXHo0X7oHmk7l7bkIUGvQTCD0nd+P4TuH5C3B0XqnrBwsnOs4RruQ/uReWmjNVj/KzbUKKDx4wO2kMz4uK/qiJCm9eXL84sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614252; c=relaxed/simple;
	bh=vn8yjXaDcpQywxawcEFzJ56V6mC0wurawB33i7t3Nog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPT4nPApObzLj1HU3yTZ9meS+oSk5ZTl1KCRp/aTPz6xuvOoBoobWAwNsqrD1hzGXPPkPf9hzMs8QXhqN0C268z9gkRHtV0hHuZUFYTzbTf+t3EOT64YLXXK8MNaX2nKPVjicdCKKgN25j7dTF/vF5BqN6T5tpC+QyIYtDdhzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXKJwpeC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXKJwpeC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso24543435e9.2
        for <linux-staging@lists.linux.dev>; Mon, 28 Sep 2026 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614249; x=1791219049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=kXKJwpeCJGV5RK2B41Bf+TUJizXnj2mL8xOIjjpCCgQK/6fzZ3WbBN5iOPqGdEI7jc
         gZtBSfBjbWiUkgqq0z3kZH7j05AIyZ9BFCKJQKGYTbgYH8r4eDZtNfMdxUZi3Bj/72Gr
         6qxbRt492gAwFnwNOBSnJ7Pkw8hCE/D+dNRhppA5KNLOAETLTSoY0Kb7H2ceiG0Mflmb
         gC/xmjcgtLZATzMvB7/z/4Q541tXI0HBi2DpxRGleyPGZVVvUYvfyW+jFM/A1F0wZAnN
         zIDIjH70AfJXTunoYzXMjspc/ybeGwGNuiSYUZKJeIySOgiGxzPSWkywCLihdVyTAvAJ
         hMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614249; x=1791219049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=uBqjID/G/PsMK0pzsUXlgs0BZNz7mOmgblFd913eplC34+ct6VXpIY67ktlk2eejIT
         rxmImz5PQlxg+uGUVjJpt5nVAMxFTIFoNkYGLHCM2/ELZ5MYXLfSHfMc2xSAieKgNn65
         acAO3JRmmbhRQSmVpAtL9vNjksq+Cg+wglFZ7KNf3L0w8mReYwc6zQxWlQKuG0qPmKOa
         etIUoP3+lVRcZsMnq9CsJyKI72l620klgN4w2CS0ZRRQCFZPhDiO0hpuZzD7DIYir+/J
         kJSVRbYdC0oC1IU9q42S4foioyAeqBkguEMpACUXvPWZvNboNnEk7XnyBpZ2Cu4nJGjB
         A46w==
X-Forwarded-Encrypted: i=1; AKwUvBzXUo6WrYwogEm+7Gk2CDPZPm2IWeKcpbBm6kUv1tiu5VawjaUAnduTj5wnvP/pgZXvicZWofjdOG4m11OL@lists.linux.dev
X-Gm-Message-State: AFuF++nyJN646YSz2JeyiI8h+s4K7QqV/SB1Lt9h2WvExnjhttcSdEQ7
	bXScamKzhFuOLNnjuANZTUY5BkQSfMIx5/sLrZuCrtmWadda8wftFIdo
X-Gm-Gg: AYBFou1+s4qv1H2cuqZ5EZ3OjiH/G4qil6o60pXCqjrJnCHh+SnCIjaJZoKzVbRy0jC
	MFGr4z6klNW0ZqAIA0priLx+YlIPx0Fx6fT7lpYwS4PZ5ghNR+ot7WZuQlkXKfZGMro0G3P/A7K
	2R6rffCeAkvWixbkJO0rJpNqfxSPS4J7Nkdz6sST3QfiCJFqMKoyppfd13Jcrq8IOQBtWJsqczP
	B0ZqkJWVvDbXMvhnajXWIi7wrOCUMxIt6QBR1A0d7a9LJSusUiYCHU3euUH75aW4nRZmWfebM3+
	sfmYhDSWbDaZz6NnVenwwkfs+0TpxnfqU/iKc6Ox8u7JZD7bmTzfjilQR5qlENXNpUlrOjNZUQG
	9pN73JOCj1VqgLYM0X2So+O6Bl1b2QOjJao+zBXBJVTH/RbgKCKzduGsUs5c2vMy9+mD5MYPHjX
	HMUbpE+RVC9WNEMydb9o0cSaBhEPki9fh+9YjuuTHXo95T/7N4D/1PQGJBsu95aPgwFidFJpi+c
	eC/mTy/
X-Received: by 2002:a05:600c:530e:b0:49f:bc28:e8bc with SMTP id 5b1f17b1804b1-49fe7bab945mr244219495e9.17.1790614248631;
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm27538220f8f.35.2026.09.28.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Mon, 28 Sep 2026 19:50:45 +0300
Message-ID: <20260928165045.642354-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
(amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
get_output_size() derives sizeimage from the raw width x height.

When the width is not a multiple of 32 the planes are too small for the
advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
The decoder writes past the buffer, and importing the capture dma-buf
into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
sound over a black screen. 1280x720 and 1920x1080 are not affected.

Size the planes from the aligned canvas the hardware actually uses.

Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
AddFB2 errors.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Michael Freidkin <freidkin@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -34,7 +34,7 @@
 
 static u32 get_output_size(u32 width, u32 height)
 {
-	return ALIGN(width * height, SZ_64K);
+	return ALIGN(ALIGN(width, 32) * ALIGN(height, 32), SZ_64K);
 }
 
 u32 amvdec_get_output_size(struct amvdec_session *sess)
--
