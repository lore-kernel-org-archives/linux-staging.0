Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E752DA76C
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458278; cv=none; b=d/RGkKHdhfwXWMo8gUtfECH3OqFh+bYWBtEIOb339cgTALRzqAUGZPWAZlNuUwOuBGqO8FMp16iB/z8EQsvNfUuUNY+eb9+ZQQhrbIZzBBlA8nEJNzFeSYKuHhTWpXsKoxpatq4JRwo+cp2hoPxwkjJy+XFPKg2ideQxbBJx+fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458278; c=relaxed/simple;
	bh=WTQ2KhVp6XGVM/nKvEmRs9J+mcIRqz77lw6CLOJqxqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXgKiAE0XNBHFVrzNsyDkBjGW75Bch02ehE+pGVOwOQQyaMlrX/vCplH/1QsbA8nNz3MNjnSu14TqOKWcF9updhY2uehDsBq0XZapfHWF48Z8d0tBh/ynlKzgfn7PCxZlldJhzF/2mjqu4d969ES4S8vCvRJgTPLmugqNdwip5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm11thpi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm11thpi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so45324415ad.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458277; x=1787063077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elm8hu7/WTVqfj5PwnQhs3M/8qOhI9UAr5iDCvT+nvA=;
        b=Xm11thpiVuemTqsBwbgb7w/DI2S+N/nx5KF0wbjibCmbSynrCdslX7t/W80pVPvObA
         //26xAk/IDF/g8mHR4kXv0tYEdwqQ2sDKe89CYz3tzk4JNOIcPHpay4lmwKAfUX6y/wq
         x6362uoZY0UbhSjVgoJsXn09Bdd8iOUkFU+aIY9TF9oWbbrkWfTgS2bLd5czpkWxyPPP
         CCU5O4npFzJYsyHzMRnagT2EJs0yMRNM0UgPHdSAGnpWtbagTguDLQjsTXzd6hHVMbW1
         jahCwp4Hq3V1Gy5qzvc7CZ3kGNhWt3iL8x/46/25zMQYAF8J3XYOfD4sDcLLQ5VgFea0
         OVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458277; x=1787063077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Elm8hu7/WTVqfj5PwnQhs3M/8qOhI9UAr5iDCvT+nvA=;
        b=ef/7EpWpUD8ydBUqPcjdGcCmmp9oTnkIgGH9XHquAVKuK7Talsh8i0QbuGgqDwgsOB
         AiBY8wh69LAdOP+RSzEf3OZdKp+4xMNLWK3r9YSZKZuoLcF3Lm5YD5ad5xklvfGgfmc9
         2pINj//sEF2xalDCxtKo2nG2gjTMBgMCan+Y7nhqIh7WPyZ883a9PDq33sjK4g6Ty/xi
         BbFYDBl9ZwS6eiJX2YuAxCB9V7Ieu6/DwwcFG2tpFps7NuJJ2oEGV5QqmWozZ80JFJJ0
         qQz0ux8KqVLiX0YPnP0zEUbeP/mb927xxMItZKekT3XNdrD0wDlei2nVMGzCx1c3Lxfu
         Ggzw==
X-Gm-Message-State: AOJu0Ywwgaj7ZLH5PGDCcTfyoZCbUEOohWAOEn0nXaUtGD2BBtp8jjrf
	GMsC9rhSmLaIX6iNFRnzZeRea5rA0zM+efgbseFUyKPJosiInQO2uj4r
X-Gm-Gg: AR+sD11L5b2jcYbQsqkx6bTl5VrhO5z1G4k+x9FPtGCGWoVXr71l10pDfBamBD8rzO1
	yeFdrU0+CxNT6d6EQHqUAnzg/gO55DledejMPcHOJRNhX3a+o4bs5R0RF7NJm+ydVK0Sv21MSOA
	oqVMVTeLRq6yZM0swc/w+8iFbVivhDN/Ks/6CVZnB6sGcx15QFZlhZJGcgVQRTkq86nlKuxSoQA
	UsHzeSYLO8yaex7dkRdwiThrRXS7RxQDVH5357Mo5EtlkzI3fNYzJ/P8QlU1Y1PJSqM1PnQ1/1b
	Bu2niJsFqzjgTRgx4z8UcL24gTtyXVoj6mt658uVcMqfsODUL7TLcZptn3/7YlKl0djgkg1e7Z8
	WYHRid15lbPJjSrRyCShg8YmKaHTSbQ7jZcXqBzjXp3ngO/35N2+Po/lTKLTfPTNDUUUa+J97MA
	yEVZLhRXf1L1G6o21YE8P4Wm93B5RjeJsHxgqpJPZDS2BSJYbyFVokODP+yJWH8/rLItVw5GCRv
	h0Ch5HQbyFnKZuUQEkcM6kJElLR4mCqUwS7VYZOUclKL5p7spVjhg==
X-Received: by 2002:a17:903:90e:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d3177c69b3mr51033795ad.9.1786458276734;
        Tue, 11 Aug 2026 07:24:36 -0700 (PDT)
Received: from DESKTOP-M1337NB.localdomain ([211.241.115.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef0e37sm9531395ad.7.2026.08.11.07.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:24:36 -0700 (PDT)
From: Jonggeun Park <ndamin221@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonggeun Park <ndamin221@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove dead RTL8192C function declarations
Date: Tue, 11 Aug 2026 23:23:55 +0900
Message-ID: <20260811142355.60533-3-ndamin221@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811142355.60533-1-ndamin221@gmail.com>
References: <20260811142355.60533-1-ndamin221@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

include/rtl8192c_recv.h declares two functions:

  rtl8192c_translate_rx_signal_stuff()
  rtl8192c_query_rx_desc_status()

Neither has a definition or any caller in the kernel tree.

Remove them as a step toward the TODO item "find and remove any code
for other chips that is left over".

No functional change.

Signed-off-by: Jonggeun Park <ndamin221@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 1f86654f0..b63625ab4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,7 +30,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.43.0

