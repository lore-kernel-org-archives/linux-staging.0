Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0850C4DF4B3
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449672; cv=none; b=VB3p2MAowY4Ycy97K5EsFS3aqfB/yfM+B6wCgqSlnBrMaPzpMmk78h03+32LkJOM+PyGBQKEYpZfaYK3ru1tdGo66RJEcJEBT6iFPaXXJ6wbOiCgm/o3wXKgIGwXIuq5xuUB3zXRhAgYMQrVlLhknKeJfPk+E1I9RwpfQEesS7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449672; c=relaxed/simple;
	bh=goQu9Jgo/wzgznFj295FQUjpYm7lou0KSDavxxBHM4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhb3B5WcgjrtSvGrqIKes/nz+Bzjpvx/qtR3HNP51uVsqWT7phV48WSQnqN/7U3On5Oqc82WI01fh1I9NLGtuFXGiN4MKQAmllXACTwSpiiznoc5wIbWuUGXeWSYHtT9rDIGzMY6+zD0LrUK8VBAaABOeDDkrh5NLwb4XFei3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnthqoEG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnthqoEG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4994d41ceb9so1870665e9.2
        for <linux-staging@lists.linux.dev>; Thu, 03 Sep 2026 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449669; x=1789054469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkuD/BaHiKXvm0lMtMhPcQ74061Sh7KqlPSpTfAlPBU=;
        b=OnthqoEGak2+byBA+Yvc+ShEZjs38YzRS2yn0D2S8R0+4z5fdfr2upHZGgBGREeT5E
         xXlDi1tDTxzAqCnwlbWn7nJxRQVdndUqHO7YNyPotY572gWBCTBczi5h4wSyIptHt/9i
         nFUgEO01IA+A6qh0H0mmGsAJMOgnbSQaXdImxz5E6qITGWYD2gYGsslx6+iXUAtQWF/t
         vEhb1viC+l08H4Ht57w17B6txj7QfyJqEjqNeP0/ZEaKDdDhpDVAr02c6s9Qxqom73o9
         eqeEQjH3/9lTsBPePuu+x35uh0v84gHwwPLIZwHYD8L0gPpkhimSgPN/+uR6Ww5V+hds
         0YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449669; x=1789054469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkuD/BaHiKXvm0lMtMhPcQ74061Sh7KqlPSpTfAlPBU=;
        b=hWgphaVeVBHAgzcuSozAP9C9/OsyYFafNqZNNLjBgxyPLjuyA+dhayGW+TuCwBc/xn
         gUnk2TPvKRU2KpynmXRzjPjDeAu9xZDnB6mnI/VVcH4jN7TjOU8zUBBvkJM1GWnjNCP6
         lIjoMkG3XrkFHlAMi5YjwiAeZABzyg44vTVK0Yp9VC0u+V+o7wjD2781j1R/fnRohIqb
         Q8b6mJh7s1+UoSFIvrymHfbZhDdZUl6Fkd8D7U7eJBPHX8VndU+qIeSpnAkyL1j4Bxa4
         9lmoq8cBHfX5fFgks+ucjMxKN54obgidrR3hri/LYAsn0K1ypqUUi4adKupwDOIrFJNY
         kwrA==
X-Forwarded-Encrypted: i=1; AKwUvBxicgJvgQ17KKlkky9DxSFYNwRG5eIMFXHW7gwV4PBWiCKiscpgp4homdQBAvhWUCB7t/y10WP+++MLv6px@lists.linux.dev
X-Gm-Message-State: AFuF++ks4kHw+9JhWZRtmrWhRvTyUOvuih6h2I3G5pFHCPiccVs94W34
	+RF+m+0La+aqjPA0D0fRDaSmEkEYKmbm4fpkrR+X69RvWf32ZqpgM64s
X-Gm-Gg: AYBFou2Ko7FARVDlKBtohGuw+851arWEivmSGFsTPxXfEZ2/XXmKRogcttH4AwLpIyl
	AWhNKRwclrq/FD8HTmZmraPzunkW+cT4lb8EnXjGY0RwgPUGoP6dy92TSdmS98MtpM+EuUZFAV1
	4c+gw9pj2aZ51PCY87/wL+5fmKdJhODOxgNa5tsaQFMbsXST29RYlfLf7Jb25EHcO5zEBwOAvbo
	OCbBFfdzmAkOBWuaWdhCzxapsQ4ueZNiIipgzL1SAH0g6JfFEbAe9xxc8geppJCHFPCFk6XkcBB
	aofqE9JQY9aX38UaAW+lEsnwh0Aq1kaL2qBzl9f4JpXmJHqwgRHUxb0Gc+Qijtjy6Gm8U8WS8oo
	rXKEMuI38cZMyVys+EXr84/JhPC1xA9aVXuQdO4XpG6AzKhBNKCt4uiMC7mPV7G51RR8mZwNeJU
	rtvjFQtoKVhVJvv4xk8lWmQCPzMjbzyzZITOtAeMBcXnnVyo73/e62AxEZj4SWZwZGgJBk2G7Ay
	FrwdBnfVpfDwqxW6yeOlWW5CTJd/NiYIcjzCd7wHs2o4jfX9WGqbny3vn7iOs6qKy/EZC7N2dKt
	3XY6NdQBgqzc5XjhAYo3Loli
X-Received: by 2002:a05:600c:83c4:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49ce580365emr105280595e9.1.1788449669019;
        Thu, 03 Sep 2026 08:34:29 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm87754845e9.1.2026.09.03.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:34:28 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused phal variable
Date: Thu,  3 Sep 2026 17:34:23 +0200
Message-ID: <20260903153423.1814932-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing SdioTxFIFOFreePageLock also removed the only use of phal in
rtl8723bs_init_xmit_priv(), leaving the variable set but unused.

Remove the dead declaration and assignment.

Fixes: e9b50a2821bb ("staging: rtl8723bs: remove unused spinlock 'SdioTxFIFOFreePageLock'")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608310749.mheatdIW-lkp@intel.com/
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e8..0441e84ea87da 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
 
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
-- 
2.43.0

