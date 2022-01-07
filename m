Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE692CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id bm14so20439759edb.5
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rWGc25I9UHfLAvl83M8OVDS0k2GJV0r/8CZZ7jpKHXI=;
        b=nOAYZAqJKCBfbha4LmVid9XfWWPF8Hn+fLbU/aq7W/Q9JkhTZYcFZq4Q7RH/601qps
         IgSACDshJlwYL9A1jcY2HhwlME4gm7dqzsLXfRv9ioXSHBQYIsrwn5Blwqm94QXyoMC6
         JOq+fJGC84cDB3dtPdCBLwOQqNw8czucTW0LZwFsg6o6xymMOVugVWmeQy3lSe1rDMb7
         g4eQqg/pM8Nj1818gfdF0xxQxBlgzTUXZ9e4KnoIuPimi1U8mU+pN82Wc3RMBxjrqMlw
         +ToD4pkcxuqa79274Ft2Dcbr96pWkU5MbcOi1GCYAuMCZkwgRuL19SK89e5F20XWcySZ
         Rxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rWGc25I9UHfLAvl83M8OVDS0k2GJV0r/8CZZ7jpKHXI=;
        b=yOmrZnpDaqFFMs725D6IbtARquuMSGqDeJiqY6+4BEvf88hgTyrvggo2c3ryj2Y1Ae
         dgpmdHOp+x/4STBvAsJNccENjiETHvCdfcOT8mjcmM56wg9sEutsFoTxfGVnyLYqdXbJ
         1caRrs/YRFjcyPiKQ5UDZbQk/WqMTtG5yNI5kcspGixqmeJerZlmBRHPMtTBvVVDfNt2
         BXuR9zcx8z78uUCb6LcPXVm1qU5uHrbLPLroRG1FZDMxhEWWzuYuN+MnMrcMvr5KgGI7
         0lVgwdAkHt9qB0ZZFZuK6HY8saVSFaCZ/2IkPp5DDq7OHM778rB+LVyg64jTUmvSq+bs
         AEeg==
X-Gm-Message-State: AOAM5305AQXzEMXeVJmyT09n4SO2fMZSTRFbpW4WREdx1YPfqyNk1Fca
	+qsbNtIf0wqYdXMV2T8INjk=
X-Google-Smtp-Source: ABdhPJxqzWL2cC5MH8XEMhWW9Z+kpyjzXks3CJZar9/yFi9O7GPdogFMNanyVhXCmXNKxhVm/P4HJg==
X-Received: by 2002:a05:6402:4313:: with SMTP id m19mr63020648edc.326.1641551796090;
        Fri, 07 Jan 2022 02:36:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:35 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/19] staging: r8188eu: clean up rtw_reset_8051()
Date: Fri,  7 Jan 2022 11:36:12 +0100
Message-Id: <20220107103620.15648-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107103620.15648-1-straube.linux@gmail.com>
References: <20220107103620.15648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local variable u1bTmp in rtw_reset_8051() to avoid camel
case and remove a call to DBG_88E that contains no important
information.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index b1f2d349c33a..d219882fc4a2 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -460,12 +460,11 @@ static int write_fw(struct adapter *padapter, void *buffer, u32 size)
 
 void rtw_reset_8051(struct adapter *padapter)
 {
-	u8 u1bTmp;
+	u8 val8;
 
-	u1bTmp = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, u1bTmp & (~BIT(2)));
-	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, u1bTmp | (BIT(2)));
-	DBG_88E("=====> _8051Reset88E(): 8051 reset success .\n");
+	val8 = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val8 & (~BIT(2)));
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val8 | (BIT(2)));
 }
 
 static s32 fw_free_to_go(struct adapter *padapter)
-- 
2.34.1

