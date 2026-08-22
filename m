Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB7493627
	for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787432098; cv=none; b=IBoVIISdnEiD2CyCKvThRjO11OVffmg1FoErYtv05Tnmlbs4TGWnS0dB34hv3VCf7hDsGy68apKPp2aP7hxBZwdWcEQqwmcxyQlOGZirpwqZCE+K8uxOdTM9sxF/9CO+V8NpUiRIgSyxsxFtzSANw0FdgFOQQWS2psXnc5iFdwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787432098; c=relaxed/simple;
	bh=o+K07mLP4Bm8z+FbLv+hzuHqtL7d9JUjBnPQuFneLkc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YbEJlpMaBRDxFsspykoNTRbb3yQwwELHb9ZsOKP/0xi+uG3gbuf8HM+VlkjPw136uLEIMpVKW4Z6gCH4FlMkOww4sLxdEqJ8raAofNAopUWtYmlIoVzaQvZoUzm78644mc4a5m0/O69jadR0X/ko00Omrop1RR1qkG6z+cRdxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERtZ+jLx; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERtZ+jLx"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so2010900e87.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 13:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787432095; x=1788036895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ctT0SA7fmEfcKtDg3k/ghZg8FkvB+q3B12wZO43BhlA=;
        b=ERtZ+jLxsLJCyLi/HxKtkCyi2PhEdOqBu3lUgfjSreZV7ZX/n/EZlYCYOGfFY5/Db+
         +IAxY7IMgIKz+vXEdkGOutMIKdZqur6+GhCpowBzkZ6CUKt2Xw5UQW+q9OUFfukY171e
         j+F2Dr7UZtku1WLfOYtOblqma22kvJ5aeoGZ65q73Rpz4Z55dFwMMTfM5MaBfEdt8FSr
         aPXZekrGr/X9G6/GAFfeAA9HnGWN1yKkvEKJnRbnz1Byu2XV4f+u9spBrSpDGVbBu3Ci
         B0mdGRwa2rNt+0K7vPJ2xeFworbUGMHJRRpcpYyN0PFjvg2V6Jznswv7j7T05rQtELcw
         Z2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787432095; x=1788036895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctT0SA7fmEfcKtDg3k/ghZg8FkvB+q3B12wZO43BhlA=;
        b=DPQO8gK9jWRg80zse97s5YdZ9Rg0QK0EdR0+CpKjqZEpoXJ7qeeVT0P2o57AQrqClI
         WLnpXZYY8ZKrQgogsxjFt7Jz4es6Hhf7P9jNCAruxupBawgdGh8+MKD++8qV3l4BKn9i
         AeLR84dk0GhevKe0bPhOx8EijNgAlEag+BKynmOabwq4T/ZEBOv8ayURzuuoP3C4GEqd
         o9+/e20we2ZE46DuctILZ1WR9qrkFytu0J0nrUQIeUiH5fmaO+ULQ1wSva+s+7yUGrpC
         y1J+JKOw+h3XzENuMWaBwobSbqrKiwkopdUKlVJ2+lLeQ4mRu1In1lOJ5s/3b4YnJBrA
         aA7A==
X-Forwarded-Encrypted: i=1; AHgh+RpHBYaDRdRcmq8TyGkv3oCJLTkckxaVO8Pf/UAnJNl1WfSJWlOWdIjEfhmk0/s83x0Hz/b29YrkDhI58+zL@lists.linux.dev
X-Gm-Message-State: AFuF++mnSlnzgP7aNRZPR96HZyuzVlxPEE0mNk+FSPFrPMmSsEa9BJEP
	R4rGp0sQY4lKhr4WQPIOsCzjLHofmOuWCN/PEGzZY57I6twOc6IuspUR6hqUnucGfXQ=
X-Gm-Gg: AR+sD11lwgSCfVFZhtsR49/Mmd3UsDHzncJeJ+6JanjKhec1F1JVUuv/BNmrkF/oYtN
	3jPCrmPORT0QHjdhoZ9p15wAFDqSVLe5a5q7HFpB7wiPXHWz7yxvFViiRjq2ydLJj7K6dOxs57V
	n1lOjIJMgeYszpV7J+tEb5m0vy36tCVhCInAKmy3Ltfy6iOpuveq0wTd7CJM/E2CnD/oy5tJkJH
	DECid79rxJLT/XIqlD2JpxxeQT30CC2+5g0j+7IsU/o0m6l0oCTSqQJAKBizGfzoJDyJ33LDIOE
	Ij0YyVo3EsvISjKFzTsACXMBNLpgPLLm50Ull/yCjFqe7fIen+qu3XeN9GC33cOEbpPdK2lKu6i
	gbK0aLG8+jzyV9WGlbu9Vx0uvZ6JlUvDE+8rnZSfJbpOo0Feh5wXnxNg4x7n+OZt1TyRnM79Iqv
	qQcKYfGdOggQKcAWKnI8yaPQtmp7ztdCTyCmIZCql0dY9Regj3cTyGG7CoRWZtwWqXXo7sL9aNz
	NIaCw==
X-Received: by 2002:a05:6512:3c8f:b0:5b0:c95:cdb9 with SMTP id 2adb3069b0e04-5b4842694cdmr4880071e87.23.1787432094530;
        Sat, 22 Aug 2026 13:54:54 -0700 (PDT)
Received: from localhost.localdomain ([37.186.41.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48cdfdc49sm582366e87.41.2026.08.22.13.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 13:54:54 -0700 (PDT)
From: Luka Miletic <mileticluka2001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Miletic <mileticluka2001@gmail.com>,
	Dang Vu Duc Hien <dvdh12707@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: rtl8723bs: use usleep_range() instead of msleep()
Date: Sat, 22 Aug 2026 23:54:26 +0300
Message-Id: <20260822205427.74562-1-mileticluka2001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use usleep_range() instead of msleep() to fix checkpatch warnings.
Verified both loops exit on their own condition, independent of
sleep duration, so this only changes timing precision, not behavior.

Signed-off-by: Luka Miletic <mileticluka2001@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee2..8b793680f 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -986,7 +986,7 @@ void rtw_dev_unload(struct adapter *padapter)
 			if (cnt > 5)
 				break;
 			cnt++;
-			msleep(10);
+			usleep_range(10000, 20000);
 		}
 
 		/* check the status of IPS */
@@ -1086,7 +1086,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	pwrpriv->bInSuspend = true;
 
 	while (pwrpriv->bips_processing)
-		msleep(1);
+		usleep_range(1000, 2000);
 
 	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->bSurpriseRemoved))
 		return;
-- 
2.34.1

