Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8CC37D128
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912043; cv=none; b=mDcS74J1mcEOQaDPiR9fmgeSrF3vMWEIhsb5e6XVgusunIOp4IcF274JIhYYN37psa9ttf7V/BIMECeaq/RVaK3eS+ZPVflUzIYp79MyhVgdi2Gfdi/bEfxpWGpMMHfGUkVOO1jn6qKNjc6wCMkjileGKRgK0WsFDa7ovitEY+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912043; c=relaxed/simple;
	bh=zRbM4kScZzFGitxetDkCfCDqFc1QUvpNR2RLUDkkUdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uoCwOuWLdUqdQEghQ3/1UNmZQDw+yULeaCBR42Ae3mHodCBFeL9rQH7yLCix3XPU8UC4if/ZqSrEmldRCkLBFESbx4W7V/5XN5w8n+JeSV6ZzGM2HqbmINEpzndB/8uQJYqKjEiRRBsugr0WGZqpMn278k8FEPkfUo5rY8dvhGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQWC4I3O; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQWC4I3O"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e5624c053so7228156f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912040; x=1780516840; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsNNi7W/XehxuHgiJOuHnzTmrsKpJ6Ytb+GbYXKH8UA=;
        b=HQWC4I3Oikx4V82Q2OSOwmSa0G2Mrd0tw22CK3O6x//OFc2ynrFoy80Nyw0ra4OQzv
         6E3+WlsmOb7d4IxM8LbbERvEYRUzdNfQmUw8R47QCvZzYKsHB769ZpvVd4qZCu2Dk7pr
         pp5YRLHf3zDmhYi4dEPQSbNGETxl86AopIB5uAJox+C0uqB4HF8jnP3bI8VL7mdU3rns
         9+dxghHvkrDt7gng0xffHzDLLla90uYc75zPFBbQm7/TxsaR5d/qomwZvsou1pyShw5i
         CHe8FaaxfWN/khDOGzGvLfWtrE3Btou7ns0WsFKlte3tTtI4hu69pV5v7jwgo4kPHLwc
         5ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912040; x=1780516840;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsNNi7W/XehxuHgiJOuHnzTmrsKpJ6Ytb+GbYXKH8UA=;
        b=JA381lZVRqrTatgOKa9KG6EjI40rWLAmtq4CJRMxKJr0PeznFbILeGCweQY4JHffAZ
         8ZOTUtvTaWPdY9HnSBpQVD5VF0CngarRa99bpO9MYEk/+asbWCWvE8+nFqdqTBSw+gXp
         JrRDGEBM4oMNWifCCffM58TqSegkMwM0DJR3p3srPq0dF6I5CARlJBrVgNlGOeMWAbih
         kd8tvqdPG4+uw7ivYmMnQl6peLz43hEFCQKYtopYUorI8bwbhDO+M9KyPnGErzCzQwGD
         6Ug7ggSuEWrK1Vv2z/xnBcTL0Htq2c7u4OtEKy90NXuqe1NYKJVeETevosRCQU6wJsAp
         gTfA==
X-Forwarded-Encrypted: i=1; AFNElJ96pg76RONCSjngMh/f7XLBLdZxOFeFmcUkgp9PlfTfDtq/Dnig5p6tWkoJ9+/hrg7TdxH1knawjDVJ0cK3@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc7WGwESJ9GwXuaayP0kUYfpX7KfYM4Hdr5yTGVJS4GqLYihNZ
	yshBbbMqlAfGlwb3L3tJRelJQZiChqaj1KPyr3iFvHw8ySd/m2ZW5Gat
X-Gm-Gg: Acq92OGdzXa5Lgc1bwL1+UgA70y7NEt+iOrLRTvuUPIr24ilsIlygpG4Ii1bbiFFsgc
	Y3wkEKMvuimOzPOITGiVtuYijz76+iW9yyfEec24eTb+8n78jdBl9cE8dwx/3Dr1ckWy2Sw+oqU
	vlhbvIRBuXFqByNLr/TVsYEn3QOswFeAaamFUdd8HNsGZ52YntcCg+/E3cn1UuEWgpHr7HNI7de
	4Gs4pb+XS2F2nVEPDOp7W0Yb1W+FkcGwvp3JwEAzuzqXYrJrOYmlEj09A5m7tSksRr90fwxDwv/
	Je3lJ/Q2j4JcVRlWf8kwmIC3s3CULEMHPYKtbYnAKq/aCSNuOBMKHdJMPDwhQk2CgvKLtOzuCHG
	s7aFUZ8SLFQYeoe8lHdT4EouJoqvvBCGzOPHNALR8JCOYq/oJ4EUHRel1W8pLrwFAtOr1hzwFbH
	FC7yUqh09nDQtoVQ9APVcqs77+pNSraU8xTw2E3s2RDWrHGxwlb0niBUOOyuuEdtPQG4ttAQ==
X-Received: by 2002:a5d:64c8:0:b0:452:8286:86bf with SMTP id ffacd0b85a97d-45eb3673381mr42987148f8f.1.1779912040037;
        Wed, 27 May 2026 13:00:40 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54a432sm11636386f8f.3.2026.05.27.13.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:00:39 -0700 (PDT)
Date: Wed, 27 May 2026 23:00:38 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Remove unused macro
Message-ID: <ahdNZlYqnTO22tQq@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused macro as indicated by the compiler
when building with make W=2

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/staging/greybus/loopback.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 4d085d3cd471..7442b1c4e86c 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -167,32 +167,6 @@ static DEVICE_ATTR_RO(name##_avg)
 	gb_loopback_ro_stats_attr(field, max, u);		\
 	gb_loopback_ro_avg_attr(field)
 
-#define gb_loopback_attr(field, type)					\
-static ssize_t field##_show(struct device *dev,				\
-			    struct device_attribute *attr,		\
-			    char *buf)					\
-{									\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
-}									\
-static ssize_t field##_store(struct device *dev,			\
-			    struct device_attribute *attr,		\
-			    const char *buf,				\
-			    size_t len)					\
-{									\
-	int ret;							\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	mutex_lock(&gb->mutex);						\
-	ret = sscanf(buf, "%"#type, &gb->field);			\
-	if (ret != 1)							\
-		len = -EINVAL;						\
-	else								\
-		gb_loopback_check_attr(gb, bundle);			\
-	mutex_unlock(&gb->mutex);					\
-	return len;							\
-}									\
-static DEVICE_ATTR_RW(field)
-
 #define gb_dev_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
-- 
2.43.0

