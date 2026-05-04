Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4313D2F290B
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877660; cv=none; b=TRFIgZUXmGOKIP7IDfGgcL28XdQf+TUIzVwCkzvWzoEHIftU2wPWZN7OdbmOijs24BmQ42Ft8d5Ag2twIwsG97QViP7+B/cBsEMzQ2LVRQ988n7GBfA94P02jq4rWFtQSFh0SX4+J0mo2WxBJE1e4riMKn8eqx7LZALHxVVQiVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877660; c=relaxed/simple;
	bh=1hqe5xk6q8A/JJ7IgDYxkmD8c7CkAOuEyy57fGoNOLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/3hYWrV6mlpOT+areEFxeJMtECOG7uKqm3cSzaDAHz8oim8oz2ZMDB1g7NTio5VEe6obdu0/ANWCTPIcj7BSI8uATSUFVzCZpFHSs0WkA9Cht8TxsxXC9JLGtCK6iuYEMJTKxKHZfcM6sdAZfPxEjdf3WyOD1fofbEHOK3XwjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PSvXo+Xr; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PSvXo+Xr"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e97e73234so36073371fa.1
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877657; x=1778482457; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84cmq9M5CJzu1gj8OcFfHRDpQSy+05+lbM8dfJHx98c=;
        b=PSvXo+XriFcWFIvIZDAtLf6q7pGZo7o1s4EYbcbdS82Q7VT8SpYqlJgu2+TS6eZ8oD
         pf5NVNk0URrXowM68w6ewJXNSJD0Osw0k3Dsn7Z8C9rufeL5wTWuGY3OSYAHFH5AtbHW
         JR/ng1CyI7OyZPTVDpmCFe6LGQpnMvoh1VDEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877657; x=1778482457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=84cmq9M5CJzu1gj8OcFfHRDpQSy+05+lbM8dfJHx98c=;
        b=JkcrGHVDfCGUg4jj6ZVCG3RsCKWN4SpDCBUfl2sL+e0rpvE68n3OZYUKBZyTSfgVeX
         v4S1AWSpmEjrKcgv95B2YhyiyXNi0BFTT14w7WdrZz57Nzmw5j2gbYdCGt/DWhpmO2xs
         urcVy6OIZRO0FmoGSH+Y1v2jHABNdbs50pkFHxPoKyGqnVsiw24MIyxYeSMM/meL0zqd
         aRt+CXXJewey4dXn+L+Cn1FmV8aVE9aTGSlnfoayjvmmaceOJbBn7o1knKBEk8a13eKs
         4/aT+BmTYtmABrJ4hzRMYK5CIZQpslwj8HrReqzeKOz5oJcwaWvQ3RuVMMcC8JScuFT6
         veJQ==
X-Forwarded-Encrypted: i=1; AFNElJ826OCX/miWUk9WX/AZ0zt2p9KqFqa3/RAh/1AvhLoM7qs11k22y2u/drmLDK6wG+OGblqbpoU9QKCH/MtK@lists.linux.dev
X-Gm-Message-State: AOJu0YyTrQOQKAmhFivYBY1hLy6MffcB3Zx+NxByRmes3odqZxMgS4Uc
	KRGzbrse3HyBPC6HY6pSwqgVpeDo8NAR0GTZ7qEMLCAoY91KTaj+9O7CnGU45J758Q==
X-Gm-Gg: AeBDietopsNIZEweVCUa/zNImnW/DdCch3pIk4BiNSCnvt6SB0ItJ1zDabqoZuHu43n
	Ku8sog2jS8tWqEaRxzHjjs1DvnILa3L+qaKj7EsVCWptOz0lpLIamp1WR/61rp9hfbpypDbRk5N
	UK7nktnRXtZ+/U6bhUkPytoezpcyg9IXZsiMwuc7PCrX0d3y1NjC3ndfPHnETNdBrryHn9vOyLr
	bA7KbHGWgtJ11A1Jy8MTZKn6g5obJdrj9dTGmtjM1YlqmguZCR5Bzf8R8Nw7cGmXO+rXKNH1tfO
	lAMwbFEz7z6eC0ga2O192l2HaOg700MxR5Hu1FExlDLZY5xgnNA9zsBqKvW5gU73aZXLLsSbe0S
	ro0hKqaQtvdcf973eSVBo72WLJ6M4NSXReOa4j1wlN2P0wm3CTpuUh1uCr/BFE+tgrV0BFM2Hdf
	VTDogRFWegpVN2rUvqrFWbAIejxpj9hDYKo2bzL0M9VN0a+s7TqC7tExuplTtvlLhSLRiQZWlym
	ilPJvWjxUOAS0jdSw==
X-Received: by 2002:ac2:5599:0:b0:5a8:6b4b:bea0 with SMTP id 2adb3069b0e04-5a86b4bbf45mr1130311e87.41.1777877657467;
        Sun, 03 May 2026 23:54:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:08 +0000
Subject: [PATCH v3 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-5-fda125c30058@chromium.org>
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

