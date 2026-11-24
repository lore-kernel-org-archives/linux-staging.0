Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543960;
	b=oL3v7GT45GlBVdNPyRRRgI0+kh6ekUY3tEzcqrwxdYgg0B3xn3ap2sQZfiI1PP5G/yRa
	 74a6DpBRJ803JpMvjMqWR5XGuo4njlX3/qL0uWRhnd4fuVf7pELWPEJp1GWY5EEEfIE36
	 8c7fRn5m8X/wgLXOM0xius63z2+mLLN44sF84E/X6ihoqdsBaCTqh9qPyyLZ1fLvl5Wee
	 PxMhJoHrkEM22b6V1Wg8fgNfVXsJDUrqghMi6f8g6pDKUpaoi6u316lPkgtb4+nJOlNci
	 BPHQSwOkz2vWzZkBBLDKPErtTKUKZjEObpbcFuaZ5zpNjzS6OtNf+5nKnl3GPqa9sLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hmoMr/xIeQkn6KEQV65vhstYDu1X6WGPKu2yVoQvURA=;
	b=TMwfLxP8e1BNHOBvB2sDM5ayAdWHmHwBfkbkI7SHk8ljR0m9rN/VwaGEtPJuK4I3mGhQ
	 RwClnaXFFrd8+v5NhNhUF/tAxLNoLNazQllEYJsQodyG075LXgZ7xnwEtC4T4hstGjWoC
	 CqbgGRyNpFHoNmnueWt+PyLj3OYxOIXcNbBBL8e19oCmFcYntNYZPtd18xc8G38vgd98f
	 OJVnQ+XuN3LnnBNc73IN+YrjxNuE6pgHvYHrDUlhK9C7cay68mx1/Kegx4YHd3m1F2AJq
	 72XTqjuF0TsOQauHkC5tipGYnH0S70Hp0FZIqiCHUX/TORn0xIjF1ed2qwun6dQK/fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o+LSxy2/";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713E606A31E
	for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 18:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C713E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+LSxy2/
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so8128131c88.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Nov 2026 10:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795543959; x=1796148759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmoMr/xIeQkn6KEQV65vhstYDu1X6WGPKu2yVoQvURA=;
        b=o+LSxy2/5y7F28Id7b54Jm4KOhTlgTdenGYGpcAg2vg4rHqBpDcpKnIJNyHuoU3+vu
         5oRnNa4kOQO3yaWQmeQlHCEzcsB7ZO/rhgNkeTZWgNb3KNFB6nTTBhP9JnAvobaUofVr
         psw+ySOu87SQ/PN179WzrNXGr4QNGpnPstJ6cIWrK1F/Ff1QP084LshUnU3xwMw8qQbw
         66+GXZx5wdPjGvPqDmWwKJut/fSSPBUutPfBbi0hDPaKeziiZAQRdSpytTUnDuU6pc3h
         Gu3MSUuvCsC6GyU15pneaTdSkQ5asryviVw9pQSyqqHWBkn/UEDcnG6wxG4x/vRFt5KU
         8xgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543959; x=1796148759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmoMr/xIeQkn6KEQV65vhstYDu1X6WGPKu2yVoQvURA=;
        b=sDr3tcSBRD/kDG7CHm22mE83SCufkgRs7yEpZzJQqgSJK+O5q6ZNil8xhPXpf3CQ8/
         VnungowzKaAoukcu0xIsXF34OaXJxnttT8YkQjtpivXrGVtOnLN2K1dsm44m4Tw7PZJc
         ACisDCbAHXAunxB6DIfS5ajWeLKxA46D0oYMHlb0rhKCNiK2ToO3UKN+R6rcNgqT1laD
         DvKYBazvZ0aYypt/g7+tuTvX9tcDB65+JZC1wX9fybwPOk2Xww6qC5hvlyf3xbYn1nAH
         kiwukr8u3jyY50wgoLl1h2vOd6+XEnHTJAsQxWJNir0XJanMtyXDgnRweuZwn7KXHqdc
         PJNQ==
X-Forwarded-Encrypted: i=1; AL+hErGwf11a4OsT2o3uLIj/p1zs0+gGz92tStUpv2DKLzeS1XYE7Qlmy7VT7zCzFdGmOHS1CZihqXgMsC9Nk+ja@lists.linux.dev
X-Gm-Message-State: APuU4Z+eExTxdLKyVx+FjJiDOTgq3711LRo8b56Q+e9afcY1p1tqiIO2
	muTvYqA1mnclNb3xriYm8lWrrYRQYT17kE/B4GqqEAEYowBxvy+Ubgpq
X-Gm-Gg: AZFdTZeSjKmoXO6ckjl3mhxBesBmXRSQnCE1X6d5UXWt2upS+g4aIFVrrOhUEE6P8eV
	IlNdhWed//24yGIlpneHP2RTDIfYKt0JH/J7f+bWuu21DfUfUv1t9xZEBoudC+hZKtj8k6ZjT9F
	IRojRmBLvALxz74LxMREQEDR3oieoccy/8+s7IHhUc+9T36SH6VRt6fbsbubRrHtEtOubOAd/b9
	+032Iywp1ioRc+RokPIRoYkHydBXX50pb/YaVw2akfQjUuDERQbUXf0u3f5zPZKwf5Gs11RB62R
	7fxNCFa4AjQzjlQYmsd6y7bCEAk1vNUBsN3CeCUr7IkrssksR5S5boUyjwwICRq0gTy3X0M2RNk
	u90AT0lH5UzrJy89dwR7K8+H0gOTK7f5+FaS+XO6sXtCaLOi8FQyXNCerx04/YKbGcx3MhnBC+N
	acfijmRTadpXnZsmUHCBT47cHn1BU7G5k1HezIPRrhrbeNy6Dd0aHqlsy+G8fvxZ8N43p3gX0fh
	hxCg1aWHp3GTOyAUb5AtzdIb4K8g7sRLlvTQtEYVNnBpNnF6dGXfRFbfnKj+pKIIXELeQJTQqKZ
	RI+s86Yist0uATmfFymjWc6Fvmgilcuz2QMCOw==
X-Received: by 2002:a05:7022:5f18:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b55687ea53mr12696132c88.10.1795543958747;
        Tue, 24 Nov 2026 10:12:38 -0800 (PST)
Received: from user.. ([2405:201:c052:b00b:ce4a:5cb1:57cf:1361])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm42713885c88.7.2026.11.24.10.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:12:38 -0800 (PST)
From: pavankumaryalagada@gmail.com
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	elder@kernel.org,
	vireshk@kernel.org,
	esennesh@leaflabs.com,
	skhan@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH] staging: greybus: bootrom: use firmware size for debug output
Date: Tue, 24 Nov 2026 23:40:46 +0530
Message-ID: <20261124181046.44750-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

The firmware size is converted to little-endian byte order before
being stored in size_response->size. However, the debug message
prints size_response->size directly without converting it back
to CPU byte order.

Use bootrom->fw->size instead, which already contains the firmware
size in CPU byte order.

Fixes: fc41c2da44c5 ("greybus: firmware/bootrom: debug output from bootrom protocol")
Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index fb1fbd3f7b99..4e225084851b 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -222,8 +222,8 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
 	size_response = op->response->payload;
 	size_response->size = cpu_to_le32(bootrom->fw->size);
 
-	dev_dbg(dev, "%s: firmware size %u bytes\n",
-		__func__, size_response->size);
+	dev_dbg(dev, "%s: firmware size %zu bytes\n",
+		__func__, bootrom->fw->size);
 
 unlock:
 	mutex_unlock(&bootrom->mutex);
-- 
2.43.0

