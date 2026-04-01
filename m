Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382082FC00D
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070915; cv=none; b=d5KNmR//lKmQixcWk5J3zydQpI/1Psqcsk1BJwqjThwlAmHoCTrsYZK5aRAx7vm+81Ib9Yo7blETMYO7oxfSbXqbZ+jJRzaPVR9qPjA8XEgFs//SdQ6WnTAkW0R3paeP0gKH2Z/9ZUfbE5OLIlbIIif3vjkIZWWYthmrrOiUO90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070915; c=relaxed/simple;
	bh=OJ8d86r1cv2Dz9K0VOKzDX9IeSSniN4yMPUR9rzI5RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9wI7DTmSd9J5Hlfn21AzwQEl4ESp/6oqK4OZ7e4p83wBHdJSPxcAh0sq2gLz1Do7zHiAz61EsgYdy/aMXPtC1+J87Q5IetdBMfV4FbQ0fdGKUC1SFuh1oaP4jJYloaPvS9WpNURM0e/YdRnjlfKG1xCR+u1+hvJxZ6qqfv5UoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFadfKeM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFadfKeM"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so183507e87.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070912; x=1775675712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=;
        b=lFadfKeM8LfUepjK8L+7IPkc8R9HMlRmB6zTa9NSMS0cwYl9EXZZKVC5KJRhnkcNg+
         RejIqVj3NpLyFmVysdVz9/Y1WJ5YMtSkc/4z7iJgZADziyEZBJL+B7JUUqZnZYRW/B/p
         0OYWjBIy5vg14N31i1nuhS7+FSxvQEqpXZf9HHSeSKzQOfdmozvA+qVlYW4gB5KIeQHn
         /P3cxPntC7sTKQnjVddz3Qw8+RqIeQ4/HivgByfVsuv36RfFi5HiS0FHXgyNHEvvK8Q9
         rpscdMpbpq/1kdlQSqDJJDW1G/Wnzuvl70NX4wo/KkAhs/ED2tR3LLPbuGiSRlpKbIaC
         tx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070912; x=1775675712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8KcYzflmFoH6kQuwH+mgkFuRmADtPPTvOe6lcVTKSM=;
        b=BfM1k6AoB/cXJHNt9Hdmphy4l9lq9buDwcaZJsZf1PKS8MJY9Z61Dgn8e5EGhyOjaW
         JS8pBUrtHozd2DvNZiJs8EESnqlZB51kzVwwrK3YHhXvc19u5Y4CAMJGDmD+I+e5B4+I
         mCeSvIBu/EWaR0oS22Vq1lubcjLi9raCxhD5gj9La3fzoYhQe7GxRwzMJ/dbUVhLgN+l
         mCryxq2o2JMKRFwhPuQ6iBYi7/0Y03Cg4cUczk8EpBC3DrPLlSiZ+fH5LELDHv7nlx8l
         xlQvTHwN6Mt4YFwUzfMMKalshESEiXmixCNBud6f+Sflaf3DwUlLFQoxWkja+5TReDel
         OZ8w==
X-Forwarded-Encrypted: i=1; AJvYcCXPPi8lookxH/8x+wYscjpIO2mJ3wwQxy3ZUY//A4oLNSyWxlRJaHzd29nbcZKK1JuLftrTM7X4/SetQDFT@lists.linux.dev
X-Gm-Message-State: AOJu0YyJoX7BL0e386skgPs9ReW2jwc0kaaclZ7uLfozLzJrz8KgXGJ9
	y1MkmdABqfM//u9bV1vsr/k04/TdW0dgewAwSz7ZtRZVGQpO3PRREfbW
X-Gm-Gg: ATEYQzzqs+gH3YKVuzkkbU5nBNHwkuPTNcF7ssz4OKQWeDttQe3crGfi4WQ4eaMwsAF
	QSSyLGwdNGjizywYr/3yXqUv1XjUYEe9P78zckuObX2PP4rCs36IfiGfT8eLZhJeaEEi+ThPo+1
	EDrh0gKqn43qbq2ZfYiaG7VWtiVPzxJZqP3G+Flqi31udwSdlZQIzBLTXwbARTM8MCBcVhWXIya
	nBJUfGbx7eNpBP6Dp9/BykdgDqQ1Janw76+FxwFYUEM7WFKDXJBedV7cPhvGJIqYpaO7lrQjTTI
	B7JMPTkjzPHeTg0nAqGKwd8faPWHqCtAwm+s3Twv49bsMpJRhp/O/dmeCbXTbsQYyXQ+3sDI/7y
	OOjqxYlwsBX9JypVYaDUsdpv5vtXBoTICXeuF1ICXfTyx5YbRstwKj1N7ExABZ13HpAjWkH4dKv
	vVI+kFP/cBI8QNX6y2zSQ1b+c0vjD+6HWesPMI
X-Received: by 2002:a05:6512:318e:b0:5a2:961a:f7c7 with SMTP id 2adb3069b0e04-5a2c7676402mr92043e87.21.1775070912245;
        Wed, 01 Apr 2026 12:15:12 -0700 (PDT)
Received: from new-nest ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccca2dsm141855e87.60.2026.04.01.12.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:15:11 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on probe failure
Date: Wed,  1 Apr 2026 22:14:41 +0300
Message-ID: <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

From: Samuel Holland <samuel@sholland.org>

cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
like disabling runtime power management, releasing claimed sram.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 1d2130f35fffc..ee0e286add67d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -477,7 +477,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
-		return ret;
+		goto err_hw;
 	}
 
 	vfd = &dev->vfd;
@@ -538,6 +538,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
+err_hw:
+	cedrus_hw_remove(dev);
 
 	return ret;
 }
-- 
2.51.0

