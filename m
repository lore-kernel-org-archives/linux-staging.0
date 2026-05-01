Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875E2390993
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635187; cv=none; b=eHsk5WtOS5KVEFdZb6wM4HJNibEzcA0Wdbwose4CzSgiblmf2O0uQkGmXoOS2zRSZAYa2OyerFQUxHIF7LakTtSzgfVSw/ZvJ3D05d2ad+4FGx7VYpAUkaPoQlZX5lKGsCtTYi3DWsGwfCmU0Yhl+fjpXK21k+g+UCriBf5u5M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635187; c=relaxed/simple;
	bh=1hqe5xk6q8A/JJ7IgDYxkmD8c7CkAOuEyy57fGoNOLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxsR3baK5C39IpKoEJQgqmxqLVuYlgcYJ4Y4aaak4NCuPbc6xH0+Q9E5Ax7b0juPnMaP03QiqNL/LA7UDgep3MuLNLvpqNCFQ8BCE12gw/TlhM3WAvL3agcu/xjphGokdrW5xa0kfT6/xWv5OjUmszhO3FjxssWAnK1hPqD2+tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j6ZEkk3X; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j6ZEkk3X"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e9653b580so19818701fa.2
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635184; x=1778239984; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84cmq9M5CJzu1gj8OcFfHRDpQSy+05+lbM8dfJHx98c=;
        b=j6ZEkk3XtKpptP3WxjUUiwEzPOSyUTSe9XJ/CO4giyY7IyGqRjc4PUct4C0iTH/VZq
         dHbSZ/mZcLicj2250KMQoBhXDx/LchgZlidSiRoTDdUJqlL0Fct4LaCq9nO98cZyCUjN
         +Dbf/aUPY9erXX7U6IhZZcQeR3Jt4Ppn4ye+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635184; x=1778239984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=84cmq9M5CJzu1gj8OcFfHRDpQSy+05+lbM8dfJHx98c=;
        b=q0jaf3aBlVYfN1NjhNtRnzFj9fg/vcy8wSHBC1YqV5H/0UYJFRDq/iBNC033oYcaGr
         KrwtLKkHU4EPc9LnLNnukC+6t32IRYTVSbVv8B+mtG2Cf2hdCQyxDY+YyQYWu+e2FIk4
         7Gmbe4lZXP25+cewpd4Y6thnkCDG3BTX+N+uaZnChKdvSZyeCivo+/t58R8hvb8ry303
         XIGnXDt6w/QkLBFvjfu27kmAPS+0SI5uQGOKBlV0K7rtMEauSC5MUPgwkqqVYScKXEi+
         i4cmlH51lcC1zTbQHprfVzoLE92p5G4IhCnSLgu27gKxXj2xxZofhl4Mj6FVbuqvugnk
         O1Bg==
X-Forwarded-Encrypted: i=1; AFNElJ+n8dDTphsvb5JSMD9beGW3SuzXVgn9iHnNhR1YCxZenNSXkfROwRiTlfG9jUDh2EruY6cO9P8pu4DDSuC3@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6SAfXLLjaT4m5a1kbkjEs9GtDE6bxNqbo/mBaJkuc3sdDqAel
	mcR3ly1JXJbStGGis9ziLYMITXM1XCHuz8NVLDKs/UPozsrKs0TBzxFq/YS4ldOQ0w==
X-Gm-Gg: AeBDievi/4BfU/mVnzHXD9Y9N3UO00UBQ35B1OpHbeZR1Fk9ko47DJeuO1Pd3dAXtta
	fjvLiWNL0Tzk4wtvmoQw5pmm132grrwkJ7KMJq1uMcVXv5/9LP0A293e2o4LUqQlGzl3huBOVaM
	6tZ9dTyAp/K5oppO4Lyjp/Lp/6Sd85Hf18WkyLqLB3/gBvkJPRk+K570/s3x0wiLw5YBx8kM0sj
	Xj1vBQV0/q0ICYvt0OkkWH3eSzgHKOE+SpAwkuzYWtUUGCbbQ8f664TiILZlzW/GRwW2YQAylei
	35ziXBcL7yb8pW9PAfcv5efImvtI1S54pXWOzQqPqaR+ZlDphdDF1naEbirfRKqcXq4wO2/7nb5
	3GGqanr3Jj03kyylFH1DmTl0IlxfO/rO6bmkZSsVsLDvI0w75wEAJhfewdGUZvU/PvVKqDs45e1
	yYDnAemo6LuSiUGgUjmVFQ54L988hVnJgYEOwfrhZ2Jo5SLs1ffGwbqsFUeAYyNmLoe2PryxCv9
	3UzsTqrh5SWNDNL4VmCgyd5fvUL
X-Received: by 2002:a05:6512:1288:b0:5a7:46e6:74c4 with SMTP id 2adb3069b0e04-5a8522bbeb8mr2381457e87.9.1777635183776;
        Fri, 01 May 2026 04:33:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:33:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:50 +0000
Subject: [PATCH v2 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-5-a2fcfb2531ac@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

If the driver's stripe information is invalid it can result in an integer
overflow. Add a range check with a WARN_ON to expose this kind of
error.

This patch fixes the following smatch error:
drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'

Cc: stable@vger.kernel.org
Fixes: e11110a5b744 ("media: staging/intel-ipu3: css: Compute and program ccs")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 2c48d57a3180..92cce31e35c5 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -1770,6 +1770,8 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
 		acc->stripe.bds_out_stripes[0].width =
 			ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width, f);
 	} else {
+		u32 offset;
+
 		/* Image processing is divided into two stripes */
 		acc->stripe.bds_out_stripes[0].width =
 			acc->stripe.bds_out_stripes[1].width =
@@ -1788,8 +1790,10 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
 			acc->stripe.bds_out_stripes[1].width += f;
 		}
 		/* Overlap between stripes is IPU3_UAPI_ISP_VEC_ELEMS * 4 */
-		acc->stripe.bds_out_stripes[1].offset =
-			acc->stripe.bds_out_stripes[0].width - 2 * f;
+		offset = acc->stripe.bds_out_stripes[0].width - 2 * f;
+		if (offset > 65535)
+			return -EINVAL;
+		acc->stripe.bds_out_stripes[1].offset = offset;
 	}
 
 	acc->stripe.effective_stripes[0].height =

-- 
2.54.0.545.g6539524ca2-goog

