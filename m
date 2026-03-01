Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142142AB7
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 00:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326720; cv=none; b=b+/EC0DCcgmZRH6awqQEX99jgRUeqr6SLSUakmYMeQz3C+Vk13D9iq4DMUYONWvGc3AYp5qvqFdZxe9uL8IdseaxNtzliS5MTGnrZLpjSGE/chivSjZeL0ol4Myx1pbxGv+u5L5LJfT8PgKSdFi0GDCe2MFfqWWbucY6Hedz9GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326720; c=relaxed/simple;
	bh=B1Bz8rN1olLWHjb0G18m9bVGap3xlfFJifTTlvK3rAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HYKipZXI3T2e/9bJ26yWfzO6GSnM2q5ENxO8//q+WXV0DGW5/FbXwIaJWP3s4QWFBEwwE07z0h2L5r4NQd40LAYvhHZoi0zlI/LHbV0BOsv8JfvOwnQ9NHgm00iK29bDCiQ9O+EudUNKUu+lpT0ivHRFrJHFpedi2u2z79q0sqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwkhyGjg; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwkhyGjg"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb20bcff5aso324590385a.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 16:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772326718; x=1772931518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJwgCwJvzZMG+myFSc9GjI6pVVMF0CC/37KFN9Cw9mg=;
        b=dwkhyGjgAPTQ4iba5e4K+4GlNWfBBPCAp7sYQcnT+5LNAtlnrX8j6vBVOzCOKn6swv
         CMB1C7UGBHyd21uWvFa7n/OjVHgcrj6ma5PmcBifIZuZUcO/HeJzpsao7AKcAeA17omV
         umaZKirOgMCRvDr+OfhV3H9cPtc7HPjpAeZkedAS0yth9ArZF1CUT0fzcIwVrUVq/XTZ
         E1GaG1ko/E+QfHk+GLJ16UUd8rNbbRPR0PEP3KBPQO05efRJt2N9lJgx13+qAK+3XNBC
         FKUVDpjFwzTFUmELFCewwtTedSJFomJrDs7VPBzCSw4vqih2LxREqoXk5TmdcLkpIBtb
         WKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772326718; x=1772931518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJwgCwJvzZMG+myFSc9GjI6pVVMF0CC/37KFN9Cw9mg=;
        b=qghm7qbzmM5YnQtL9FUYwLTrXD2aP1fBTsK9CelIPe+7mBGr+8c+qQF/4q+toGgNDe
         JVqEuJf3jmjB/K58RfQczzurXqGaVFbINj1RaggtfQpSTONhvA39lYhjeXa6VgpkJilB
         AplIy5DOrXSukfLq+99X7qYBIFrDwtli/lwAHtqBTe912smvSomw2LVZg4+WJIJeYpE1
         hloH7XwcqnXZsMMxrokfuqyvbGh/HvYkxE4OFzleXQkeaucYGNrhq8nplDEV74qH4om2
         51I7zT9G6Fu2xOoOlTZ28878Bak3ArXgzudqvgcixYlOwlRhudoO/OPiFVLQVQsSlbYA
         WMgg==
X-Gm-Message-State: AOJu0YyWOqaCnCKtEmOzaYmOOhKbLoavl9ojqnnPF+zT9cIh77Xm2Yb7
	Y7hctTww4+A5Qk7sSd3BhK0f7Q0ZSygiO2db9gQ4VTDyjaIX/MhqSaV9
X-Gm-Gg: ATEYQzyGOk8EcEbdjlf+wOxFnU720eEN2GNwayLN9xNfSjy9HmzZgtlViOloF853kcF
	SfsYWGRMwWstYCg3CJLQgt9d7PbDNvV29DiNWFXSIa9br3pB8GjUkOEQ2JBIzSf7P7ZqCZhdIL3
	EL9rfYceaE/Bj5c/nFUOuhmGzfqktYsLSuXQOrGAEN1OeVTn2cdf8DazNrowkU5TJBt5LdYi867
	Rrq9X3FTP3qEMe8OnHLXFb9q+YpOL1f5V00FnDSqe72fgk2dUbfyliqK/HBj2l01m7hXBqL5q75
	g/I46e74uGlzc0TD0cS29HtutNZd4wH3htf1LluCVB7CY2Twz43ge8HB/RJvSZAsiJ1rJB1xTcZ
	F8yEE9SNeUna9K7OpBLFQwgaKT6WO5t5fzWe/CdXJsnm4nBaQlHY6o/mXGz/PCTjDt0N6ngxfCs
	l1ua9HGjpgouBoBFEhD1ERxa/qy0EYbqa+4zr/oZdU4NwEehRcADbWiwtPlNsTaBHW3L675qcSw
	GaA
X-Received: by 2002:a05:620a:2901:b0:8b2:598d:6e66 with SMTP id af79cd13be357-8cbc8da8ecemr1022789485a.22.1772326718496;
        Sat, 28 Feb 2026 16:58:38 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e845bf7asm17368196d6.40.2026.02.28.16.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:58:37 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH] staging: axis-fifo: minimize lock duration in write
Date: Sun,  1 Mar 2026 00:58:36 +0000
Message-ID: <20260301005836.2513391-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory allocation and copy from user space with vmemdup_user() is relatively slow and can sleep. Move it outside the lock to minimize the time the mutex is held, reducing contention for concurrent accesses.

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

