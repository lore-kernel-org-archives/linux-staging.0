Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA245C6EB
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786702482; cv=none; b=pQfv1CdnpMEEtWCAr87dR+mikQpVNCo9+pCLzGxmAnjx0uiDTy3jFlY+87rEkY6l6yEdF4+jj60oNLb8G6j9lgD2gD0zGRLcMP0UZlUOGUwUw6z1xdE/kowlfgUxjsSKZJQdPF7ZHJxHjDRRnpZYGwVudRrg/Yh4rLkvaYY+9sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786702482; c=relaxed/simple;
	bh=EOvCzGPQ1wrO77c9ImbqYwELh6n+J6JCozv376VBumU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=op1P2LcFquPY1xJSHdOgHANsCDyUVKx2Cn4XeZrJ7WKUoETzQ89xbQqgEhOmhgu3e1HDpYvf3axqeosPayrYZwYYlJ9wogqQLTuRKlRsZ6RY43iEdtHV/3rK0DiQlFUbUj9bZyhcWZ+SiyJKJ4EQF3I379ZEUNFnCayNy5rJ8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+P7hY3M; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+P7hY3M"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e347638adso988895a91.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786702465; x=1787307265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=POFYQl9/S3qYOJeBzB96Y2RvTRQ9VB3bFVtckToWHaE=;
        b=B+P7hY3MrnR84cTNdShWmSCngYOxdXR6rd1uvEIqr196h2NdFYq881HpkSEc293FSK
         hfaLidx498TvF1Hjf/8/fW5WKYXSohG0Ss0f9+zFvbeE7ya61FBykzNuWJqj8nUoWQE+
         PwE2N0EI1J1KPv/1cLgqwxwQ6qsk9D/tx5jfUoU/w4p2lapILukNQV3dnHOUD6Uv9uNi
         AI2MWpGi5o2Vs2d4uyQnMlNVcjhBKHNOEeF4aCHKvnIUsQ2vvgRv/R7pWw50jrxzLxPo
         l+JY0BswT2ti6ZoysoTTX5kUz9zBXM5gMfQ33PWonzpXNWrLDBn8bh+lDRbbMAGzuyQ/
         X7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786702465; x=1787307265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POFYQl9/S3qYOJeBzB96Y2RvTRQ9VB3bFVtckToWHaE=;
        b=UZzfyz6/kaDb/gtvDMXztorjSAzFfNdKSRnEWcmS8f2maNXFxtrniTBwll5pZrRtQr
         PuoeFZoEdkmCuDVVzXLuANrXUh/Y/uW5fvp5ldvwbXhXPhewsjKDNl3ggbs15XaFDi9T
         cjNMZENEo022RNLFzazXzCD97AO4up+GUDI1sngrHnhrN3NUckjnfvfsn1jx6wHFKNdt
         BmWiJ8fyCZR6zNPf1VPTYbshng6HG98xWB08PPeCSkaDKQHza1UeHsYQrYJFiROFXu8H
         wUE+SbPjLcUNspO+k11QvSqghlY+w7dD7e9AAtLfV75jBiQ2GEuZeohB6hNabNzaTSo4
         appQ==
X-Forwarded-Encrypted: i=1; AHgh+RrerKBBudWhRNbrHE5jrDLT7Y2g31KbxJd/kfCHXsSckDTcdlAIhFsn/fjKqrPl4AVeHo4wDoO7MIgh6KSA@lists.linux.dev
X-Gm-Message-State: AOJu0YyIEZVJy4FO58PqTfRnvLOIRChvPnPTa7PYVXD9b9D6otLEe9U5
	MerStzxVTaHiUlWClHSI6lnwJJ1Tr+r8TYTbwnBwZ8g1i+WlR5Qr36wqYcwc6rWq
X-Gm-Gg: AR+sD11KGC4ghaMpYCcmlzK+AMbJ3o7taZCBP+LsqYJUsul4TpaaznXg4unkyZ3NkRy
	RgXeTUBJ/BCY07VDlW7Lgt4ACHWhkMGfScZ+b0gxpVtpxU3KfZkZlQRd54g1T8YLtM56l+lk1JG
	1+XF6/Tc/aal0xoRM8XH7SDj2z/o7OvCEMndZ9WViDgLIrUjen2qrmwcEOWOGqWmD0Y1jGdRYA7
	FyH+vSrnun9OVZ8odq40jaPvxY2GWu7dQTZAnowW66z+nKScIQ2zxNkxpvL2EamqpvJvVk03NnJ
	+tfFV7gEQHMBhgF7Jt0iiXV13a2sz4TXzmTC/X4o9NQrWpvbHacj0AudDGP6+2mm953qcKA7Kqy
	JAWcqun3+PgdTI1Gg8mAiDMHydb6kGx4BLkYeyp+UATxTkvysLyQtEE4Ozn3Nvpfej4PJrvGA23
	G0tZVO0Yq9UhRZkVYvkSir5NF63GfW/n/IeqYWiqwE7/vj0VMkOp/UNscokktjdwV9R1GtLDDfl
	tZJPcG1Ppyth4Qag9BDfBxNdgU=
X-Received: by 2002:a17:90b:1dc4:b0:38f:1dc:672f with SMTP id 98e67ed59e1d1-3933ba72497mr5056363a91.18.1786702465144;
        Fri, 14 Aug 2026 03:14:25 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03ecsm2772615eec.18.2026.08.14.03.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:14:24 -0700 (PDT)
From: Malathi <malathi.a2000@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Malathi <malathi.a2000@gmail.com>
Subject: [PATCH] staging: greybus: use sysfs_emit() in show functions
Date: Fri, 14 Aug 2026 10:13:51 +0000
Message-ID: <20260814101351.1023627-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/filesystems/sysfs.rst recommends that show() callbacks use
sysfs_emit() instead of sprintf(). sysfs_emit() knows the sysfs output
buffer starts at the beginning of a page and is bounded by PAGE_SIZE,
so it guards against accidental buffer overruns.

Convert the sprintf() calls in the protocol_id, fade_in, fade_out and
color attribute show functions accordingly. No functional change.

Signed-off-by: Malathi <malathi.a2000@gmail.com>
---
 drivers/staging/greybus/gbphy.c | 2 +-
 drivers/staging/greybus/light.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index bdb0f5164a6f..bb9a5b538e6e 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..2689f9a7524a 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.43.0

