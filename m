Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDB20B814;
	Sun, 20 Apr 2025 17:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171666; cv=none; b=bebL4ykeF91X0Kt7r7g+v3FojC7/Z+8smGeGCDKzihnbooqg/N0kGkf2ZjsU+ZeQyA9nUj8Yuj9EsMH8KpGeCNoSe9toBp9izjTVleXn8oihmKYV8pE1TEcsfGaoLkxMAVdig0vfD9IBlLDCaXpgF6TaDb8f1djQA6FABBEvEgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171666; c=relaxed/simple;
	bh=Yjwh6DrsjcKU5bFRc6zRRnv4rV0fIl8jZH8L4C5u09I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJIhEuJSxMnWshcGufGXhFztAuZy30TOQqspgXKy6Cv/BW2MQhc4bTfGfRcWqjbYRU+dMBVpOB74huiT+o3MDd6WOLBP+TIcWnCcC0FwGUiBM+t1G+2JI2RZbTenJs1xrkjzFVoYKoS3JJ6RRnf3MkgpcmIyyDVoo023i+DW44s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwJmsrmi; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwJmsrmi"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so38401956d6.1;
        Sun, 20 Apr 2025 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745171664; x=1745776464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzOgfJm3r4ap/eGSZdUiYEYs4uCCNfYQBrjOjwlLAKQ=;
        b=kwJmsrmipqGK/yXXQpoh14uBHtb8gUSzFTbd3w7cDdZIngYuQwhiqG2fp61GIPtlKC
         ceyy3yXhSg2pNuO+cvVDICeWhCM33EzgehM3wmwolEl0ICQJRW7AWL/5OrFKfdyUiIiy
         81Z8Lk9+ApQJ94BCSL39u7BNl1OCfLs3Roa5C3s4GIhxz4KFOH72/PuI+QdbXIWvb5FZ
         rq2WRUhUSACHHg29yqjFrD/kPlN3CGiLWNGrSy2MDx3LBw6uDuUqhjOqb1WjHLdApFX0
         FLY4GMYFIlzI2ODhMw6H5FtV6WRno7N/ljTU1p8jlUcTb4QYWejaHZVRzQJPLhJ4VomK
         gJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745171664; x=1745776464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzOgfJm3r4ap/eGSZdUiYEYs4uCCNfYQBrjOjwlLAKQ=;
        b=qed/pTuh++l+0uMFW/u5waX/z1hNCHonVvIQpQmUR79p07tH/FA8wKcMiA0gqEBmbO
         jaHLwl5x+mrZIpbh9W/Ew7Ejr7s8mf3HjNUR+DPfR6pr/TRmm6ZunrmgJAgI06r9W2Ks
         GM74sMabBYOwDBHi1OQybLxAq2NzcJ6zZWkHGymUix1I/0xU/MSF0JtMYRGFhxgQaPWu
         UzOSN9A4VkEK74fAF8fTh5Xh4yc4z71E7psftACXPBXfm/AgcoFmFmUXU7rq5RYJEhwr
         bnqxG00XKubkWahz4niilqAZ6/aBn+hs/5F2RDlFtkRz+ww+lPDlKm45E2wwAR2NY5pZ
         y4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUKlZdTLyiswLaJLgd+tMLu5TjJyXhgNv3O167WNrocZJ8hOxaI4dddnKkRwF6/geK77rFS5PPLBxmlXbIQJzFz6N1gTA==@lists.linux.dev, AJvYcCUk6qSJjo0psk1ozueeNUeaUMgESQekKOlP59gSEF3kTNWoqgly1n1RpWGngSe2t6qpLFWIChCwlP93YmiFtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxlPvrsPQNZxH7mp9Asf/aVj4iIkReWpzOa0zbXkImgi+XNk2I
	kUogrDiyZSc1G4jvytg1VRq1mi0xbadPL+0TCsRy0uwAntPpnQh/wawslY4KuLU=
X-Gm-Gg: ASbGncs1k/SXlsJe2z5lv6FVq4JJxxeVhUO2Ak5KX10rAo97moUe4DpknPjlEe5Awe3
	o+jUz63nbGE9jp3ua199OuUYB4a8NTMkCs2aKMBsVsE2aqz9T+PMTJvpcyvbjSkaj1oyG3GWfOH
	RY9ubk8tZCc+crYouNRoVLm3Bp6an9Vs4KOLTbrOsTFS/NapEp2VhWctDUSc5HJtWUJw4hFi8+Z
	EKr/URtciHEuxgXlOQCmtOsfICNxX9WYUyMZOquIGBOfvtygJ+GG5It+EocE3+ifKCKMDJsl6kq
	CWnhIKxWQS7/eR6DsLWw+oWg8vg4cW9uUEnQyACT35ift5z5OynHh/0hN0s57+6ZMA==
X-Google-Smtp-Source: AGHT+IHTykkMY2VPub0zs/b0tL0+U9e4zfzJQjPRSmVQA++TxLoy1VpNTKXhr0XTBBaywyQwZ0gxig==
X-Received: by 2002:a05:6214:4004:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f2c4578776mr128057446d6.22.1745171664054;
        Sun, 20 Apr 2025 10:54:24 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0c1bcsm34801286d6.26.2025.04.20.10.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:54:23 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 3/3] staging: iio: ad9832: Add minor improvements to ad9832_write_powerdown
Date: Sun, 20 Apr 2025 13:54:19 -0400
Message-ID: <20250420175419.889544-4-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420175419.889544-1-gshahrouzi@gmail.com>
References: <20250420175419.889544-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimize size of type that needs to be used by replacing unsigned long
with bool. Avoid redundancy by checking if cached power state is the
same as the one requested.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index a8fc20379efed..2ab6026d56b5c 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -173,13 +173,19 @@ static ssize_t ad9832_write_powerdown(struct device *dev, struct device_attribut
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct ad9832_state *st = iio_priv(indio_dev);
 	int ret;
-	unsigned long val;
+	bool val;
+	bool cur;
 
-	ret = kstrtoul(buf, 10, &val);
+	ret = kstrtobool(buf, &val);
 	if (ret)
-		goto error_ret;
+		return ret;
 
 	mutex_lock(&st->lock);
+
+	cur = !!(st->ctrl_src & AD9832_SLEEP);
+	if (val == cur)
+		goto unlock;
+
 	if (val)
 		st->ctrl_src |= AD9832_SLEEP;
 	else
@@ -189,10 +195,10 @@ static ssize_t ad9832_write_powerdown(struct device *dev, struct device_attribut
 	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
 				st->ctrl_src);
 	ret = spi_sync(st->spi, &st->msg);
-	mutex_unlock(&st->lock);
 
-error_ret:
-	return ret ? ret : len;
+unlock:
+	mutex_unlock(&st->lock);
+	return len;
 }
 
 static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
-- 
2.43.0

