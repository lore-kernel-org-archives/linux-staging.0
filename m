Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2140210186
	for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 18:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337187; cv=none; b=FeWklYLciZCMHlIqD52zIIySLV3kxSUsWtNpcDVeBMDGTDD11NkGXX9JPcU0d2iAxWmwsgoHsWyzsb+x2AQtngg5IYRIbMFRPuCPfQFERpyD0B6tCG5VijZPdalBL+uK4ZVM+y1apfGJoEgzjIt3NjbV9PzbXLt71+H0H9h0MOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337187; c=relaxed/simple;
	bh=dnwNReE1hPulb+Tc8iZo/fcErBj/zFU9VbifxtAwbsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIkCI3O8/d52iJQAPgQjvpCLyvI9GbjIrtiie4ZAiVcNbtBRMfq/S9RsyntKSoSxCdwHYZdU7W2o57mWUfoEjpSSGl4ItM4FzVXdqz4mVMbNsPqPbrjB+g4itoTziVyoXNslN0hd5tB8hBE3AJeX7vGacta62IPaQkSEPNLeSxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jSMWIJCH; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jSMWIJCH"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c07b65efeeso372208485a.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Feb 2025 10:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740337185; x=1740941985; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1ZNr+zAsbdRe6SnCCPjc7UJkoW/yg5cRHdJ7D9R9Hg=;
        b=jSMWIJCHeFqIuxNLA92vVAlb2BY0XhwgW80qApqhkAltRruJJJLwjGZZWbNr3Y1vvD
         mPHW3mGSrMxUsjJUCdqT23ULRjfwonf64WiUnLW/VJ2BTWTKC0dAMDTs7Ifxr56dz3y5
         I1GNbtZzNwsisMbxA87hLQfr13Ju+lqi/KDVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740337185; x=1740941985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1ZNr+zAsbdRe6SnCCPjc7UJkoW/yg5cRHdJ7D9R9Hg=;
        b=DfT7N40HtB0HRjvyS1uKwV82V+ImoppIt08BtgoyOA5NphMgbKIvlT8YJ25FhA3Aqn
         ScOJ05wYB1q9tSVS8A6w0BTq+nRscMvoJLb8rEg4WEt4Gy8om9G2kOdOG53pEcBeCSy8
         v1XsMFZWI3yUDCMgUAq85/2RHgcNnt90fZ5440hCAji8PNr35bdqwHOaYZEMMB5Fm7NY
         u/v473NnV3sqUqJlq45khWyJbVR/uCkPe0WPZcnEEuSMk0ZCAAKAP5IF5U3CDDol+aNH
         HZHqAZkWPmcEJLUIQIn6t4d8Eyrib4mHWNq9BDoxVae0ucQEICIx/OyX3dgyDHHqVAFC
         AG1w==
X-Forwarded-Encrypted: i=1; AJvYcCW3R0a9VwpV1ZhF9mnjsY878QYNB3sSG48q+DQSYGKo43bpneHT/vxEOqqLhF7bZDK3pmlmhMuYBmtxK1or@lists.linux.dev
X-Gm-Message-State: AOJu0YzxxPZ8weVnqo4coEpcnqlpDL4PZ7rs0vx1rKYv8A/LUoTP4+rN
	jJLbQAaEItIYXpM+gTSHyoFL1s6JejNZb6liz34cs+k2rCXyk6vBRDYo0hfNNg==
X-Gm-Gg: ASbGncvKgk4bW0GzvpXB3lP6EfijFiTJu10jCxjqcay6bvHzehcxFDMQ2HRPJozL5X1
	QfZoOq8RhHFmC9Be1GKdAwdkYigIkU2G1lv/JOQc6cs52Ii+w6pBpdThcJ1WyLYvyWT/3YEYCi+
	MPNN0iUGlkHuC25MAVL2RA51SpuiYVX/u7+VXlg/0jVpUG42fpoKBgpRy5xiKm1foaPRD4T0fKl
	WWamZQq/iaNqBfpMCn2lDEd/7Qs8Gzubqbo+Olxf9zO+8Rcjz0kChaV5DdkU9K15cWnEyI9SJKy
	JDzI0+RKOw5W6tCD1nYvNteMFPPwE1ZSg64wMjaxcsxbw4zF0+Pn52NoUdFeOPGTb21jdhpOQg9
	4Vvc=
X-Google-Smtp-Source: AGHT+IERdPcmnp8DFkM7FzQDBmkbwLEcVj462XFjOmf0I55eocLBJbotx9VABzofXN7Sh0Nf0lYF2A==
X-Received: by 2002:a05:620a:470d:b0:7c0:be0f:2dad with SMTP id af79cd13be357-7c0ceef9875mr1290641485a.21.1740337184802;
        Sun, 23 Feb 2025 10:59:44 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm894052885a.47.2025.02.23.10.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:59:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 23 Feb 2025 18:58:15 +0000
Subject: [PATCH v3 12/12] media: radio-wl1273: Rename
 wl1273_fm_vidioc_s_ctrl
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250223-queryctrl-v3-12-4292911cab6b@chromium.org>
References: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
In-Reply-To: <20250223-queryctrl-v3-0-4292911cab6b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now that vidioc_s_ctrl is gone we want to remove that string from all
the codebase.

Besides, it isn't the correct name of this function anyway. It's clearly a
left-over from the past.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/radio/radio-wl1273.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/radio-wl1273.c
index 511a8ede05ec..f55217ccf2b8 100644
--- a/drivers/media/radio/radio-wl1273.c
+++ b/drivers/media/radio/radio-wl1273.c
@@ -1407,7 +1407,7 @@ static inline struct wl1273_device *to_radio(struct v4l2_ctrl *ctrl)
 	return container_of(ctrl->handler, struct wl1273_device, ctrl_handler);
 }
 
-static int wl1273_fm_vidioc_s_ctrl(struct v4l2_ctrl *ctrl)
+static int wl1273_fm_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct wl1273_device *radio = to_radio(ctrl);
 	struct wl1273_core *core = radio->core;
@@ -1945,7 +1945,7 @@ static void wl1273_vdev_release(struct video_device *dev)
 }
 
 static const struct v4l2_ctrl_ops wl1273_ctrl_ops = {
-	.s_ctrl = wl1273_fm_vidioc_s_ctrl,
+	.s_ctrl = wl1273_fm_s_ctrl,
 	.g_volatile_ctrl = wl1273_fm_g_volatile_ctrl,
 };
 

-- 
2.48.1.601.g30ceb7b040-goog

