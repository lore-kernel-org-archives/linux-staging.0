Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F59405C31
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925074; cv=none; b=WZZbk1iQzbtWvw3+EIpEnhvxkYAOg+UjiPb6BW97dXGLhihUWalNzkiv3MK4eeakTHI89XvfG3GcsfuJA238VI+J5+EAcA0wWJ+zgN4i4ASx1ID/2nMWdS2bsyzPBXbiTjsy/RYg3wQySRSVT8jUGNGNcKjwVtD2ldpuPwgXILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925074; c=relaxed/simple;
	bh=glthZY+TeF3WuDE6JLbfWI0WRcyhTMVu3WnPkFcL84Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a1ZxxSoMk1/k61QJ8/OeDXPIDpqEv9PMkKKfYoCrX7eCLD2HdusuCHYkXH5/KBQuwOGuRlXsYeF7e02iN4ScgZpc1I4e+Aw0UNy6hvsRbRRiELVV0a4BIsep1EKFD5jfckFGBoxn05fxFDYjWpNnPRxYqTv2/6zfl4KQS0PjoH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFJHjE/T; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFJHjE/T"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so223883b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778925073; x=1779529873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WvQX8UThyFEgL4GFs7G4uznBl9OAkQJ/lHz8YrXfXY0=;
        b=qFJHjE/TdUFYLu9A45fyG6PZ7QCWPbDd6DAqbzgG7HwiK6S8T4xWnimv7D7Z1RgOYi
         tn8P/+eY2dRXepRANmb6/SCD7ceQRSAIbGkSyb6+LDbhc5OD06fnsSJiLERBToF6Iu3x
         ozhhnQ1mdmPhYe/edQSMTUKdnDb2h54MmJ3q0lh0uOyoKHG4I0KoVZqA0yrqrVKfoR1J
         DTa+zVFpye7PaPYZ3Pl4JV6RG3lQfV1ZTrqj1w5Tl51qVTdskf8vpydcvtwvE0Q2WQcg
         pyhfUUiBbXzWh7yZrKok0GDNOnP+36YCDwfpDOJedeRS00VXx6I8yxpq7MEWj6VZgYEK
         yF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778925073; x=1779529873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvQX8UThyFEgL4GFs7G4uznBl9OAkQJ/lHz8YrXfXY0=;
        b=N32lgm45A77N+cDfDQ5zgiT4balZQCgVKWVoVo/426vwHkZgOIbzzIOx/zZ7H6gsz4
         8hxQGViteQA6f3f7p3a8JDEME19kJmejSgwwCU5hLY6Uu9V53T2QhLTX20p3iOrfD64l
         tnQZjfGcj9Qt1Uv0x7lZz89K7Ac24mq+j6A/h0DE7M0zCFqXZhujQVUEuFsR7lnXR26u
         8MUv04YQJ4VPbAZZtl+N8PwnGGveMu5f9hks/zH3agsPEfA9CQzW8BucXwZVRN5yxKEd
         wfb5y69UEo/Dxlt/sLp1kbFAkmWknm7SWpXensthDcOHmxITlvj3jQS/s+Jy4wvGvd3u
         aNPQ==
X-Gm-Message-State: AOJu0YyebG9yt+0BcVNPvHySVvAL4u5ejOO/WuEzuQSaqULsscI9i0sp
	WyouEk3C86t5KhMKOLXWt/EH/A1oHIcyyb6tuy6uOjz1sVT6KoRkzDpFkvj5Iex7
X-Gm-Gg: Acq92OHxuG1L1+s+44F1jtxJCsCIU3W/DshejlrDP2Syk5VXafa15KHHHSyLlzUOVmf
	MDhVxmd5/3cV1U3Ubq0MthLVP75/K0CHmd6Dk5hk6QrpaKiGpMlAND6Z2ycvpVRn2gL0TRrnTHe
	iOiTNlzSQ6D2XD5jzFfFojpYI1xOWWwJBhlh/1/PekctopIBpA03bCxsixuz+PHRPvBaLEs0lkt
	cpOGO2j5jXl/SNLkgX5jQSChHhWdVGbhtS2dNXDAXqzq46VjVzFHPWaVNWfLXzweQ86ESxiqdDo
	xeGb/AOGZmHedCDHa3bp/dZDMGLYGlGLow8P3Q11ak91G9MwJ+xqEbj50oS6KYt9epiyOlPpISV
	qx1FYTqNmpa4KjguA2su6L/8peK36O7Q3SwquXK05C2NQYLh9Gn9Ns0zSPQimnKvBhAGb6kVqdx
	EB3OrXGrlUYPm1WHJkbtCRXm1i9w7eZRmziRGqp9zg0GU/8ZF/TpeqAEoFUaEf91uM3YGok3uG5
	CkUNg==
X-Received: by 2002:a05:6a00:124c:b0:835:3f51:72fb with SMTP id d2e1a72fcca58-83f33cbc0e7mr8232744b3a.12.1778925072624;
        Sat, 16 May 2026 02:51:12 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:d022:240f:d06b:67d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f8b8b3sm8111593b3a.59.2026.05.16.02.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:51:12 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
Date: Sat, 16 May 2026 09:51:01 +0000
Message-Id: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 803a608b74fa..987d05816c5c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  * 09/23/2008	MHC		Copy from WMAC.
  *
  */
-u8
-rtw_efuse_read_1_byte(
-struct adapter *Adapter,
-u16		Address)
+u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
-- 
2.34.1

