Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6835E41C31C
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604265; cv=none; b=AIONQ8evOsUjFDy0qgX80rDJ2Vq8jmfu6cH1UNmX2bqaxqokiVE/JtiSQBfKYyq78nbxO3OB3tXejlBB1ZsuWrNLLI76+v82dWjDqP9Gq/09ACxR9HsVGX5b6RXE1wtegKK+Q97wa4cy+SS+IdSNjMR+pDS6NLqe7u6OePzQN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604265; c=relaxed/simple;
	bh=50F751gF+rXlNIyRBoGhHlcoVou6MOxU7OCNopSBl7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IqJtb4pHyLu0XPQpNDbf7ojXPU2x2WDwRj0fS9XySiLwwkrbFn9JF3W4EhlpQ7Oh3saK8Tn9nLmF7MvwTvJlA8m6gYILnrU8fxk5GNBfzEZoUpIvhotLZO90MKlEoaX+yBFpr/syrcVSnlnJImk/czqoKp7KykIoCGaUxvY6zbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CieueQkD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CieueQkD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8423efd76c8so3094064b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 03:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781604264; x=1782209064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WqqUitEfH9e229osynsO1JlKCUb6fQkndIHrjVVsHs=;
        b=CieueQkD2WKR7LPmRzibrTEJIBrKfrSetIXcH2Rc3+lHBEeIviStQofnKGDij7uqsN
         0ur3f2NE8aE+m9CxzK6bt5UAOOA7nkNpjEt3tcaqqgfrybA0+ddFiF7NOt3USQ+jm++q
         dhWz+FIcM9yW9Dog4DuKEOmsfRCeX8HwG5mKDmjjsJay0JC7qo/pixoA5FaxdJwGYPhm
         9PbwlhhXhvc19B2vPhcV7TSklXmi59fVu3OfYPgLGcCvQTuVEfOf67Yzukwwm70JE16h
         C/2gFwN4G18MfjCKzQ5i2zBPLpufXvcD5YsiGONy8TNPh0cL8kmlCbHJIrBVFNjEn6U4
         +F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604264; x=1782209064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WqqUitEfH9e229osynsO1JlKCUb6fQkndIHrjVVsHs=;
        b=JbVUBGWwMAyHQYLVrGGK1StfLJ8aqgKgBWjVQ788rQl2smF5d8IBbW0gCclX5pNIMv
         e302C9V90U4vPj7Vkor1tXMdvhL+diQDq0iG1RDne2yCjBvY+Ziy94YZDBsgx0yi92Ro
         6aZgbhQ29O6imGVt6aooVHsY/8OpBr1Dd3IdFj9qigLvluJ8ZnDQu/LWl9aS8PqD1KS+
         bof6lvhRT+hwidaXd/vw8waGZff+hDmO3fd4GbkakkmqI7XiuJBOu7rjwI4NqJ/q03Jb
         Eca4VUlM/Jnq5jlc+JP9T4onG17GJSpU3gI9LlYvXqV4+dtv2wcAuW1ZGZva48iS2aaf
         OXig==
X-Gm-Message-State: AOJu0Yyy4CunE1Xkd89w2SO72FrDUmdMAVugNePrSQJKpBnhLvTs6A/h
	vlbuxPelYYvUqFAKIiqG3Wh6fqvnezenZww0Mmp39jw3u+NLMCnhz8uw
X-Gm-Gg: Acq92OH9V4l3L1e8Q1Sr86mdqgP9V28jm1JGdxo7PFBUE3QMeYz6iE7x3fqHFi4KxFg
	WtJv9cBjapJvVIeBeRUfPUCwm1xUukXWG9hFzEyqpT0+og1qTR+wRGma2oYGFkE3o8m3feqSbdW
	UeM03wdlGfdxQId6DnNngJwyDn7AX1QXFsLf8A5q5AiwD/NmMm83Q6/OG8nnM5BC09U/dFfJ95c
	RCfZtYqGfHay2LzYpPYcbH0IZrBBfM/OHKF4PCd9PB92rALWXah8IQOUVUDz2v2eSzr9CBTXfVY
	vCCox6tY9xB1ly7OrW6eq/b6bQA9J5IPI9R7xvinNpT8Ckv0SvwhLQ4TYFZ4bmCwjR8YF83VWdn
	w6f3NkvjRxThDvtkUC2fglxQoLmx/uinixTZeKKKxd/m1nUZwUQD5gzRwhjfzbWO8uMJcp06vbk
	83Ml26mBS+NsX4VeurtjFbvr8=
X-Received: by 2002:a05:6a00:178b:b0:842:6c02:2fa3 with SMTP id d2e1a72fcca58-8434cd4b6c1mr19659359b3a.15.1781604263819;
        Tue, 16 Jun 2026 03:04:23 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c4c0sm11438860b3a.3.2026.06.16.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:04:23 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix multi-line comment style in rtw_mlme.h
Date: Tue, 16 Jun 2026 15:33:37 +0530
Message-ID: <20260616100337.38230-1-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block comment was not using * on subsequent lines and had blank
lines inside the comment body. Fix it to comply with kernel
coding style.

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 33 ++++++++++----------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index dbb523c8a58b..59b12d9daa71 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -67,23 +67,22 @@ enum {
 };
 
 /*
-
-there are several "locks" in mlme_priv,
-since mlme_priv is a shared resource between many threads,
-like ISR/Call-Back functions, the OID handlers, and even timer functions.
-
-Each struct __queue has its own locks, already.
-Other items in mlme_priv are protected by mlme_priv.lock, while items in
-xmit_priv are protected by xmit_priv.lock.
-
-To avoid possible dead lock, any thread trying to modifying mlme_priv
-SHALL not lock up more than one locks at a time!
-
-The only exception is that queue functions which take the __queue.lock
-may be called with the xmit_priv.lock held. In this case the order
-MUST always be first lock xmit_priv.lock and then call any queue functions
-which take __queue.lock.
-*/
+ * There are several "locks" in mlme_priv,
+ * since mlme_priv is a shared resource between many threads,
+ * like ISR/Call-Back functions, the OID handlers, and even timer functions.
+ *
+ * Each struct __queue has its own locks, already.
+ * Other items in mlme_priv are protected by mlme_priv.lock, while items in
+ * xmit_priv are protected by xmit_priv.lock.
+ *
+ * To avoid possible dead lock, any thread trying to modifying mlme_priv
+ * SHALL not lock up more than one locks at a time!
+ *
+ * The only exception is that queue functions which take the __queue.lock
+ * may be called with the xmit_priv.lock held. In this case the order
+ * MUST always be first lock xmit_priv.lock and then call any queue functions
+ * which take __queue.lock.
+ */
 
 struct sitesurvey_ctrl {
 	u64	last_tx_pkts;
-- 
2.54.0

