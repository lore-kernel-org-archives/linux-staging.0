Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B283214
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 13:50:33 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id tl27so8941816ejc.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Wkt4yDwYFOHbUgy/ksyjGBA/L251ZQDRHJTdSWCyqSA=;
        b=dRPN98xziBG2n6jy2drmwYpBCuIcqx00aPQBaA4fKvBcLeEe617/Cd2j2a040sjt6r
         4r5b7ryasI9MjEcFoiue4KG2lBKzD+rAnFqbrgHuUilh4oQhwGhiohnYAsr/l13UCjjB
         9NVJimd01k1LqFudpSiLF4LuZtVYzJlJwmahDV0bTQQefJsoCJUAMn5QKgR3ow0PIAkk
         sUCUc+5w9eqFJhiQG5yjwcbhge5C/F99YaYGaWlJJ5xoGIWWQsfIXDzMsXt7I4cLVkHK
         uSZJ9xffLAagbYtcwkWzSgQhpqS7qwOmHrELEPQSlpETuymzgfOX5penx/Hw6O4iy694
         tYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Wkt4yDwYFOHbUgy/ksyjGBA/L251ZQDRHJTdSWCyqSA=;
        b=Sb1DFw1inAmhnmW9Gz3YQy5raLo5lnhEX2g9bBCMalB55cF1cuP8vy0Lj9/rx8GCRh
         1KfBLXDJpANI5UNxn/vKV7Dep6X2JvUrtDY5Y8kYrOus+QfPtOaEXq8a+L3V7hRdPbS/
         ExcTfcEJvlJPr9xklmRy1QPU8Fg+CAxvGCuQMNfHtpCFsBiKAbUckHmMLE9rmQhmNPsh
         pnDUwW3dXfzodFmel4TVoWcSo+uletZp7UPnHnZqpgMhIaMMFc6bZrydA0J4jvTHeWbd
         aT4BpqIpE244wYv5nA5sf79mpG777BUMMvRuP30/PfzRXCVNcmzLJSi9DDhrBSpfXiNo
         L8uw==
X-Gm-Message-State: ACgBeo3tWKAhEAU0EOgCXgJC0Jv+TZpZaU3TLqT2uRXjr9SrnmVP5ICT
	l0V1D4oJKjlhDSyHA3KUzSg=
X-Google-Smtp-Source: AA6agR4ND+FbJiurFHvDzvIv1YD5QK/jNEld+D2NxMCMIQBQMkni0BfsvP24ydsja1f4CrQ+Hj9Q1Q==
X-Received: by 2002:a17:907:6eaa:b0:730:9fb6:41a5 with SMTP id sh42-20020a1709076eaa00b007309fb641a5mr4841567ejc.675.1660917032017;
        Fri, 19 Aug 2022 06:50:32 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b0073087140945sm2313821ejk.123.2022.08.19.06.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 06:50:31 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 5/8] staging: rtl8723bs: remove function IsCommentString
Date: Fri, 19 Aug 2022 15:49:39 +0200
Message-Id: <c062f678dc8f99c18a251f6137c4c3883f8c8205.1660916523.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660916523.git.namcaov@gmail.com>
References: <cover.1660916523.git.namcaov@gmail.com>
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

