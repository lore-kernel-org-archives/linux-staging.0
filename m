Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E76E17F9
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:54:09 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e21so5252edc.7
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 01:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=KwKZVOZR3GJHc3jlnF0u1iBjRpLe4GFgoYhD+Ro9tFA=;
        b=bHnTY0e17WQrnhkFe0v0JcWa1ICaH84+lJTKQZlqf9QimQBOyoFYY9ahRRTUZCBY5N
         siQMhNHdYC4xbwXG0rXg+//A4DpZfUTJ5cua9+ag0c1WiH1/vFBtxwpr4qxTf3RbsfW1
         KyAkSveejM5NREf78Rw3v0PHtnAsPzy+xf2ak6sRfls2TKx/8+xVdjsFeOl2MzaqzCiG
         NQIld02ZUEdnNBt6IPbdJMrA5bav0uaDcaZgR6Am9ddoEvNNYkxRZvHssPJMFVmwzkHg
         In4fr1rTSRWuwtxrGNJN+ToP6RAxJlkk+eLPIj5/1fjbRxl7732aVSXAabjFktMlsuXS
         paGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=KwKZVOZR3GJHc3jlnF0u1iBjRpLe4GFgoYhD+Ro9tFA=;
        b=fzCfEtOKAzE3TCXkJl12rENHUQSQW6SjMXUCW5a+dvKqnE4/jjsWtF3jqgeGtVSwgq
         2H82cIOlPNHvDD6A8YXhY8vqWGCzkRG22DUJ35IdNGlGTPkOUIyFa/zd6F3+UVk3B3zv
         Hez64cKp6o7GDMx7hrad5z8HnW14y697nmxTVriS91kQKCVAnsHEQbu8zQd7qJkra97w
         Qk2u90fSvKT6c+nwEewyP4tL1La7UCuITR/vBxfTJy7mZa6lK30BjQgnqR1myJCrJN7/
         E+9VN0N56kb0HVoYXbEExQ7VFJOe9nS2HrYKCyg6wtcrc1uSgHsR0L0rCWsd9scd8kE2
         UWGA==
X-Gm-Message-State: ACgBeo1OE+D7GzyMQBRkhoBnIIJm4kJtiI7n1vb7KDsuA/x+WmVS3T8s
	O+woYaL9KiK8eCQ9fmly1Qk=
X-Google-Smtp-Source: AA6agR7qM5bf/Q68jZvJnIa1spu+fyHZvz11/ztBSI7zFdKT40RfuwXvcXpe/5fUkXNLaDf9gTaH0g==
X-Received: by 2002:a05:6402:1d4e:b0:43d:9822:b4d1 with SMTP id dz14-20020a0564021d4e00b0043d9822b4d1mr5390131edb.212.1660899247969;
        Fri, 19 Aug 2022 01:54:07 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b0073c9d68ca0dsm1084261ejb.133.2022.08.19.01.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:54:07 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 4/7] staging: rtl8723bs: remove function GetFractionValueFromString
Date: Fri, 19 Aug 2022 10:52:54 +0200
Message-Id: <e782bcd3ff8c33df8da7eb6b8e4bb00b1c270edc.1660898432.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660898432.git.namcaov@gmail.com>
References: <cover.1660898432.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

because this function is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 43 ---------------------
 drivers/staging/rtl8723bs/include/hal_com.h |  3 --
 2 files changed, 46 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 909b37bcc897..f82cbe5a77ff 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -939,49 +939,6 @@ bool GetHexValueFromString(char *szStr, u32 *pu4bVal, u32 *pu4bMove)
 	return true;
 }
 
-bool GetFractionValueFromString(
-	char *szStr, u8 *pInteger, u8 *pFraction, u32 *pu4bMove
-)
-{
-	char *szScan = szStr;
-
-	/*  Initialize output. */
-	*pu4bMove = 0;
-	*pInteger = 0;
-	*pFraction = 0;
-
-	/*  Skip leading space. */
-	while (*szScan != '\0' &&	(*szScan == ' ' || *szScan == '\t')) {
-		++szScan;
-		++(*pu4bMove);
-	}
-
-	/*  Parse each digit. */
-	do {
-		(*pInteger) *= 10;
-		*pInteger += (*szScan - '0');
-
-		++szScan;
-		++(*pu4bMove);
-
-		if (*szScan == '.') {
-			++szScan;
-			++(*pu4bMove);
-
-			if (*szScan < '0' || *szScan > '9')
-				return false;
-			else {
-				*pFraction = *szScan - '0';
-				++szScan;
-				++(*pu4bMove);
-				return true;
-			}
-		}
-	} while (*szScan >= '0' && *szScan <= '9');
-
-	return true;
-}
-
 /*  */
 /* 	Description: */
 /* 		Return true if szStr is comment out with leading "//". */
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 7be0ea20bca4..b49b0a0355c6 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -153,9 +153,6 @@ u32 MapCharToHexDigit(char chTmp);
 
 bool GetHexValueFromString(char *szStr, u32 *pu4bVal, u32 *pu4bMove);
 
-bool GetFractionValueFromString(char *szStr, u8 *pInteger, u8 *pFraction,
-				u32 *pu4bMove);
-
 bool IsCommentString(char *szStr);
 
 bool ParseQualifiedString(char *In, u32 *Start, char *Out, char LeftQualifier,
-- 
2.25.1

