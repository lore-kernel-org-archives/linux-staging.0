Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5172144D7
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401713; cv=none; b=KBICU34nEXhO93MPaWrY3Sf9i6OxHh1Es/qT+fkiQzrQrCF68F5jugSFa6DnbSiOgwMFbUVF69HEF5vVySDFC8hsXw3KETOrmqMbe8o2YHgkKsCNgdqKRef+U9xkbdjaYiwkiqP0upNvrV8QexINC9996AuZswQli4Mkcus/lOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401713; c=relaxed/simple;
	bh=6Vju4WuBYujdwwUknrIoV3hgd3eTQWzETrDWZgidYyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgTzQ+3PM2X5Ya/VCqafakSiW8qlaTBoMZXAKvZvydEl5/8AzmCuS2XbcEY38sDzaPEKL150J1iq2AIrVCwWiNwF8DExA5u0qRMyfCwHHBqdWccKp7A5NfsQN2PLXjniXTr9dEHOqDRcah1GRw1eqgwZad6Q0LKKM3WZpMbCJxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8YPIf2C; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8YPIf2C"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-505a1789a27so23070821cf.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401709; x=1773006509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJt8UsvRPDd6WYsmR7H6xt+Tl0nUgDLLhRSbGSXufGU=;
        b=Z8YPIf2CQPMf9L8XV96DsxGJaK6ujujChgs8vm41IPLtqAGYL2tqYcmJqvKAwRkTHF
         1QN+ZGRhqlMVq3ag+Ia+JT9Mhma7RmhV9ZoPKa0iIqFzf+raDNmn4mRkTCkWdZRTxwGm
         vqKQ9elR8CWrzdhGkrxiPoLXL0NqTrbTu0JU51CaC1OJyfDdfUHbWHCDd0Bp10qrQUqf
         fjwbA0TvDA9GrDX0ZYVDH1BtHnO9T4ZwWKKlQ1QqeimYPmgxoWS4bs1a3KDI1DEQo6Iv
         9jvBzneF1dho3BhLI/Vz4IZSOE0p+jFIA4sgIeh+lEcT5Zi4PZm+RChzsVFJ6hc6xuwC
         Bt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401709; x=1773006509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JJt8UsvRPDd6WYsmR7H6xt+Tl0nUgDLLhRSbGSXufGU=;
        b=eM6ItWAH7bByBXzSRwaPFDeFNpoa7Txyv4lNvYmhcd8HNFVFFM7hlCr9nv57h46SxE
         fGHgwcWOGuwevqG3Dnm2twU9Y/Kk/8GQMIoltQ7uclSr9tE1maq+Qg+6l+4Fszmz8wIb
         M3Iz7vdmESwrGo47ZP9ftdBnWD3LVX8HWJhm88LUCeoSU3pr8xzsSinRjJXMY/lCS0SH
         vcMvLWHas8jELsGsjL3ozqvWB941L8nIw+mRyMsxT+zoxcWpvIu1tNrDl4uEUdtv2yra
         osDlfIT3V8WJZLShv4nfJb8q+1Fa6amS/Y4LZcgYEhZnMAiO0lnyADcQwwdNUIdVf3Kx
         zq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtuD3uCwyvVkgiki9ToJrka6OtMIrCCs3k/37oBHoZR8Zd91MdR8dBOQXl8ERbWLYcKnZ07PAlyIckpff6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5VzfSBEqti61O6QnoF5dZMnnjVLVuMkkl7udkBCq3YicpJGhi
	fHX8OKBmKhKyCzKib1r1wyTDd/7vBTvRvG3HftSJZDrqvwTiAVksNxyJ
X-Gm-Gg: ATEYQzyBcp7ebGFRDMKsKO7hLeQPjN/jkRZE/NAv2CdmzFsaidvFPNQBL6JAVKvnrpw
	aNeZmF6QdC2ZwbuTYgke4KZtQY573Bb34j94K/DM5fiFMH04HZiAmJSGwOXsUkzHEPjCS1Ja4EF
	NgszueUUKU5ddAZiVGjpARiDxQpgupZPfS/u47fMp53K4pc80oF0Rrn8QC8E1QRE2lDP2wjgTkH
	r5qHlnSvH1JvhhIZ73yHe2FCK/XNRjkeK7gowbd8euR5nOcJdnkHnQp2OW/geFcB/FWDOJdF330
	laZ+svlNnmMGBU1vLj5hHBuRqCIbanfQzaPEbjdUvzDQXzgmhAzwfvFNh17vR0nWJ8HySisEQdI
	VZyq7JdD7wJZVdmqGr+zrVFg9cQAI0p2G1MfR5e7Vb0wduux2l7D4Vv+dE4Ltd/3P3H+qFIbc5S
	WuyLvaYMnC6w2gIEeWWZHR3T+uyvwDwb595gK+ZnvdiIAZQZniLutc+F76jg844uATNYiGZiDuz
	xUu
X-Received: by 2002:ac8:5850:0:b0:506:9944:8d07 with SMTP id d75a77b69052e-5075289d6femr161602771cf.25.1772401709393;
        Sun, 01 Mar 2026 13:48:29 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:28 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 06/10] staging: axis-fifo: minimize lock duration in write
Date: Sun,  1 Mar 2026 21:48:11 +0000
Message-ID: <20260301214815.2628942-6-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

Memory allocation and copy from user space with vmemdup_user() is
relatively slow and can sleep. Move it outside the lock to minimize the
time the mutex is held, reducing contention for concurrent accesses.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aad2206b481a..d5533235cefc 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -233,9 +233,15 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 	    (words_to_write > (fifo->tx_fifo_depth - 4)))
 		return -EINVAL;
 
+	txbuf = vmemdup_user(buf, len);
+	if (IS_ERR(txbuf))
+		return PTR_ERR(txbuf);
+
 	if (f->f_flags & O_NONBLOCK) {
-		if (!mutex_trylock(&fifo->write_lock))
-			return -EAGAIN;
+		if (!mutex_trylock(&fifo->write_lock)) {
+			ret = -EAGAIN;
+			goto err_free;
+		}
 
 		if (words_to_write > ioread32(fifo->base_addr +
 					      XLLF_TDFV_OFFSET)) {
@@ -252,21 +258,17 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 			goto end_unlock;
 	}
 
-	txbuf = vmemdup_user(buf, len);
-	if (IS_ERR(txbuf)) {
-		ret = PTR_ERR(txbuf);
-		goto end_unlock;
-	}
-
 	for (int i = 0; i < words_to_write; ++i)
 		iowrite32(txbuf[i], fifo->base_addr + XLLF_TDFD_OFFSET);
 
 	iowrite32(len, fifo->base_addr + XLLF_TLR_OFFSET);
 
 	ret = len;
-	kvfree(txbuf);
+
 end_unlock:
 	mutex_unlock(&fifo->write_lock);
+err_free:
+	kvfree(txbuf);
 
 	return ret;
 }
-- 
2.43.0

