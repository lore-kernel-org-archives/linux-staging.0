Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466328CF44;
	Thu, 10 Apr 2025 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290406; cv=none; b=huHdParayxwIoijHa50v7kmk1BZNMyS6KL772aozjs3DZhA7//kK+7IK9L2w75jIlybZJReEion+K0UKXaKsrEZGDQEvLfsfFmMxIr/iolSeavWjVxPIiWdzvDP6J8ClLKMpM/K/58P6Ga13ShDV8P//N718OxWL1jTUlR14UTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290406; c=relaxed/simple;
	bh=pjuWFOSZ1RZNImwMtIT7uEizjyExORnbaw11+N/b+MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKRRCubons/xqxQWGQCWMX/o4/UvZcYhB7baax/7FJ6cprNYJnRP9ZGsrsyXJKF4AbHsLXj9sgGU0s9votbnt8k9VGMJWAPRQ/F+mbIqOmjZ0rpygO5NcN/Zh6mQTv5WnOHM6oRJDAFfzdQEEctpXDnoXZWn6VXEA6UtbkWjfn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6UuKGt/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6UuKGt/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so6509915e9.0;
        Thu, 10 Apr 2025 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290401; x=1744895201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZ/a/9wOj4qqyc7f8nH0QgnVcQfOjbEe/xaqcp+eVQ4=;
        b=D6UuKGt/s5gLjhGojYB/OIvIzesoJJTKXmXXTtgJGU3VQqdZAW6rwNdfhRlnhs2jXo
         bxLhzX7Ze8hnN/k1AdNSgfL6FB8Pnaxuy3I6xE7KeetwRvyNsgf7NN4OZ+qAxu/P2vFG
         LMF/rsNDAz1bHY1hTbNKX2k786336zxdutzFnnRedUJ4YlNnSFIyoOpwqSeZf3Bl6HQ+
         fPO/DLdDL9fWLU56mgHEaeXGSAIF+nVsK51lU+LGJ2dAq0IxMxDYdf53tfUvtVKJ2Yd6
         hJBTrG/49X4d3dDU/ZmSsegRS7mxYrWLi1KzVltJIoAAmgjGB7UECIaIYZ+vFq6pUbi2
         ABfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290401; x=1744895201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZ/a/9wOj4qqyc7f8nH0QgnVcQfOjbEe/xaqcp+eVQ4=;
        b=K8RSO+wz8AZcoAILUtsoxAYjtEq76jFX5tT9+ApnTQ/TuiJYkCQuouzhsO8nkDETqb
         moL5oNIAy5vsKEfHoQ9iKtv8+OXMpyF7CZpmyxBhf18iu0+PFBiYu2f+XkkBtT5bceQm
         whRdJ785eEi4520H9zqTrzbweq8w5KXvB0ncmBF1WlxoCT3c6ByaP9S5edTxF5B9odx0
         kQqfydm6gznNAQTiDkXoGHDW4rImJG4gTFan90xumq5oVv+60wqjJIjKBWY1fgKtB4ZP
         ukkCj6YIHszO34t9H6ajxEfTDgnjV0nBqqkDYwNj8L9MWJ709LTJpRmmHSkS/V+nQozl
         vdWg==
X-Forwarded-Encrypted: i=1; AJvYcCVBdoCgIUpnndGTiYdNEGJBTpUQsDlwLIJhZ3FN45u6vurNTQlzKC78rswhAFe1OBDxvTyXIz7fw0kmLIay@lists.linux.dev, AJvYcCXqpl1YTYkjX6chJmxOF/lHopBqgszkh8cu0Xxr1MOp4ZLXXinRxA+tRY4gZwk9LBIYirjgXC00OqhJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwOZDMmpR8mxUL0tS9SQ6tupLPKfxBPr2ezCHyFnMdCVeu2rd3f
	Tj1Zs8FTobc9gOLId5vwn5zLLR/tN7I8kUmAOXOuPqNjNbu+GY6luKAq8qdl
X-Gm-Gg: ASbGncvcorEqHM6xXJbvqJvDCUlntd3GAX3TySXofM+faE8Z2qtT36z51aB5bpyTtyT
	fY+leWYENPsQle/9vQkN+4W8ToLAyaC93dNJU8BUmrgdkVIdpZh6rX+arh16pHzD49N6eDlXkRF
	J3Jy3mOJFlD2eLjg8zGpmqLOaPUK6j8gQC2sIagcsHHdAyjNw3Bmxd4YecxjldqLU7DDwjyTBc/
	65XPxST8aLQCPrf5gf/sPIRYc70sf9hus4u5/yqY2ofUuGoe7GrGkBocVp3qAExlqecRSwWSquY
	4fAzeJPXZOWdA6S+xqTJ1VN/+1He2EQTTNdtbw==
X-Google-Smtp-Source: AGHT+IGu0ruWSrChmP0OLx9UlZ42DjEUbur/E5YrIC2D/Fe0LeiIQ9zEr/EDZo2o7CHK6DxF2ClBUA==
X-Received: by 2002:a05:600c:384f:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-43f2d7af3a5mr27512295e9.1.1744290401177;
        Thu, 10 Apr 2025 06:06:41 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:40 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] staging: rtl8723bs: Initialize variables at declaration in hal_com.c
Date: Thu, 10 Apr 2025 16:06:08 +0300
Message-ID: <4e40575a308a7fc4ee0d25923097fc915a2ee849.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744285781.git.karanja99erick@gmail.com>
References: <cover.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more concise and readable by integrating the initialization
directly into the variable declaration in cases where the initialization
is simple and doesn't depend on other variables or complex expressions.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1213a91cffff..7f4dbd5c5d33 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -745,12 +745,10 @@ u8 GetHalDefVar(
 	switch (variable) {
 	case HAL_DEF_UNDERCORATEDSMOOTHEDPWDB:
 		{
-			struct mlme_priv *pmlmepriv;
-			struct sta_priv *pstapriv;
+			struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+			struct sta_priv *pstapriv = &adapter->stapriv;
 			struct sta_info *psta;
 
-			pmlmepriv = &adapter->mlmepriv;
-			pstapriv = &adapter->stapriv;
 			psta = rtw_get_stainfo(pstapriv, pmlmepriv->cur_network.network.mac_address);
 			if (psta)
 				*((int *)value) = psta->rssi_stat.UndecoratedSmoothedPWDB;
-- 
2.43.0

