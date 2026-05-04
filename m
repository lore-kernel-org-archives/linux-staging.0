Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9232E093A
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877656; cv=none; b=BNaYx51FRlojiunxaCnQc0ZpaSm7wS8bppexqZhJk7qEPXrL/b3FHBCsCnwFE4Ia7jBK1lIn4pHozD9tkmqG7lj4Kw3c4t/r8fu8RLVz8w2Cxc6GM3WGe+mqZ1UJIOZ5UeKGn+Id/iZ73MC/E9DLOdLJNtGJimc6lovVbISwVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877656; c=relaxed/simple;
	bh=tLwMsZtKESL5KitvooJvICOu2RrZ4OM6qvgcLZaroZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUWkou4s2j/stj5Igb6Broa0ohLwTmd3RCJ2cNpv+HKybDEMWbsxXcrDiv72d+XRJm1dpWbMWTpOHe/VuvhqY+Y2P2wjRJyqPSZ1/FmIvpvhkdL6lu0HjN1ltRkqq7tZZFBQjJ7atgr4QNTCdTZGehFRQK2PsMH+3QYW+A7lmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IAl0p3nd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IAl0p3nd"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so5572559e87.0
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 23:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877653; x=1778482453; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DO6EYg4vrsGld5Vns0zx8Rx5L9ViOljnC9zyP7KqNys=;
        b=IAl0p3ndHpv6Z2+W+8JKMKWAtCppe7ni/SMYAHWcQiWM6F1pV3OPE60hK2s6WRkXjK
         Vork7PDc4gKqiAqgkR6MvGSfvP+brd2hPNzdAAi4QywZIQA9a3ltX1o8G1NQXeNTGQPS
         6pU0KtQKK3JCYPIh7GFSMfAcpaTXsRKQjVt0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877653; x=1778482453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DO6EYg4vrsGld5Vns0zx8Rx5L9ViOljnC9zyP7KqNys=;
        b=qoXTJYg1UCAB/zlZVPJQCnO/sYbaIfc83gzNI6lBvXtD3fl9bWX4B7Pdj9QmTql+bi
         8SFC+FIzeiqy4SNcLELpk9+FrZe34mVl1ylaf3hjYkXChWDwVwsK9fE3oKEsRfdMACJe
         iKGuJ4ihwFtLeYrJbrG99Vh5ICMhfIhbv9eYe7B2v/ZlexdlScROJPBeP41qi6jzbDC1
         VMlfA+k7K/xuBjL1jr1QBialz+Q2Vv4eNQmWNTM8FvCLkL5sfg/mtEQdmZuAQULViK4i
         A/vl7Ukmh/agXOKUIy9wtrUE9swmXN1p0fQITOi1ajKKx6RN4Ygwg3gEJ9th47KjMU9O
         arIg==
X-Forwarded-Encrypted: i=1; AFNElJ8OeChghoXlKdTBRvkHg8suzUOcxMzn+NrLPsLpGVI3iW8OaVB7pqw1PT22PKPrLf/k3wRUSZHMTglnPt5/@lists.linux.dev
X-Gm-Message-State: AOJu0YwE/nyFxBRfamKOrm6HWc9S2XMOa1q0i10nFOLxpGnOJSOwcTTK
	p/ZyhaaPIui6tntaq7CE/3AuD5s92V2RRfd/uDirn849BfoqwgA0t+s0+tR5tJc2nw==
X-Gm-Gg: AeBDievZ9CyWgK1VGTgFiL5gksO6RjO3cBWQiaft9LwOPNz2CnaFDZHzRMkTI8g4zCa
	QEAkCHMqo5xKpL7v9L6YidQRzJnKSba/H9StnItaqi0Oup4dfLiSv8CB3CTjRpEUa7pAg4MmOLH
	zq7hht6n4vC9PgeXfrm1iZMsmTVIZW8oWo4DeI4HPNFiBo8UKVvMzBMH4rpp09M/7MiXifuOcsY
	UixJb9BWcUzZggzdRhNDREop5KwNWpFhnuX0Gp8I+ialSyeasrTBdxSJ82BO1xenBOhUmo/BRiE
	0N4T2WQaz6Vb+jA11+scPCWvfz/K5e54/g6ny41t4vRVvAOajwHWvt08n0sVRoPbFiQgMVurxOh
	nwj8GU5ADz8br2B/44fGd2yv4e03TNEkaEvajzA5Q8gQDocBSiyI51I9Y4OaHMsxbZgBZMUfCzs
	njwP2v7nzSU8KxJamV/TjrvBAMcVsJAJRP0IV5vRcOv9aB/pxHC0ZwmNeBhkffG0MiMN/JelRnQ
	kG9DQgGlNYVxKfmeUXYXHzN6tj3
X-Received: by 2002:a05:6512:3ba2:b0:5a3:d1d9:6080 with SMTP id 2adb3069b0e04-5a8631c00famr2451231e87.29.1777877651260;
        Sun, 03 May 2026 23:54:11 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:05 +0000
Subject: [PATCH v3 2/6] media: i2c: mt9p031: Rewrite assignment to make
 smatch happy
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-2-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

The current code makes smatch a bit uncomfortable:
drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'

Probably because smatch is not clever enough (yet). Do a simple rewrite
to make sure that smatch understands what we are doing here.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/mt9p031.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d925ff..8dc57eeba606 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -796,7 +796,8 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
 			data = (1 << 6) | (ctrl->val >> 1);
 		} else {
 			ctrl->val &= ~7;
-			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
+			data = ((ctrl->val - 64) >> 3) & 0x7f;
+			data = (data << 8) | (1 << 6) | 32;
 		}
 
 		return mt9p031_write(client, MT9P031_GLOBAL_GAIN, data);

-- 
2.54.0.545.g6539524ca2-goog

