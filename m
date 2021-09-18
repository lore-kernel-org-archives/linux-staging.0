Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C293FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:58:04 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d21so19216939wra.12
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GN0wJ5LnNY6MYcGXoZ0yQC1yHdhXckp/WdDFfQjh9kk=;
        b=HDzUjA8/t9XwZlA0ZRewydSInyoCIRHunEnd9TC4sXobyukeYHELIppaqRFr20Is7P
         /6rtpN+RkCySxtnfFgZhyC/EG5uGHmkZjtlkGWJjMExu5h/BaqaOyBbANTCQJbCKB3kw
         lIwZHJpq4Q+d99PeGLL9xFc86jbeICoG9P8UpVnqoAd8D8s9XBgBVMYquInuoOEQ7qNw
         GjKfeT24zzVDYAIx95hI6apaC9i1f45Ln7zjwqoNdmae6WoMjxjBEy0Fzs6/LRMAOZMr
         ZD6tAQ+ddAicIpDKRfraKPv7mTihc1TszjNIRnTNdB+7p89VmbsvhvssdWzK+Rfr0ohR
         KnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GN0wJ5LnNY6MYcGXoZ0yQC1yHdhXckp/WdDFfQjh9kk=;
        b=XLMpPKGR/6iMOn+RSa4+ZU83boQjDxtL5SAhmFLfPsvwc4nGz4vbmD4xk892C76K8Z
         D7Qf7U6O9fTz5CxKOCqwYwqYpdlCX5aMj2NLlPGITwbfpLVZRRnthszlnUOBNJx5rQoL
         VsbZluZB8qOCQ5x3NwQ71EUVCWwkFW5zfcz4DcUb4lBbE+8yb8bpwQa3zGYAUch+Y46x
         7AW7yusi/pCv9yQvG+2PCf3R5y9o8tan6/C3L6qk2hZL8LDNOD8XR1DdtIbjzEt7/7WM
         OH8ordVycJJ7OrlJPp+C5J94sRrhnmI68luVwLSNLJiWyd+UqE3JNqRsdZHNSwoC2PcY
         CvWA==
X-Gm-Message-State: AOAM532RbFAhGy7iyfo8LFQgTL/RAqgFcnUFledJrhjRZeWuin7p7ZY3
	Q9jOmNiEtlpUBKGfW+cgPHk=
X-Google-Smtp-Source: ABdhPJwx0McoFN5Vjc/Fxh6Jfqyy5O/iD1mjHQ3dQhngP/mFr5R3CzGVfXSMMgwKmr+3V+RE/fBsrg==
X-Received: by 2002:adf:d216:: with SMTP id j22mr16542547wrh.191.1631959082580;
        Sat, 18 Sep 2021 02:58:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id o26sm13013287wmc.17.2021.09.18.02.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:58:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 8/8] staging: r8188eu: remove EFUSE_Read1Byte()
Date: Sat, 18 Sep 2021 11:57:27 +0200
Message-Id: <20210918095727.13591-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918095727.13591-1-straube.linux@gmail.com>
References: <20210918095727.13591-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function EFUSE_Read1Byte() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_efuse.c    | 58 ---------------------
 drivers/staging/r8188eu/include/rtw_efuse.h |  1 -
 2 files changed, 59 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 0c4ea1e45842..801887f497cf 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -127,64 +127,6 @@ ReadEFuseByte(
 	*pbuf = (u8)(value32 & 0xff);
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	EFUSE_Read1Byte
- *
- * Overview:	Copy from WMAC fot EFUSE read 1 byte.
- *
- * Input:       NONE
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- * When			Who		Remark
- * 09/23/2008	MHC		Copy from WMAC.
- *
- *---------------------------------------------------------------------------*/
-u8 EFUSE_Read1Byte(struct adapter *Adapter, u16 Address)
-{
-	u8 data;
-	u8 Bytetemp = {0x00};
-	u8 temp = {0x00};
-	u32 k = 0;
-	u16 contentLen = 0;
-
-	rtl8188e_EFUSE_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, (void *)&contentLen, false);
-
-	if (Address < contentLen) {	/* E-fuse 512Byte */
-		/* Write E-fuse Register address bit0~7 */
-		temp = Address & 0xFF;
-		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
-		/* Write E-fuse Register address bit8~9 */
-		temp = ((Address >> 8) & 0x03) | (Bytetemp & 0xFC);
-		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
-
-		/* Write 0x30[31]= 0 */
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		temp = Bytetemp & 0x7F;
-		rtw_write8(Adapter, EFUSE_CTRL + 3, temp);
-
-		/* Wait Write-ready (0x30[31]= 1) */
-		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		while (!(Bytetemp & 0x80)) {
-			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-			k++;
-			if (k == 1000) {
-				k = 0;
-				break;
-			}
-		}
-		data = rtw_read8(Adapter, EFUSE_CTRL);
-		return data;
-	} else {
-		return 0xFF;
-	}
-
-} /* EFUSE_Read1Byte */
-
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8 efuse_OneByteRead(struct adapter *pAdapter, u16 addr, u8 *data, bool pseudo)
 {
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index 2dd74c9c691d..53ac906f79fd 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -118,7 +118,6 @@ u8 efuse_OneByteWrite(struct adapter *adapter, u16 addr, u8 data, bool	test);
 
 void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
 
-u8 EFUSE_Read1Byte(struct adapter *adapter, u16 address);
 void EFUSE_ShadowMapUpdate(struct adapter *adapter, u8 efusetype, bool test);
 void EFUSE_ShadowRead(struct adapter *adapt, u8 type, u16 offset, u32 *val);
 
-- 
2.33.0

