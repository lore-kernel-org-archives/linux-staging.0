Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1642E3FE
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711626300; cv=none; b=fYkLyHML3Dci8dWZlwBSzA7D02x7rouyG1whLYSpzpIlJjpwWndqX5kyGICrLGSqMIsJs8RqUwhF4I07rEploTnerqruHjC0RHT/Pp9/TSRC+aa/EIlttvSSHT3UVNByab/Ar5/Cv3N3DweVmb6HfPgvVozRT+bWROWp5mY0VU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711626300; c=relaxed/simple;
	bh=OYM8k1EiWPWpNf5LRNyDFFCvXpyMLeqLULX1HXll2yM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GD4OBDWhT7/WGRfBaeBuV0bpeZ2s8N0pkZQTpi8An5A6xk9+U5GriR9U8yc6JMfFTsv5EgVl/Z+sjUiKl77s8TXl7NZP55dLlQ6NyA3CC+zRgotKNEICLUonIRDjE4GHQcpLAQFPrwvzMuuyWWEaRIXIaWpSulH6wukSm9TPmFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNb3aJlV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNb3aJlV"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513d599dbabso1041403e87.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711626297; x=1712231097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9MZemIHH/wBwBEQSnrQYLhJvhCNeO4YGhKFn3AbGPg=;
        b=fNb3aJlVCqvXn9qmOfGoULeI+LEc4eDEiyGBZlrMQiL3wN0S8oa90oTy0UF/aXZx3y
         snwE+px1ZZU8EknjMzwYi2r3ejwIt6tGA8fft0M/bCx7xSAs1ER1hV+x+bQ+fN1/q/38
         a/1wgqXktRTzlLItj2amxSUR1vG7w5+7ix2NLEUCcN0iX7k2V8GhbbNcKXsNJ/h5wdzX
         rsEdZQFXNP0JdQJO8dZMO5l4C6LpPWmmRfgTGAdGUZz46KXusk20lVp2C3otCvhIjQF+
         JHTyPE/HV/vniHMtqgIQaWin+5yrC5D0VqXHE2CowoYXRJGHMtYlcO/OqG6tfbyzB1Yr
         Chbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711626297; x=1712231097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9MZemIHH/wBwBEQSnrQYLhJvhCNeO4YGhKFn3AbGPg=;
        b=ZNz59iSQ+S1Y9xg+33iATMonAW9ltvWfnUuLJJWE1Z9fm8Kf3+JyjH/rM6GDdT6LcA
         2m3eQQmg8dZxnhpKOlU+x5xDzi/pUwS71nJEkeIEqlAiKPbbHkljvHqz+zeSeBx7sBrU
         OimiLqTezYMa6FJp/wwtD59TQypmYVQBBAMu88VZCvxs+b9isrlQmg0cTO89CyxEg0Ad
         gwTC05am0FZuKrbIEfAm0m4hKhhr7GCB4saaCIsirW5EOxZB8afLjfLQofPpsV7ZlxvE
         hKMDhyvueemm5hqk+ZDxv+Itw48wsZSbBJn5yhC0OgemGqjd1gGNB6tccm6sg5ycr/fA
         BH1w==
X-Forwarded-Encrypted: i=1; AJvYcCWKIGczd1we4TB5adKUGiU76bGEkOV1Wonaefti3VUySMzfsvPegq9BNFy/JOTUiTLuENwzbEKRdWLGnhm4/BM4RULKnOXfeUI66cmVgQ==
X-Gm-Message-State: AOJu0YyFeCFZUoDMsjXZynZwijRNZ4Hnr+CUjdir/KYzY11WPb2bf5Uw
	Jad8XseMgxO+EX+6U1CcJ1Yejh2SL/+KMOcUTFY9gAY9Qh67r997
X-Google-Smtp-Source: AGHT+IGEl6kIo0nRaR4sdMsNwoiqAEZ+tfdSkPUMmYpwE3JGZWyrDnwFHzDvEeA7KMSIxgFR1yAEjQ==
X-Received: by 2002:ac2:504c:0:b0:515:9ee7:ce45 with SMTP id a12-20020ac2504c000000b005159ee7ce45mr1914760lfm.49.1711626296973;
        Thu, 28 Mar 2024 04:44:56 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id bp29-20020a5d5a9d000000b00341d28586afsm1581112wrb.2.2024.03.28.04.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 04:44:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: media: ipu3: remove redundant assignment to pointer css_pipe
Date: Thu, 28 Mar 2024 11:44:55 +0000
Message-Id: <20240328114455.762195-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Pointer css_pipe is being assigned a value that is never read afterwards.
The assignment is redundant and can be removed.

Cleans up clang scan build warning:
drivers/staging/media/ipu3/ipu3-css.c:2058:3: warning: Value stored
to 'css_pipe' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 9c10f1474c35..1b0a59b78949 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -2055,7 +2055,6 @@ struct imgu_css_buffer *imgu_css_buf_dequeue(struct imgu_css *css)
 			return ERR_PTR(-EIO);
 		}
 
-		css_pipe = &css->pipes[pipe];
 		dev_dbg(css->dev, "event: pipeline done 0x%8x for pipe %d\n",
 			event, pipe);
 		break;
-- 
2.39.2

