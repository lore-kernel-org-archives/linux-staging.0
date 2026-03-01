Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CBA1EF36E
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 00:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326522; cv=none; b=L8eDpCzqVXeQgvHyE4wrp7GybMwZX+oPtPSHyBc4834XvU0lgNuLL2bdV78RFPq+5pstK3YfCdID6iYNP1HAIC/5tCmwC/+vt/srhLRf0FFlli//QOGGIYKjHpAUlbOdTv370P8pv2Od5XJys3Ad64cA1xOnMer78J9V2k2q5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326522; c=relaxed/simple;
	bh=JXGLbl7twyNfx3SZ0LfRHwU0NCKVesPGSeBi9+VukQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=toY5bVNgp3fa9G0yk+DLRYMHsWLoSA0WMJ4vvuNQTnhphIETYi/Z9dkw2npIXpk4ujhlKJjG7DoJJRPkLjn6p4nzAbr9aVkLRj+9XMkq923Pk8Ska85ttTIYLqFo7GuFPrOkGUcrmllYSsETwCFCTOcX2MtrV8V9wfqYaT/g424=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQkGwJW/; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQkGwJW/"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c70ab3b5fcso480051085a.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 16:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772326520; x=1772931320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikNvRTtv8hol4u0SB61YiepYvqKOicyXn/dv1bKXazE=;
        b=mQkGwJW/S7N+SgQV0YYtVAANt1Koc+q7hgpnGCLIT7KNeMVx279soCxC/ERwf7A5Km
         9WPcdynqjE0MQKP3vp2snYq630bofVFc21sJ1lKKIPvpZSG66tKVmFAAc7mjv9ZI7vnK
         znFbRrxj0bhMhT6DYRxfL3Og6DF40MLyAACHpErhVM7l1EwB77tK2qSyIDVDFUJ/d/tj
         90kWi75DAuQvnLnhrVLQVoySOGYl2Q/C9XWADnfuztgpnI48+48U7cpUluB/4ipT5Ub1
         ILxDFI5byNuRjLFnaW8Fi5jSGmNr31wN3y02Qpu920+DeaxsQ0dmCJxEiWBTVLJnDxf4
         S/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772326520; x=1772931320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikNvRTtv8hol4u0SB61YiepYvqKOicyXn/dv1bKXazE=;
        b=OT0Su0zhRNEi1iaadfzVCXGGb7n9AsfmcW58lBFOYN58xAWELPavh2lC30YnDxCRLf
         XY85rXyFev37bJXKYyVqzHGUQV4/6UT+9YOGjMeJg6L3fNvK105l3lmHz23ZA+x1bHAI
         rIQSAPHB+6384sEErUeuv9aOsYFs0uOOLiRR0Vo6AqF/zE2VwxLtK7TKYXaT3BTZsDDx
         uy9wAkbHGcwi78BW4J0e5VOf3X25tVcnCThBeg4E5xmuz9elOR2Fh6N0ENBn6u/4CwsE
         j6iMhE/BjC3GJM/FA1EDLtk//XOQLo/D6nCWigOhcqHkaDLEID6tq0QGksFX4AfZNPzl
         c9eA==
X-Gm-Message-State: AOJu0Yx+mQgESq9CuKux1C/IxB3b3ciEVfIy+YLPQIS3wDaZp24P4f+k
	ZDg8aF3Ccx/n8b5FXgCHg2ExJnD3MO0ENKsahMzy1gWGiuFychDj7dbg7eceG7jIUxU=
X-Gm-Gg: ATEYQzyTlxNlvrAMFmXHcPLqMPrJxArvqGArnYsJN+QXn2n94ntZWK6BXyrL4DjvMsJ
	mVg54jtKaRDUFEvU5e8Mash8LbMKSku5g+rnpl1YpUbF+zK0NUdkQ3g0ImTkUL2qvrMEA5TwTCZ
	tOm+Q8Pb3qn7bWgCw9FVN7QSlQEJHATodKzqA/vtZmML7tIwrIWJKaWGAGRuihOjZqQsbLSWMPn
	lod6UUyYcRD6v5XnSSyJXY3bwOitXPnuXsHfwPsfjolzp32CVy61BxqBCNqc5K46RW0QweFzq4r
	X1Wx1Q6cfXBwC6GyD/M3Gp8CbV1Rbi0+IxweKNyF1N0GDN69FnuBQz54CdKwZfC/g1QBWRkdy4l
	1q8TrI2Wufv7puN2WjisVk+85GQamQ2Ts24gu5MxMUpjGTX1asS7mEA+CZwUZT65zxRIpzub1xS
	v0iji/tXWaYlofRRhxFlRy8A5v/J32bDSPFjqqIQ0Qt9WZlA+R8ZchO3nc1M+vz2BB8dyIF/v0k
	bHh
X-Received: by 2002:a05:620a:2949:b0:8cb:50d6:18be with SMTP id af79cd13be357-8cbc8d7ffdcmr1086732185a.18.1772326520380;
        Sat, 28 Feb 2026 16:55:20 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66f325sm815840985a.16.2026.02.28.16.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:55:20 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 1/3] staging: axis-fifo: simplify resource mapping
Date: Sun,  1 Mar 2026 00:55:17 +0000
Message-ID: <20260301005519.2512706-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_platform_ioremap_resource() to simplify the code and remove the unused struct resource pointer.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index d83a0fd5b231..fc8e35696b31 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -450,7 +450,6 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 static int axis_fifo_probe(struct platform_device *pdev)
 {
-	struct resource *r_mem;
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = NULL;
 	int rc = 0; /* error return value */
@@ -469,7 +468,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	mutex_init(&fifo->read_lock);
 	mutex_init(&fifo->write_lock);
 
-	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
+	fifo->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(fifo->base_addr))
 		return PTR_ERR(fifo->base_addr);
 
-- 
2.43.0

