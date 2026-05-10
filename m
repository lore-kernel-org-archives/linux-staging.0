Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB752F90E0
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778399184; cv=none; b=lLGOBPra+S+7AeRhbKaCcF+yYZObw8/YJynoltnLc1aEW9Rtw0ep35imd5Tqr1o3Ky8F0Sb60GFzIIMxCLEtDwrC2KLq038D6uFhupjKIRR8CwCPlFdhWhB4CDth0tjDLVJ7FKTcyTQ+pWwTptXSPTqy9TfwS/y0UN2Z2LwJpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778399184; c=relaxed/simple;
	bh=krXGrKDl/YCg9ufNR1bO6hxQdq1JwjkfLXdNDUljbkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCUmDSr8CISbveu8EHVLqa5QBov9KpP5RCFx9v42reDgsPHpYW5tYqyM8w5tiZsn62lLHq8owSYk5nLd8z7rV7OI0Sf2dwdS7MA++AJ523+hwdeP1WsyCj57LlDa5PHzCEnPqUnOA8tsiQA+xyp+dmeK0bhNFftqbG8AZjNEB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=En9kmJIo; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="En9kmJIo"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c80227c9572so1438306a12.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 00:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778399183; x=1779003983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68HjT0r0URpGWCt1B0Ubioq53duC0QjuZw3UcjpYRCg=;
        b=En9kmJIouUsnLBfJYqk3PNJxfHanO/7WHx3v0OGPe7mvlbR9pt+Bs1XX/NcDXreRTl
         ELtOwBdfoSB7kcEjnkL/HDS1Vf0+1FO8uamsOUcgku7W1KmrhuWA8zOdapBH95oGNhnu
         wPu3jTmtakAX73KSQjzkaHDs6qRP12LyWbUZyPtworCJuAQFkFrZSKRg8yQdxFHpRj2k
         QJmh3ivLimZDyrscyD+5Bzme+QSFMXWwebnO2HwquWl8HLqKHKKDk/sR8ByutKku1YdK
         eOuaXRsK/7xBNrOde9lRBnDuIUiiZ1SN3JhzOd2UJ34sRaWgm0Mpuj2/XFl58kaHhP9Z
         kvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778399183; x=1779003983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68HjT0r0URpGWCt1B0Ubioq53duC0QjuZw3UcjpYRCg=;
        b=kjiICkPKOO0QXk3tdJnRjPHp5uAlPJUItPyrBtBvrzZY+CI+TelvFgUBi3f6uoZAHF
         w92mWeI3QPCPG+cfsW1QqQgvNMjogJT/D+5R5Tad5V9KNENEXoNc7Z+MEHMpQVSc9XRi
         kNgp/kZeXrvgZ9j5c980EQy3Ai/q4m6PftVQG0jdirfy7PZ1oW/hCdrcbQckcSvrY1vv
         IprXYwxH9Ck9UN4pD7bSJgIp3XvRjsDJv/lEKyM4qUEwhCu78mcrq+9UCekrEHKKAf9m
         4UMX/Na0X3xHFfSM9BUDoiAkZZUi5vd3H4LcbAq8Ur2rEMREQtm1IvQgH7wOk57VWQ3b
         fKDw==
X-Forwarded-Encrypted: i=1; AFNElJ+1c40hzI5m+QSb4RuGCDpuMAyx9fPNINqTct/kKBsVF/KtGhLFP5qJGQzICN4qpTJ58Obph0mHpcIpkuaH@lists.linux.dev
X-Gm-Message-State: AOJu0YwNKrboAhv7tzHKUFP38mRNI9tpFr2IZjZ9KyV6GxwetRR+Sh77
	4HQTpSHQmCbEghy/LQlxO2aj+0eveZJGw4jyYhEQazjKQ67wf1NIyWCi
X-Gm-Gg: Acq92OFllW693RSv8FrKrQL+7omauwvqTib+0P/IM/KD3TlWs/WZFWBs39nkIz1ppLe
	KsxtQ64jS3eKEi1oHanENtV195yhO51EoOqAPOSf4eIrqmhi5bRPoIszCDTndYbyGyS4gfpeQWh
	QDExMjY6aWIaSZNGayFMt8xivduI4mblBAdgKqADY3tQazppYw/NxykIBhu8CH8k8/qzfYd2Z1B
	lZl1bJLfjMbOOfEoZnoV9ZbPM22lXRHqqZu/NFyoKmgyEBzoqU+3IYBrC4FuvuFxLraknpN8StL
	gBHVXVZhEAgtvcbqcp+Y+6YAN84abjz05YsANcG+xxm2mPzfpkky9D2lONg+y1q28Y6ZD1ifJUQ
	mXLQXakA7lUcWa5qssLWEQRaKDSTithPxY2Y9Br57QJwohTIvtyu8kjzcWCkg0nFOJUgt7pjtEL
	W+OcOFtxndBeDx2XbsR6tssEc+yYX9Pm+/ImpYE2o93gUnUlXbnXYcQAj3w4vnvGMNwRJxogiw/
	TEBJVfCm8zR8LMXftA=
X-Received: by 2002:a05:6a00:1805:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-83a5b2d570emr18447462b3a.9.1778399182626;
        Sun, 10 May 2026 00:46:22 -0700 (PDT)
Received: from viveks-box ([2405:201:d027:287f:4759:6148:a4d8:7d0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839681a9e33sm18618896b3a.50.2026.05.10.00.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 00:46:22 -0700 (PDT)
From: Vivek N <nagaraj.vivek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek N <nagaraj.vivek@gmail.com>
Subject: [PATCH] staging: axis-fifo: align arguments with open parenthesis
Date: Sun, 10 May 2026 13:15:47 +0530
Message-ID: <20260510074547.10003-1-nagaraj.vivek@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wait_event_interruptible call had its arguments incorrectly aligned
with the opening parenthesis, which violated the Linux kernel coding
style. Re-align the arguments to improve code readability.

Signed-off-by: Vivek N <nagaraj.vivek@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..e8facc9b429b 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr +
+					       XLLF_TDFV_OFFSET) >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.51.0

