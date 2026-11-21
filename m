Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795255856;
	b=gdxTeU/Af2kFv7vI83d9tf1s5pamAvnB0odXWtYIRz/7NqnPzUfTWVuu9oKbgu27eIUm
	 Y64IFMZkmOCd4/urJ9LsT6bqFiGHnxdzRsIsPUbU7GCSlMEY4fK5EzIQNh8thHxyMxBK1
	 8uleJGlOUjwrU5+1txmIHjrKBRGHc6lHv1iSGWWXZ5Rcbx6jdzdhXwvwarXrnOgDU6RnB
	 uML2r39RPG2DT9oMo0WU3+c068+IYvJvAs9/4LJK4CDjwoiLeh1Cw02LhOdxEQ0eJRfpm
	 4wWETUykCbyDX95TKNxdcI1Dyj/zWWfEBkGbBv92+w3+qwRml7GVEad4RBpGHpqN37w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795255856;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gscuI7w3gU6wnR9QFO0QB6BLM+nklmFZb/eBfq6BMOM=;
	b=C8Cfm2iLrmaeg5WQIQL6UgCGNjjLGI0OzrwTsMFXe8S/6eq7Q7OhTKlXCVdfBEarAqGH
	 9imZpXC1MqKa+xyYBVNgcSxlcISedlhDP1BMtCEX4vLllhezoTl2ldNwXuypRIQaTbMyG
	 rsEX3iwiS9OmM/suZzjLWXXNffC07QfVKQv+TM6szHoGcVu661q6+agHhr7DqoDZJ+qWr
	 48PW+GhaAFEk2PmNiUh8SDsNIrXJ7YsoKuXAvk73H8uq/uOjmM60YLWoOp+Zs9ez76a03
	 3ei/vFgjUEMU//wu/g80jO7l9pttxKGV/QQyehPpKIAa8QhUw03yFzRc1x99JQT3hHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWo2Meb3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAEF606A334;
	Sat, 21 Nov 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWo2Meb3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795255856;
	b=QVDeOv0O6p8Dy1rAi66j1/hMof3UnzIjjU7dbX7mfhoFnwXu6oyrhEEp3RhtbbKNwZpF
	 hmH2N+McLsUUTcrooCIhu5zCtSUstIsB/SEUfQCichy4lXNZxtjqJpjG8woq4N7bzMVYJ
	 Ps7pqlqBG71E4d6S0mb+YraZx93Y64n1fI80HaYJiP67zL3p2keEWsisbDY1fvIQOBfe8
	 8ULpiQJQWtRXo+5r4w4a3j3kyeJsuIMqpPzuXD/CSGP6it98voY3THEzoKLqYTMMb4K6D
	 L0KV4FynTq0uqbCY/DRSaM3LqnO0BwTuVGhHxX1/J/QJgfCn3hptlIEXL5Gz35G0ysQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795255856;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gscuI7w3gU6wnR9QFO0QB6BLM+nklmFZb/eBfq6BMOM=;
	b=RnQ9nctcTFM8AqB/dhvX6Zhzv4ALhFjM2rD9HgDG5f2C2tB9jRAbMjADu/vIHwd/yYvd
	 iXrab8nInEtxlYoIBvxnINX/xwfHB1QD58mLuxvs17235ZVIDji5psk3J4ls35JFHrVJm
	 8cH4KVpwoov//aKbkGmjqOd8MZPWcW9BnoQxD47U90Ua39dyelri0RpKTNvQ9NxLwsFFc
	 mOZwmmbfQD55Dzo/qyb6KmIHkKiT2Vh1JrJldxWgfR2FQQ8uKBTl9b+5E39+7WL2OyIn4
	 FXGE2XD0krLX7nB7E5Z6vvRdOHdMmadBJ5nD4eQ7ojVqsRIty4GkOY/JcR3pKQwyw6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EBC21F000CA;
	Sat, 21 Nov 2026 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795255856;
	bh=gscuI7w3gU6wnR9QFO0QB6BLM+nklmFZb/eBfq6BMOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QWo2Meb394otORCWBsKCEuIWlu5u5nfty2XBL9ZDJ4pWgZ/cSV5Q+rZ+IzQ7nHN1P
	 y/quNN3jLm/pJs1NGKuK/9aiDq2zDmaYlydlJ72L9Pq58D711wYOjvCxtaO8PTRXin
	 fnSLTDNj0cS8Cm+X0ruLRK2aZ6+33PCx2ty1JkLbL751YoJMlgZm8Y4npnljEyPL4n
	 qH2xJC3Zj+OyTOxJOZm98LladECIyys4JBnkK79xj877c3CmDj+ynZw80s580hvr1N
	 bHz05f72Y6BUJPwkejxo/4MhXmyHDtWmE+2yzrXWjZ4oUeuiqEc/IQKnJLgZs9UzKe
	 nYOtnN7f0o2ig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4B694BBD0;
	Sat, 21 Nov 2026 10:10:54 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 10:10:55 +0000
Subject: [PATCH v2 2/3] media: verisilicon: reject MPEG-1 controls
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-b4-cedrus-mpeg1-v2-2-95e4decf03fa@gmail.com>
References: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
In-Reply-To: <20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795255854; l=1859;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=FQStrbwGL4QdSNvEd7D9LYJAA2FvyeyUQoe74GUu02I=;
 b=ebfDy9i8ixnAvMHvwqGQgQzsroi7ROGjPvbLkfaHAC8Y0OJuixh3Xqnqs0S+QnBtvVKPCd36h
 M8qLiINqHZ/AwFnvbY067aC+w9u1xTsiLqiR9EiSpB609O7zJcwOzfs
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The driver decodes everything in MPEG-2 mode. Reject
V4L2_MPEG2_SEQ_FLAG_MPEG1, the full pel flags and D-pictures, which it
would otherwise decode as MPEG-2. Compile tested only.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..c910a69e8e3c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -264,6 +264,16 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
 			/* Only 8-bit and 10-bit are supported */
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_MPEG2_SEQUENCE) {
+		if (ctrl->p_new.p_mpeg2_sequence->flags & V4L2_MPEG2_SEQ_FLAG_MPEG1)
+			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_MPEG2_PICTURE) {
+		const struct v4l2_ctrl_mpeg2_picture *pic = ctrl->p_new.p_mpeg2_picture;
+
+		if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_D ||
+		    pic->flags & (V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD |
+				  V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_VP9_FRAME) {
 		const struct v4l2_ctrl_vp9_frame *dec_params = ctrl->p_new.p_vp9_frame;
 
@@ -435,11 +445,13 @@ static const struct hantro_ctrl controls[] = {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_MPEG2_SEQUENCE,
+			.ops = &hantro_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
 			.id = V4L2_CID_STATELESS_MPEG2_PICTURE,
+			.ops = &hantro_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,

-- 
2.55.0


