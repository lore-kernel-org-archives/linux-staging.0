Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6AB1CF7D5
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773507377; cv=none; b=R6qJIJSJytE9Q1/1yGLZDGdiypxDoc1e6E3agaUdM4STjQwVNfZ9NljUjEwzN2H7DJrWcQUfm/FHbHlq2qTBgrGrMhz+SaUcGqz9lYfmnjxbiZNldY2HQxkSGG6QD7K/esq7qQiuy5x4pLiwVpuRvVDbolGpkQvANlTWyJdoI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773507377; c=relaxed/simple;
	bh=eOjDVop+l6bLIQPTZ3A1OeIMyYENGs8gKnjnrQNl0lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1xmieQRQ0PiZODQ/ECAYDiNomyqLtXGLWu7tx0nyQfwgMsnMfW0L73Tk25I+j9OwG82O2lIxBTMkLrLxIvQCmZvEiMtS+++XVBifn4qQoYWm0xvVKkLrzAa40q4bFBli/ptENaa524inSi2NVpu8K7MReLLvfvjocfHOixsB9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2Hm/fzE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2Hm/fzE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48529c325f0so23255405e9.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773507374; x=1774112174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFtt0Y22evnLOyyVLqWbGjszA04nZlgn4myQVXhuxKQ=;
        b=O2Hm/fzEgaf3GSLNLnsbkgzbHh9qvzHXeCsYxWHWXT2wSGs9WBfzPBdXJbbX3suao7
         qpJdLrUcvLyO4TQxPrp5557rpDhO+VE6MYNguMjGJn/B2P0oA4TZVSDYrwpmiWrST90D
         8wApDFD1ietmNGf/BmOp8pEIp0v65Qpye9hc9pOit/tdTnRSGs1aH4jt1owZUguDQt6z
         4hJwlWO1y2U5OGfBFE9TMhcqSfSkqhpVM6fEihuyxvPdqY9q9f6k2SnbVhgV5/N288IQ
         mvCYiADe8djrAZcK04lU+OGsGxLXs8M3eFPgVgc4OQQehCu/bOhzcfZYmqVSnY7EfqNR
         ayhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773507374; x=1774112174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFtt0Y22evnLOyyVLqWbGjszA04nZlgn4myQVXhuxKQ=;
        b=ZZDyOFLyA+Lg0Wzuj5Oi9HVypJNp3rbP0Oy2NfoBeO7FoHsMyC8ARgHICw6p7Gae79
         BRnfvuvFdPNfILo9NAAQhxvXGJYgc3VFnEUR8wvwo9J3xYzPV0IXs7FqPVM0BM9F24mt
         OKqgcvl+W1xXMWEWxXCQRquCNxVX4+XALUH1Gg1iGgO2z43QpdsJjk+JtmjMSdLHKWRO
         nylJKUzrb6mzasbcrrk/HA1slrNqfL397QqSJ10+P/0W3g0WWD9E39uOOe5QSxhdb49F
         ZqN+sCGgfQVIHd1o04Fg6mFeX+mKL4AIm89uNL8lXIk+EE+MQz/r9clNyCISLynSWZmT
         T5Sw==
X-Gm-Message-State: AOJu0Yx7rMLEBRZyBA41d9ThLtYdHSYC6EyoZ9dp5vPdXL4RzP73jybr
	dhiAPjJW8sCS+nJVyKHQ+oFEBG27C6W56cEi5dfM2PfSeynS2x/gNwPi
X-Gm-Gg: ATEYQzyhroLc1Nc6oj2zD/oUOG37GmbVR5hCCKsYr1wyuL/TzQjgtnYb0EoJw9RhC9+
	rs4XHS4p0x93SP5Kfwef/BPqVTGO70N+DSyKIKHOlHD6ioN7SCXp6e+LI5JOV8w6mECTQ2wVa6a
	7MNMocGA8Og2yK83d3uFg4vg3Q7zTDt7CiaNBj2kQc3kmA+n4BHPKMzVjpXunfzPAyJwKenUSni
	dYDVvhpa2vJlA+AR2cfQkg2h9M/oa8xiIIW8IeVjSwzxAd7eCqx4Rm1iqV6qCl4+kidalDfW7e2
	vhnmhOLHFk5FpHiJSMXoF03jsBuF+JMMAvh0ZYGk6OKjL4Z4evxp9q/Tq+5N3abI8o4+NzJQtki
	Cjh3GoeqeLjDeqhLvBLlM0iZwuwqEFuLMQ7Swkalm3m+Ziuk0mbfFU5A8JzLfyXZuArBmiA87Do
	Va78w6pXGiVBtjEt2r3slqOrdTEY6C5lhTsw==
X-Received: by 2002:a05:600c:64cf:b0:485:4388:3496 with SMTP id 5b1f17b1804b1-485566cfbe4mr117360735e9.11.1773507374132;
        Sat, 14 Mar 2026 09:56:14 -0700 (PDT)
Received: from potato ([31.176.162.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6b95sm296756885e9.6.2026.03.14.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:56:13 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename 'status' variable to 'ret' for consistency
Date: Sat, 14 Mar 2026 17:56:00 +0100
Message-ID: <20260314165600.17146-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel commonly uses 'ret', 'retval', 'err' etc. for return value
tracking. No functional change intended beyond style and error handling
improvement.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..dbcde683789d 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -345,7 +345,7 @@ static int rtw_drv_init(
 	struct sdio_func *func,
 	const struct sdio_device_id *id)
 {
-	int status = _FAIL;
+	int ret = _FAIL;
 	struct adapter *if1 = NULL;
 	struct dvobj_priv *dvobj;
 
@@ -358,25 +358,25 @@ static int rtw_drv_init(
 		goto free_dvobj;
 
 	/* dev_alloc_name && register_netdev */
-	status = rtw_drv_register_netdev(if1);
-	if (status != _SUCCESS)
+	ret = rtw_drv_register_netdev(if1);
+	if (ret != _SUCCESS)
 		goto free_if1;
 
-	status = sdio_alloc_irq(dvobj);
-	if (status != _SUCCESS)
+	ret = sdio_alloc_irq(dvobj);
+	if (ret != _SUCCESS)
 		goto free_if1;
 
-	status = _SUCCESS;
+	ret = _SUCCESS;
 
 free_if1:
-	if (status != _SUCCESS && if1)
+	if (ret != _SUCCESS && if1)
 		rtw_sdio_if1_deinit(if1);
 
 free_dvobj:
-	if (status != _SUCCESS)
+	if (ret != _SUCCESS)
 		sdio_dvobj_deinit(func);
 exit:
-	return status == _SUCCESS ? 0 : -ENODEV;
+	return ret == _SUCCESS ? 0 : -ENODEV;
 }
 
 static void rtw_dev_remove(struct sdio_func *func)
-- 
2.51.0

