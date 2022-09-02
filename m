Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FED110D
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:40 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id a36so1958359edf.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XpHH42SQLJDVes7ZZ1hXimWD0tWN6qFGRFQjolXplgk=;
        b=p2HZ+y3PZt8dbds1f3sAYhlZgc6o0fIxKkgVd5OdusQC8+2V6emYxX4kaoXmhyfW26
         z+2DqwS2uvTawWnsfIgWB4bB9ZPNyDY9PkhBEf9w+old+3r4vcrTpAtH3EAuGLMU63On
         u/yI8+4W2NtvlZBElgO1Tf8oBW6h9dACoJOj1dahexueIY3OjKoLoiNVNMWEOe3YI8Rf
         N/9EnEAqDm33Ka6CvqXDjtTeoTc7f4gdZcrod4TzB/528ruAFKUPoe9f1UheR1IH1PA1
         pX5eEw4uCtUB9+m4mOvXnPNj5uJOfY/PEHHPDgQ87VAWzjqnqPNPdtQA8X25PoZp/Owq
         pwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XpHH42SQLJDVes7ZZ1hXimWD0tWN6qFGRFQjolXplgk=;
        b=7wsImUim/N0PBJUPM8Dvjd7qBoQFHCSp8TdQHU8SpsiChGnaXU+t9HHIkgOWx6JQsu
         /CkcgiFhiZbhLsv+qCbaB+N+UaZUFsWxTAAor7wU1CX7EmXp2lBGBtT6+cxJ4B8nJtWW
         oY2SI9q7JiMrN+zzv+Ol62MBWSJ9gdcs4QXZ6pm+dPWbBNc2ZXkXHPedyo5A0c0+nV4u
         jzjs7NYz/eiNkr6/P9qlvpjaF5Rw6MncMxBcUZ1KQjpO5hSwcSOhbYW/efHwq3kIMQ2r
         d+RjHkbES7VviNBNQd7mI5E1r6D5s55sJw+VNxRzLDOmXAO4mxvJ1QfcylU8yEl4AjG5
         e7Xw==
X-Gm-Message-State: ACgBeo1LtLLVOHaATqLBD+8jCArFGnaIg+FzMJiZZIwoUVDI9Yb9jfdN
	RAe/+anpbEcl7uNAWdqCOz8=
X-Google-Smtp-Source: AA6agR7n1eVccxBiIatilAWpw3BtoSPNWeTYij8m1vB+lPsqVlB9a+PqrG7YqmxistKcFn42Mlnl2g==
X-Received: by 2002:a05:6402:550c:b0:443:7d15:d57f with SMTP id fi12-20020a056402550c00b004437d15d57fmr32044758edb.147.1662112358353;
        Fri, 02 Sep 2022 02:52:38 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:38 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 06/10] staging: rtl8723bs: remove GetHexValueFromString
Date: Fri,  2 Sep 2022 11:51:56 +0200
Message-Id: <74c77a5d86570065a5fe96446063595b649f76b0.1662111798.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111798.git.namcaov@gmail.com>
References: <cover.1662111798.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function GetHexValueFromString because it is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 45 ---------------------
 drivers/staging/rtl8723bs/include/hal_com.h |  2 -
 2 files changed, 47 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1c744d0b4742..010a097c3afd 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -894,51 +894,6 @@ u32 MapCharToHexDigit(char chTmp)
 		return 0;
 }
 
-
-
-/* 	Description: */
-/* 		Parse hex number from the string pucStr. */
-bool GetHexValueFromString(char *szStr, u32 *pu4bVal, u32 *pu4bMove)
-{
-	char *szScan = szStr;
-
-	/*  Check input parameter. */
-	if (!szStr || !pu4bVal || !pu4bMove)
-		return false;
-
-	/*  Initialize output. */
-	*pu4bMove = 0;
-	*pu4bVal = 0;
-
-	/*  Skip leading space. */
-	while (*szScan != '\0' && (*szScan == ' ' || *szScan == '\t')) {
-		szScan++;
-		(*pu4bMove)++;
-	}
-
-	/*  Skip leading '0x' or '0X'. */
-	if (*szScan == '0' && (*(szScan+1) == 'x' || *(szScan+1) == 'X')) {
-		szScan += 2;
-		(*pu4bMove) += 2;
-	}
-
-	/*  Check if szScan is now pointer to a character for hex digit, */
-	/*  if not, it means this is not a valid hex number. */
-	if (!IsHexDigit(*szScan))
-		return false;
-
-	/*  Parse each digit. */
-	do {
-		(*pu4bVal) <<= 4;
-		*pu4bVal += MapCharToHexDigit(*szScan);
-
-		szScan++;
-		(*pu4bMove)++;
-	} while (IsHexDigit(*szScan));
-
-	return true;
-}
-
 bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 {
 	u16 i = 0;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 406fccbcd4b6..76ad979c2a36 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -151,8 +151,6 @@ bool IsHexDigit(char chTmp);
 
 u32 MapCharToHexDigit(char chTmp);
 
-bool GetHexValueFromString(char *szStr, u32 *pu4bVal, u32 *pu4bMove);
-
 bool ParseQualifiedString(char *In, u32 *Start, char *Out, char LeftQualifier,
 			  char RightQualifier);
 
-- 
2.25.1

