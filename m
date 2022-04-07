Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44142595
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 19:28:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id p23so7576630edi.8
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 12:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=spUrDlTPoQb5W/WISiaHwyVQFy34aqJXbfUX39rUuXo=;
        b=Aqbx7GkMI7y3Mql3+83x97cVq81FAobXYw3EYgB12+sq7PCKL3BtUqylLZGXxHYU6B
         5MHQdGl4PeqwrjydEQrzzK5bDrymR9qPSJqCc/nf7K9wk7hM1/nQjPEQ+374QYvNOFbW
         zdOmlj4553NM4DOqRCJKoysqoxQge2RHM17mPBb7woEba9yx0I+pPWFddhU4YlG0lLx3
         /2cZFmh6Cfwnbr5E9VZbWf9U+/MF1iIZfgrl8Oypej/ULmm5Y9hkpr3VIdtkIxLkdk9r
         CDJsmf7XpYK/DHKhi0T5S/Mp0aieQffFrbhXpFalnef/6MrxtoxIvY2G9fhxa9aHi6Rl
         JN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spUrDlTPoQb5W/WISiaHwyVQFy34aqJXbfUX39rUuXo=;
        b=rvWlSg2Bzegy4vma3CyPg5Z/AfwD8Z2ToujZfHkeR8Y6Y74FP8iJLlq6rUal8dXAqu
         rxx+jq50+EJ0br6rB9O2G6wiBR+VOfcoshHCn2+ujCMC+I5D4HIwirIKEjq2frPAFF/7
         LQdE3SvpWCOsPgTmXiBmgsBScKG/2zhJbsdoxlJs/1iZNshdxDtR+cCOAOIJILueNFcg
         aeMQjoInV6W0VM3lVffnLl3uRvZQxYKNdMbrCTXKfyTH5Yj4ek1mJIOdVSry0qW3hhqU
         FLZUZsqmqh5g9hZBe8NdyMqOBjyEOpwExy48m6Vy1ZtTSTqoaaCN4vuNP2FbN6uI1rJ5
         5CjA==
X-Gm-Message-State: AOAM530ADwe28zmrzNpSYJe+N/p1LlUmmjXYrAy/XTaCTR4UkqNo5Qg5
	PKfZr4e08u5mTKNITAAsaZ0=
X-Google-Smtp-Source: ABdhPJy0WSU5QEc5x0vj8sGv8dkjsmkhDZ5gorxeDFvh5gqutGlefXOAZ95I0YAKafdhoNI0oqpDsg==
X-Received: by 2002:a05:6402:27d1:b0:419:1b02:4a04 with SMTP id c17-20020a05640227d100b004191b024a04mr15790385ede.218.1649359703905;
        Thu, 07 Apr 2022 12:28:23 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm9652798edl.22.2022.04.07.12.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:28:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/8] staging: r8188eu: remove unused macros from basic_types.h
Date: Thu,  7 Apr 2022 21:28:12 +0200
Message-Id: <20220407192819.10661-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407192819.10661-1-straube.linux@gmail.com>
References: <20220407192819.10661-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macros from basic_types.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/basic_types.h | 73 +------------------
 1 file changed, 1 insertion(+), 72 deletions(-)

diff --git a/drivers/staging/r8188eu/include/basic_types.h b/drivers/staging/r8188eu/include/basic_types.h
index d82b2171d584..ffb21170e898 100644
--- a/drivers/staging/r8188eu/include/basic_types.h
+++ b/drivers/staging/r8188eu/include/basic_types.h
@@ -4,9 +4,6 @@
 #ifndef __BASIC_TYPES_H__
 #define __BASIC_TYPES_H__
 
-#define SUCCESS	0
-#define FAIL	(-1)
-
 #include <linux/types.h>
 #define NDIS_OID uint
 
@@ -14,9 +11,6 @@ typedef void (*proc_t)(void *);
 
 #define FIELD_OFFSET(s, field)	((ssize_t)&((s *)(0))->field)
 
-#define MEM_ALIGNMENT_OFFSET	(sizeof(size_t))
-#define MEM_ALIGNMENT_PADDING	(sizeof(size_t) - 1)
-
 /* port from fw */
 /*  TODO: Macros Below are Sync from SD7-Driver. It is necessary
  * to check correctness */
@@ -31,86 +25,21 @@ typedef void (*proc_t)(void *);
 /* Convert little data endian to host ordering */
 #define EF1BYTE(_val)		\
 	((u8)(_val))
-#define EF2BYTE(_val)		\
-	(le16_to_cpu(_val))
-#define EF4BYTE(_val)		\
-	(le32_to_cpu(_val))
-
-/* Read data from memory */
-#define READEF1BYTE(_ptr)	\
-	EF1BYTE(*((u8 *)(_ptr)))
-/* Read le16 data from memory and convert to host ordering */
-#define READEF2BYTE(_ptr)	\
-	EF2BYTE(*(_ptr))
-#define READEF4BYTE(_ptr)	\
-	EF4BYTE(*(_ptr))
 
-/* Write data to memory */
-#define WRITEEF1BYTE(_ptr, _val)			\
-	do {						\
-		(*((u8 *)(_ptr))) = EF1BYTE(_val)	\
-	} while (0)
-/* Write le data to memory in host ordering */
-#define WRITEEF2BYTE(_ptr, _val)			\
-	do {						\
-		(*((u16 *)(_ptr))) = EF2BYTE(_val)	\
-	} while (0)
-
-#define WRITEEF4BYTE(_ptr, _val)			\
-	do {						\
-		(*((u32 *)(_ptr))) = EF2BYTE(_val)	\
-	} while (0)
-
-/* Create a bit mask
- * Examples:
- * BIT_LEN_MASK_32(0) => 0x00000000
- * BIT_LEN_MASK_32(1) => 0x00000001
- * BIT_LEN_MASK_32(2) => 0x00000003
- * BIT_LEN_MASK_32(32) => 0xFFFFFFFF
- */
-#define BIT_LEN_MASK_32(__bitlen)	 \
-	(0xFFFFFFFF >> (32 - (__bitlen)))
-#define BIT_LEN_MASK_16(__bitlen)	 \
-	(0xFFFF >> (16 - (__bitlen)))
+/* Create a bit mask  */
 #define BIT_LEN_MASK_8(__bitlen) \
 	(0xFF >> (8 - (__bitlen)))
 
-/* Create an offset bit mask
- * Examples:
- * BIT_OFFSET_LEN_MASK_32(0, 2) => 0x00000003
- * BIT_OFFSET_LEN_MASK_32(16, 2) => 0x00030000
- */
-#define BIT_OFFSET_LEN_MASK_32(__bitoffset, __bitlen) \
-	(BIT_LEN_MASK_32(__bitlen) << (__bitoffset))
-#define BIT_OFFSET_LEN_MASK_16(__bitoffset, __bitlen) \
-	(BIT_LEN_MASK_16(__bitlen) << (__bitoffset))
-#define BIT_OFFSET_LEN_MASK_8(__bitoffset, __bitlen) \
-	(BIT_LEN_MASK_8(__bitlen) << (__bitoffset))
-
 /*Description:
  * Return 4-byte value in host byte ordering from
  * 4-byte pointer in little-endian system.
  */
-#define LE_P4BYTE_TO_HOST_4BYTE(__pstart) \
-	(EF4BYTE(*((__le32 *)(__pstart))))
-#define LE_P2BYTE_TO_HOST_2BYTE(__pstart) \
-	(EF2BYTE(*((__le16 *)(__pstart))))
 #define LE_P1BYTE_TO_HOST_1BYTE(__pstart) \
 	(EF1BYTE(*((u8 *)(__pstart))))
 
 /*Description:
 Translate subfield (continuous bits in little-endian) of 4-byte
 value to host byte ordering.*/
-#define LE_BITS_TO_4BYTE(__pstart, __bitoffset, __bitlen) \
-	( \
-		(LE_P4BYTE_TO_HOST_4BYTE(__pstart) >> (__bitoffset))  & \
-		BIT_LEN_MASK_32(__bitlen) \
-	)
-#define LE_BITS_TO_2BYTE(__pstart, __bitoffset, __bitlen) \
-	( \
-		(LE_P2BYTE_TO_HOST_2BYTE(__pstart) >> (__bitoffset)) & \
-		BIT_LEN_MASK_16(__bitlen) \
-	)
 #define LE_BITS_TO_1BYTE(__pstart, __bitoffset, __bitlen) \
 	( \
 		(LE_P1BYTE_TO_HOST_1BYTE(__pstart) >> (__bitoffset)) & \
-- 
2.35.1

