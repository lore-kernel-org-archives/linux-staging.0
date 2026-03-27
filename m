Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299582DE709
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608641; cv=none; b=t5GxncPvsSXVxlcxhbSkLgEYEx38CuQTDhgVyh8yDT21maNCiZ5Sf8TSqVl8GdVo+LZU7E4xSzkWhIrTI0OTXekjpFHEU4Yz3ZkMBZhgMlsvb5rZxdR5rx5Gg3QAzKVVljvdq4kbcfDYn/rmf9NuCVF0Pk6+WwRIUyfCR4NIDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608641; c=relaxed/simple;
	bh=Z2DZEbc/HJbX9tPdYcElOYH+KUedJ7Yn9mCwTu361uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tBpnh4XLGVLYKHycWrlPTSIcB82L6axfe1bfJFhN2JGzkNZYyoSUK4+kv2Q3nh/T1FYxcobiYuo2cLt7EMkCnI0VwVKbA3sfHabreZEk7aMgJGp/UxZNb5fq+0QJiQrv+YyyxUpDt1i3+l5s3e75pLV6ptkFl6yQC8+/yjeri3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mx3UKHnI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mx3UKHnI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ad9516a653so9364765ad.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774608639; x=1775213439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=36slu4uPf/LlZgfKyM62Yz3R3RYFLzUO4BRkcsqkies=;
        b=Mx3UKHnI2zLzuflyiBf6hCa1mIHS2cSWIz12Yd3hrp7f4qFIB3DjNPDWo+l5MrR9vW
         VdyoBqIniUlxgSfiPQ0dSDhekT2ihw/atHNPl3My9wOA2v9oUsXLNt+sgtuHA90PGpEb
         /ySRT45G8G2FysoJ+IDms8nBfVR+Wic9rp/+QvjuytsB9Rz7HgWc5dm166pvoHaNqh9A
         DTg8bcL9DTBIPJzOeam+ZFzDeSd1B1Uy7xomli6iRgm2weAUdGfH0PUJQDuY/4HE6c4x
         rY2StC6BjKw2a8DQ1lExceKYuSvxQo8cvIaD5eZKzvql/KQa+FuUhHX58eIJ1jeFYuwE
         vh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774608639; x=1775213439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36slu4uPf/LlZgfKyM62Yz3R3RYFLzUO4BRkcsqkies=;
        b=ncVel1KYUGon+EAlM4AainFfJo62983tLZRL7w17iBuLV/e2XCid9c2T43GPgt2EZX
         ceCh9W4ezDdEua2EvzZXRmXQMcufsNHPB0KfyQ5EtuW4/s635V8uH4Bg0F91NEgvRC7A
         5i88Hy//fEQRUCAhL7r2UfPLS2FmQ8C80ahZaX9AylPGK5bmdVZwuBf+BPThO6ooK5Ua
         p6GNC+ZdTwDr8xVyd4aOdWjsgRhMed98F/VDsfDUOgPviz5F2J35FyYV3Zl3iao26iV/
         lb+EzhEKlnQu46br+DSFk9P8Fu9j7wP2QGWEVpVPio6ZOPA8K8We4x7pog6MA3bT18a/
         /2ZQ==
X-Gm-Message-State: AOJu0YzPNyrhGrDUg7z0d7Ub/oTEeNt+yuWZEe1G9XNSS5Q7WLE16wrm
	Qk+BgN5PAnA1hLXrjkNI6gX5rYlhwDCr82sLT+ICsXex1riEtGEwCYgQqPc3l79S
X-Gm-Gg: ATEYQzx3l9r3ZsIOzAIFlPpqfTET26YdLick2Mm4X6NIcZQ+58FXe+2b8HPOoMS3TAn
	2KueTiuet5XFhmIxvjxnWJiK16U1bTQ+1nvvIGNsJtKGrIAF8l1Z4lqMR9k8OXWiHFlfTdoUTqP
	fyh140+YgPy6SGDoEFT6inOJNUPeyslEoeU5FDUC5JNQgpIoH0ePUeLwSw+XXMncTzIHgkkPXwY
	Yph7msjBBqrwldsE3tcUo0qBT6ywyjVrcTPNyO1FrWIbJnrpZOH1OBZT9GoUnEUVMJFm3IWCiju
	eslsDLTwJDrwnzTdVW0R870QQ3aAUk4shwFu6Wc8u9pnaqdcOq3XzdzqCh4+RDQ6YUVw1ZsCXbi
	Jo+STuasimNEide02irFVxc56pp3eReUiO8b/rjRgSAfAXVj9KsCSCeZWjwi3Eq95DENB88A+UW
	Y97NBGI3V4Y9CZCI/0he5cUl1QacDoGcuutJ8I1EFM57ptV6qjbqrvVQ==
X-Received: by 2002:a17:902:e802:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b0cdd1a6b4mr23947185ad.42.1774608639452;
        Fri, 27 Mar 2026 03:50:39 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e97f0sm55906115ad.67.2026.03.27.03.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:50:38 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix spelling in comment
Date: Fri, 27 Mar 2026 18:48:42 +0800
Message-ID: <20260327104842.3106-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "co-existance" to "co-existence" in comment.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
v2: Fix author name format in From and Signed-off-by lines.

 drivers/staging/rtl8723bs/include/hal_data.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index b87c90f693ec..ff4383e30322 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:48:04.333064200 +0800
+++ b/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:49:02.478348700 +0800
@@ -385,7 +385,7 @@ struct hal_com_data {
 	struct dm_priv dmpriv;
 	struct dm_odm_t		odmpriv;

-	/*  For bluetooth co-existance */
+	/*  For bluetooth co-existence */
 	struct bt_coexist		bt_coexist;

 	/*  Interrupt related register information. */
