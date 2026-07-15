Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A648B371
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119863; cv=none; b=WuSaIDoNEw/5LHGerfVKPmm9tvMdxI8+PfyrlalgByChEqXUvErw2v9l3LLrdW8XCQk63pz5ZClD3OCKcVSX6NjhHY7MxtPeQj0RDqXNpsZNkt3XK/GkmD9eX2qk/fLLg5qRgYYcDRO4D0qGY8pJSWYtOLJjWtnLuCQwlU3jU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119863; c=relaxed/simple;
	bh=MgwMfJEReFvN72328jtvIskPGt3bR6CiNueYu5D+8PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqOlazvThb8wcOqkQH21iY8Mung1PFiqUruHAOjqcfvTpKGc458GVBwQS6tmLuTcOC0WRa2CjRxN79Mo/LD8lmv7GrlhTlOZ+gBrViSdVqIerTpgXioFJGUbCV9enYBqa0uqrzJv0i4eMmctFiaTOB9Rblf7sOA/gfP1jxYKsW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn9Ciwdc; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn9Ciwdc"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39ca300db70so33709071fa.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119851; x=1784724651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lChfMGSwq/R5r+MODZabX6LrPsAs/T7BI6oVqUDf/sI=;
        b=Vn9CiwdcP/eYx9lx1AnEVjGI+o/AJYddvpiFIsMaTW5al4Q2CkwldF7+uaNxUcsonr
         GvA/EFu/eWTr1HMI1NnFUe+K+3KH/mVseqTIq0f1ZMCS3S4BrCm96zhno3Yu4jDMKEfk
         Nlh8puy+pQeYSHJrmiWjnazT4akeWrKoNkiKlnmP2LtKigHiEhd5xTAAJUqVh2+ZCYrs
         L76daPvwcNESx4EIlGYkMOmu3cphqq0uh94TxrizWVLLTbS0ShZpno6R/DwFjqS8dYZ2
         AZp/z6/0PdIAciCbkuXjq4kdCST81tTKdrwl/ysAjL1e+WIC/9kIbaspcSem0EG8LCbG
         H9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119851; x=1784724651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lChfMGSwq/R5r+MODZabX6LrPsAs/T7BI6oVqUDf/sI=;
        b=a25Goqz/SqhX6FUeUUnxRHzrxcjy1Czx+R0f43pelTtvqDO/YECryfLAtizhC/GzwR
         fqMd01H7FqBVH7gi7CD9+xGnmKzJdO/v8d3NPiaSR8wIBalkpdR3gqDyqx8knGj2cKNl
         aT12fnU9G60RJH7DxzJeHsSEmkWSZOdVHh2BnG1WB99EnGaBsyQpRmrmgqGKifkKn/bN
         yJ+8fyZzOGFRlaEH4VkNOqNusoUHuw0uoL9TjRoWyyauUwSWZWmjflvFN8Sq4pwLjUOj
         nR3xdUDAYaq5aH1/Zwr5qHUQgxhc0ubyogFeK92aS3YbfAz6PwZ1Q3KdSCyAb4c8roIM
         x+uA==
X-Gm-Message-State: AOJu0YwrnJXBsM8pvlq8TqhB2ZRePQEABwCcNU3XtgyFFPva/rxBhLmO
	fbyc972peIx7vOtqBoccTUSVi6bEpnYnOopEvprgg3lyWS2ABI5ssRiK
X-Gm-Gg: AfdE7cnWbzvIW5pb3echQs0+//FdEkqsY3semadWx/z4wX0ch6UDjbq7TSN5zdr8NW8
	Jvh6xE89H507Urkod/srUSy+SUDxX69dn+bazcxSAKt2076VK8hU2hGmQIKRykf5JyF9cxqriti
	CmF56nakgq2WNcanrHqj0E984AblmMHsiKpVEiT2zpDXlzBBtcHqVEo3emPqbhQp50457nDx3Gp
	3BgbSgctix09NEpxoMm0eSm3xEj/1mv0zwoKlueh8Rmm+sStePKIyabRjk4bpQd8su83IlVHwNU
	dk8BlNFL5mNSWJCpEFxnsn++vy5jfSmXybRNJPH8SeeQ9V3ekSl649hDs5h11NkqzUD4fG+p74M
	XtT/VGeoTyTgDywMJyXc/J5nDcRfSNtl36ic61Kdqv82HsU7icXIVvvFXRxVLjRET6JL4PFrICS
	omQpHiIeL6kNDy5iPO6PCKQTJJEyvY+OGD919zhavr7YZvL//98yXi7eLyIHjmDe9fdXJVy2xEX
	kgBvB/QpIv+Ag==
X-Received: by 2002:a05:6512:4045:20b0:5b0:2176:69f6 with SMTP id 2adb3069b0e04-5b15d7a50b0mr461132e87.37.1784119850645;
        Wed, 15 Jul 2026 05:50:50 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:50 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 44/61] staging: rtl8723bs: remove rtw_init_hal_com_default_value
Date: Wed, 15 Jul 2026 19:48:12 +0700
Message-ID: <20260715124829.90290-45-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the single-line function rtw_init_hal_com_default_value.
Move the AntDetection initialization directly to the main HAL
setup phase to avoid an unnecessary function call layer.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 8 --------
 drivers/staging/rtl8723bs/include/hal_com.h | 1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 7 +++++--
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index ca0f7d7ec..638d598e4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -420,14 +420,6 @@ bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
 
 }
 
-
-void rtw_init_hal_com_default_value(struct adapter *Adapter)
-{
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
-
-	pHalData->AntDetection = 1;
-}
-
 /*
  * C2H event format:
  * Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index a52d8318d..e6d32cf53 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -123,7 +123,6 @@ u8 NumOutPipe
 
 
 
-void rtw_init_hal_com_default_value(struct adapter *Adapter);
 
 void c2h_evt_clear(struct adapter *adapter);
 s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54..295da8c23 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -640,7 +640,10 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	rtw_init_default_value(padapter);
 
-	rtw_init_hal_com_default_value(padapter);
+	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
+
+	pHalData->AntDetection = 1;
+
 
 	if (rtw_init_cmd_priv(&padapter->cmdpriv))
 		return _FAIL;
@@ -665,7 +668,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	spin_lock_init(&padapter->security_key_mutex);
 
 	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
-	/* memset((unsigned char *)&padapter->securitypriv, 0, sizeof (struct security_priv)); */
+	/* memset((u8 *)&padapter->securitypriv, 0, sizeof (struct security_priv)); */
 
 	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL)
 		goto free_recv_priv;
-- 
2.55.0

