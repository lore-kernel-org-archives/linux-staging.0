Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5C6FC7
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286730; cv=none; b=WDjD4wPc/7pc8zC93cbNo9A9ghqshiDkKZZSDVapJHAKMtAuQ3iOayRsaR5YA1Vc0v8a1PY/IGY1P/FCUycf+2LHBUubTi95QtlSlMp4LTvi3rGfCqJKrnMu9FAi7M75BTd4g+UtUSgDgY9ofms6k8pqKHKINAB4Ka7w7dFHm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286730; c=relaxed/simple;
	bh=Vr2owwfaggIp3VUywDxZaxpxBxEaCCsQ7ws0R73hY9A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=thXlOHvw6Wmx61wBbKvcKyOzuRZYAmOset/qX7m9c327QOeF2bGA6Do6AqTLkcudsR/qLkCUhZr/GoiXPzLzUSrVRciQ5kOP05aHUKzQATlUVKDvhZBeYsIeedbWJgZVpkHI3Gn7UFz7s/4t09MFLLZkobsQauEqCzBqquWU4XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwKlj52M; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwKlj52M"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-202089e57d8so1601985ad.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286729; x=1724891529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+hEoHL9J/nPYk5QLrqkOQS9keGcw/49+kaYJqoYRoE=;
        b=NwKlj52MxZWbOS/HEXD18yNKlPRUKCXNoYBh5UgpoyzoUBKNIcRAC1traRaU0cJVW9
         Vpa045sIYDsBs7yNA9ud58re0WAUo/gflrft8Y3ghG9qdLzRSbjfs6Yr/JdPAreoKPsd
         lFXYEilMPeqWYRkXMaXMrCm3MBCQ9xpSLnaoIWZf0GZZ3C09+rOmgpINmZ5jbEeW0nqk
         Y7IyoVltTdCAhTfH1l71zkDSqZRT4OanH8/EynJmCKNTG8bzZ/u7Bi/mK77blcIRBjha
         wObZ3lolhSPr/vGIAroGm5tahT2fDxhvCACxRpYd8Yv+uy15JX9kzRvjwQABl+QrSBVo
         tLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286729; x=1724891529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+hEoHL9J/nPYk5QLrqkOQS9keGcw/49+kaYJqoYRoE=;
        b=FuL2nxbzpPctwG4eRG+b6zHn5MpGaUHd0RBt/2c8gQ8y8vz03Iah6GPKhgD7OIblxw
         WXROBsQeuMGt/21Ta5NRkK8Rn+fqQgOB2cmqK9lHtUDe9F05uqoY53SDeKVMTIvs2vAr
         QkP4oVjp5ZV4DA+XZkhBZkKYDBJ7zN0V+RnCENvLOLJwM1Q0Isog3mtaAmRKOnUW/7Dt
         UKxiTdzW/ycIno0wWVg56vtkr7ynOBZH0UOyqG3kdlUE++d3FQfuWY9186wSML20dBNm
         4YQPWRJrfSWaprS4aR0LQ/6+7roD6FJBr1rqnrO/JYso+PqP1PudbrSPsmAfiOIC7v/N
         qZVA==
X-Forwarded-Encrypted: i=1; AJvYcCUm5Dr68+CBkgHC2x1G0A7k+YeKToIH3TaZDTzU5uPGPF7o3uDZVQ41wnimj22zIwV+GZA8OQhMMvn6FT18@lists.linux.dev
X-Gm-Message-State: AOJu0YwR2gdbvkElAV/mI0Rm5S4fU8HxHM2dvxW4jfzNDYZHL1Hjkijh
	yJLroueMQ1o8RaFny4VQuuQ3ZDdBB44IHsceDJnEA2b6KR2OV1ObVL+xod6we3o=
X-Google-Smtp-Source: AGHT+IGpty3G24IJM5a8qRyiOXV6cIuDaUddjCyf9dwqsfyvXBpU3HRhqfnEk1LDQrJ5BvsFVnAv9A==
X-Received: by 2002:a17:902:fc44:b0:1fb:7654:4a40 with SMTP id d9443c01a7336-2037f9d4153mr16179235ad.14.1724286728492;
        Wed, 21 Aug 2024 17:32:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:baa2:9074::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560dfaesm1684535ad.223.2024.08.21.17.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:32:08 -0700 (PDT)
From: Hans Buss <hansbh123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] stagging: rtl8192e: Insert spaces around '|'
Date: Wed, 21 Aug 2024 21:31:45 -0300
Message-ID: <20240822003156.141717-1-hansbh123@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Buss <hans.buss@mailfence.com>

Insert spaces around '|' to adhre to Linux kernel coding style.

CHECK: spaces preferred around that '|' (ctx:VxV)

Signed-off-by: Hans Buss <hans.buss@mailfence.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 1b444529b59c..e507593b939c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -229,7 +229,7 @@ enum _RTL8192PCI_HW {
 				RATR_MCS6 | RATR_MCS7)
 #define RATE_ALL_OFDM_2SS	(RATR_MCS8 | RATR_MCS9 | RATR_MCS10 |	\
 				RATR_MCS11 | RATR_MCS12 | RATR_MCS13 |	\
-				RATR_MCS14|RATR_MCS15)
+				RATR_MCS14 | RATR_MCS15)
 
 	DRIVER_RSSI		= 0x32c,
 	MCS_TXAGC		= 0x340,
-- 
2.46.0

