Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF678F24
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753036769; cv=none; b=JVF0sMgVOZWB7GbddCNl5n+brcvAYM1taUieGIz+I8OyQS5eNL7/+wM1fBYxvxHtoI2wce//ecHangaNUVsgyfeB0VoUX59gRNn6AnDEEO2PGYQqyN6ffsQFE0+1+fzSsfi9YH77eXttOtCfvaVIuX2UsbqasXkH85cqWgazVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753036769; c=relaxed/simple;
	bh=xJBY5D5UCy7GoDTYxXBCZiOaDGl+SxiZdGbLQ01qOho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qYUDsLe7OwgKfCdNYDqyMmOsO5fttWLS+0SfBYLoADRAvUGX5DDgJb+NW38UtwpIVo5E/OKrgf6lrHKipblmD4zL/KG6ZNle9+K2hFCIXV0TUicrlBATZ0mqX/rQw0wlYVCteEQe7+UYCp63Oq4K7XSA3Hsaj5BrOCx5aRUYmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnkTHuuv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnkTHuuv"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae3a604b43bso613499466b.0
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 11:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753036764; x=1753641564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIj5130s6XEeZrfl5Ht1lns82l2AP0slHtDqlWI3j+A=;
        b=YnkTHuuv3yBkogPbOtkWi/MHULMpf3djT8yVxHcMh+GrdqWZW+tR0D/ayg/A8XUT39
         tcWhZVJ7YlSSRUrGQHTZpu/14jdBSq0UKSJHCFvW+L7AoXU2DYJYH90GZpWFZUbdQNGB
         aZQw0JAdDkSSE32gCR+jIhB6odEu/oFlgMwQ/Bz6FkqBth1iX6UKHpPC4FqnSEh16Ro0
         /P6E/IgMbkg7Q6VpvizFIK9WJAfqSPE+V+i2HJFnl3dGK3thd/vOjTNp05RFD6tVBc5Z
         xJPg64j0sxpJqlIx4ICxIH/cNf7KD+nWxLzYmCNNTQiSfb14iTrw/7JbldB7fBheGTQS
         dPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753036764; x=1753641564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIj5130s6XEeZrfl5Ht1lns82l2AP0slHtDqlWI3j+A=;
        b=tI+ygnx3iYPFneRso9CN45ZS5FS5q9Cx0uSg7myA4H3qc+OkqUWGCYIQogIblMtlV9
         sA2hSKYfDyNU7hNiAtK99qE5G4gxEq4Th8se6ckOVl+ldRfF4lkyuAQ5WnJnhsyNIayl
         K7a23lemGnFAAkMUsp5TVJO1mUulraZaSAS+I6LKVCrR76BoWv8+j6b87VLg+h5vrlS2
         U7ZO5iLWG1b8z2Pp10BSp6tCBD5FX/3ri+zS/mfj7oinIIjTc6Tpx+VfcFHFYdV6zkvq
         nh/dIPYKbZROnmKnbCV1JJsAxuqesTwaDjxXmHfejcmZjPys7zTiGPhdZ5JU48qjyo+E
         SHBA==
X-Gm-Message-State: AOJu0YzM29yMccCL7DerMmOUIMhZE1x9n1l+G8pnZyTVp44pwBL3eT4h
	9k8f1JfMjPe4T98LJM5Z261cM0SMSvZK4zo+AcjDfPTT2NJ11ecGebcE
X-Gm-Gg: ASbGncuQMQNpEpd0sYzMSYqPdcVC8+7XU2H5BRzpOVmlhOcmCQMpHlkR5wVd8CQZYfk
	y5R/DNfFhJTni9f2xCAhMoF7MJIG3Wifd8cWOpgfMNmcDP83AcRKzHBk0iwP8dxTPCTJwyXU8Ws
	+ETEfrLTQOepLlYkFmZcUiJsAHz+Rb9f/25HpeI0LdUdoskT4MSRHuQwmpdMxFSDI31H6wbTmPj
	+ZPXwrtGfZF6MN6Jrpnk9bmxQvLgdbp6MfqMWf1/TRig7HEIzXfMeC7JDohBvtHT2htnhsqYli/
	ckhvr03QnyliTZ0vSmiHWKU4Jd+YgV4EJegRkAvWJBXtB/JaS6oHtyUOPaSK483UpJ0FMDSbLkw
	ZMT+0Ey464HtDPg5e6yq+mCouJSqOcRpiV4k=
X-Google-Smtp-Source: AGHT+IGvJMYMIHgv+MoXsEoY1OTOE1bx2hR79A5fgF8jQbWL+4R/usnXJx5PcMQi7kXr45Uy8VJppg==
X-Received: by 2002:a17:907:d24:b0:ae2:9291:9226 with SMTP id a640c23a62f3a-ae9ce1e71b1mr1692396766b.59.1753036763895;
        Sun, 20 Jul 2025 11:39:23 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c703:7100:a4d7:50f8:78a7:9bfc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca5a029sm533406366b.75.2025.07.20.11.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 11:39:23 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 1/2] staging: axis-fifo: remove sysfs interface
Date: Sun, 20 Jul 2025 21:38:32 +0300
Message-ID: <20250720183833.3570345-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firstly, the existing sysfs implementation is broken: a r/w operation
produces bogus results, as the store/show functions incorrectly try to
retrieve a 'struct axis_fifo' pointer from dev_get_drvdata(dev).
The pointer is actually stashed as drvdata in dev->parent.

Even if this issue is fixed, it is not safe to expose all fifo registers
to userspace. Poking around fifo registers can easily put the fifo in a
bad state or generate external aborts. For example, when the RLR (Receive
Length Register) is read when there is no data present in the fifo, the
following external abort is triggered:

$ cat ip_registers/rlr
 axis_fifo 43c00000.axi_fifo_mm_s: receive under-read interrupt
 8<--- cut here ---
 Unhandled fault: imprecise external abort (0x1406) at 0xaec8d000
 [aec8d000] *pgd=03f74831, *pte=0525c75f, *ppte=0525cc7f
 Internal error: Oops - BUG: 1406 [#1] SMP ARM
 Hardware name: Xilinx Zynq Platform
 PC is at sysfs_read+0xc4/0xd8
 LR is at dev_attr_show+0x6c/0xc0
 pc : [<c0ff9298>]    lr : [<c0adad38>]    psr: 60070013
 sp : e09abd18  ip : c3193000  fp : c0adaccc
 r10: 00000000  r9 : c3192000  r8 : 183abab5
 r7 : c1d5d5a8  r6 : c2d71440  r5 : 00000024  r4 : c3192000
 r3 : e0a60024  r2 : 00000000  r1 : c3192000  r0 : c2d71444
 ...
 Call trace:
  sysfs_read from dev_attr_show+0x6c/0xc0
  dev_attr_show from sysfs_kf_seq_show+0x270/0x360
  sysfs_kf_seq_show from seq_read_iter+0x7f4/0x10bc
  seq_read_iter from vfs_read+0x350/0x3d0
  vfs_read from ksys_read+0x104/0x194
  ksys_read from ret_fast_syscall+0x0/0x54

The same abort is triggered if a read is attempted on RDFD register when
the fifo is empty.

Therefore, remove the sysfs interface and only let read()/write() modify
the fifo registers. For debugging purposes, a simple read-only debugfs
interface is added in the next patch.

Fixes: 4a965c5f89de ("staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 175 --------------------------
 1 file changed, 175 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 351f983ef914..7897434f2441 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -139,180 +139,6 @@ struct axis_fifo {
 	struct miscdevice miscdev;
 };
 
-/* ----------------------------
- *         sysfs entries
- * ----------------------------
- */
-
-static ssize_t sysfs_write(struct device *dev, const char *buf,
-			   size_t count, unsigned int addr_offset)
-{
-	struct axis_fifo *fifo = dev_get_drvdata(dev);
-	unsigned long tmp;
-	int rc;
-
-	rc = kstrtoul(buf, 0, &tmp);
-	if (rc < 0)
-		return rc;
-
-	iowrite32(tmp, fifo->base_addr + addr_offset);
-
-	return count;
-}
-
-static ssize_t sysfs_read(struct device *dev, char *buf,
-			  unsigned int addr_offset)
-{
-	struct axis_fifo *fifo = dev_get_drvdata(dev);
-	unsigned int read_val;
-
-	read_val = ioread32(fifo->base_addr + addr_offset);
-	return sysfs_emit(buf, "0x%x\n", read_val);
-}
-
-static ssize_t isr_store(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
-{
-	return sysfs_write(dev, buf, count, XLLF_ISR_OFFSET);
-}
-
-static ssize_t isr_show(struct device *dev,
-			struct device_attribute *attr, char *buf)
-{
-	return sysfs_read(dev, buf, XLLF_ISR_OFFSET);
-}
-
-static DEVICE_ATTR_RW(isr);
-
-static ssize_t ier_store(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
-{
-	return sysfs_write(dev, buf, count, XLLF_IER_OFFSET);
-}
-
-static ssize_t ier_show(struct device *dev,
-			struct device_attribute *attr, char *buf)
-{
-	return sysfs_read(dev, buf, XLLF_IER_OFFSET);
-}
-
-static DEVICE_ATTR_RW(ier);
-
-static ssize_t tdfr_store(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
-{
-	return sysfs_write(dev, buf, count, XLLF_TDFR_OFFSET);
-}
-
-static DEVICE_ATTR_WO(tdfr);
-
-static ssize_t tdfv_show(struct device *dev,
-			 struct device_attribute *attr, char *buf)
-{
-	return sysfs_read(dev, buf, XLLF_TDFV_OFFSET);
-}
-
-static DEVICE_ATTR_RO(tdfv);
-
-static ssize_t tdfd_store(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
-{
-	return sysfs_write(dev, buf, count, XLLF_TDFD_OFFSET);
-}
-
-static DEVICE_ATTR_WO(tdfd);
-
-static ssize_t tlr_store(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
-{
-	return sysfs_write(dev, buf, count, XLLF_TLR_OFFSET);
-}
-
-static DEVICE_ATTR_WO(tlr);
-
-static ssize_t rdfr_store(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
-{
-	return sysfs_write(dev, buf, count, XLLF_RDFR_OFFSET);
-}
-
-static DEVICE_ATTR_WO(rdfr);
-
-static ssize_t rdfo_show(struct device *dev,
-			 struct device_attribute *attr, char *buf)
-{
-	return sysfs_read(dev, buf, XLLF_RDFO_OFFSET);
-}
-
-static DEVICE_ATTR_RO(rdfo);
-
-static ssize_t rdfd_show(struct device *dev,
-			 struct device_attribute *attr, char *buf)
-{
-	return sysfs_read(dev, buf, XLLF_RDFD_OFFSET);
-}
-
-static DEVICE_ATTR_RO(rdfd);
-
-static ssize_t rlr_show(struct device *dev,
-			struct device_attribute *attr, char *buf)
-{
-	return sysfs_read(dev, buf, XLLF_RLR_OFFSET);
-}
-
-static DEVICE_ATTR_RO(rlr);
-
-static ssize_t srr_store(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
-{
-	return sysfs_write(dev, buf, count, XLLF_SRR_OFFSET);
-}
-
-static DEVICE_ATTR_WO(srr);
-
-static ssize_t tdr_store(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count)
-{
-	return sysfs_write(dev, buf, count, XLLF_TDR_OFFSET);
-}
-
-static DEVICE_ATTR_WO(tdr);
-
-static ssize_t rdr_show(struct device *dev,
-			struct device_attribute *attr, char *buf)
-{
-	return sysfs_read(dev, buf, XLLF_RDR_OFFSET);
-}
-
-static DEVICE_ATTR_RO(rdr);
-
-static struct attribute *axis_fifo_attrs[] = {
-	&dev_attr_isr.attr,
-	&dev_attr_ier.attr,
-	&dev_attr_tdfr.attr,
-	&dev_attr_tdfv.attr,
-	&dev_attr_tdfd.attr,
-	&dev_attr_tlr.attr,
-	&dev_attr_rdfr.attr,
-	&dev_attr_rdfo.attr,
-	&dev_attr_rdfd.attr,
-	&dev_attr_rlr.attr,
-	&dev_attr_srr.attr,
-	&dev_attr_tdr.attr,
-	&dev_attr_rdr.attr,
-	NULL,
-};
-
-static const struct attribute_group axis_fifo_attrs_group = {
-	.name = "ip_registers",
-	.attrs = axis_fifo_attrs,
-};
-
-static const struct attribute_group *axis_fifo_attrs_groups[] = {
-	&axis_fifo_attrs_group,
-	NULL,
-};
-
 /* ----------------------------
  *        implementation
  * ----------------------------
@@ -877,7 +703,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->miscdev.fops = &fops;
 	fifo->miscdev.minor = MISC_DYNAMIC_MINOR;
 	fifo->miscdev.name = device_name;
-	fifo->miscdev.groups = axis_fifo_attrs_groups;
 	fifo->miscdev.parent = dev;
 	rc = misc_register(&fifo->miscdev);
 	if (rc < 0)
-- 
2.50.0

