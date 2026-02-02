Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D12387580
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054642; cv=none; b=AvKXTjdCIQeh9UENMunUPflHK/gdPLI6RGA5sW5oMwEpyXjwa8o8nES09vShjYGc3z9dkSVBALDUjJyoIW5AqX6OWGd0T5JQX3LwXOS4TAAuTcfnJh3rbzJu9w0RDD3T78oiZAghKzNXGR/F4FygtfTKidcoqvugUiz1ipMBHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054642; c=relaxed/simple;
	bh=kBE6uNEucl6NId/+/XI8l6n5LWwc1K1YqjtdDJtweRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skuk/MX3PN8R+i6BGPw3ShC4rUcEzFkacs25f4jT918yNQ0SFu8V4jua/OsGOM/l2GBL65vPT0ve7q6xiHsIKuvaZ2bASxkFyhTO7JcvZADbYuah3T/30bg2FEvz5eLRsX2vrGQOqo6XODkWxVpAkqwzUy4aaFhRLPhenlLdKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9vruHfY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9vruHfY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so3900341f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 09:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054640; x=1770659440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5c8Sl+AZyQTjldUH561qMBazYom86+XOMxFsK7gB20=;
        b=B9vruHfYulDN0qacZ+Dbm5sJPCGXTjSGQs4m99/pFBpcut3BJnoxxzaO6pRN0sqioC
         +eHcZBme6Cfcj6Aocv0FDhlh/T9PbZQikIRTCNpciJvrXr4FLxv0Tzhz1fpynqjypjSv
         OLdg5GKE/XLjXu0b0tcq9ZeqzibW1NIC4YDU+105NeXHAyZZV7Bz3CGQkOUtbVsiuO/J
         SeqDNJVzAhCn3cI4RpDRmMrIGy7hWKU+11MWG+yd7FVNMqQ7yreC09mZtnEYkkMCtLQE
         dOAG7maCdeQLdXDSAD8ip4FRDJROJd6oMU+0d6imn75jGXtVns/l/gT0/lvAzUQWrxEj
         w07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054640; x=1770659440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5c8Sl+AZyQTjldUH561qMBazYom86+XOMxFsK7gB20=;
        b=DToDGK8cWDujXyPaXbd9oCJSYSpe7folskOnJFStM1OZo0DnxBEF46n+3+YSxy4dtN
         Hz/aUMnXxUNhWNz56jWJfgsTwlfnLm8HHX8qGuvmrmO2pqM//5qA7477Uf/zXtq89pHI
         LQ/HwpN69zlx4/sGveWZuROvfoKdMKQ32lB0Aoo00bsUfJKDD0qr7i5wpNzCm+478/SC
         4y2gFg1U160lJExRy2C68pVNDylHXA3Q63Yeg+tE5Y6x3CDivK2K5ZLhgmi5TBu525IE
         nd0Rf1xy7Ij70Kn9o/YD+ppXL0FarhesV32VDoJBLRWkifZnjXlnASvqjuYn2WhuJrar
         CeCw==
X-Forwarded-Encrypted: i=1; AJvYcCXpbFfvnNuX6fmW8qIL9wrc1G7/Dnlr8VBr09Ycy21amFfnZGn4bu2doiwm6xJz/WOzR6UQsDJxHmhj/C1g@lists.linux.dev
X-Gm-Message-State: AOJu0YyFMje5HSToKNAa6ID1Dv4jT4tqUndxYI6V6RM9dtcnEEIhHvAq
	1gBO8aZCV8n/n66Da5IYpSC+IyozALE26ZjaaOjNd/cUbbd9Sde+FZU2
X-Gm-Gg: AZuq6aJKqT2vKM2oqBPCx5Vfsc0gjUtpCvChaJFMRdcf5QMoYQXlckYJ30nv2gRbaz2
	8twmvz62RNTPYfmxgcEYhcjwb0N0wbbISlipaqqy84NDe5ZfDQbSrr82tBcRgbUiYQ77rEsX9Yx
	rW2muh0jzl6s+jrVKtcdnrzgNTHgYZ83EMATZRxkEGYcPin6XpzEML4CwdcDRRDFGLaZ+wDRcrG
	x7HqckSr3k+D5kDbQsb/8nPAeMZKpnl9EzxiXDhNt4RLbLcXgzOI50XCSiRhfRbkKnI78p5s9AW
	3+O2gc/wx/+l1VyODHR2sn/SfPIfhZtwfqsZzpuNnNnc07jrwGHF3bcHQ3bOkQDm8wyTMXxrSGS
	wa8lWkgJfpOnvBL/wziBGpETNXSCPMCmbbuA0q9loSm1P2Da/KbfeHWs79amaMQxDyjxIhrOZ1D
	w4cUtNV//OVRk6S6kvjRc3eobKcjB3fMenQfnxw1uJ2sXb2tqO
X-Received: by 2002:a05:6000:144a:b0:432:84ef:7160 with SMTP id ffacd0b85a97d-435f3a6bf2fmr19931292f8f.12.1770054639555;
        Mon, 02 Feb 2026 09:50:39 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:39 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 2/4] media: ipu3: use tabs
Date: Mon,  2 Feb 2026 19:50:31 +0200
Message-ID: <20260202175033.8640-3-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use tabs instead of spaces.

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 145501e90..e990eb5b3 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1034,8 +1034,8 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
 			       3 * cfg_dvs->num_horizontal_blocks / 2 *
 			       cfg_dvs->num_vertical_blocks) ||
 	    imgu_css_pool_init(imgu, &css_pipe->pool.obgrid,
-			       imgu_css_fw_obgrid_size(
-			       &css->fwp->binary_header[css_pipe->bindex])))
+			       imgu_css_fw_obgrid_size
+			       (&css->fwp->binary_header[css_pipe->bindex])))
 		goto out_of_memory;
 
 	for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++)
-- 
2.51.0

