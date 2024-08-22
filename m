Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C91679FD
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286245; cv=none; b=XKXVYKjRt9UQgN9nzpjmxFweSpKjjW+6MXIFp3o1JkQBKDzT7orhhSJYW8cIFh26B0ZWNAYMWxXfBJpz7EA6brQ8S32wDix3grBxLc0KKMeDjeZvb3e22XooztL2XzcinilJdqsit+zFVkPy0n4sfukFdqwJuhewEioZXPXkbFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286245; c=relaxed/simple;
	bh=E43a4QxGfWfleu4yve62uTS5HZZeuJ03AnjlfmpEJEI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TJFDLf8qV3RKCCVb/9AMEsoCMF/gtz2FaKuO66oiNniVRHaRAazUXiqOiY1rSaViwvLtvvQkOG9WyVBI2+G20Mw2ltRY4Xkz5UqMYXcKm+jAyg4xWw6oWTKxVm/na9L2bxcsR1dMN/A64cqmuTaN28L82SDsVWfGWfwoGHV38Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsgvntUM; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsgvntUM"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2d3da6d3f22so174000a91.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286243; x=1724891043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BI/Cuoavg1EZmfqc6I+MaekM6R5ly8VDmqCakm/t8U=;
        b=IsgvntUMJOawythJCHNSW3EC9Zuubt5mvYQ8kKsMKW1x4eE1269CKZ1qVWVdBfpFkc
         5MkYKMYFAxyvGKReMCMox6ZqSd0UqxeNQ+4xkE3O8I4/kCz/G/ltRkF4dAmBWTRrFKea
         zLZ0kn+G5KeCWXkw/WHjxlmk7hq8Tl7sTVLmM0FIBgaJXsNr80k0nPOGq4bQVmcAddqg
         Gq4mpl07AjbKdxgLZ4q8IRtrAPsRLY7ed0GMCTLb6YVlWNj+hKQCWBjSh5t+uvwYnX2q
         UEMg4aTczrCX4jIrQLdKpT8I0rO2pL8Dg4wEyVNOxay+UPkwbwqkXko9gvPBbgbH3Cys
         hFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286243; x=1724891043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8BI/Cuoavg1EZmfqc6I+MaekM6R5ly8VDmqCakm/t8U=;
        b=l+GES7rddIr9mrTIvTbZ6rnqBIh+qvNjgIsXxVyFLvcqyYcKiCIL5tOg5XHSfQcQ8p
         R2Dy8z9UsUusbJnFvxl23Ac3cu69wBkgRDqPMszeQFuL+dwiZHc1DYZHb0UTpWoqhVF0
         CiHZvkn+u5zrphEZ5X7R3d2EezOi2GZ6VZ3YPrVOTC5aHwjMgq2vMGrOWDeZInHaaji7
         yNGzcq5nqP+mjbkbtgYtmZOqEzE5MJlX6wIYFCV6NnTqg5WLXR1/5R6KmWOKIQZc8/65
         SqMpiYNC+dsOsJ3kN6YlQwbDznhQL3bMbV3bns9iX7/X6wTQY7fSZf1LdxkF2en9qaJ2
         fFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlzGs9sJYd1bJcdq0a22vo2dNF8llE+cUYd4djktZlebCGT4jy2fCiosAVEKwXQARGLeAUcIkFkhiZPlFD@lists.linux.dev
X-Gm-Message-State: AOJu0YwlDpOBoXD7/elkTu37HY1RVsZsMg8hjDFuwzv30WHAubgkPvae
	POIs3XkDLLfY4M9XkJQdfMhXv1KTjVJXbjhn565InRSuBDS42M1v
X-Google-Smtp-Source: AGHT+IEwilWiZTOg6ZITaUWHFGun0J3N4EgPXDiH1J4YUnbPthL/Jc/UdeHpFyvVCe0ImoO7+SYAhQ==
X-Received: by 2002:a17:90b:1c84:b0:2c9:4c3:3128 with SMTP id 98e67ed59e1d1-2d5e98bcd51mr4459011a91.0.1724286243246;
        Wed, 21 Aug 2024 17:24:03 -0700 (PDT)
Received: from broom-closet.unicamp.br ([2801:8a:c811:1:92ae:ceb4:3338:3fb3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm2559443a91.17.2024.08.21.17.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:24:03 -0700 (PDT)
From: Gabriel Maciel Raad <ffunctor@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] Staging: rtl8192e: Fix parenthesis alignment
Date: Wed, 21 Aug 2024 21:23:43 -0300
Message-ID: <20240822002346.3555-1-ffunctor@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix parenthesis alignment and unnecessary blank line in
rtl92e_leisure_ps_enter to fix the following checkpatch.pl warnings:

CHECK: Alignment should match open parenthesis
CHECK: Blank lines aren't necessary after an open brace '{'

Signed-off-by: Gabriel Maciel Raad <ffunctor@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 5aac9110bff6..7b6247acf6f4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -204,12 +204,11 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 					&priv->rtllib->pwr_save_ctrl;
 
 	if (!((priv->rtllib->iw_mode == IW_MODE_INFRA) &&
-	    (priv->rtllib->link_state == MAC80211_LINKED)))
+	      (priv->rtllib->link_state == MAC80211_LINKED)))
 		return;
 
 	if (psc->bLeisurePs) {
 		if (psc->lps_idle_count >= RT_CHECK_FOR_HANG_PERIOD) {
-
 			if (priv->rtllib->ps == RTLLIB_PS_DISABLED)
 				_rtl92e_ps_set_mode(dev, RTLLIB_PS_MBCAST | RTLLIB_PS_UNICAST);
 		} else {
-- 
2.46.0

