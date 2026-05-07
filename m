Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DE2EB874
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187496; cv=none; b=TMHSclJqMStdt9sEPR/uraN4BUcyQBsB+GlffMzTerbH6D/Hx84QBUsrlnVXuZ/8ABShxOSfc/0ZviFUK4fqvvweIYvgDwXUque5115piZZCpYyLt2iuGEtnw/8x0Pc8mVzuI+xA4uaNxF3Iae8qWnR0FiHNa98k6T7V3Wk6yD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187496; c=relaxed/simple;
	bh=uz/gROx+rjRO7Y7pLi9uXLD8lzDUoRiVHf25jEK7m7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssRKE3yx9QGkp1Pln16CN1cPidoGSB5Rhr6iMHkWEu4kAVMpZhOt765dcTdL/1kMNVxEnzDQPuBwGfEV9ksrkX/rKswyArFaDAf0wVIAylSKxfQe1j3QplObDO0jLA6640L9+5aWN3wW8K6J26HtTKZHj+kfN2qXrJWHE80Z5Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MRkxMQrk; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MRkxMQrk"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-393ba0616aaso14506171fa.2
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187493; x=1778792293; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsiVHzLscfDV0/HZD1Y9rxslOuv9oKsD+zQVHA3Vk98=;
        b=MRkxMQrk+VvjUSut1FRQE9fks4Zf77gHrHnYFIiKF5O7PoCZpgbSxadN1gHSuFcohr
         LJBNxqEaLbM9AQIdgCnKQfwVwZ09UAlT149nVytetPdqm6+s+O8jK1MFDn0c4UUBvRFt
         Kc2fi0i7nMmv2U2PcWwFDg5WZ7bLqDsdyZOzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187493; x=1778792293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wsiVHzLscfDV0/HZD1Y9rxslOuv9oKsD+zQVHA3Vk98=;
        b=JZ9vWFYqEPYBqdeF/+gerCFtTnnoG4mDznjknLzGI0Fk3qK2x65AYkC1A/2sem7dDH
         kpEa9NNgMsdrBQnpxKX29/ZM/Exh/zGq72jr+tkHR4J4jsCbX6UYCzZtOrvDPBxJ9yp3
         KNudYzx42p2IxC89t/7vB0ia2Dok3cQivlABXce37DFow+Jtl4ysiBCF+DCnHhjR5LTm
         hxgD8s9o/zF3argPciCECH95/rTeP6v3D08AQI7VeLsZwTyDy4NoBJN2yBTEB44gAHS7
         Fepb1vR0QTfPGiKGqK+y1T/AN7u0w5NIo6gJDvJBgTElmcgdPeDecAH/1Q8WOyRfwreZ
         JhtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PvlzS8dob5QgYlwuMK/QTRtq/YgfY8mKhxu/e4BHNkyGAV4ILJ2Wt9RPiOkCb7+HS9OFliHQRtSsPN8i1@lists.linux.dev
X-Gm-Message-State: AOJu0YwytSrHw+V37PjJTzjC/cNo8loxHTcKocjzjyQdfMjCYltyvUP2
	+beSY6wQXRhRXsr1DPBHWJnMDJilf66mFjEvlNn4ATvJ4RppXQOBkDqgREZJDVongw==
X-Gm-Gg: AeBDiesMYEHNJZmS0lOlq61ESt7WEFmo8/YCpXLHCwHorzykth2GWxuZTVuKiyknQ3O
	GqOBgKFyXG00XvhaK6wv+7l//dTKFRDKDOqLEjImR0QfoiRpECfKd3OdBF8C0y68wZfwzhvmC8E
	XFz15kPUqP/clO4RvLFooWCWsb99l1bKnav78T/vcga7xyeOZNO8bSMZ3XxTpDPCOP79q/Z56Zj
	/XZu3kjTtAThb8JmEbK8IH6Zs/6b534uKUiqcjZhYqfmaK5tHmVbzKwac7r7rFwiygne2IdDd2H
	JrzetJ435XGEq7XiEHr5ADEXsEMMlbaNxOkoVb0YyNaqwz8z+ECIq8kKZLI04BN/2kLaMNfwI95
	2WkBTR82WMkfk7EwifWrAsZu2uHx57VGj0trHSbERtUVYc9yfGezLnVZ+HulRCTyE2jv4xrD83L
	mCrmBVQpS+CfZklagh6PvdBeAnUjx4PNelLki6L7kBrgLMibRMC/tNzYaHQd79+NDR4JwS1y0Zy
	kgDRdU=
X-Received: by 2002:a2e:9bd1:0:b0:38e:36c2:9bd1 with SMTP id 38308e7fff4ca-393c40fe441mr24746121fa.11.1778187493409;
        Thu, 07 May 2026 13:58:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:07 +0000
Subject: [PATCH v4 2/6] media: i2c: mt9p031: Rewrite assignment to make
 smatch happy
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-2-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
In-Reply-To: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.54.0.563.g4f69b47b94-goog

