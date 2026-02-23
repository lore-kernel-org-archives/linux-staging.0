Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9643644CE
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846944; cv=none; b=aIC3wy20W9xmPGRK12K/B3urqUoKKX6dt5xmIfrTixP3t5Dnd/mJ7g6sH7oFKeHPMh90LXC76pEBa+bS5bwd1Ao4KOrqRSA3XNIidBMVzLwHqI+5Q9lBT0J1GN6ffHgR/OUQ73n+jOf1kzUcEUQcC681he5RZIOC7MLdOkHnr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846944; c=relaxed/simple;
	bh=k+fIOi3T3WxLMidLrgWYiMQBHxd+vEDrnSIOkOtyTvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVg8v09dXN/hQdil/0Z1TnVDp/R47X3Hg5LBr9NuHpUqojtoJ0mOcvHIz80OCeU2d2WSwprpJVxC3emePwuAsGjZ2TelScE4WRpus0i5F848422ZppKrTKwPO2txmQhLAlbfb9xJnvy3eYxMvvoEWMU2poc//N6q/SqCSk91AYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NikMt8G8; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NikMt8G8"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5673fd077b4so2095865e0c.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 03:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771846942; x=1772451742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmmrtGlDRSEU043yEU70zvdkJUij3sS5DuLSSmJgOEk=;
        b=NikMt8G8rEfDDl26GSIORHTquK5J9qKxeU952OS0FEf310WnAE4OmnEaOt1EJjSL37
         VDjYRaQD/4BKyk3yv4AN512d8s7I0xBPqqeRIgZA7XI3MWeo0uvfNMBUFnrxwzz1jAg/
         5fzmLXu1qnN8h7V4V7vgNn5bIQxgyMhYoNP6H8dTydOWzkun4nkExSbHhXy35hsUEjpl
         Zi6JFPeU4K4Y4uN1F6o+Mk4ipD2b456/c9Im6AVFRmVdqzFIQSncidfhbWAxJfjowIuE
         jJ2DcyflQnVinO+q0jFsFRSh5+xuVAfvfqDrWEOBf+YihrWiy75THjH7kBVWUDOd5pM4
         kxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846942; x=1772451742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RmmrtGlDRSEU043yEU70zvdkJUij3sS5DuLSSmJgOEk=;
        b=p+WMsqiPi2oBtipTnEKBOj+0zhaWjEV9VWIUhH8TAE5+Ab/sKujsqOWk3eU5lYNg1O
         0Z1L4Y68lbnr5OoQep0mj9b+Lbya/skSAbjAPy2E3k+nOsJ0U8PAVw7YKEhR8WUJK+VO
         P4WcRXoFe2EfIm3A2WGzeBpQisIZ56SztLgPeZYOmUca4JDPjbFNcAZyD7wnYTHWDuf6
         O+TLp5I9gofLjzCCHE154cGNunzH9Jvtd8dx9+kRmQ2NKdaEl5ocvEF6ngKiin4h5YB8
         FyfaP0OLGTwGsLXQB7sSoYbgkT4lXa2dSnnS5Dq0CnQHNubNhECFlSAa9AMbdUZSNk20
         KkuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEglo/UUUKf3oULCZzJgCArc+XbOJmntTHGt/T30y0TkEFn30caPXP8HsZBl9p/MJR/KNbuoyOs+XvKdzR@lists.linux.dev
X-Gm-Message-State: AOJu0YyC8Zhp7QrjG0Pj4RLh7v/A/PjHJKwwTh3GIgOJ0xkFcL0OAsh2
	N6TUdKjKSl/2n7GkeE2XGeB0ZG65WmfVbfVWql1Dzu4XJ7T8jQhnteCT
X-Gm-Gg: AZuq6aJV16u2W3DwxPiaIkk0QwPq2YyehxlxOz8s1Wrn0bcpGbJoKRIMjONU/zcVwwL
	YEIkuu7e4/6WEjSimMvzgvkvfPEAcGc5tjisgrd89V4wmx9ARdgl43AERTj5/L6oxnNBhcW/wcf
	V1PEFTUMbsxGYn2CR79dGN8XBNGOlQDc60tq0BiRFXlgv6MqO0hl0amCXfppzVicefXIbACwRoI
	QMeRWyeHy+6qQSaYdfQ3dD+BbiAOitMTC7/8BIxD6JFlBJaF0dju5HJBzAqPKlTLDg7Xm5SwcHv
	bu+tKxhf/xeZ6M1zwTB10oxnxHidS+2vNkJ4vffdcmvMVana9ENqMNpHY5/ByD77sfx6YXcC00Z
	epBLMwMAEFkhd8kRkXBKmZS1aLR+HI5c3drMODXoYX5Iv94anCSoNSD/f7VGxgsTDk9NjYA9aqA
	Y6HTNUYoIAdYy/UiKvaYeLjo0+k5pPF1eqieQTftWTfwque36pWspxvFjTMbo3JyHBLj8rV81AK
	rNH
X-Received: by 2002:a05:6123:62:b0:559:6d45:9a1c with SMTP id 71dfb90a1353d-568e474a781mr2991915e0c.3.1771846942518;
        Mon, 23 Feb 2026 03:42:22 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e593a666sm8285024e0c.17.2026.02.23.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:42:22 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v9 2/2] staging: axis-fifo: refactor device tree parsing
Date: Mon, 23 Feb 2026 08:42:07 -0300
Message-ID: <20260223114207.3639-3-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223114207.3639-1-gustavopiazdasilva2102@gmail.com>
References: <20260223114207.3639-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the device tree parsing logic in axis_fifo_probe() to reduce
verbosity and simplify error handling.

Remove the verbose error logging and goto logic. Instead, check
of_property_read_u32() return values directly and propagate error codes
immediately. This aligns the driver with modern kernel standards by
removing unnecessary error messages during probe.

Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes in v9:
 - Rebased on top of staging-next branch.
 - Added Reviewed-by tag from Dan Carpenter.
 
Changes in v8:
 - Reverted line wrapping changes to keep the diff focused strictly 
   on logic refactoring and avoid unrelated whitespace noise.

Changes in v7:
 - Reverted variable name and type from 'u32 width' back to the 
   original 'unsigned int value' to minimize unnecessary diff noise.
 - Removed extra blank lines between function calls and error 
   checks to keep the diff as compact as possible.

Changes in v6:
 - Removed the axis_fifo_get_u32() helper function entirely.
 - Removed all dev_err() calls in axis_fifo_parse_dt() as the 
   driver core already reports probe failures.
 - Kept the 'node' local variable to avoid checkpatch line 
   length warnings.
 - Fixed checkpatch style warning (missing blank line after 
   declarations).
 - Ensured a newline exists at the end of the file.

Changes in v5:
 - Added missing newline at the end of axis-fifo.c.

Changes in v4:
 - Removed extra blank lines in the commit message.
 - Added "rx" and "tx" prefixes to error messages (these 
   messages were later removed in v6).

Changes in v3:
 - Split the original monolithic v2 patch into two separate 
   patches to isolate logic refactoring from type alignment.

Changes in v2:
 - Fixed checkpatch.pl coding style issues regarding 
   indents and line formatting.

Changes in v1:
 - Initial submission.

 drivers/staging/axis-fifo/axis-fifo.c | 55 +++++++++------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index e54bc4c1d40f..3aa2aa870ea9 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -392,60 +392,39 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
 				   &value);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
-		goto end;
-	} else if (value != 32) {
-		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
+	if (value != 32)
+		return -EINVAL;
 
 	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
 				   &value);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,axi-str-txd-tdata-width property\n");
-		goto end;
-	} else if (value != 32) {
-		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
+	if (value != 32)
+		return -EINVAL;
 
 	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
 				   &fifo->rx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
 
 	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
 				   &fifo->tx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
 
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
 
 	ret = of_property_read_u32(node, "xlnx,use-tx-data",
 				   &fifo->has_tx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
 
-end:
-	return ret;
+	return 0;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
-- 
2.53.0

