Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F2E343D7B
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187502; cv=none; b=RB6lrCs5UJ9DE3TtGWsISWqsA98onzlzOGrDbW9PVICbhwTEquRk5KgDEGSRNH++DAu2lJKrnQE2Zu/GvL79DBZ3LBVjBgUUHm0upJ0uv/JmYBE4Lr0Swt17Jv/2N82EbLEi1VJBUsT3tekZzbe2idx8/yzS61VINpEfRcuMSWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187502; c=relaxed/simple;
	bh=Kj70iDTzSgfkdpFGrFm7jqyxrLXQ8vQDqKV0w2y4QJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIl+PckbLXEqKlihtrDD2t8vAAEqUm3ldy0mOTDONycGBkWk47kpLqJwnQcZJeHn37H1IxCH8yvOidcyg4ewDhxidJZZbrIYsde9UBPz+52XUEiVVXRjDSlc5BM2sgc8gIinzoKwnvY01+ZRPsnuQXQSHoORF5ShaaN60+/sVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jU20btxz; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jU20btxz"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso10805271fa.3
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187499; x=1778792299; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEKESsFN6b/rn96AIqBdX/QKktD4/S30+ixOsI61EpA=;
        b=jU20btxzx0GmxIx27bebqODYbUPF3LwIFGaES9YQEx6LqzWDW4/IT4yGUqLBGROCaD
         MkVsXvRbgKjua0e3NQcxeK9m+rzc4rGkojsyVkNaYqmROGe7Y/UFxVbrnorkx12V8PfI
         Qft/5wyaB8A4ajP00hzp6h/MnuYXKHvRf74Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187499; x=1778792299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BEKESsFN6b/rn96AIqBdX/QKktD4/S30+ixOsI61EpA=;
        b=cvYlyhXIQKoLtdnWBjLaVmHBKalLkbqrKSp2HL94Q1K4AB+cXyjtJTB4l50rBCxg89
         SJ7Iy7T4P58AesjbrvqQTtifTxxMLvf5HroVuVGh40MhsRNowr1aEA73ogI5jqtxBbcf
         atNYW+SUhyCVlZxYl3ObuUqrSIsxTc4tY8O3GF7ZvRNxF5Ywp3r00XukGLyqiDTsU+eO
         2W2wgGFq3OIDX9Ur5unF/iupcbroxTMTzvVPm/bCZ0jLyNFe2LJvtXwQMwRNNgfhFWYt
         Bnm5eavNgsPC44e6T9WqvUyD33k8mieLuVOrCGSQ30xQjzocm/NaJua6P2hMEGZCBPks
         lMsg==
X-Forwarded-Encrypted: i=1; AFNElJ+1ZksOHD5L36UX0JOezuSNsk+RgAG2e41lutyTUlFlW6MhPkfG+DYgdVQm6JZE4b4GZDGI7x85Rk+9n1eC@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/fx78T/CcDIK3ROT1Dq86AyC+/S0pgWmeZp6aMx8eD+9y8qGY
	hDu3D1P/lINuz+8JRsXho8YE5uIZEzlbZqUsYoxAWUaM8CLvsW0odxYuLW035+TytA==
X-Gm-Gg: AeBDiesJltWG+R5ixXhWTdqmFxW61nC5qEoq5ouoGJBBoplY/Mhm2dKI28gMaC118Qb
	2S7HluIQjoPFFRLiJYonkG5ea2MA5XTiIWdGPQxASPPk20iZ8MbVNUOKzwhCW6+1AXMZinD0Rus
	k7wZOU0ScULFV4I+B0o8T5mIs4ZO/7B3gfjrrfBejLwm+wLMSZsOTu/EWTolRBp5XgxhbiPwMgS
	0GrEMIxdTJRPn56jTEj+P/zsmw2F9uUA4YZF94G702XieixIE0Gz2aytPPXzd3tZUgrpyNWGR94
	AkTqSV+3yDBVGribH8q+O54B5VAWqSWSxmmfMSKbiq652TBElatoIcMR7/MC+4KpR8VAhwQOPOg
	2/hHdhPhgl/kaGqJ0+Dw4rVP6RXsFzxntVp49hcZ42FXe0JGLHG7xF+WrcYDcnRgLFpG6A6183b
	H1rGvK424bp8Wp1VmMZ7HuBrDG6XTUKHQ8h9GKssHPBWM/FBPWlLSh4kl5TZaEH91tTz6twYS4x
	xj7lJE=
X-Received: by 2002:a2e:b8cd:0:b0:393:b365:6e28 with SMTP id 38308e7fff4ca-393f4fc95e1mr148531fa.31.1778187499396;
        Thu, 07 May 2026 13:58:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:10 +0000
Subject: [PATCH v4 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-5-cc195f142167@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

If the driver's stripe information is invalid it can result in an integer
underflow. Add a range check to avoid this kind of error.

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
2.54.0.563.g4f69b47b94-goog

