Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9323AF
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 08:35:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id u9so17429310edd.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 00:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678437306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq0v9YVI3wtTDDjRzU92twoQtmr2PxAaTyrW0UMmWQw=;
        b=DPozms87b/PKkkvHKub1WKUztXE4+jPb5NnQzzW1kMEuhkF8hKSWBzkPblC7l61XQh
         EZ1IRrjDeI6vRq9phb5K1GGpS+AbLi8zw0oHClXEhj+1S/M50sK6Zh87BFVW8E/x1k86
         GPNd3m060qI+rO6sDrrMjMqBIjYU5L0drL2gxFllMpKGHFfM6Ib4pIGPrHMslE4+1xS7
         IPPJxK0q+RZLSIQg8FCsIpBBqs8h+Gwp/umX+b9Mhp0jaWndX2nPWxVv7fpU6/ZKK7xn
         EzRJ/uL5ZIzsIfu46DzMC6ihuntdr1MWemfP1ze9dgz+6G5NssJ18c5vqAveeFWzRxqS
         HsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq0v9YVI3wtTDDjRzU92twoQtmr2PxAaTyrW0UMmWQw=;
        b=5hqSVTyF44Rjm/5TniXltiIRjIastYwhINO+I6cdKNH126ZjSyPzh9WTnETRHhpm9t
         HqwzC5Sgsq7QBZUb8JO7sGAIMTvYODBk86H7fFIwghB9UhsRUKMQ7HgfEVC6au3zjlpr
         jGC1aZsC4WolamaBW84LOmRr1acLRddS55iH3UkLAIok8B9AiTHjLA+IWkYocu6ptQuB
         6M+R9u94QzoTo55ZkQeTSL6viZJIBV7y8weysE6Ax2IN4rkxW8A+ryMyyy80iNwQg2L0
         HZw9bq34PZ/AeBrp8vBCGrCOtxz0ojgrMobaRg5zwWlpba97sb375Cormr3ZvBLpzK7X
         Y3jw==
X-Gm-Message-State: AO0yUKWVEcX8/FbvAugW8Xv3IWrB1O5i8NhxW7KcJONGC1NtSQBMTIwy
	bEXTx27aHtll0BmK6E5mQvc=
X-Google-Smtp-Source: AK7set9zvfifLV+DAdB0O75/g20ZDKcfqNMOyFRopgBKGXG/WmOUXZN7jRDevDU5HDD2DOXlzO0/3g==
X-Received: by 2002:a17:906:6d85:b0:8c3:3439:24d9 with SMTP id h5-20020a1709066d8500b008c3343924d9mr19667016ejt.24.1678437306035;
        Fri, 10 Mar 2023 00:35:06 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbd3.dynamic.kabel-deutschland.de. [95.90.187.211])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090619ca00b008ce5b426d77sm697888ejd.13.2023.03.10.00.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 00:35:05 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: MapCharToHexDigit() is not used
Date: Fri, 10 Mar 2023 09:34:45 +0100
Message-Id: <20230310083449.23775-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310083449.23775-1-straube.linux@gmail.com>
References: <20230310083449.23775-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function MapCharToHexDigit() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 16 ----------------
 drivers/staging/rtl8723bs/include/hal_com.h |  2 --
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index e42556d03bce..b74817fc4316 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -859,22 +859,6 @@ bool eqNByte(u8 *str1, u8 *str2, u32 num)
 	return true;
 }
 
-/*  */
-/* 	Description: */
-/* 		Translate a character to hex digit. */
-/*  */
-u32 MapCharToHexDigit(char chTmp)
-{
-	if (chTmp >= '0' && chTmp <= '9')
-		return chTmp - '0';
-	else if (chTmp >= 'a' && chTmp <= 'f')
-		return 10 + (chTmp - 'a');
-	else if (chTmp >= 'A' && chTmp <= 'F')
-		return 10 + (chTmp - 'A');
-	else
-		return 0;
-}
-
 bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 {
 	u16 i = 0;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 6356b8c2ef81..8a7d31d1eaca 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -147,8 +147,6 @@ u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 
 bool eqNByte(u8 *str1, u8 *str2, u32 num);
 
-u32 MapCharToHexDigit(char chTmp);
-
 bool ParseQualifiedString(char *In, u32 *Start, char *Out, char LeftQualifier,
 			  char RightQualifier);
 
-- 
2.39.2

