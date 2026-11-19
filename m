Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795106089;
	b=ohYl/cR4MHjy75BjudA5b90JQ0UbWrbDC9vOO38g9KU8KB6I3vL4eiVet6CSsTx0Qif6
	 gPqdkT/rv7TWqZV8VNRVN0fKx6FXLOJ6XoLq2wWorUPQEAej1npI2JBth8Ziko9hiiobg
	 UEvNRqXVNv7G0r/CAwDHit5FrBKTTowey8WkTlo9k1zfeawChpDLx4FSj/1LasBg7ivKC
	 LqPnqRaEs00/lY1KiwTxaqmkclBYTHNoRTmkUZ5O6l1rRKGMjTaZNJ8oEZlmQ5Q/9U+BC
	 Jmjeis2OhUsHzeTbQ/6Xy/ukhWeEqpkKvT4FzDTB7dTD9JdHzh1T2nRXl9mcFDIhy9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106089;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TASXj8wsMRiuTiWS9CZldYuNl5sRLL8gOkJehr3ZTXs=;
	b=AgefvZodTrW71YQiHxi7zV0ho3IfCfdrTVq+oN6065zPGTLRCCndoChEhOHrehq3EjlF
	 uGBRPi9JDxnU4yWDouUoTqUxiRrW1ZEVajqz2i6Gv7vJNK7zol+4Vb+a8Kp5NHYK1ZNfD
	 LvbEV3WsrjpSrG8atUHy0sRLU1dcdjALAtm3FE3hEU+vJxYBUtG5tZQqZW5Kg/U5N0DcF
	 oXd++0bXSb22+XgstFPSxVzBY7iribIXa8+0RAWCgmxoqw/RDOpqqOskJ5GnJCMEtJVpP
	 HkTHmgJmtbymCfhFczigye1h1eFyfKEhmWFwcoeFDOOX86ZaJzqXOFAlko8AvWnZQBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSogWvU5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37056606A337;
	Thu, 19 Nov 2026 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSogWvU5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795106089;
	b=L4t5dan3pmX+JnWgTQEFpYut+kUDbNJN7v0yeOwCIHF2EXXvaxNPAFreP5BQGZrsWerl
	 uGFASlF0Y84quENcIHv9K61Wj8q7BC6R154HQyzcmEaAecFwK8iGSQO5lfrpq5hBlVipT
	 SrSQ/9Al8lRKuiKvG8L6zYUgSMUnRVjgSsPBCmxhkzOV4Qw+e5/dZlPWj0p0Sz9XYt7jV
	 vMi4wYUSnBh9dlPrmekCa+FNnBVi7V+MAKCaCR+Q6PjundyLAAf3NcT9+3tLQeeVql/BU
	 LslHPxkuqda+GKk61qa1m2kjqjFr5gKPnWDONAMhUhoc8oDnzuUReRZyR+k1UQkE6pg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795106089;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TASXj8wsMRiuTiWS9CZldYuNl5sRLL8gOkJehr3ZTXs=;
	b=WIDEp6eREEqGEzHyfClIz3gXgirA4U0ijnCzl/GHPCkIdbIVJVn9smKGKjWCFtruEiTe
	 2UKs81VlsQGFMVIDvaHOcM+Syf1x3OzWIVHmkbyQOBTzOEhtLlCDtADCjTg+nFwA1TGDH
	 jFWx9Zx1kSKwQz784QDIvqy84JMteU7JMW3rxkZjFY7u2NZiu03JyZ3ajssnJkkgeJpv2
	 YQC14yjfWDTNPZHAhPD/dFQc9ua3YJTKg+5e0e6wGfyksyxOBEuk2bsr7R2ZovAit3SRn
	 lcyAqxr6OjrQAMcAgKIVQJJd1SrS9JTAptRLYpRC+P4VL7g+eIHdEOFoqpoH322cB5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E06B21F000C4;
	Thu, 19 Nov 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106089;
	bh=TASXj8wsMRiuTiWS9CZldYuNl5sRLL8gOkJehr3ZTXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZSogWvU55Q22Tsn3BTlEV6kFWKjiTpepEeedHaifkNt/JRWfolLvLvivSa+uj8znn
	 rVDPKkQBkp5ZMRYSUAtkeROF4jSmVHDLmBtMapIOIILlccde7wE6Al6vMamIYt901p
	 jQoKuSA13+Ave6er+5Nvn8yp5O8mvDNmtbJy7Uce6P3rfZTsAgSuT8gbBCD5DSJ7Xd
	 rafx5xwKloh4mn9EiHyGQihileZ2gEqq1/7g2tfJrRL6E5szfn9z26O3H0DR0yPyoD
	 k8D4gHF6xA18wWMTH0X/aiQMhFj01bB/4HD3Zvixl9PLxlx9pbRSmozxUIpR5+DOIH
	 zlWh5IYInVaGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 695A74B340;
	Thu, 19 Nov 2026 16:34:47 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 16:34:48 +0000
Subject: [PATCH 2/2] media: cedrus: report only the picture as capture
 payload
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
Message-Id: <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
References: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795106086; l=1453;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=lSQqpNTqUN3KRP025JzeD5HjWBP/5kJZvzmwU8xlcgw=;
 b=00WljHGglT5egohrYdOgq2pH9RldUbgdDe5g5Dz9/47B5lNqevbDqAy08FT/fuUltqaXLfp9B
 urA326EmJLEBpPXNRX+hE7m800eVBKwNcfw1YYiIYkhBU4UoJ4p/We0
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

For 10-bit H.265 the driver appends the low 2 bits of every sample to
the capture buffer and counts them in sizeimage (extra_cap_size).
buf_prepare reports the whole sizeimage as bytesused, so userspace that
copies the payload gets the private plane as part of the picture.

Report only the picture; sizeimage stays the allocation size.

Fixes: 65429ba82572 ("media: cedrus: h265: Support decoding 10-bit frames")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 9b2d24e77fdb..b7e0cbe548e6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -511,8 +511,15 @@ static int cedrus_buf_prepare(struct vb2_buffer *vb)
 	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
 	 * it to buffer length).
 	 */
-	if (V4L2_TYPE_IS_CAPTURE(vq->type))
-		vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
+	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
+		unsigned int payload = pix_fmt->sizeimage;
+
+		if (ctx->current_codec->extra_cap_size)
+			payload -= ctx->current_codec->extra_cap_size(ctx,
+								     pix_fmt);
+
+		vb2_set_plane_payload(vb, 0, payload);
+	}
 
 	return 0;
 }

-- 
2.55.0


