Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969912472AE
	for <linux-staging@lists.linux.dev>; Tue, 20 May 2025 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756322; cv=none; b=Jpv2KocV3YIBF5mu93dhNy+v0Pa1+rktb+TlrpyEI+qF/pSdm2SXGYRqQkCriJfwsb8atA16bkhJW4lDOtT47yk6Sg3GQfGhl7myJVVQKjRDw8ZtPsvI+KGjvfJcU1mLmDYqE+ngiTg9FaCHF8hdk2kLzixuCBSEzdvR/0KNEMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756322; c=relaxed/simple;
	bh=yDzB+rK4kRvODtUh32t75bfBwyaPRGI3UZDm8Q5fjNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrzbXetmth9bvPkq+s3IzOIv9vFb3jRET0fKQZQYJNw0otti4c9wTgL5avb7gdV39k9GeIyyIiylf91Lfjjl7AEMI0o8PEppW+AUp6e/ZjsSnR79Cy/d0ZsRpn5mbau4gG6AyDPXFu8ql7ZH/OWEho7RTe1GOHr6yRgrQM7RIaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIeVpGEr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIeVpGEr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso57040545e9.2
        for <linux-staging@lists.linux.dev>; Tue, 20 May 2025 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747756319; x=1748361119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCWgh0ZdhtzvxMZlS8E6PlbHO1fWal8xoyCgd8Qfje4=;
        b=NIeVpGErQXRTGG/RBOqDuMLJgr/nk35lOfAPiT6CkyQcfbS4PmsnVZJlfId5j0Go8m
         mweSAgsAmuOiWzuLS/vg9z9/l1mfEg/Hzl1nqQ3MlE+R/CbKAuhV59sOG/qwwon6J0yF
         rV0lXTOQw0DGwrQKYgGZaNUARrZRlaZ1fh0Mw9QkDkDU6kW8/n9H+1th7Y2GloR6BZu9
         CWC3GwtAeH0A+4qt+VNnsLJZ6zRiNwyyBtWjWotJ7ugjc4dih//aC6iDafyBUR2An8Dj
         0m0mCTuv+XUvUVTiRBxd6XTZJhiYDfdor2naN1RNvsOMmQiHKkOwz27f3Ea5aRX+QBu2
         1fGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756319; x=1748361119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCWgh0ZdhtzvxMZlS8E6PlbHO1fWal8xoyCgd8Qfje4=;
        b=Q5JBPqEI4GyF1pSAb/4oGTu/hEqWE1rZ/2NIMm7B4wBWV7jUZT/rwNqBos5IKnr33j
         29q5Rr+vyYpgQOSF+nEhDHSOGNFp29DERLuRUUR16Gci0ranNvkBfwc9qbYqeoUW60Wo
         YtYrYHSS90wEKfmuLzlF+0k+OFrXgMFl7iOC/5fPJ4B8+LmTV0TpXcTOXrHmsJ5VXh+6
         V7PiNokX6kE4xc1uWytLbOfDHTmTmAFbwL7m+m6uOFCsy991WuGf6PleNXh8iXm32qvr
         DcRmHrtijf29gPCW6N2mlb2g5drZD+tfYEBUAtslBf1LvB0qmEfvY2lmZryDUavpeNp/
         PU3A==
X-Forwarded-Encrypted: i=1; AJvYcCWvtLYMsW3my5tfwY3SvpiCkUFmUIjsKlqx8xRPZvbXAPq9u1Wqp6bJi6X0Sm+ZPyF4TFRUs37UKEGse7Tj@lists.linux.dev
X-Gm-Message-State: AOJu0YwLkk4gLoCCvKkcAS1Z7ORiuJ4a02fC/eRnVX9l72PO+7o6c2dA
	W0o4gICahUqCmKcKLS+Uw336UB3yNGn5YxnUS77734ZOAkkZgb+gy4OFT3prtw==
X-Gm-Gg: ASbGncv0QgLUhM6dNbBGJIQ8E5DifghtIWOCQnYAoRWVSLhE7y7eIVi1WOLaAik4jO7
	vuc7lzMiYNv1H+pKhA4oJwvfE8oD+yG2t2HO6Z5GT6a671NA6FSxQOCCLEg9fV4onhKBEjVJfRB
	kjAwht40lwkVA79jmpyhy3CikNxAip4i9y97j/dSU2SbLxFpGpM6m9IeiGGnBzKhCP2tO7Iw9WD
	rk04WM7DBIlEtLULdzwfquKXhS3DtEY6QrJQ7c64YSI8Qw9WII3AWyvb1RWcab1h/BhDUdRaD7C
	a0FVwXVfUQlvGX0XXBIAn4WaARPq3h1kM1BPs+YlHMeYoSLLYxMRWjVudZpRv0rK
X-Google-Smtp-Source: AGHT+IF8v7bpu4ytKc96dJqlgxfj5DJg0OrRJlXHFHPGOXdl7FlkmEH5AAt0Db9U2W+MWb/T7/n/cw==
X-Received: by 2002:a5d:638e:0:b0:3a3:64b8:ef20 with SMTP id ffacd0b85a97d-3a364b8ef5fmr9383658f8f.52.1747756318554;
        Tue, 20 May 2025 08:51:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62961sm16581478f8f.49.2025.05.20.08.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:51:57 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix secondary address restriction
Date: Tue, 20 May 2025 17:51:00 +0200
Message-ID: <20250520155100.5808-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIB secondary addresses have valid values between 0 and 31
inclusive. The Make Secondary Address function MSA, used to form
the protocol byte, was using the gpib_address_restrict function
erroneously restricting the address range to 0 through 30.

Remove the call to gpib_address_restrict and simply trim the
address to 5 bits.

Fixes: 2da03e7e31aa ("staging: gpib: Add user api include files")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index 4ca3cc9e0cd7..deb7ffcb7902 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -136,7 +136,7 @@ static inline __u8 MTA(unsigned int addr)
 
 static inline __u8 MSA(unsigned int addr)
 {
-	return gpib_address_restrict(addr) | SAD;
+	return (addr & 0x1f) | SAD;
 }
 
 static inline __u8 PPE_byte(unsigned int dio_line, int sense)
-- 
2.49.0

