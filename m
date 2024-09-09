Received: from smtp.forwardemail.net (smtp.forwardemail.net [207.246.76.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE9718A947
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.246.76.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725910013; cv=none; b=LTmW8Okm0/4neKNwz5QCAQE8MgFGh7MCN6+u+FPOppn4VQOyHv7XyCjYRtIb9ynQs5g15eb8ASgiQZV4YVnCpj2E4/Fvj2FbyAeVXsLI/77ro8Aql87mu1lEwtY6yV1lAR89ICFod0hLkephJ/x1vj/v0w/JeW7Ar4Dt/U/YNyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725910013; c=relaxed/simple;
	bh=Uu832Uk5b4LaQN5ScMnX63a/5a+C3Dkjxd06KyW/bfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3ITH6p/QwA73UbuIJSUeNEnnctDX+76EODfj76rDuzz+vmezi0ldcxf1JebSNwCH5sCPzkQEa87lEyCaAraB3GIjaehjIwxjJJgZQdX3mNQmFcFWpOMBbMTG/t1RB2fsHQJ8xd4a8MuCmBsPM5smVkrtSTf5PSmAnG6E+pJeu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=BkI6+NS0; arc=none smtp.client-ip=207.246.76.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="BkI6+NS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725909996; bh=MqUj8A8o8xViBmolQgigKvVukl8yo9wbPYV1IfunL50=;
 b=BkI6+NS0Cv+Q4HJESeMcK2GKj8uSaSQlI+BZUklvGzn6xy0bjIaMvaWK+UEV3kyLw/wSyIRK6
 o0LQC1TZgocH9jGzYrjMNJ2CaJxM5mEsMjNFgFBHFJnl8IEKkVMups63wxBAgRZNT4N46dmEM6c
 hcoiZBOQRYfrnu/yjDp3eDcqv5V1WHudpcysncazfnJl2qLYbxgg701fA80ujV2Rw3Ae7kFpstJ
 YWKdpPlHufvhfZ9VSNLwozdgLuUymFzznUqv38wCuqe4Rahv6O38x68j47wK+VMlq6SE4BpO+kU
 VU7AZJekqHxEDwKYV8BswFm8uxI3gEKwwXGS92aWL8fw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v6 11/11] media: rkvdec: Fix enumerate frame sizes
Date: Mon,  9 Sep 2024 19:25:09 +0000
Message-ID: <20240909192522.1076704-12-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909192522.1076704-1-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 66df4beac680cb8b7d2dc270

The VIDIOC_ENUM_FRAMESIZES ioctl should return all frame sizes (i. e.
width and height in pixels) that the device supports for the given pixel
format.

For coded format returning the frame size used to enforce HW alignment
requirements for CAPTURE buffers does not make fully sense.

Instead, signal applications what the maximum frame size that is
supported by the HW decoder using a frame size of continuous type.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Suggested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6:
- New patch

With this change FFmpeg V4L2 Request API hwaccels can implement a strict
check if frame size is supported by the video device:
https://ffmpeg.org/pipermail/ffmpeg-devel/2024-August/332037.html
---
 drivers/staging/media/rkvdec/rkvdec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index c8c14f35ac44..9002eb3a59e5 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -334,8 +334,14 @@ static int rkvdec_enum_framesizes(struct file *file, void *priv,
 	if (!fmt)
 		return -EINVAL;
 
-	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise = fmt->frmsize;
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = fmt->frmsize.max_width;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.min_height = 1;
+	fsize->stepwise.max_height = fmt->frmsize.max_height;
+	fsize->stepwise.step_height = 1;
+
 	return 0;
 }
 
-- 
2.46.0

