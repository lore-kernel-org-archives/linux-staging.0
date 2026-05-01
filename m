Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA136C0AC
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635181; cv=none; b=kzpfX+uX8UttYJ3S3eN94x4Ha4CM5zMP6ryazxN6PhlNVgfreueywmNvb2tXdbErJMS+7acd/gYHLKn2TkuSl4dinXFPZK/aGwDmg3qMpRpU56W7WhSq7F0dEC/uR6iJPN6yFPtEG+WgqYWJHUCFFK/scM+B1xwLMCYTUcMx6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635181; c=relaxed/simple;
	bh=uyYaC1lTz0w/nk+wumPROnOpURb8EgSxj6J839JiKk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaZJXYDSfA7f8almzXO/fklPh7yMjTnkKWMb0Z5X0GJC3/ZMbg5zKBbaECmndEc+E8g58BrFx/PyaHZMfSaw7Um5XoPuudvrWq8b1J1lP5xupF4+5zZHNdBPfqGKd2mqxLgxpu0VPQkHZ0gx8GD+cOLXzpJylQH+lIUDNR1dsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VN55zu0W; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VN55zu0W"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a413f83226so2612995e87.1
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 04:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635178; x=1778239978; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8cx0IS1VAS+UenVXpVCneZJCK5BcfnnFJsArKfUIY4=;
        b=VN55zu0WKk93qelaDrwX2CVGs7MJdKTygZC1ge2jPH1YqusthLcDBaOZBi+oKNAnbu
         55yxIuRuNOPovdZFr1yPKoOmuyzH/LyVAAeLg0rA5OS9BuQpVKbyWAfftjLSWBRRq1PL
         GaJzF8hz4OwWuNedHn6nLIYA6Ft2hNJzJ1GwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635178; x=1778239978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t8cx0IS1VAS+UenVXpVCneZJCK5BcfnnFJsArKfUIY4=;
        b=kotx+8Bc1YcMgAvE2v+nvfM4WiGmPdqqaGAV0maek3Ln32gDgzt0vZY7AwgPRe30ZZ
         JBQCjkwE8ZC8rUhAYLT9CWIyPuAk7eWeK4b4p9LFycU9ebiU+w+WGvXLW2xT73O0Xld8
         hljOKauaOhV+9PkquIXsI241rkYz1gu8IWANQa0aVA/W4NGa5IsMvm3EeI3kxquROVqs
         dz7WuxwaJlZzFIYVuf+8/8Tf2B0H2GPkWZ/J6jDZ+Eu6Nw1zjL5HzdJT3PwgKsgExD3u
         fjWDUQHkeTQR4tW2SOxyK8ngNJuv95XjqnIgFN7o8tJx6oEi/6cOHxMmvM56XP431OKC
         DXYw==
X-Forwarded-Encrypted: i=1; AFNElJ94Tx3m2pckSaDC+wmRxNS3bAE/CKZh/is6/sOkIEWZasFjooAgGaDNr6lYfMdqPpp+N8WgxM6b5UwVGjTK@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/72wH4v9zc/y0QX9EO/xVL+X15tR2W0hleJ8FeXYx80N99p0u
	6GY4eHO8iQBKUoZeaOdpGZSrfk/WfpEgBzEafm0POWgF6ZmWljLbuspjQjIUuXzduyTqy9EDKbV
	Te+Y=
X-Gm-Gg: AeBDiesHi44W6NvZlFJhyuJQHBY7E6Sho4eR/6kE7Qad0nP+TVIgyxhrTy4aJuVQiFo
	uDw5jGpdoL3dDjEoukfX/ZeSdGnrZY1rmcBim0ME+P19k+kWCG+CjSwCa9qmHXa53ZxXHTFBf4A
	leBjJXdf2KCBlIY0wjZybjhBempfEjOSVEPKpBz2xq0vtuc2q3GMrM6FJHqw9XNFtHdaHJ5hvEV
	64ff11siJM9m5y7pe92gwuqRJPtl815Bct8YCDsw/+6RoIKXKWdoU94+O3yLVP+cw4Ap9KecgfB
	gJHRJF28k/X4i1zZcLeQHH/LZKbq3m8o4dmVXGguz5CWGcK12p0eCI41Vyqn8PiMXuQvrzf2piE
	ovxwtphRPugX71oV/JhKCdnKCZMGCAtARY9N6dcvZR6SYvOaKMlqYJRpVOPj3+bWXF1W5ow33Om
	aTjNwkYtJSvur1noDrmTyz4T9U6z9a/O2OeeaisMmehEG/vV89Mum3+LGE+poRUTGCMrhS0qQPh
	Re6h0MYh7ACIp3t9A==
X-Received: by 2002:a05:6512:3b0e:b0:5a2:c0b8:270 with SMTP id 2adb3069b0e04-5a85274573fmr2057007e87.22.1777635177764;
        Fri, 01 May 2026 04:32:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:32:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:47 +0000
Subject: [PATCH v2 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-2-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
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
 drivers/media/i2c/mt9p031.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d925ff..5c9dff030b4d 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
 			ctrl->val &= ~1;
 			data = (1 << 6) | (ctrl->val >> 1);
 		} else {
-			ctrl->val &= ~7;
+			ctrl->val -= ctrl->val % 8;
 			data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
 		}
 

-- 
2.54.0.545.g6539524ca2-goog

