Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9442FFDD6
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775381477; cv=none; b=PkR2VmxU7bKNl7JZOuKJZmld/LHyt3ReJcoHYdxCsfD6lIDFsVqEvb/Cm6fggrLz/d9aN1usvT7zESgEvvU1rJFGvBnFpyApa0xYMsQhddvjE5BnaHCkJelf6NBjBXap4sX8OnMDUaF1+VeoMQk+VAr9Bh0/3Rn0ekBmPf4m8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775381477; c=relaxed/simple;
	bh=ErK4cyjYPm91+zNjvpGOJAvbVwIvmcEeItVbsI1yMSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUGOllP6KoOY7maPV2vmwxk9fl1Tuk5Wz1jH1T5ISstUJiOJAlD7X+k4tJ2LPAxbHXqX1F18q1PzNX3X5PHLrLftycBALjfwrxzSyOTuINKk8lQ06s+72IioNiKAtQOZbaSUP7UboeiKgyW/YNUsSc5dVvAgstikMeLfLrzVfBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV1yYGca; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV1yYGca"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b9144790dso1712356f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 02:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775381474; x=1775986274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXMWNVHfumBchZlq3WtoZ97ns5eMXe5atHuWyp6eKiE=;
        b=XV1yYGcamTfQTvkkn/cOqqxOiYcmV6i7HFkkPwZugvDmXM//NK58g9yPqKmYIk/bK+
         kIn1gcn5WhW6y1Ewv+bHQnaRkpNsD4Ecjd8PTA6539sK0FuyBWF8wJ053H/s+IGFMy/L
         eJWxlCWH6nmRXJRUsTctgj9Jxug5wh/CCasMOfPgONt2maQMa7CyFTGeS/lH6IiTwwXL
         iWbKdQ9f1SoZOPsdmSrh0ih7zagnYKdNLJmlCcRoS45Wp0waTVRv4x6gWAvkdei1Br8+
         Q2o0H+OxqBrr2M3E/dNj+3l+JvCIsBp1BbI6wgzT8Ui7OnNU1/yp/5qpgr3WIpYnEVeO
         4Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775381474; x=1775986274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXMWNVHfumBchZlq3WtoZ97ns5eMXe5atHuWyp6eKiE=;
        b=ZlhQdyHi7Ig0t+cw36c7GUJMEj/a8mRaIOIcpkyE8127lEzhwcftkObqq+9nq8lq4+
         +H1xT6D0g3bvy/XpVZkW8+kolzpneXbCo/TJwzErqUMcz9ONDawKWqXrC3/7r7Ee45z5
         FxiqzAbYXEGJH15tgHA4OHI12JJaPtbWpyJxQ2LWBuzgtKQbJLC958fKDUgda6yLc9gp
         ThkvV7p3P/aBuXs7nVm5p3jP2Mahx/N/eIxyvpk1MTSYhFFuMmYDH3qTx7snaEfjad3f
         XRounZGCyAvd+lCztxtnNILsfqGrZfW66Yp7iZRIRLTR8HiIW3goC+WtfirXY+CUsY3L
         /XZA==
X-Gm-Message-State: AOJu0YzjLVmen3swVRv8ZRuMrk0tQeck/wo1J5d90UEycG+Qb/HHZQVf
	kX9ViWwwZ1lLvvzStfo3lp/5pFgnF9eSflwHqrtXjlv7HhFH/qoc/vsLUxYXKA==
X-Gm-Gg: AeBDieuw7wcBYWyHknpO3g5nOZCBB7NMgBXylng5vdqaw2o1GCCM+nqm1HMgBLiNY4H
	ZGCG2ewtBUTyPrnv0Ma6gCsUYhRFTDJM1tmf+TQoOT3YbU9Y0UENDRGWn86hImUTuXYD6KYKfLp
	5zk4h+rkQ4Kj3ACl3AX46SDweBijgqrJs06UM9OgHySe+JbQwkmFW/M1Pfx9qzaVxPfxpTnjtbs
	V63ol5DXJjUwGChYAnuTofyNp22KcERL+5/fushECa7wR4pi/FBwPTpJ21ULdxL+Z/AHz/mkf3H
	76Q3JolYtmvOEFHPqU42YnwDxplg4+iIAx4oh3n55A2RBO/1LYtbOPOuXiLV+5TEPLrrtIaqQ3k
	pS5YqVoLHZ8jQTTU37Aw1TEueQekzvckWOJv6nJIx/f1r1Bs/XnEl5KE9Xa2ew6v1gmr8Uu4mnj
	V/CoS0K2fzyvbyG5C0s2RMQ8SrSrLjx/Vt7dr2hFjgOdyw0g==
X-Received: by 2002:a05:6000:40dd:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-43d292e7fd9mr14331002f8f.41.1775381473697;
        Sun, 05 Apr 2026 02:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c83:b0bd:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm29156707f8f.29.2026.04.05.02.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:31:13 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
Date: Sun,  5 Apr 2026 11:30:44 +0200
Message-ID: <20260405093051.515222-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405093051.515222-1-azpijr@gmail.com>
References: <20260405093051.515222-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function configure_isp_from_args() contained a duplicate call to
ia_css_output0_configure() using the same output frame index. Remove the
redundant call to simplify the configuration path.

The ia_css_output0_configure() function acts as a configuration setter.
It populates a struct ia_css_output0_configuration from the frame info
and caches it in the binary parameters. Calling it twice with the same
out_frame[0] pointer merely overwrites the exact same state with
identical values. It has no cumulative state, neither does its order
matter relative to ia_css_copy_output_configure().

ia_css_configure_output0() writes into binary->mem_params.params[], a
software-side DMEM parameter buffer in kernel memory. The ISP firmware
receives these parameters later as a batch, not at the time of the call.
Calling a pure memory write twice with the same pointer and same value
simply overwrites the same location with identical data, there is no
hardware interaction that could require repetition.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index abdffff41ae2..2beb7168517f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -792,9 +792,6 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;
 	ret = ia_css_copy_output_configure(binary, args->copy_output);
-	if (ret)
-		return ret;
-	ret = ia_css_output0_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
 	ret = ia_css_iterator_configure(binary, ia_css_frame_get_info(args->in_frame));
--
2.53.0

