Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEDB17EE
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:54:10 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b16so4852777edd.4
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 01:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Wkt4yDwYFOHbUgy/ksyjGBA/L251ZQDRHJTdSWCyqSA=;
        b=jXR/EAeh1LtJa4xtGuazKLbd8wfW2pJeoinrnZcLK1TPA1cwgDgaxc8TzRq8CApoEh
         PMcpmUyd6s96yUWBZLZaBZBHiMCwiZ2Bj5SEsXnJmKlJS6ZPYNzoFoImKg0GM856xquk
         RSbJ/V5wIWUnxxuZOYeA9G49NqQj9h9V6fIxKzMs2wZWfmeOPBDEom/XJzURF/Q82i0p
         SQq/uEpTtEQqdonAzsVbsBAv4jcZDJdlORzVgE0a2aNrbKuu47GBhqIkzxXMIG5C5+kT
         7ukiotfwxkvMQDcN58Atax9nuQHAJ4v/O4DQdNCUguPeythV+TGpD7cG0BvWfDT9Rmiy
         TFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Wkt4yDwYFOHbUgy/ksyjGBA/L251ZQDRHJTdSWCyqSA=;
        b=46MUzXo+XpCocMWXmK8/INUYNnTqA1Hl+zpYe+IRyCKLDsc4h3kOUq8dmS9+fp6X0T
         IKZW2eTmRY/JgH/WDGPdlifVy7IQN2aB7ogu7e/9qeV1YcCBWkG9dhyJkKSwbozG5hgy
         SaJd+jz7jXNM6Pxo7LCnxZzI5T4ykFyOZBbwtyKow3nXijnBviKk0tJPWaqHQqV/Hcgv
         nFegYOPg/oAwpgxi+s7gPCdxPXJFuX4gSGvnht0p0Lh7kjXnR33Apn1YpZbd+bq2vzvr
         uDU3zGmSvQ947Uon6oGwKSb6QUZuzgA9iWzkD92m89mUMDNJIn9ag5HTM4oAAOvgfW09
         2MPg==
X-Gm-Message-State: ACgBeo3F1+gkgZ/LCJ6fVHGQoAEtgdaNZqXVwhooMs/7S6VodOGKTXwv
	d0nrCd2Fjyll7ITuhqy0rmk=
X-Google-Smtp-Source: AA6agR6dPomSIXWSFzdLmxyvM4Y8IWN55S1vVrbzpLxAZZWG2xnclM4xwiARfhSDuMFnfXdqu3EF5A==
X-Received: by 2002:a05:6402:254a:b0:43d:a634:a0ab with SMTP id l10-20020a056402254a00b0043da634a0abmr5294340edb.298.1660899249140;
        Fri, 19 Aug 2022 01:54:09 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b0073c9d68ca0dsm1084261ejb.133.2022.08.19.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:54:08 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 5/7] staging: rtl8723bs: remove function IsCommentString
Date: Fri, 19 Aug 2022 10:52:55 +0200
Message-Id: <c062f678dc8f99c18a251f6137c4c3883f8c8205.1660898432.git.namcaov@gmail.com>
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
 drivers/staging/rtl8723bs/hal/hal_com.c     | 12 ------------
 drivers/staging/rtl8723bs/include/hal_com.h |  2 --
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index f82cbe5a77ff..1c744d0b4742 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -939,18 +939,6 @@ bool GetHexValueFromString(char *szStr, u32 *pu4bVal, u32 *pu4bMove)
 	return true;
 }
 
-/*  */
-/* 	Description: */
-/* 		Return true if szStr is comment out with leading "//". */
-/*  */
-bool IsCommentString(char *szStr)
-{
-	if (*szStr == '/' && *(szStr+1) == '/')
-		return true;
-	else
-		return false;
-}
-
 bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 {
 	u16 i = 0;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index b49b0a0355c6..406fccbcd4b6 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -153,8 +153,6 @@ u32 MapCharToHexDigit(char chTmp);
 
 bool GetHexValueFromString(char *szStr, u32 *pu4bVal, u32 *pu4bMove);
 
-bool IsCommentString(char *szStr);
-
 bool ParseQualifiedString(char *In, u32 *Start, char *Out, char LeftQualifier,
 			  char RightQualifier);
 
-- 
2.25.1

