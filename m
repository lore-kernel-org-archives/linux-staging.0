Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30241442FBA
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842051; cv=none; b=EpP8yrjs1lY7OIXeHkuIBmk9Yhw3TmcQ546hnNvtTxvsBWaMoFgFVxbub/LMy2u2x2i+Car4u7K+5D2Knqi7HkmEVvUEotgCJ+yXuU5T4gwVYyLBp6n7Jwe+/nFvcQnf/DLksGLL+S5KKnKqwG2HvRoJ2EZcuHedGwPKgTr1678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842051; c=relaxed/simple;
	bh=soGcrDO8LVCJhZZutqWHY5M/ewsJR53cstOhPqDZmIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Img5UsxsYGQ+ITkf9Ur+JB8JZd4xbzW7/ZGYUsjWJVV4++6dsl65pGPQrDrQJh6hd4ZLfno95KUvbdGfUYmlfUCW2pyT4dSpjbTrPLcGjVL+0MePYW2m/KEIquwZdwSWz9v7xcI/WJoQnityjTZXL1t5/n8w85QUfJGHpBFErzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3tsGf28; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3tsGf28"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso2482440a12.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785842049; x=1786446849; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDeJ1eZ2UVo1OtlVo9NqbRA9RXNxkElEq+DmNTPQkt0=;
        b=i3tsGf28oX88OIUZWQelYsIGU/DC6yHEIg2MOTFbNtI+w/oksv7Tj/u9hYtG6Kge08
         dGiykUG+TMWDk825CiB8bRq/e9PQCidQUO5UT1BZEux+ed0rAwLg8qRZQstQ0tdilWK1
         7F2NJ/WzSkLBN8iQsFRF7GXMV+5BkWC7dTBat0NfkYUBrN/ARaQF9mHVhJITPpc+/lQu
         DFIzm4O6xozTH9drdB5V9LET9lxTRMvDN82QoSi88VTxzHT7cL7AmV86bu/Os5xS9KCO
         KUvkE4U97y/hrr65F4HIWpqi/Y/IPEO2DJqA8wURWvu3XETOzdf2FZr8dRGLh/yAAuaw
         v6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842049; x=1786446849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDeJ1eZ2UVo1OtlVo9NqbRA9RXNxkElEq+DmNTPQkt0=;
        b=cBctl4FiS6CeL2zvFr7ddmkCd+2gh76arQlzo+h0W5iojOv8ZOOz5KYPwaC+j2uUOi
         d5OwSZdKr05CZR6OMIwJ3ilvpqweNzZsmBffBeorAHx4EXUBMtDokYzqa5qzsivmT2Ov
         PSldDQqTHLoIhcCVaI4rh+NwCggop6rSImz7umFWJ+XWmppih6EgVTveHqbmYkqnCXcL
         JG4yPD4iF3o9ILsm/plVOtrR0Dzo6EYI5hske3idpV1X/tc8X4kzNKDZMkPTshhC51a7
         RI28KT9li8i9lxCMM5RMKzEXa2KIGVtxGp/Xr2rwLSo5BM290S2FbX7ZhyW2tf61dioU
         OobQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0jQdbRHsibCnJ/4QejUmQWsSnmTMND3fxsL6+osP/+wOpEodgy7MO4fJZzq0Nu0dC0yaFz4MTtRkLKhtk@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi4WK/imgai5c16/XGAIXy1WyqBdVrIuOjxozzof1NKP3zTvbm
	dGlWj4izgjbQLXhDJ+XlurLiT/VWc2LSNmipLqbguILc18K2TQJF64xG
X-Gm-Gg: AR+sD12ixSWxvbs/bFg0o0OlW6DDfaQMibuTdEyEXMlEa3n1WqLLIOkSuTRuBCsqwZT
	lG70eQUHPybfWen4K4DtNEVzn6BbuTV6AhnFDQCLXgLkQH8HBU6eTvEuTvQwv9PE+xpbaCPAi8h
	FqEKlHjIylfXiRAGyRJHrvLutNAf2jU5WycDHHVexb6J91zRqBCPFOcTMdnViuhz4LDn+z88v3R
	QDGftMu4q11yWv47Qgq6q0l+YKqiQV7o1PMsfLMiHevPbnzTvguFqB1SASaBe44mHeWj+llFCxG
	CccaagSm+C2RIfiXEYv3AeJeMHRzdK3/W4widrDuI8Cc1/Dw8+49Kp94afEfciHOa99XlApn+hj
	JDx9d6fXlzLA68J6wveLAODO5kvTLWCdmvAVcSF4gdFzy/+oRzI0Ynbt38rWWLujiju9zIfKyK0
	vNYG/+g0hg+tTlwz9Ylmr3JBIPDZS3DoR9Lb1RzMrTenxVyerB02Rva79McaOsK2G/t/OoHGZ1l
	phBJbU=
X-Received: by 2002:a05:6300:220a:b0:3c6:5770:9a16 with SMTP id adf61e73a8af0-3c92a9a4cf7mr13396298637.75.1785842049276;
        Tue, 04 Aug 2026 04:14:09 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586777bcfsm6318175eec.21.2026.08.04.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:14:08 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v3] staging: axis-fifo: align arguments to match open parenthesis
Date: Tue,  4 Aug 2026 11:13:52 +0000
Message-ID: <20260804111352.21257-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a checkpatch warning for alignment matching open parenthesis.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v3:
- Fixed DOS line endings.
- Shortened the Subject line to comply with checkpatch.

 drivers/staging/axis-fifo/axis-fifo.c       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea..ed09be2fed4 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.51.0.windows.1

