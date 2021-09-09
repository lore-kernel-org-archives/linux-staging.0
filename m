Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C48D3FF0
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 20:21:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso2279693wmi.5
        for <linux-staging@lists.linux.dev>; Thu, 09 Sep 2021 13:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mtgnYh4+V2MnpDEhOcmk+l7ZYHvGZHXFt+EjfvjuPgU=;
        b=oZVa5hb+/A+juJRocbJEsGIOh2Vgt87Ol5kGD27oTDbndwB14f6+E/NH2o751yPtnM
         DleVf7cYm7aPYU8k3q7vShxcKgduWmi+COnIH+JsDERyAfURxw4me7vYSpe/OaYGSJQQ
         2UfGtvNcavkZj8S1wR0IeXnM6Pec8RwGLNq00IUAFhxPqNz+G2xoCPjXcIrohjcN09Ay
         EUPimfOozhYaYW5pHA7Izb0wixY6/ld6OIG6a1cUBpYThatu6/eTGSx2lW8EaZEHr95z
         PkA2H2lhEfNdyrQ2y2419DmT+kIDN8bSRMhTVknGUuMK7p7MszgCHxqm82rTQ+5Yov6r
         TM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mtgnYh4+V2MnpDEhOcmk+l7ZYHvGZHXFt+EjfvjuPgU=;
        b=5STokviMnoQBPe5AQCb0EtoupdoG7PCRqqwRTINDbDKdPU6oFm+y5QftWDGwYCd2mO
         /6DXphEvTu9I83TCl4RHxgVJHhtKbQ3X/AkbzqIAOm1xbFCOjN9XNldu6F2Fn/tLNrm1
         0EAezWybwLT//uG6Y642UceAtw5vEpa3ZjqQcNtpATW/pJ+xjh4oxNkv0EdrXZPTB7Cq
         hfaisNUL9i6QzK4LZ6ziFe4jt2NvBafEVz6ftt/Is8za2426FoTYt2q4JqVUdDFqzpYt
         ldCgaRFyRSYwfNKJucC+j2vOJB+EofvaEP+hv+K0QtQkHWzYCFw03M+lYEMVtNXIKG+b
         ve3Q==
X-Gm-Message-State: AOAM530ht5PpzhM72bQzOVzwcZRJO+yAg9PF+YLtnq/mnXtrC+L7kXa2
	dqu8pClKYI43fuQ/M2JImUY=
X-Google-Smtp-Source: ABdhPJwdYbEbTikpTjwNLOCMQWyLbZ83iknG0vJnHFYYzkcawvTeQ9xid/+cHX/rxAo2MWQuGcszEQ==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr4805681wmb.139.1631218913461;
        Thu, 09 Sep 2021 13:21:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id n5sm2415620wmd.29.2021.09.09.13.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 13:21:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unused macro ROUND
Date: Thu,  9 Sep 2021 22:21:30 +0200
Message-Id: <20210909202130.28508-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro ROUND is not used in the driver, remove it.
Found with GCC -Wunused-macros.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_security.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 82987255400a..db35f326bbb1 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -1555,16 +1555,3 @@ const u8 rcons[] = {
 	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1B, 0x36
 	/* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
 };
-
-/**
- * Expand the cipher key into the encryption key schedule.
- *
- * @return	the number of rounds for the given cipher key size.
- */
-#define ROUND(i, d, s) \
-do {									\
-	d##0 = TE0(s##0) ^ TE1(s##1) ^ TE2(s##2) ^ TE3(s##3) ^ rk[4 * i]; \
-	d##1 = TE0(s##1) ^ TE1(s##2) ^ TE2(s##3) ^ TE3(s##0) ^ rk[4 * i + 1]; \
-	d##2 = TE0(s##2) ^ TE1(s##3) ^ TE2(s##0) ^ TE3(s##1) ^ rk[4 * i + 2]; \
-	d##3 = TE0(s##3) ^ TE1(s##0) ^ TE2(s##1) ^ TE3(s##2) ^ rk[4 * i + 3]; \
-} while (0);
-- 
2.33.0

