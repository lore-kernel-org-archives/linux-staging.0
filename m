Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F39D7C
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 01:05:39 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id o7so4788439eja.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Jun 2022 18:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YgKd7A0V6bwx+X0oq5/ADFKrLPJ/xlfHLzRCcdTRlM0=;
        b=PkCZVjQx7n7MTIZI5UVaxN/nttnw4Hqc48ZtjbApz81Tze+ZZVapSUFSmlyy0L0fR7
         AS3Y/kmDWFMCKzmZUJM6+OHJAiJ1eJr6xpS3REZM8HKAhL1JCBQXjfp5VD6SZ/UxZA8Z
         B5P+ikYKYQI+7zPPlthQoKsNj6vxqagVss8BvSJPc+R4hndTjUFP203MgnnCVzFjwB0q
         SckTV+7I2Mppk8ywZUxzpFuawXYnwfB65a5fzeKkqPhh/5BfB5Si4B7L5R00gEHyMzW+
         VthUGkVH5EOQNBNn6n8qqAlXEh/04EOLMkGhElUMQZuJzhjExfHffj0TEpk0LRK97VJ/
         9Mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YgKd7A0V6bwx+X0oq5/ADFKrLPJ/xlfHLzRCcdTRlM0=;
        b=i1YZ/D+WFIl+pZK9lnH6i0YsFt+XtPpBVmKu1KAM96k0QIuGyW8lXOWrAuzrx7ZDhe
         cRtjV31nNgeLZPhA43Je/srmxy+0tr43a3MVNAKy2aNDKuinK751m4ToGny7tjqauAUb
         aNZd6Igv5IEZezuu1BuLdn99bqINngRmxcqPkNWOX229Y2ojbJU4U7T8YVqY6G2OZz0E
         fYiiOj8y+SXLy1qC8V8ZF1cgnpEKYoZ4ItFIlNPVaMHq/obdum3Ykj2PIt97vyM6gJX7
         cJ/cAzIy7wMwsujuD/XOy7PWgWVxgWz+FDD3P7ncbPYR4rHzIy2B9/RWhHUtF9tULIMG
         5zng==
X-Gm-Message-State: AOAM532oTPxib2IcXdg1kKR+3PI5bM91uOSyOcX3HjmV34nEKioVP1C5
	j6XQzsYX71WyscOL2l5kMSw=
X-Google-Smtp-Source: ABdhPJwlALXMAgRqxnuoYVvZlL1Um5eJfIrOGuJXBs5N3q5WaSy/jjdXr5YqXFkymOckg40o9CrTIQ==
X-Received: by 2002:a17:906:7486:b0:6fe:ffd9:b14f with SMTP id e6-20020a170906748600b006feffd9b14fmr16662420ejl.573.1654995939031;
        Sat, 11 Jun 2022 18:05:39 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:b802:84b6:a3f8:7c89])
        by smtp.gmail.com with ESMTPSA id u20-20020a509514000000b0042dd1d3d571sm2312297eda.26.2022.06.11.18.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 18:05:38 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcaov@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: simplify some macros
Date: Sun, 12 Jun 2022 03:05:13 +0200
Message-Id: <a3438e13cf2c117ad74432cdca4be97e731e9b21.1654994517.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654994517.git.namcaov@gmail.com>
References: <cover.1654994517.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some macros which are not really useful, but make the code
harder to read. Replace these with clearer codes.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 .../r8188eu/include/Hal8188ERateAdaptive.h    | 10 +++---
 drivers/staging/r8188eu/include/basic_types.h | 31 -------------------
 2 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h b/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
index 20d73ca781e8..79e4210c6b65 100644
--- a/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
+++ b/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
@@ -26,15 +26,15 @@
 #define GET_TX_REPORT_TYPE1_RERTY_0(__paddr)			\
 	le16_get_bits(*(__le16 *)__paddr, GENMASK(15, 0))
 #define GET_TX_REPORT_TYPE1_RERTY_1(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 2, 0, 8)
+	((u8 *)__paddr)[2]
 #define GET_TX_REPORT_TYPE1_RERTY_2(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 3, 0, 8)
+	((u8 *)__paddr)[3]
 #define GET_TX_REPORT_TYPE1_RERTY_3(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 4, 0, 8)
+	((u8 *)__paddr)[4]
 #define GET_TX_REPORT_TYPE1_RERTY_4(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 5, 0, 8)
+	((u8 *)__paddr)[5]
 #define GET_TX_REPORT_TYPE1_DROP_0(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 6, 0, 8)
+	((u8 *)__paddr)[6]
 /*  End rate adaptive define */
 
 int ODM_RAInfo_Init_all(struct odm_dm_struct *dm_odm);
diff --git a/drivers/staging/r8188eu/include/basic_types.h b/drivers/staging/r8188eu/include/basic_types.h
index ffb21170e898..c4b08fb82200 100644
--- a/drivers/staging/r8188eu/include/basic_types.h
+++ b/drivers/staging/r8188eu/include/basic_types.h
@@ -15,37 +15,6 @@ typedef void (*proc_t)(void *);
 /*  TODO: Macros Below are Sync from SD7-Driver. It is necessary
  * to check correctness */
 
-/*
- *	Call endian free function when
- *		1. Read/write packet content.
- *		2. Before write integer to IO.
- *		3. After read integer from IO.
-*/
-
-/* Convert little data endian to host ordering */
-#define EF1BYTE(_val)		\
-	((u8)(_val))
-
-/* Create a bit mask  */
-#define BIT_LEN_MASK_8(__bitlen) \
-	(0xFF >> (8 - (__bitlen)))
-
-/*Description:
- * Return 4-byte value in host byte ordering from
- * 4-byte pointer in little-endian system.
- */
-#define LE_P1BYTE_TO_HOST_1BYTE(__pstart) \
-	(EF1BYTE(*((u8 *)(__pstart))))
-
-/*Description:
-Translate subfield (continuous bits in little-endian) of 4-byte
-value to host byte ordering.*/
-#define LE_BITS_TO_1BYTE(__pstart, __bitoffset, __bitlen) \
-	( \
-		(LE_P1BYTE_TO_HOST_1BYTE(__pstart) >> (__bitoffset)) & \
-		BIT_LEN_MASK_8(__bitlen) \
-	)
-
 #define	N_BYTE_ALIGMENT(__value, __aligment) ((__aligment == 1) ? \
 	(__value) : (((__value + __aligment - 1) / __aligment) * __aligment))
 
-- 
2.25.1

