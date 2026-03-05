Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36602244667
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 01:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772675829; cv=none; b=m+NuaHfCRsDd93PP2YMDBk7Cozwn6RQCszWXxqKea7QgTLXwDPgKHy+HnkySwzjiXQCtJI2Yfju0CZBFtrIdo2ceZJfgXikF1lRwfEHiODhI5yMRinnv4+KCjjK5JlyYuaZlyxC/kYFebSl8SnJqiUgWM3kWm5KewzBsxzpjHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772675829; c=relaxed/simple;
	bh=m3rreqZq6vLT3EhYaY86P9t15/dsh1CgCsl/SObRA/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZW1inpG/FLj+hIKeNMuqbS3iTXnu7G5BQ3JJ8n7033AakI2dSvwzPeJ0D1SXdXtzDH4aE2pwSOji0RFPCFSzXY04B0h5jJ8oR7LAJHtcR89I6C6UsPJJEYm1AVcol9jQ5fLa/TeOYmSBAxofS9ZQNivRz3dhSQeeaReqv76iSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oikh0Tdy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oikh0Tdy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9358bc9c50so815469466b.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 17:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772675826; x=1773280626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kK5AArLisBowhIk8Yemj1T34WbKtX8pFHOmbdJsZGWg=;
        b=Oikh0TdyaiRI9M/IK7mCXuPh7po9KbcpHk1+q6xJW+t8DMumCOELWwrEP2051fhIfX
         ne4G5OjIhe0b3ozcMZQS0jeLi1ydgHX8z8BHbUk+iCk6TtsPoQNBu+y4hRrvukLJ+6da
         XeZpoN/uq8lHLnVnHiQmYZZwMpytlAKMSnYCn+kiQiJQlMCpJSTUV+0efhGCRNmZBtOq
         jnyujhlkaGU9dTgnYCyjw3pSrFtlWIbwtprI6B4eBPpPapxUfFH0igyQWm/QvicsA2jl
         Gebo0vBKcFjJbT4p5lhS18QPKjEgohS0GPQqI6TTJPDwJw7ZUxp0rbR550CN6ORJ3ihL
         vt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772675826; x=1773280626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kK5AArLisBowhIk8Yemj1T34WbKtX8pFHOmbdJsZGWg=;
        b=oXdPLiqHTQ78sbeI2+c8nWYEkvW4VkvOfSZrW3piWxKKHkUqlQH6oV8Enb5dt6ZO4C
         h0mOn787a2saWZE4Q8DDtscMH6XYBlLOCaZY2+wlmUey9qhsVtfk/3+EZNtqnbPO4u6y
         oltu1MmNLx9/oHL+6Ee1ue/hF2gDDY6lApcv0YIwJmB816d1JiATwHQWzCedOCiqtFFO
         ui7srQZcPpT+H9KaZaMu82KucBdvhyHIkmJyiBOtMjTAqdwzak8QsPnK8Yvoq+bk9JuF
         +8IydRQQS3PpmZRmyG8hIvXKDZzT/hyz0OYpvo/eipboODxKqw79b4n1gO3oNDtvNnin
         c1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEVSGmmVkP8RihH3aPu7E23MQocQnYQuSzWQfCX1fkjVMvvX20aI9p/CaDr3gHfYXT1jn+cPzxWOwe/+zz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0k77kCDhscm1Osyk/tA6w6Yu6PjwRx5dwdXBGTPG+oM9Iur1b
	BR70DsU2KErNsY7svQmyzScw0/KZ//FZ/stdSXCiS+UmWv9GqTlpje/D
X-Gm-Gg: ATEYQzzlUeLq69GrEMtsPDhOehsrabYAQTjglLZRXyZ6x7twG5Gl2Gh6579op1udOXi
	RJaiXGUTvz0ljOjq6r4SLoxxHsqgANM+TaGXtugCvF+LoU292EdhrMduH4+0SqPH32KJjb/avZz
	SJdmm3ATrrUvAs3jxkCR6fwVCx/m/Bitvy7/PPSKto8a7jT+uR4OQ4nr2xsCEAmd5D7rNK/Ex6u
	1mcxMoyqtF5p7YRPO66pdBA3yzHcdNqrDSvWLc7wSfJuD72lf5j+aktcN5MHlHNvO3yZ8WQjAU3
	umY1axLHY1gYUQJ0RADzGD2KM5LbTEzA8ImXG9Hg8i/XVUZxcty6vwZAkCDVAEPLcntzHVaGC36
	JQWEkVan5A9ToTeIYc1dat2ZCm6j6E8wP+X5tYguba2lggIfNMeBgL2GE6f9Z5NSiDaDI9u3YNO
	lCfZG2UhTMhGAloeK0cmfmIlwFdsMlsa3ch1n7CDKCfTkrYZiGd7ogRnkRc2lAkvbcdNZjybIcD
	uLpcHsyzQAfcHhnnv8vvxq2srazLaQXP99myAlwvUdPkONgUEzhP1OmLdWsf7iejstas8EI3jot
	H5L6GjW/QQXRVA/R+im1N2IXszY=
X-Received: by 2002:a17:907:3f8e:b0:b93:8e7f:3d3f with SMTP id a640c23a62f3a-b93f1434126mr261836966b.32.1772675826290;
        Wed, 04 Mar 2026 17:57:06 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93eea5869bsm174820966b.13.2026.03.04.17.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:57:05 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: parthiban.veerasooran@microchip.com
Cc: christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: most: video: fix read() length underflow
Date: Thu,  5 Mar 2026 02:57:03 +0100
Message-ID: <20260305015703.41762-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid unsigned underflow when fh->offs exceeds mbo->processed_length.
Use size_t for length calculations and clamp invalid offsets.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/most/video/video.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..8c4800be875e 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -158,7 +158,7 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 {
 	struct comp_fh *fh = to_comp_fh(filp);
 	struct most_video_dev *mdev = fh->mdev;
-	int ret = 0;
+	ssize_t ret = 0;
 
 	if (*pos)
 		return -ESPIPE;
@@ -177,8 +177,19 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 
 	while (count > 0 && data_ready(mdev)) {
 		struct mbo *const mbo = get_top_mbo(mdev);
-		int const rem = mbo->processed_length - fh->offs;
-		int const cnt = rem < count ? rem : count;
+		size_t rem, cnt;
+
+		if (fh->offs >= mbo->processed_length) {
+			fh->offs = 0;
+			spin_lock_irq(&mdev->list_lock);
+			list_del(&mbo->list);
+			spin_unlock_irq(&mdev->list_lock);
+			most_put_mbo(mbo);
+			continue;
+		}
+
+		rem = mbo->processed_length - fh->offs;
+		cnt = min_t(size_t, rem, count);
 
 		if (copy_to_user(buf, mbo->virt_address + fh->offs, cnt)) {
 			v4l2_err(&mdev->v4l2_dev, "read: copy_to_user failed\n");
-- 
2.43.0

