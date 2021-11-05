Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61D2C80
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 16:53:46 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id o14so11451597plg.5
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lw3syTyl3QqLO29zLcWWRiGYqMVOb7lRsimsIo5QZQI=;
        b=EYNJQo8oY4YQdKtotJz2ACvtjZlQbJH0MbT7hl1u4TJdfjiSrCp+NbsVXkcCa21Zpx
         GyveAAknMlwKA0cRiu29+skMKKvYwjZF+6rcBW+2r5RmXyFxodNyOpGZRCyAr4Rnrgwi
         yN7kLDwY8+1giGqYJ3uSxh1ncdJSsf/3dKXXp7pJRxWmJz3YnHdU2JtgkRRmwYYLh8L9
         7VEuaAUqNKzGVU28KkiB/aV9MrEZky5tcyg9HV5VtF52WtDijsX+kJ3P+VbjaUIrlnMX
         B+8LZLqLvZSXT5+m09BCyC5FPtC6nX35MncTGucxo1E71S+iZoWP1i3qFJgPcvSPVWw4
         EMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lw3syTyl3QqLO29zLcWWRiGYqMVOb7lRsimsIo5QZQI=;
        b=Y8odhwInxH5veA54nxrWhhhH7/WI8fKoXUD5gQz/Gs8SbVJZsAVQMqNzCj3nFWnfA+
         3iKdLaVzLn+OljKEeAzKMT+cRVU/Z8yTLaLyc87ZGp7cHv8OrYu3lZbxgTIgod9YpTu2
         2AejlKq0wb+oOLPWVR9RTdJo5gArFtRECqn7vxSMIk8GdaJ58UaKwkwzeKHUjgB4CyIz
         L4H3VfKXsoEalCPDRFu4wcWkJH3zLIma6xdalS0rCHGVaBS5ZVc4RaDLRHOFDlzfB2/j
         BP70awShB0bKn1GgQZMEbkwPUzohyOoESAAslxhVi954SaHhYCASfjPLZ/0tcEhwqHcc
         7WRQ==
X-Gm-Message-State: AOAM533Wm5JsEFRlSwNGugm2AZGWOmZj3lOkZn8aSZo4E8zP+FPA5mXr
	eS9ndTs2GfxZjEH0NPke9xQ=
X-Google-Smtp-Source: ABdhPJyGCBcbqSIiQ8r8ja5/bhzaW2JyKiS6HqAQ4B3kB157FrkOroJ75RQNBHVGdFC8RBSnEqWazQ==
X-Received: by 2002:a17:90b:3717:: with SMTP id mg23mr31743831pjb.107.1636131226006;
        Fri, 05 Nov 2021 09:53:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:4490:4409:3406:a18f:7c45:2f81:cea2])
        by smtp.gmail.com with ESMTPSA id s30sm8524425pfg.17.2021.11.05.09.53.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:53:45 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	saurav.girepunje@gmail.com,
	dan.carpenter@oracle.com,
	shreyaskumar1035@gmail.com,
	ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: core: remove unused variable pAdapter
Date: Fri,  5 Nov 2021 22:23:29 +0530
Message-Id: <20211105165330.78524-2-saurav.girepunje@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105165330.78524-1-saurav.girepunje@gmail.com>
References: <saurav.girepunje@gmail.com>
 <20211105165330.78524-1-saurav.girepunje@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused variable pAdapter from Efuse_Read1ByteFromFakeContent
This variable is not used in the function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 430e2d81924c..bd057e041a08 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -31,10 +31,7 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
 
 static bool
-Efuse_Read1ByteFromFakeContent(
-	struct adapter *padapter,
-	u16 	Offset,
-	u8 *Value)
+Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
 		return false;
@@ -250,7 +247,7 @@ bool		bPseudoTest)
 	u8 readbyte;
 
 	if (bPseudoTest)
-		return Efuse_Read1ByteFromFakeContent(padapter, addr, data);
+		return Efuse_Read1ByteFromFakeContent(addr, data);
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
 	/* 0x34[11]: SW force PGMEN input of efuse to high. (for the bank selected by 0x34[9:8]) */
-- 
2.33.0

