Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5889C70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FCBC61042;
	Fri, 30 Jul 2021 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637079;
	bh=bo5PTnoiu7gFBaAFH/GRgDIAfbWtJ8wr/OG/B/RsjEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SwJ9b1HmTsd4DasmSLklCYn1Ll7jkaIJ5LbHQDqvTGJsyUcBxKn9ItpZROJVtYpOW
	 NBzXTNcVxIZVsKaBU0luUNnA3V0SfD3AYVwpToZ5ZgEhPka9Rjvr76cqFMBX2yGvsI
	 Voe+JNx0hTwrQqJkdEcHH+sDPaHOKFtMKun38Iwo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 07/12] staging: r8188eu: remove rtw_mfree2d() function
Date: Fri, 30 Jul 2021 11:24:12 +0200
Message-Id: <20210730092417.1014392-7-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447; h=from:subject; bh=bo5PTnoiu7gFBaAFH/GRgDIAfbWtJ8wr/OG/B/RsjEY=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx1Mk84W+YbxW6zknBbx8+KiS49Vv9YdfJH9zTSiwFeu +qJdRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEykxYdhwZx961grxBxWKd1+N2HRul MMC/qVlzPMzz+uu1NTguv2STPJrbMDguRrbp5gAAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

It is just a wrapper around kfree(), so remove it and just call kfree()
instead.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 8 ++------
 drivers/staging/r8188eu/include/osdep_service.h | 1 -
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 5 -----
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index af7977165c3c..02ba495b6d2c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -187,9 +187,7 @@ efuse_phymap_to_logical(u8 *phymap, u16 _offset, u16 _size_byte, u8  *pbuf)
 
 exit:
 	kfree(efuseTbl);
-
-	if (eFuseWord)
-		rtw_mfree2d((void *)eFuseWord, EFUSE_MAX_SECTION_88E, EFUSE_MAX_WORD_UNIT, sizeof(u16));
+	kfree(eFuseWord);
 }
 
 static void efuse_read_phymap_from_txpktbuf(
@@ -921,9 +919,7 @@ static void Hal_EfuseReadEFuse88E(struct adapter *Adapter,
 
 exit:
 	kfree(efuseTbl);
-
-	if (eFuseWord)
-		rtw_mfree2d((void *)eFuseWord, EFUSE_MAX_SECTION_88E, EFUSE_MAX_WORD_UNIT, sizeof(u16));
+	kfree(eFuseWord);
 }
 
 static void ReadEFuseByIC(struct adapter *Adapter, u8 efuseType, u16 _offset, u16 _size_byte, u8 *pbuf, bool bPseudoTest)
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index e61113c2608c..ac45eec75153 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -226,7 +226,6 @@ void _rtw_mfree(u8 *pbuf, u32 sz);
 #define rtw_mfree(pbuf, sz)		_rtw_mfree((pbuf), (sz))
 
 void *rtw_malloc2d(int h, int w, int size);
-void rtw_mfree2d(void *pbuf, int h, int w, int size);
 
 u32  _rtw_down_sema(struct semaphore *sema);
 void _rtw_mutex_init(struct mutex *pmutex);
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index bec784dda81b..d11718013cf9 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -91,11 +91,6 @@ void *rtw_malloc2d(int h, int w, int size)
 	return a;
 }
 
-void rtw_mfree2d(void *pbuf, int h, int w, int size)
-{
-	kfree(pbuf);
-}
-
 /*
 For the following list_xxx operations,
 caller must guarantee the atomic context.
-- 
2.32.0

