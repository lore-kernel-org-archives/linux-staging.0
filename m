Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7DD1BD01E;
	Wed, 31 Jul 2024 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444791; cv=none; b=m5UjNLwPnGohy/TsXvUIptK5tO/Ba8cgRyiiAJ4+LyR0ATPD5hABz6KFJu6g/jDNlHarnHWZJfR/y6SAe576s6BWYKcYlkpQ4Kf26Du0Nsqi++/VwDaKSUmFlNoPn/CKbl4vlPVx+IixfncuzhClccIi/TafGXPYCHmYOOvH+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444791; c=relaxed/simple;
	bh=4q8W9CDGm7kj2yaWbuIWp1ErRtQpGcJXde2YvXOADAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCCGQ80gooDgeZe8pxN0vTZb4FxU4M2ZPoOTTk5YErnVEnJevIevzqbwu703XemtN2YgkhXZBDDjbJ9Kjj07zIONZCWS+TOckx9QVQqpQSFxG1EGk9uirmsghRFBqXc/kY04i5DP4JGZlfqORkhZZumzC4+T5eBseHCkJoCYpxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 9279114649DD; Wed, 31 Jul 2024 18:44:28 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: linux-sunxi@lists.linux.dev
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] media: cedrus: Enable JPEG decoding in various variants
Date: Wed, 31 Jul 2024 18:44:13 +0200
Message-ID: <20240731164422.206503-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240731164422.206503-1-linkmauve@linkmauve.fr>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

As far as manuals go, only A10 and A13 don't have JPEG support
mentioned, all others do.

To be safe, enable it on all variants except A13, since it was tested to
be functional on A10.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index f52df6836045..f586bd95c163 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -563,6 +563,7 @@ static void cedrus_remove(struct platform_device *pdev)
 
 static const struct cedrus_variant sun4i_a10_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 320000000,
@@ -577,6 +578,7 @@ static const struct cedrus_variant sun5i_a13_cedrus_variant = {
 
 static const struct cedrus_variant sun7i_a20_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 320000000,
@@ -585,6 +587,7 @@ static const struct cedrus_variant sun7i_a20_cedrus_variant = {
 static const struct cedrus_variant sun8i_a33_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 320000000,
@@ -593,6 +596,7 @@ static const struct cedrus_variant sun8i_a33_cedrus_variant = {
 static const struct cedrus_variant sun8i_h3_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
@@ -601,6 +605,7 @@ static const struct cedrus_variant sun8i_h3_cedrus_variant = {
 
 static const struct cedrus_variant sun8i_v3s_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC,
 	.mod_rate	= 297000000,
 };
@@ -608,6 +613,7 @@ static const struct cedrus_variant sun8i_v3s_cedrus_variant = {
 static const struct cedrus_variant sun8i_r40_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 297000000,
@@ -616,6 +622,7 @@ static const struct cedrus_variant sun8i_r40_cedrus_variant = {
 static const struct cedrus_variant sun20i_d1_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC,
 	.mod_rate	= 432000000,
@@ -624,6 +631,7 @@ static const struct cedrus_variant sun20i_d1_cedrus_variant = {
 static const struct cedrus_variant sun50i_a64_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
@@ -633,6 +641,7 @@ static const struct cedrus_variant sun50i_a64_cedrus_variant = {
 static const struct cedrus_variant sun50i_h5_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
@@ -642,6 +651,7 @@ static const struct cedrus_variant sun50i_h5_cedrus_variant = {
 static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_H265_10_DEC |
-- 
2.45.2

