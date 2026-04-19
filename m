Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6092690EC
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583338; cv=none; b=GeNokGyy9RhFlFgjh8Y1GiHOHa4fFakq2fVAJ5ga+px/ShTYudW+7KLborq+7whr0SQOdRfWgYrE8Y3E8b7hcVCLvOpjzXW9n0o3vdp+WAope/C4BRNsUZY02K8iiPfI18tlzwLSrAIl37tol6ASbtQnY6bE1SG7MNewk+9UQeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583338; c=relaxed/simple;
	bh=AMzlbRsQymLsolWakVBbl5T2hDTScndrueHrLgQToY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3+ggvZvGzqcFVMbnP+XLkOSVNp7nvTughNqFgJgLtIzXGizBJBzqi3hjEbCkb2b+yKuHMQJgwnb7dgpJnjuZ/doJ3BA2UvCthxBS6YMvYFSvoZgKZcKA2AITU2xTKz1NoVfINhpCkq2BDNKo/rd/rnETm25mAzv2/5L+0oOaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKBCM9ZZ; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKBCM9ZZ"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64e87a81639so1906849d50.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583336; x=1777188136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB/xiHxoyv1gV5+coJ9jRyHxeXTqQe1btbGhGWGYO7Y=;
        b=MKBCM9ZZ1Sp6IIDvvD34/Dj5VlgEb9hldvJWJY0ACubuGNQXe2MurcXjf4JpHgM+cT
         wJg1vFjO+BlNjBP27wgiln7+jfe2IWArlIGc1XKPDfWvzH4AcVdwE39eh+aZ5l2A3/Gk
         sJOW75KfsNHzGYxIpTL0MEF41i4NycqwiMy0pi+NRCd4GChNeN+zFfpqVxDPLfyvZfEq
         5WUn3A0aeM+tz8OSVyR7tjIlGwFBRiAuiG9zm1c1mUURyICGLhpjONtvO8SNJLwhuL6E
         r0AZf4hInXfgt4+w+sfiT9j71mdSYPxqCG4/5a+DxRhceouOYHot2iYtifZRn2dgE4Ud
         jfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583336; x=1777188136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dB/xiHxoyv1gV5+coJ9jRyHxeXTqQe1btbGhGWGYO7Y=;
        b=eQFj2VDvof/Tc6AZGUN9ExdC+b/9r1N/3ywsS3ppOdrUOVhFxg9D7NE1GnuWuVowMK
         hCacjjX/NLow6rYj0ZfOXWtdUqi2LCc42hB8KjU9nGLxNKwJF7SMtb0HSmThJYAonLhX
         FDp51PgqblXKmC5woqOD1ntaNtGFqzgVsbf7PVBXP1iez8svNWIyu+LLDMLQ6ELPPHc6
         fNbtAUuI/RixfwPuY1gcCwjQAN65fduBpNwEFpTBG9fsnVmxw1GLAw5TXFCW+9xn0jNP
         u32SjpyLlrfrYGud08tH9K9PAnhrSgp06NQVaM4gUnvTdn2lBQld3+p4djDl7DBU3i9z
         v9+w==
X-Gm-Message-State: AOJu0Yy2iOpnhnvYke10aYwqcdK432721QGDdTiARC7v+IOY21Xbr44x
	SE07Y5B4w8IBYE9+ksioR08u6R3l/D8nzFpRwRm9I9utXPCbzOZzKUxYCIlYHA==
X-Gm-Gg: AeBDieuSdUCMNPCR63xv4nWfw5Wbtkk2+6X0RQ4cn2P+2vroVpKOBcCT5fiFF6mMwK+
	JXweALRovHIK7fWKgLOm8+VvNxAL9HclbjwAA0HxMSUQbjaaYBYVT5gCcYakNzvJC0M5dg12MmB
	e0bBswKkvOJcSuUWcXGuND11/zEqh3UKEjfdLoi3uPUpE01q1spkuYVf4WclNwR/z+ZgHrObVLb
	iTHrileaDnqh4d7PIfek7gOq6+8mZOjApRat6mKU20eKuM0/Rod5+9i80vwILmn7zwZ7TeDl2Zq
	QXhDThjqysgEF7DaHQdKqJ678kUumsQxULsEVDVPJFCOL5uyJWCdUpaqq4IyVF6PcsYCyrQkKPS
	w/fWVzfSFIi7cLrO5Zk0ez4nsN99ptgariJh4KzpTI7ok6xAw7DvNqDUO/dNy9PvoXtm73aG7tK
	pA9R6LqHwPuYzr6RgVVt+hhaBR5MPLFUkmKZY=
X-Received: by 2002:a53:ac8a:0:b0:653:1b50:4ffc with SMTP id 956f58d0204a3-6531b50549bmr6815291d50.5.1776583336535;
        Sun, 19 Apr 2026 00:22:16 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:22:15 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 07/11] staging: rtl8723bs: remove wrapper rtw_hal_enable_interrupt()
Date: Sun, 19 Apr 2026 10:19:33 +0300
Message-ID: <20260419072034.19824-8-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419072034.19824-1-nikolayof23@gmail.com>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary wrapper and call EnableInterrupt8723BSdio() function
directly to simplify code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 4448082c14da..529648036f58 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -94,11 +94,6 @@ void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariab
 	SetHalODMVar(padapter, eVariable, pValue1, bSet);
 }
 
-void rtw_hal_enable_interrupt(struct adapter *padapter)
-{
-	EnableInterrupt8723BSdio(padapter);
-}
-
 void rtw_hal_disable_interrupt(struct adapter *padapter)
 {
 	DisableInterrupt8723BSdio(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 721501ca3b02..6af2337822ff 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -193,7 +193,6 @@ u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-void rtw_hal_enable_interrupt(struct adapter *padapter);
 void rtw_hal_disable_interrupt(struct adapter *padapter);
 
 u8 rtw_hal_check_ips_status(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index e487e238d737..2e573a0a255e 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -204,8 +204,7 @@ static void sd_intf_start(struct adapter *padapter)
 	if (!padapter)
 		return;
 
-	/*  hal dep */
-	rtw_hal_enable_interrupt(padapter);
+	EnableInterrupt8723BSdio(padapter);
 }
 
 static void sd_intf_stop(struct adapter *padapter)
-- 
2.53.0

