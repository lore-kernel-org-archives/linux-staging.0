Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BF20C49C;
	Sun, 20 Apr 2025 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171252; cv=none; b=rDTLGsbF1YWv26eSC1cwE1SqqQXCTI2VlOY9Nbr1XH8Df7gssGVceFDUQb1/D5KeYtW/4GgWf/mHtugc8T/FK9IZESMjryHcjimT+gNQXpb1GRbvx2kY50cI7kbeW2vO2U6h3xNzScFbXtxnLuL7TcxHyIhE+8iyAyXIgXUxF1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171252; c=relaxed/simple;
	bh=Yjwh6DrsjcKU5bFRc6zRRnv4rV0fIl8jZH8L4C5u09I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZlWHlDjOC4Ww+jBcriia8qkRJMnD0l1q9SV7omVqOt9ZA4MLXlzVRC20L10De9IoDgkuLwCYY39c4LWstKd7OqsTPw6VmZLekhtH2hRgBYt7iXXtqybi8o0gV8fRdvFbipyqUFf+cucyIHLorXF3coByl53o3WJ9TyZ3NBbdBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNerZJXE; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNerZJXE"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8ec399427so28798156d6.2;
        Sun, 20 Apr 2025 10:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745171250; x=1745776050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzOgfJm3r4ap/eGSZdUiYEYs4uCCNfYQBrjOjwlLAKQ=;
        b=nNerZJXEsGRIsDYcVbzQyamM3SlPTqiEZYihAaOldj7+t31Ojgf4IOXW7k83wCKVz2
         Q1+MVMaVdGpmOmyuvZGz0OIbXmLqqRNTJQIRB8MKaGgzLy2fCk21nchp3JCLl/Jfexuf
         QrYOlhLHLr5I8TIjiSDECJyrtD90z6y4scQoyjRXNfAtDgPUloyK96YFPgzzBpSu2l0J
         tGPp4lv44RfVvgUsbPZPqR6D9+nG2zQ2xnXdv33uKkM/ELiJ1kWKl1dLSqnGQiKPe1ME
         g2RGSmNqWbNiJJsMADJmNzh56Xf4L7cdQ4GTUtuQKgO4GpfB0nCcamrvvYOzcROIHlFO
         79Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745171250; x=1745776050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzOgfJm3r4ap/eGSZdUiYEYs4uCCNfYQBrjOjwlLAKQ=;
        b=icyMu5V9qVOB0oig5S+HxgaVEqNcKUIpFVQ9zQkYSMe1qWkpc47VYq3yXd2NKGdKkk
         k77SqItlieMRCHdtgFIrN3Qfnw3ezhHYGz17V7WWHR+Tvf5bSeFHND7xB3xov8fn6P2w
         R3z6j3D4PKTvuJ9D0B/2jLN/AEDrq8L2x1OqMuUHWeS1hcbg4D3tWsRlv7mdLIHxIfLR
         7k4fV7b3G2/EFuSTgq7NpJnx5au8DrswiQ6lNz7pdtraTT+2hHmSI4WYQjKNa1MryNQR
         hRUQmmALGCimihQ6vAFg/uIWimuXqmlo7gI0HAiKpIWyFEzMqIKXno+DJrjtNc+fu7gN
         Yu2w==
X-Forwarded-Encrypted: i=1; AJvYcCUtboexpxFfbMmmuLOw2In+EhQH+pa2gtEvUa4k1wPlCi/WYffg4jKYXTI/GwadVQDHCJANp/uuCkLGG8uszA==@lists.linux.dev, AJvYcCWzchC1jDmmZXHIjYaQfMqWqD7IfUIJvDKXzy/DnWNLN4xiF/wpyeGKc7Ii2DbtCDb3W4bEIodWbmojM1TSa28C4SkmxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGShDYWeQgshTEiLllrnDLVLLNY38gTwCuOH8tG5T6gHTNMU7O
	oxBlpqdQjfCmAhgwptlf5dvqEBsQFuApwsal/CHIIpjBfwRox7rf
X-Gm-Gg: ASbGncs29WVJoF3LxiNtpX45c0AIR8rP1/46Ndbuhy23ae3j96XLqXMeqxL33yBBesC
	LBQOm2laYc2+pzBWXbgjZbP3tXxzKQjpqEIHVRWbR6MHNQbIn+ntTtTDO4L/OvfR3rhlJuHiDJs
	fe8pyjw6Hau+KfGiB/DWz4XqXR/LMnQCXmdLea88/jpDYkWe/slXc2p8qJBZGfOz8yOYCFKxDI5
	paKBrpzOHgmAYVE8PsMg88X6uUJFd+6oabDI44OKyC+mD8kd1rqCSnWmgSlNylM2qRyme9Ys2PK
	7vc/TogzIY3ggulKkjwphuKSvzPf1ZjNYMXMaf4r3SSucW6BQCOtWqQ=
X-Google-Smtp-Source: AGHT+IH9iK+h688srjo2GEMmT43pFIn1JTTyr94V8Hjcrdy3ZjQHR0kwwvkdR/Su2ueEF2lYQIVFog==
X-Received: by 2002:a05:6214:5182:b0:6e6:646e:a0f0 with SMTP id 6a1803df08f44-6f2c454679fmr141748466d6.12.1745171250146;
        Sun, 20 Apr 2025 10:47:30 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd3e4sm34110156d6.85.2025.04.20.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:47:29 -0700 (PDT)
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
Subject: [PATCH v2 3/3] staging: iio: ad9832: Add minor improvements to ad9832_write_powerdown
Date: Sun, 20 Apr 2025 13:47:25 -0400
Message-ID: <20250420174725.887242-4-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420174725.887242-1-gshahrouzi@gmail.com>
References: <20250420174725.887242-1-gshahrouzi@gmail.com>
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

