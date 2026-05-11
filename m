Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A847AF75
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523649; cv=none; b=NNiU0J/GH52liPHOwbLSvhJ+mcbiVt2IBY5UngzGCnArUsL84zZRiPEprZqBCZiWggVPhGahQ585I49zMUVAh3tph3Tnjhqw74UUlw6Dcwwrd3dRxNOW3Y2Ypt6DUZ0AOf+yYCaypVEKvf/hLDOUCNHzqTx1ZOIqxfLklt8Wa+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523649; c=relaxed/simple;
	bh=79PkfTckiFPU+rxHSUt8uoNc5cMjZKb32UdYDlzX+Qc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tWSJ78yQ2AwN74I8EURaHSJm5K8YQ90nnfdb4cJySyRXsWMIo6c7m0dKpcbpeMKH6r75dMQ1/r0HKeNq1Fo/9mtAB4GXH/0SfH5a51AAPDfDllGG62AOpTIuZCZiUwsMynfYaD6iazv9JVwHZDuqITOIvnl9urbqOJTERcC0ojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WS+m24Pj; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WS+m24Pj"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-130b2295ed0so12398945c88.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778523647; x=1779128447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBSqgjkt9k8y7wJ/zB8g6auqD5A4aTvpF4DiG/B/VBk=;
        b=WS+m24PjBlXwyVqUQJc5SbKeyWgNMZP5fT2TUe41TPSYp8wUM/z6A8Q5/YIrk5/jDf
         FEiHzrjanodI+d8yCsYPROPGXTGJzqCG9jBhkuH+nZymrcFcqy5BDGfcHzbjv8NnLavz
         XjTWveBw35+F7zOIaNJqsDsM/CULq2uNhfOm6yK+gMQIV0JGx8ANVTYH4bL7GNAaxypC
         3687zhViS+JWGpbGm+JhAU2TCHYSlJHcxSMGh9nemiaXLNLSft5En0GdlmTdiZxl031F
         PwYazG5pSrHtmSAs+MxlgQo7ZEz1vn8JoF90B6FC2cXmqL3Y0eYd4hEoF05dBGyMZLfX
         ZvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778523647; x=1779128447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NBSqgjkt9k8y7wJ/zB8g6auqD5A4aTvpF4DiG/B/VBk=;
        b=Wuw356nNrLih7TBcOXFBZtDsf25OOoiQlxhlR3qy+LTddJJMhSNDyg35DoNXVI1an4
         lJzTSAlGu/4yGmu0nrsf4c+5ge/moIVjQpUqdexNcSuk0c37h/5qujfGDkkOFmKXIRJF
         CCC2wUeZXk29Yc4rKzlGB/bgE/ZajLo5RGifecBawf2LctNhhCUqSZq0HrX8YfI/ATRO
         G4QLGK6WV1qhRh5FpC0RgfxMTB9DaoQjGwTCrd+pcnCeNJcUmhnDw1EiIGBaSAINecR2
         0ZdUiJB+e2Exjxp6E2BVWdeG5w98zjrTf9ZCmvHq6wquAP4TJAzhrRyugQciqiRPTtPi
         J4tQ==
X-Gm-Message-State: AOJu0YzfSRUeqUc0PRxBqPmFWnLP7q0kJNEk9pRQaWeVz3qMbSOZsnNW
	D2GI9BtsUcMdAo16J/+7YxEyqYdbGIhpTEmHvYYxnqRKmr9h3b++mIBlueL9mQ==
X-Gm-Gg: Acq92OHzhfuCBbd0Ws94MqfBeMVVJ3PY5nVZnAPJXTE39HumppL+0/Dgs6hD0MRin3D
	UgJ5Izey/wdX2WaNBq04nlo2J3x4UmaRxJfkzO+O9ILZEq0f+vcLaLzBqQz5tEYh/+nqaxYyYyT
	/yUmqPHOz7sxYLXnJXOdPUSZoYAwTObJYZt6qRSpaiqNDlhgp8ZbTHoBcLy0REP9P0N3d5YGy2l
	p0PHi0LM5yV8c6vdRwZQod61W73fENfWM/Wow9zgNDLqkq88zMfGCaSpsIQyz1T19UV66WSETSg
	sQ1kQzOxn+PKkfRXb7if/AvQziT7xuTSuHBId5uidU4MhiarPuXh+DDInAW/5+HDN6fDPt7BqQi
	JlySgRQA3HdlzEU30ltj9WffRiQHRqGEpzChIHQQBseDutvsFRn4zBOBgdXhFaJElu4mBdLIuCe
	Ok1JK23nUglYfadBiFuUnq5xCRkXO/MvjrwvZk82u/dhM=
X-Received: by 2002:a05:7300:f191:b0:2d2:ff9e:c07d with SMTP id 5a478bee46e88-2f54b267910mr11871802eec.24.1778523646599;
        Mon, 11 May 2026 11:20:46 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm17951816eec.23.2026.05.11.11.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:20:46 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unnecessary blank lines in rtw_security.c
Date: Mon, 11 May 2026 11:20:38 -0700
Message-Id: <20260511182038.6625-3-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511182038.6625-1-guojy.bj@gmail.com>
References: <20260511182038.6625-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines around braces {} to improve readability.

This fixes the following checkpatch.pl checks in rtw_security.c:
- CHECK: Blank lines aren't necessary after an open brace '{'
- CHECK: Blank lines aren't necessary before a close brace '}'

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 50d8e30f7eda..0cfd7734c174 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -123,7 +123,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 
 		/* calculate icv and compare the icv */
 		*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
-
 	}
 }
 
@@ -198,7 +197,6 @@ void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst)
 
 void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_code, u8 pri)
 {
-
 	struct mic_data	micdata;
 	u8 priority[4] = {0x0, 0x0, 0x0, 0x0};
 
-- 
2.34.1

