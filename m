Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEB16D0E
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 02:25:45 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so516887pjv.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 19:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=B3nkOxLt37ikjNh1dmCrH27OA3QKrjj/aIwluo8z8/M=;
        b=uRmM/eDkM6Mu88gsKVMeW6KK3rf9K4CU2TQnuBwcItC5Cp9qQ7+equPDnXIxXiLxc5
         x/b/9hGqVXVUxZ3WDd6MVWKgbvUn+9iX/Fb9pbu2zNDjz+wDQ71M8kJ2rphL6JPc6/HV
         9bdwrX1rDLw37WrJ+oDcqo2h8V1M3czpXQAqFumMf0GmVHXbANoN5KK6bDFm4NGj2huu
         31RYoSfoCjIV2TSUxRBx5o4PDNGV2i0Oq1DSfZ5mtL/dApxMJRP0KlsiqZdsquxzI5vW
         LD8GQovQWF88mo2lwUP3UUTYlOTFbBq+8gdRA6n0kmb1wMxQS7bdX0+m4zOEvXyuCdC4
         AIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=B3nkOxLt37ikjNh1dmCrH27OA3QKrjj/aIwluo8z8/M=;
        b=pM+bczBaLs3mEHZkaEZrp+GKGNgUCn4dAIBUyYOZSTA4IZBR363ZMbNojHV+nAgY/D
         +thKNaNeXadwFz6Wlu939ne6xRGeJwisncP5nPLbqk1qhjjN8cxZ3wHlGiokhlLLMJYw
         TXEli40zhINy80O4e+oOTcLFfDrRfQaH3h3US9B+880iuiAMmzmyIjKaUTds//i91duQ
         0jRmncjakLORqx3+b+N3VwFy4DniebAMJvGHmL0E2GqNtV1Gil77+uH+uXks8dZUBNsm
         wfAV2L+6y9lXBwEcufhbhVajJFGRWmXdAZZ7Ewdh3QvywQlskNybfrRupMSXsqx5+8mC
         TW9Q==
X-Gm-Message-State: AOAM533NUTOpZGB6BcUoS7JSUfrsBcqHkR2p6BPmBr4eji3GtJctd3ku
	L+rzco1AC653bsbl8wn+jgQ=
X-Google-Smtp-Source: ABdhPJxnf6JAZajUJLzftpFtX64NfI54a4Qom6zNJLrZ7QUbsxdUyEZ6oNDsHMeDcBkUZnz9ppjYQw==
X-Received: by 2002:a17:90a:1b05:: with SMTP id q5mr4951105pjq.104.1617848745303;
        Wed, 07 Apr 2021 19:25:45 -0700 (PDT)
Received: from kali ([152.57.40.190])
        by smtp.gmail.com with ESMTPSA id i7sm21876193pgq.16.2021.04.07.19.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:25:44 -0700 (PDT)
Date: Thu, 8 Apr 2021 07:55:41 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: removed extra blank line
Message-ID: <YG5ppTlGhRp5WVgS@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed an extra blank line so that only one blank line is present in
between two functions which separates them out.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_wmac_regdef.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_wmac_regdef.h b/drivers/staging/rtl8712/rtl8712_wmac_regdef.h
index 662383fe7a8d..dfe3e9fbed43 100644
--- a/drivers/staging/rtl8712/rtl8712_wmac_regdef.h
+++ b/drivers/staging/rtl8712/rtl8712_wmac_regdef.h
@@ -32,6 +32,5 @@
 #define AMPDU_MIN_SPACE			(RTL8712_WMAC_ + 0x37)
 #define	TXOP_STALL_CTRL			(RTL8712_WMAC_ + 0x38)
 
-
 #endif /*__RTL8712_WMAC_REGDEF_H__*/
 
-- 
2.30.2

