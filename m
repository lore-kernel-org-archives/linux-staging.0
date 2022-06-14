Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9121FAB
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 15:59:17 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id v19so12305354edd.4
        for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M3gbMv3CLEVw18Z0+GMlsuJYkcEWg9M+cqo68PHCY1Q=;
        b=M7DlVTelkdRHSDTdXFbXqRTjSfrVHM80gWUzdQlAvt08aiyANcUKt2xnHvWIr+Or/V
         n6qHxtuSWdt9ut4qX/tDFnF/GY9fm5ttHMpFHymlI1JkPNoBMLChV+buibbtUWVjo/wN
         9K/0rmRExU2x20F4AejBPwpUCBY71lJMEM5PBJrtmkWEcL4AYmHI8VyvGMdOKQGmkfxk
         a38PKwQLbZn0fuAc9m0xSDLWCrwJzmPBXckQdQ9P7p7ZCxp2zlfpKzBNnFSGiq4xwyyB
         VXePc4WMNsCiClY3QJBFuez50bAj8T4Icp99/L3CacjhQKL3+IBROWHtnto+8DAFqbOx
         0AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M3gbMv3CLEVw18Z0+GMlsuJYkcEWg9M+cqo68PHCY1Q=;
        b=4GrPljyxjijiPMhcHn7IPjyxo+z7MJXMGz4dZHcbJe9/OkgAL+lSDy14dEoA4GsSfU
         O2mjm91Qv5b3NBmpVkIcXnskwNXmVQANN4dTfBrxHkPrKi01NPEuOREAQk2+RpicQm/3
         4LQuXAA4rK4HTsfcsUbz8RVbkvKyKjByHwQwYkKydMjyMSnoLanJVWmgU4uV5fvfGdsw
         bxv0zeivVk05ln+O3/aZSEp0PtMXBt8FjzEBxMNLQvrHXe9moeMeoiVHZKGK+KtDY7rM
         46HG102109PAlliQPRF5coEbiUqnj6dfndZiQJ0i272zmhKSokC2+zJ1AKW0GWCxQI/k
         rdwA==
X-Gm-Message-State: AJIora8lYCdrcq2XWCmJOLhEJwwKgxl9Hb7CmwSfJev1t3dgArgviD+q
	ygmq+a6QV3tUC3EUgRTZxKg=
X-Google-Smtp-Source: AGRyM1vAU0DxLPxLYMT9nMistjkeFzzHUlxwynL+MUrAjKN8Oez6KHUFzkRMcICzL3aFAJoVfPiGlA==
X-Received: by 2002:a05:6402:388b:b0:42b:5f20:c616 with SMTP id fd11-20020a056402388b00b0042b5f20c616mr6903288edb.50.1655222355575;
        Tue, 14 Jun 2022 08:59:15 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:c58b:f186:2720:bdac])
        by smtp.gmail.com with ESMTPSA id qk10-20020a170906d9ca00b006fed93bf71fsm5327928ejb.18.2022.06.14.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:59:15 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	phil@philpotter.co.uk,
	Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Subject: [PATCH v3 2/2] staging: r8188eu: remove unused macros
Date: Tue, 14 Jun 2022 17:58:45 +0200
Message-Id: <a7f700c0688a16bb697fb693894f4c16594fd483.1655220367.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655220367.git.namcaov@gmail.com>
References: <cover.1655220367.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove LE_BITS_TO_1BYTE and relevant macros because they are not used
anywhere.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/r8188eu/include/basic_types.h | 31 -------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/staging/r8188eu/include/basic_types.h b/drivers/staging/r8188eu/include/basic_types.h
index cfd15ac1d9c0..0b71e2c6e41a 100644
--- a/drivers/staging/r8188eu/include/basic_types.h
+++ b/drivers/staging/r8188eu/include/basic_types.h
@@ -13,37 +13,6 @@ typedef void (*proc_t)(void *);
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

