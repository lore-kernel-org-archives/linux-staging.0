Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C838A715
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284297; cv=none; b=d5Wwyhhhbu4T7rAU99DLhy3/BmuwNaucYHXK9qtvHKj3tl8H9YGnkl54knyr0TpYVmgkrhmtGQXalb6g+qT3oVWDjQBicf0QleiJfPNH09+vJqmgYRywgbw4gfbO+S+bYnUuKNeqEWbh/BsL5yRQ4z5VSSiMIkPJgIva00YSRes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284297; c=relaxed/simple;
	bh=uDO1v86RFnRqY9b7pEBAt1odbVMighkS8NBZ6lOz7RU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=MR8OjES9Jg4WjKazch33S7C8NyH7/S9CcGt6T9KySb8s3kXmICIedu94XABSaWxop41QQr1j8hmLMm4bCQEj9c8YxlCCnIZ/m724Pp5pW1Sq5LoAx/x6M27cC2uqMb3ddGypqMVhdEXlJG4PQkWx2rLnGoFa93/+HdCOsgQK0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXmGlC6Y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXmGlC6Y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so5979045e9.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782284294; x=1782889094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=;
        b=QXmGlC6Y9fT03VVNE2pxSEmHOjdZEPl/Omj4Htfi5a9ebS14JOj+iox63om4FbTvnJ
         8+CAlPO0cne/xm0WEF4uCaTzLRW0fxr9LvMzbKD+OEByPAUfvoXLOJjogDriFOJfZcr7
         C61tbiL98IzWoQS76WxH9wfhbytPHUCwhRWS6QvBDsj3wYXfU5MsaJYmiit2LxRMiJaU
         ADdf0ijDgSKeIGZY2l85uda7ISZd8kDqgXiYVVz9CAQEj9dl/rPk+wzpyO7ZUftfDj/j
         zL7UyVB9y9pZ7ZNFwN4Uo6EZHzmqZJwJqYbPL0k8WhhK8+fSw9HP4JedySWWp3L1FrKO
         5JSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284294; x=1782889094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=;
        b=P3NICErdromPWDKoiCNIsiyqyxMvnLhtDWkae1WJrbluVhHFVwTjSPK069aXk3K0Of
         DJGpW87pDK3tafaOm9K5TteRXMYncJABBTuPBkpEDE4Cl26T6LJKXT/8CtfJODh+XeSd
         8YGNAg5etirV8uNPIF5JTYpHBegYCUMnCAGHsrobTtfFKXYbRtOsR6q3ZeOEddvHMH/K
         f80VHi3j6m858e65RnKQIlTcTbk81FhePmF1lvDRH5DGJAKegzt8zv6F7UTCiA6LYhMp
         5ixaD0zehY2NixChIerfiJEdPw0Yn/OUHC6podDbnIzIX/Oi4dVGe+Ra37yy/1WVtvis
         Fn1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+P7JlZZjf3QccESQmVKfGhX/Injpi/RuM9uHXD2WQ7nGVP3HHSsU2vvoKNFfJpjFBS4/IkIsdip9Kmy2KN@lists.linux.dev
X-Gm-Message-State: AOJu0YwH/9obKiBobrH4LCOaqwsYUHqxqjW7X5ouiUuvTcHUF/fQe0Rj
	HbYKHJM/8mMNg/ocahw1g+V9c8HPz4HdaooZYvFMnkL406dFfDsCsdCH
X-Gm-Gg: AfdE7ckd+pJfzVRYc5Fj0rm2PhXohmdmaJ4MtxgzYjrnEV8mkf0Gfgk9I9VLF8T6pWH
	NqCipUM9SOkCyhP08KrPygiqn9WTOAKLXB1q/uiW/yDtaIuGRQZ8WBv799208qkHkOn95pjwwIU
	RqwXl6cCM6y0ICtf9c8ItvO+BrCc3/nC27f0uE9F4MRulXfxfbLjAjLIloUoFv6ak9YqVEgmWEN
	I9Ed84qNm2jEi1dJ9RLC3NueYN7TfzaPNudyglpnWiiys4LeCg2TK56LIoaMGHOQNyiqVkc3WSM
	25BJFTa7J3feNmt9kApVtwpodUCpKuRPR4gHE4EgH5l7sQOPDNlHhEkHl1yVnl6JNmCJkgwE058
	rd5dm0MXdFuaeoI47o/H4ya+eCHa9CQLRTNqfzMwOihLLt5KJpqlWPO9z8M7IYyYB0khjGuU2/7
	OJ7af8sstLsu8EHOhC
X-Received: by 2002:a05:600c:a49:b0:492:4b68:c80b with SMTP id 5b1f17b1804b1-4926084aac6mr23722445e9.1.1782284293970;
        Tue, 23 Jun 2026 23:58:13 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49260d77e8asm20013925e9.1.2026.06.23.23.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:58:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common
Date: Wed, 24 Jun 2026 06:58:08 +0000
Message-ID: <20260624065809.2460720-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When VIDIOC_TRY_FMT is called with an unsupported pixel format on the
OUTPUT queue, vdec_try_fmt_common() falls back to V4L2_PIX_FMT_MPEG2.
However, if a distro has locally patched MPEG2 support out (as it has
been broken for some time) the platform format table does not contain
MPEG2 so find_format() returns NULL and the subsequent dereference of
fmt_out->max_width triggers a NULL pointer dereference.

Fix this by falling back to the first format in the platform's format
array instead of hardcoding V4L2_PIX_FMT_MPEG2. This is always valid
since every platform defines at least one format.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

---
This fixes use of v4l2-ctl and v4l2-compliance tools when MPEG2 support
has been disabled via vdec_platform.c - NB: although this is a fix it's
also a rather niche scenario so there's no need to backport it to older
stable kernels.

 drivers/staging/media/meson/vdec/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..f3e7072f221a 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -504,8 +504,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt_out = find_format(fmts, size, pixmp->pixelformat);
 		if (!fmt_out) {
-			pixmp->pixelformat = V4L2_PIX_FMT_MPEG2;
-			fmt_out = find_format(fmts, size, pixmp->pixelformat);
+			pixmp->pixelformat = fmts[0].pixfmt;
+			fmt_out = &fmts[0];
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-- 
2.43.0

