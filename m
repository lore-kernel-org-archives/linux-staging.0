Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC023A1
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 08:35:09 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id k10so17262404edk.13
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 00:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678437308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gReelpVe4zvSWiZRdb8tfO79qo06lsPORLYzKHhKDKI=;
        b=SWku8Pd8dDAyAUoUWp4nVPyVnmqu8m9KfnggqUW6hqjOiOCxQGQmhrjYXw/XTV5q6D
         NJUXM9/K6dyg3UTvC+ZwmN+X5axinHki4oXxkcUtDTYfFO2NlDbzTgCKZzzSC2gW8GiZ
         Z03AgvUWM6axMuK6GFIRshNHF2bKNtJQJQJYxVkp39Rm+MKkUluYXjfjkjwo1dOKVxHb
         d6EjEiVwg0J01uiAs9VIsITZCCiLvo/e++CIrqX2XzLrrNg6Y/WM7KVAYJ9k7KxEGQVZ
         ywzDlwkF6hFvWI9Sd1EzfekYpi06EiIKtKGysvRyRuzyXzb3LTgCvJXBo1PMq7OSbOId
         kHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gReelpVe4zvSWiZRdb8tfO79qo06lsPORLYzKHhKDKI=;
        b=vlI0pU0788DaJKVctLSq4LzYA5QzXKSX6cQyRw/8Zw1zcOGzs8sTkU9dJwRPoQIUtY
         DmeGiBa32iGIl1+fJH+A3Dhs+DaaofaL+fFD+ElGX3YlmjRm0GCdsxyd1y7uMvqyOtxe
         RFYLdGFPA+fBNhN+IaBzEvGOEpqvrEnjwnB3EmlF50TnmItJF70Np+GuEWBL3OWZZ/XF
         AqYgtM4YFHhDVEOWJtF7/cjIpC4KrtCLJk0PEYVgn9THVl6iW2vv2TTg0RFZo/4bSWMW
         U6Lec8AW84CKFi+svj78dIi7WZ/7NBaPOXkXmjJaBQL7pkWe8y48N6TQC8soTmXOkxVS
         QRvw==
X-Gm-Message-State: AO0yUKXW5eSkzXhTGJBj+04RsBqTYSgVU8HrcZFqK7DCAkslPhUB4Any
	wWL77Y0N0T/HRIV/kWMIvxU=
X-Google-Smtp-Source: AK7set9/L1r/raS/hQPUMv+1ex7lPMAWTlgp4gB5S+woMqEvmkEeH771z0d1gMu8z/MXFLlSmUU3EQ==
X-Received: by 2002:a17:907:d14:b0:8f6:711b:8d67 with SMTP id gn20-20020a1709070d1400b008f6711b8d67mr34277473ejc.26.1678437308048;
        Fri, 10 Mar 2023 00:35:08 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbd3.dynamic.kabel-deutschland.de. [95.90.187.211])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090619ca00b008ce5b426d77sm697888ejd.13.2023.03.10.00.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 00:35:07 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: ParseQualifiedString() is not used
Date: Fri, 10 Mar 2023 09:34:46 +0100
Message-Id: <20230310083449.23775-3-straube.linux@gmail.com>
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

The function ParseQualifiedString() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 24 ---------------------
 drivers/staging/rtl8723bs/include/hal_com.h |  3 ---
 2 files changed, 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index b74817fc4316..ff0e41bf72b0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -877,30 +877,6 @@ bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 	return true;
 }
 
-/*  <20121004, Kordan> For example,
- *  ParseQualifiedString(inString, 0, outString, '[', ']') gets "Kordan" from
- *  a string "Hello [Kordan]".
- *  If RightQualifier does not exist, it will hang in the while loop
- */
-bool ParseQualifiedString(
-	char *In, u32 *Start, char *Out, char LeftQualifier, char RightQualifier
-)
-{
-	u32 i = 0, j = 0;
-	char c = In[(*Start)++];
-
-	if (c != LeftQualifier)
-		return false;
-
-	i = (*Start);
-	while ((c = In[(*Start)++]) != RightQualifier)
-		; /*  find ']' */
-	j = (*Start) - 2;
-	strncpy((char *)Out, (const char *)(In+i), j-i+1);
-
-	return true;
-}
-
 bool isAllSpaceOrTab(u8 *data, u8 size)
 {
 	u8 cnt = 0, NumOfSpaceAndTab = 0;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 8a7d31d1eaca..31fdb5c45de3 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -147,9 +147,6 @@ u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 
 bool eqNByte(u8 *str1, u8 *str2, u32 num);
 
-bool ParseQualifiedString(char *In, u32 *Start, char *Out, char LeftQualifier,
-			  char RightQualifier);
-
 bool GetU1ByteIntegerFromStringInDecimal(char *str, u8 *in);
 
 bool isAllSpaceOrTab(u8 *data, u8 size);
-- 
2.39.2

