Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091092F1FD7
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985615; cv=none; b=tbyqtQy9YE+2v8WsB8ilA6cGgBYwAyLeyguJgintW7K15mI/DYS/8nNZmAdEXY0vMEv6HpULl4O2dlKnINAi1huU0jk8o4CQbQlMKnC5AtppJy+z0p0LGAzps0L7+MSbUQ2gnv7gcWfdIf+8JEZx7Q241VyjoYoWtzE1DPXn078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985615; c=relaxed/simple;
	bh=7nWByWrKamoS3Tawd6xHdcAqvwiHXGHtS3tq7v3gZUE=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=sbTM8O3H5NoyanzEo+l5QLX48ZpMX0myCjrx5s32mVf0Gkg0kBMyyDDnTV8lUTLy9Qb7BWIzkYI/EsrGaiyNEdNMGH359JJhbhMW621DgHBaTFmIPYB5r5MnPUw/Xc+KftjUbN1QaJEYL4gEOypMIZLZI5TIlN+t01VDIk9r+50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IA4t89sO; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IA4t89sO"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceeee8c46bso4115715ad.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784985613; x=1785590413; darn=lists.linux.dev;
        h=subject:cc:to:from:mime-version:content-type:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kCL9s53ovP8SdOgy9H7WYAqOYqd6/28JGErTF4iyBk=;
        b=IA4t89sOshCK5HnThSy/oE7LaJUreQnU9wTZczZUbXLhHJjoyL3e3elvZYS/Z/2gO5
         B9b/hZimYnmwiDmbPdR/O/6h0BYf+icszvKZ1Z/GsI/KBwsIRw1CSfJRJQlcra+Nfpok
         JdTKBpBf7j6hmcgO0BtHYIJPN1nMNICGsLo/sPinLGkbr7jeC+vvlabpBISD8OH4QM9i
         OCx1AP6N8vXbS+kTGXWDeWvAv9ZBMNaFe5NnCvEiaAdKTc1jngyVc52iqIvXhKOxhnoE
         55azlqk2/7lg7k6DfYhD9BYcHvxt1+DapBLM/7UQD2o80TkhThIO8DcXlRGWE6iWyYRd
         x4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784985613; x=1785590413;
        h=subject:cc:to:from:mime-version:content-type:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2kCL9s53ovP8SdOgy9H7WYAqOYqd6/28JGErTF4iyBk=;
        b=mJXmWk8wZIurAqeFckAwkEP2MirNrxx3gyzEtp5xT75JRS8AWi5FROLtR6pepfS2nY
         dsn0viOak5KoD6bXuENI/V2rpVvXxeF841Nr3qJxk8UcTWR9wMwq2xkbcvvLAESX6NuM
         HEmHhRrxV6n9VzBiE/EsLGSF0WRmw3zRGMjx9Y1UqDZk2pCQxte6c6iyz296oonM/kfk
         BVawnpLFxB8FpJyvqxgahhcPMqqZnLo7TWulA2yMfYRXebtV03JdB5Zs/uVcrgUgGtRJ
         9eu2tkkyo6x2BsTonbOq7o2aizaxzqUVbDRfcoHo7E3Ow19k2/Bqn9mAzZjzZNHRROe3
         7F9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro1KLg/KqqP53kGVYogrDMKfyhA1Iv5JIpM5sYu0aI6pMeqUHouQ5WPmu3/ko7zVQMJXZf+JwSqJi+P9Y5y@lists.linux.dev
X-Gm-Message-State: AOJu0YyC4/a3cK8PxGmqzwa5jDkj50pRSICpyz2/Q4fQ4oid/TPov/jp
	KUophQt1CRaNZK/pV8NFy2oIavjjd7/JS4RymM+2M0B8cVl0lPmE2tJY
X-Gm-Gg: AR+sD11u4VsdFrcPEZpooVlVEfSYxRBxDg99DXQFqz157LwK+ACTgfSkfQlOp10c9Hg
	9nvLimV//V9s3r56oR8x/DmZfVsoPGQkeUcDtAYc+ALw+65uGiW5q3t6Rm+Kq3/Cs3hZyownDVB
	EX8ggER11Ks9HD9hWzhGm+40p+Jy+VnznYo7tG07LPgrhUUIw0Yo92ng1uFLS6ie+Vema8EGfc1
	tiUinhW+9S86cGK65T+3cGqxP7aDmCkk2dklGY0Kg2Me6d6ndgqSiK5D/gEv0SsrfOiMEX0dnLx
	2emQuBxU451m4aJ1eePQTNipL8YGfzuuOBVqNmnmcrpg88SqO6Ga1vyY+9j3RnLhUBW1Kq/SLfE
	QZOCnkPfUcHFh5EyeFRVBQbKyE3vogo5ehfz05xV4pUT9uZ2K4lpho1d2i+b/JTm4PPatKSRNBx
	k+WdqXpzyO7Q8XfuugVjCbUmAJ
X-Received: by 2002:a17:90b:3e47:b0:381:6cf0:d5f5 with SMTP id 98e67ed59e1d1-38f2963ea06mr1710466a91.5.1784985613081;
        Sat, 25 Jul 2026 06:20:13 -0700 (PDT)
Received: from Potato.localdomain ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13015052sm33762367c88.5.2026.07.25.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 06:20:12 -0700 (PDT)
Message-ID: <6a64b80c.4987c784.13f2de.011a@mx.google.com>
Date: Sat, 25 Jul 2026 06:20:12 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3307223758249983777=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shivesh <chanelshivesh@gmail.com>
To: sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu3: fix line ending with '(' in atomic_inc_return call

--===============3307223758249983777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From c753198ad726500786ba04d66d531db4c11e2b03 Mon Sep 17 00:00:00 2001
From: Shivesh <shivesh@example.com>
Date: Sat, 25 Jul 2026 13:18:59 +0000
Subject: [PATCH] media: ipu3: fix line ending with '(' in atomic_inc_return
 call

Move the atomic_inc_return() argument to the same line as the
function call to fix checkpatch 'Lines should not end with a ('
warning.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
Signed-off-by: Shivesh <shivesh@example.com>
---
 drivers/staging/media/ipu3/ipu3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 84c4d0bf027d..14e30cf913b8 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -556,8 +556,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
 			buf->vid_buf.vbb.vb2_buf.timestamp = ns;
 			buf->vid_buf.vbb.field = V4L2_FIELD_NONE;
 			buf->vid_buf.vbb.sequence =
-				atomic_inc_return(
-				&imgu_pipe->nodes[node].sequence);
+				atomic_inc_return(&imgu_pipe->nodes[node].sequence);
 			dev_dbg(&imgu->pci_dev->dev, "vb2 buffer sequence %d",
 				buf->vid_buf.vbb.sequence);
 		}
-- 
2.53.0


--===============3307223758249983777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-media-ipu3-fix-line-ending-with-in-atomic_inc_return.patch"

RnJvbSBjNzUzMTk4YWQ3MjY1MDA3ODZiYTA0ZDY2ZDUzMWRiNGMxMWUyYjAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2ZXNoIDxzaGl2ZXNoQGV4YW1wbGUuY29tPgpEYXRlOiBT
YXQsIDI1IEp1bCAyMDI2IDEzOjE4OjU5ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gbWVkaWE6IGlw
dTM6IGZpeCBsaW5lIGVuZGluZyB3aXRoICcoJyBpbiBhdG9taWNfaW5jX3JldHVybgogY2FsbAoK
TW92ZSB0aGUgYXRvbWljX2luY19yZXR1cm4oKSBhcmd1bWVudCB0byB0aGUgc2FtZSBsaW5lIGFz
IHRoZQpmdW5jdGlvbiBjYWxsIHRvIGZpeCBjaGVja3BhdGNoICdMaW5lcyBzaG91bGQgbm90IGVu
ZCB3aXRoIGEgKCcKd2FybmluZy4KClNpZ25lZC1vZmYtYnk6IFNoaXZlc2ggPGNoYW5lbHNoaXZl
c2hAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTaGl2ZXNoIDxzaGl2ZXNoQGV4YW1wbGUuY29t
PgotLS0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9pcHUzL2lwdTMuYyB8IDMgKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL21lZGlhL2lwdTMvaXB1My5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2lw
dTMvaXB1My5jCmluZGV4IDg0YzRkMGJmMDI3ZC4uMTRlMzBjZjkxM2I4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvbWVkaWEvaXB1My9pcHUzLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL2lwdTMvaXB1My5jCkBAIC01NTYsOCArNTU2LDcgQEAgc3RhdGljIGlycXJldHVybl90IGlt
Z3VfaXNyX3RocmVhZGVkKGludCBpcnEsIHZvaWQgKmltZ3VfcHRyKQogCQkJYnVmLT52aWRfYnVm
LnZiYi52YjJfYnVmLnRpbWVzdGFtcCA9IG5zOwogCQkJYnVmLT52aWRfYnVmLnZiYi5maWVsZCA9
IFY0TDJfRklFTERfTk9ORTsKIAkJCWJ1Zi0+dmlkX2J1Zi52YmIuc2VxdWVuY2UgPQotCQkJCWF0
b21pY19pbmNfcmV0dXJuKAotCQkJCSZpbWd1X3BpcGUtPm5vZGVzW25vZGVdLnNlcXVlbmNlKTsK
KwkJCQlhdG9taWNfaW5jX3JldHVybigmaW1ndV9waXBlLT5ub2Rlc1tub2RlXS5zZXF1ZW5jZSk7
CiAJCQlkZXZfZGJnKCZpbWd1LT5wY2lfZGV2LT5kZXYsICJ2YjIgYnVmZmVyIHNlcXVlbmNlICVk
IiwKIAkJCQlidWYtPnZpZF9idWYudmJiLnNlcXVlbmNlKTsKIAkJfQotLSAKMi41My4wCgo=

--===============3307223758249983777==--
