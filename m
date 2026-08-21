Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09A47FAE0
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312156; cv=none; b=jsw9hiEJ70XN5SYRmTZ1Lnkj9WxFgftfs59OVEFCklovF/skhHcbRjs+sssXGKFje/K3NYP54tuW/XYaft81FcxKEjj0wGSEJ8E5uRF0eYT0L3VpwQTJ4zQEjp9IjAbSU1XRHfC/qHoMiOdGvo/kYf/EJflrKK1FVt3T5KyZMdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312156; c=relaxed/simple;
	bh=f4b6Z14LwAUVlBtVHyCQvaZ0gVyjp7iu6GQO8lPI2Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJ3XEe2429cp+6bt1MbTVF/oBCMF2xBv3KEWWF0WZmGCy2CqfxOd8zi/JAlo0iP2w+hdsToINEUarDnNhZ/Yu5ShtcGVxhPyxNRSg6P3wMm4mwBsiDGXMZVy/1PLVqvSn9yhLRjl7kLKRR1H+xAwf9rPLvReTS00uD+2pQfd5+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgKD68fn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgKD68fn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso6868005ad.3
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 04:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312154; x=1787916954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NrMxw7QdyXXxUtL5k1Ui0hoJIKBHXT1pSk1NNI967cw=;
        b=YgKD68fnmHZFUaPOgCZIQqrH7uaig6GnFiDtL/gkbDwHuW3sRKBFSb4Sb51gblXq3f
         eG0Knj1yuJvfiiLnoL3hHBMi0zetfdYc9N2J933xWmDAtHL3OIU6zBi0feAfU0IMvWgq
         N6lzZbomDp8QHGtk1lMBLXd4zJ1gh3RMLaYS+lt3Y9jXki1x7aLvduh+2OWE36lySgvX
         4ulyryjJXTCnXLFqG59HhCL1y7tv+1K8M/YHi+9jiTcOOQG/Yvfn8MN61YdRS4/HChkc
         kwtbWWxdzwIxMuhYCsKGoIawOQsjeIcd0DHtDrgtGm8IeVgQJyQbp1zuLk21DEqJcy1w
         VORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312154; x=1787916954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrMxw7QdyXXxUtL5k1Ui0hoJIKBHXT1pSk1NNI967cw=;
        b=paldeqetVFMOaPc0+cKthDJNEYWZvKNpiGkprFu2V8HJY7OZYcretT938c4cCnGZS4
         gRdadUVVcieHlihW8y6iQpv+z2Df6Qkaan0z6qKLqCWTuTdRYIxU/lYuvSqPOFvOBH9t
         tq/tYv8YJ0edb9GAr6u16VxWoNOYksawg7ST7S4xokR/GWZYdjptwz4/LQYSI+7BepAP
         3b45tk97rjM+adT1n0siOAbZPoY4R10z6Wb1jc5bFf/yk4xBuSs/jtDUP+s2LIg2uORS
         I5BeZOBz73lvbGp8tNuMIDyMwOG/jAZwV3DtCVpuXCXs4rbpifqVfuI8KI97LQcH2oxB
         B/Ug==
X-Forwarded-Encrypted: i=1; AHgh+Rq4NdRYXYHJynV9Qj5fm3Uo4gVhB2Fr00G9st7+Ew2SOBqRrM41JTJw+ftHWy9c/qsSeRF5rfMgOjaYrKLo@lists.linux.dev
X-Gm-Message-State: AFuF++lbPaF1Of8vnMJlQXsqUxNMZpA+zYGNSwXotT8Vs1uJKxZQG71l
	XiduHP0hK/FOtBw8EZrqusfqOv/WMI5pZn0cCMAieS19iOvrgfN7bjWi
X-Gm-Gg: AR+sD13HMZ5pvNwusslKiHI6yTHGDU+W15fw9Js7+C7s8O7Dhv/m0uo0ie2kNv38QT2
	J3t6uiloBvbFiDfjL5mzGlnEdOcjpR62M5iKZalNJuOukzm3+Ly9ZK/3eU4sQkVNbMxFA8u6IjG
	Q5/eRPC07l34hc7E8+aLFDJBE/gvJME+MJwy5ad45Z0/472v1gzfjk4GnYx8le0nxyOqmaNg71d
	wxgK9Q1p977GnBwQgGBm+vkmBhcdITzPGsJN2furZub+zCpinIGHAVq31mLdm3FJkD8zndsk+oJ
	Gt/903YybkOaIQ7ehKIGswIOW37b48pLYd6zHoWTqkQovG2x/nvz825M8J4tuLvYJa+EAnhQaWw
	x+vPjg5OxKXnFTxIAxHkCztgeL1n7bRG5KFOSInQi2FP3EfRQKIvaqKLk8YNzSasx01HTvsM7Z9
	uarJlvcz33qXTNbDPG5WC5WqXFg14kKM8cGg6MIcmrnnD/j3uHXOA0Tn3ez3KGAvssVjiUQcCbO
	UnpOgDI6XoQ8xOd9icapDfpFdsWuNan7+bnso1Xg+mJ9MkDm2rg
X-Received: by 2002:a17:902:f70e:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2d64afd7c86mr121829745ad.11.1787312154155;
        Fri, 21 Aug 2026 04:35:54 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d5ae489sm18261655ad.33.2026.08.21.04.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:35:53 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] staging: greybus: bootrom: fix potential NULL dereference
Date: Fri, 21 Aug 2026 19:35:40 +0800
Message-ID: <20260821113540.1989561-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gb_bootrom_get_firmware(), the queue_work label dereferences fw->size
on a path where fw may have been set to NULL via the "if (!fw) goto
unlock" path.  This is currently masked at runtime by the !ret
short-circuit (ret is non-zero on every path where fw can be NULL), but
it relies on an implicit invariant that is fragile and hard to follow.

Move the next_request calculation into the mutex-protected region where
fw is known to be non-NULL, and initialize next_request to
NEXT_REQ_GET_FIRMWARE so the queue_work label no longer dereferences fw.

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..289c9e957 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -245,7 +245,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 	struct gb_bootrom_get_firmware_request *firmware_request;
 	struct device *dev = &op->connection->bundle->dev;
 	unsigned int offset, size;
-	enum next_request_type next_request;
+	enum next_request_type next_request = NEXT_REQ_GET_FIRMWARE;
 	u8 *firmware_response;
 	int ret = 0;
 
@@ -293,16 +293,14 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 	dev_dbg(dev, "responding with firmware (offs = %u, size = %u)\n",
 		offset, size);
 
+	if (offset + size == fw->size)
+		next_request = NEXT_REQ_READY_TO_BOOT;
+
 unlock:
 	mutex_unlock(&bootrom->mutex);
 
 queue_work:
 	/* Refresh timeout */
-	if (!ret && (offset + size == fw->size))
-		next_request = NEXT_REQ_READY_TO_BOOT;
-	else
-		next_request = NEXT_REQ_GET_FIRMWARE;
-
 	gb_bootrom_set_timeout(bootrom, next_request, NEXT_REQ_TIMEOUT_MS);
 
 	return ret;
-- 
2.43.0

