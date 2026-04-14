Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2BD3BBA07
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157998; cv=none; b=BUJcc0UYJcJCpEOoNX3lpBwBIgBGHCB8cMUagcr2hKZgsT44PXS+SxZOT7DB75qqbxh5Y5LNxXdgNUaSj63W8kSvmn/RaMgCFr3MdSXkPCPAKbkEPDZdn9bz66tYGeZxcjcRDDYzeaE9+Pqu7csAAWXGjHSfhhXLV4L/S69fCJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157998; c=relaxed/simple;
	bh=EvacC9LihmYC+Bhnd8QXaJhFbVwPcP1wyH9ZW1zD+RA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ew8XLQpNW2fWUQdRqTQn8DhcHHInrKfH/B3/LaED1+nuXP1qE532q5Pbz7zOr0IPvU4h6e5NysYjiwCT/UEREEkKZYy7yEp+SmB+m6N0xt81/zSlK34OWt6XoLOf/tpQX9rPV1/NwRDFA5qRmWbS/7ra9Q2hGuE21K/ZK2yuP4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJLe0gRT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJLe0gRT"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9c280322e0so645240966b.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776157995; x=1776762795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLmOOVSobQdxpdV2CxzDrMXixIXpcrGizwFUI8g1ioo=;
        b=YJLe0gRTYv/0z0IvbecKIzRUR1ny1YPoqyLCEoEfUDQ2KZZMjJvVQiXdb7UhzZNC8E
         iH0ihlDH65FEE9Su0w0y0+VHdIPy4asaFbwxZP08z4ANTdsng4q5AiQneLgBjwKHjEUm
         nxH5v5uTYzw+WlKsW0e+zip3jikg4k/d52adUBVTavouWRi5kZNEl5Al+Yphet6NC9sy
         gAdUDTy/l/eYWpyK3H7pFP3H0vO5Kv2kIcSDIBGH1tf4Ib6rs9Rm48cVbWNqFsFOBVwa
         Cg1NVwmnwNPF+9yqzLDTXqeg9qdRNRHDfzw53J7gCM0VF27mmE2w7+xOvMqj4epvI9OV
         UhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157995; x=1776762795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLmOOVSobQdxpdV2CxzDrMXixIXpcrGizwFUI8g1ioo=;
        b=LBM5WZxwLMCTE7YT8kX1XVglTBD6qZis1kKTEFnrUimLTxPBQ+MBemRlVPHYpptd7x
         v3vFvlreWI7WyQF/LIcE6qQNdjwajtvMnvD7GWXmQUCKdOrpipaAvDMwTn8jmqmTyKc4
         pc6SbNrAqNht4E/Mj9wyupJO3O3VQJhm4sCpvSbsKxq7Jrw5unvNeASQb55PzxClTZs2
         aCp+UkP32LIH1j2LB6FQp8wKPBx+yRpKkTWF1wor4TgxMbHyZHKX3a+CCo3/AWqSRhd1
         lq3zpgG4KIBi5zEty5rsPOwtuJBRS55hFI5i5qaeGGNy8ZrxOIvGpQOR8fg3fEpzlb2p
         Devw==
X-Forwarded-Encrypted: i=1; AFNElJ84xVUGcvabtBb+Ls8DNFnP770p90OCzbvFsLkzsTFBOjHZkyIifKWpUQeI8lg9bUOeYHaVYutngn9PnkTC@lists.linux.dev
X-Gm-Message-State: AOJu0YxeWiVYiZ1v+nQZ9oG56ZoT/4w+KjktjY6WBkZkxRlfPCF4nN/G
	1tydOYVhteWb5SSBpF9bmx2gTY+Z/7QL6SC8UdydN6bsmEvSkxSKW1uD
X-Gm-Gg: AeBDieuocj/CA7jbBrNl+0rug/Xz+nwu0YYANmgmUis+jNOtZSc8AcsXW2XHr2BeoSd
	G7jMTCqJobFt60xT7O50lmftBGlT1Tw5Pd0Uk//0dhi5NHxUKjFJ41upHaf8scDx0G1V239v4hy
	GwbfQHIF2IDnbgo+roBY1AisYez10nPN275aWRQTGQKuRpr/U7mCY5t0botxBERkMd4Pwa+8bRx
	AVemekofJZ+itgNNgR/ecnlF01tSHEL10J05LvgARE4a73kdrRSfotYHm9VCHXqOyL7l7LC6Sh1
	4i4aaWVdu6CWdI6yajr5X8/Cxi9phyOu8hJ5dswwQjFgmY4Fb38MEvWdTS4kSrDzxj9qLVN5OeF
	H20j0/KjgzCUx7fKelkp2qqJ6oTv3HS6WBBBuSzgS0tSOws9FQmkj+FaNnfgbLDfIdZ30W3gkS3
	3Jk2VMWH/tRKW5nvRNQTe2o7mOUJS1Qt+j0bfNBk+Vy5y9OdIst8GwFbvESYSSad1sMoCCFAcjA
	pewCBVqW2Vtradco8PK4ViBH6wzfljGz7yU/YtpB5/IfdEadERAgg0syCUxQsj/HaM961jCGH5W
	GoDYL+3Y0NNLzy7Z0UzK5XIBaf4egZTACPNVOIcH9xS77faoq3CFQAs+coGkddtXJrRUb/b8j73
	aNqRGcvvX6rqGlBvnDN5+fexHkufgs+yT8YC8yu3IPE/X24UqlSLTflrrLXgX1Cy/iEmNTV8EKu
	++6nBS9dg=
X-Received: by 2002:a17:906:fe05:b0:b88:6164:6421 with SMTP id a640c23a62f3a-b9d72495353mr915644666b.16.1776157994816;
        Tue, 14 Apr 2026 02:13:14 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (63.152.141.34.bc.googleusercontent.com. [34.141.152.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a44sm384466866b.52.2026.04.14.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:13:14 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 2/3] iio: frequency: ad9834: change sprintf() to sysfs_emit()
Date: Tue, 14 Apr 2026 09:12:49 +0000
Message-ID: <20260414091250.1295-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414091250.1295-1-joshua.crofts1@gmail.com>
References: <20260414091250.1295-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change instances of sprintf() to sysfs_emit() as returning
formatted values to user space should be done using this
function.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index eed4e08920..9499e05a73 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -290,7 +290,7 @@ ssize_t ad9834_show_out0_wavetype_available(struct device *dev,
 	else
 		str = "sine triangle";
 
-	return sprintf(buf, "%s\n", str);
+	return sysfs_emit(buf, "%s\n", str);
 }
 
 static IIO_DEVICE_ATTR(out_altvoltage0_out0_wavetype_available, 0444,
@@ -310,7 +310,7 @@ ssize_t ad9834_show_out1_wavetype_available(struct device *dev,
 	else
 		str = "square";
 
-	return sprintf(buf, "%s\n", str);
+	return sysfs_emit(buf, "%s\n", str);
 }
 
 static IIO_DEVICE_ATTR(out_altvoltage0_out1_wavetype_available, 0444,
-- 
2.47.3

