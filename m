Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080347605F
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 23:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453451; cv=none; b=e2YEXvKJT/ZCM8QBr5Xr8OTbY531m9jcyjjimV2a39J+FooIr5haQZFF9Dm6j1Wq0YmC6KKNjg8ipIJV5lH6Na/FivgN5153+QUKxggCWzD4P8t3T7EbgpKO6QNUm5PPBvbK4lVt5fnUM7MvZP62xQzn7YaBCkeJFdnWaZGX06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453451; c=relaxed/simple;
	bh=TqdtAzRT7l2sUAjy/NB5yF4XtaebxgjgQEUVBySHr64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qJFLncYih2MObJc/LvdfizXcN2Ne/OKuOPh8nU0+ygQxtLlj9LYh5UeCwgCPSVebVuqmiRsE9vblPtnXmr2DzhwuKbQYY7/0YIOImnXbyQ3D0kHh+9pNve67y3QT5E7ICrmu8g4mBy4LdjqPoO9IkpLPZpHZrID7q4IVnSGUr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o34o8lah; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o34o8lah"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso2819345ad.3
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 16:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785453448; x=1786058248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9I564rcuG5sFjy1yjn++XoSbxlfPSG6JE1S17bITcZs=;
        b=o34o8lahLNDo+i3/qtdvWFLFk9jppZ9Q3pdfyY80/fVHQkg6RDKpggLxRyJ8hI5oAQ
         7CpOIb3x4iOCxU1LrH6pQgnZhdbI5s32wNID9dsbHg9Bp+LJhQMVtgwakfWQW90aqTZd
         zEHuF16JG4nq9tDtw6+gONzEV0tq3ptAaavrgoHVxRBG6thznOO9KScI5UQ/DVj3cNE/
         l7UPCAzA3EWHDbKfWE3Bh5igo/3R4fGNmS6MaPzkiCJzJ3LxHfpwfR0gAH9oYsaJeJU0
         v1sz18QT27CqOYNSxsWoWPHeb2s+fKB1hdkbVPg0PFb4mtQETMi1okG65B+S3ePtBReo
         wnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453448; x=1786058248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I564rcuG5sFjy1yjn++XoSbxlfPSG6JE1S17bITcZs=;
        b=XQ1TkZCVhYvd2RD0V0eNJQjG9WgR8ldZbguIbGSlQ2WrpLoaj6UsTB1JqUSn/3XI2n
         spIPrMsFKKJidcteVUM4girqfF9ERFfGFJvdc9fDWCcZS+Px9t7TE7EvXnqLy0Fa3ZXn
         VpiRl40IWa52J3Tiuy6U03ObFpjrW3znCGJLAnJvOkx5i4Mq+a4BRbTgMEn6WDhCiEAl
         j1oBPC4cyWFDvW7tt+pTOQ/kaRkEi3OGMzNoCTn34rEWoZbXWPom84yiQG0EU+i320lz
         VTbuh+lv5Wn0VnzxHpzHJKuk+hqXjOEc5cEGgGeEXeT1Kl0txfkL5Rf/ilGaIcNGo3q7
         +tEQ==
X-Gm-Message-State: AOJu0Yx0F/jRGYEz+CmVBmyuUjIeJONgy9EQ0eUQ9FxkoAJHLZi5VkWq
	XFqiVf8U4naIQx0TPn0A+6MXNC8ETyYt4y5XKAuxcT3lhOpH+IAwRzRJ
X-Gm-Gg: AR+sD13r2EUsZyBRNlCI0deK7DsFhVcRAZ0KirbRUPx7uwMaeq/zX76oCVbaU4aP31R
	9K6ZSrthoCKqJ4ivFSwDiQ/tgBKWJtHHh8F2RaLy7vpnKhOqy61tXX0Ja3lDJrQ9YrYdoQO+TP7
	FIQODQzqfEUCcy1yHsfAK5586UP2j/Y8PJ32V7GuUDe2tL1D61nT8AjZjhGEH09zNFsMvoD/5TW
	tn5fjxEVdaAGYHyKKqZC9ESw3ntjDDOW1XroYF8mMnWVcVX31tSOSx394eSxUDhgIhLSK55Dt3A
	NopcK73FCe74hftzi9vfge7TOis6qaLADB7TtMGC+ccUBwONbtBsqFfJmPCWd4ILp65TWwP0b72
	J4Pyqve1Rlf+GNvbwx3f+ZINFGA+58Jh8mydfOVjXAC4z6RCg2eLurPSvpSO7dqDx76dW15LNS8
	nuxa/kPDBR7rgmgYGuEUDImGwxs8wjkzxWjfo5vpCNoiZvMWFhjOWhkjy6sjwBHjThXqt9dXhWX
	dEgWtyd+iSt772ruj7etlBDqsfPCSiqvRpmSektXETujmsQLm/PA3e2YC33
X-Received: by 2002:a17:902:d986:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2d035d301f2mr43799295ad.47.1785453447750;
        Thu, 30 Jul 2026 16:17:27 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0228417adsm32537195ad.0.2026.07.30.16.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:17:27 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use guard(mutex) in ips_enter()
Date: Thu, 30 Jul 2026 17:17:13 -0600
Message-ID: <20260730231714.81977-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual mutex_lock()/mutex_unlock() in ips_enter() with
guard(mutex) from linux/cleanup.h. This is a single-exit function
so the conversion is a direct drop-in and removes the need to
manually balance the unlock.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index b9f8cf1014ed..141c322befb6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -6,6 +6,7 @@
  ******************************************************************************/
 #include <drv_types.h>
 #include <hal_data.h>
+#include <linux/cleanup.h>
 #include <linux/jiffies.h>
 
 void _ips_enter(struct adapter *padapter)
@@ -37,9 +38,8 @@ void ips_enter(struct adapter *padapter)
 
 	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);
 
-	mutex_lock(&pwrpriv->lock);
+	guard(mutex)(&pwrpriv->lock);
 	_ips_enter(padapter);
-	mutex_unlock(&pwrpriv->lock);
 }
 
 int _ips_leave(struct adapter *padapter)
-- 
2.55.0

