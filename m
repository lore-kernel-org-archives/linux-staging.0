Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DD3B27F7
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134035; cv=none; b=bACzyeWZAeD4khinYFZ1xtPESnauj/eqsSozrEONs+HCbjSxXs7g9vgASbPkQszTwAPyrgh4hD325FZnknpbXgSLGFIVcosBO6LvtYdXzYUXj4DiSaCvviTUlLUFcB+F8ultsGPoY7fIACeimbiHTy7JG/aXYfyM8KBGWsv9v6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134035; c=relaxed/simple;
	bh=E0Dp7VsfZvVeY4N45L1zt9aQMkOndMTAvINrGrJzdvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7fxKSTs7Vy32GJRWeIMaxgwoOLf5UfT+9sO8J8jHETqkfUryEkFdICyHbcf9GQMM0D6yEk++IAegNVT0610+U9ExwqahoWcTPvFADeGR7V6YTf9HU5aX00n1NU+33xpxuLKC8CGyl4I8KlwOCFUJOAEueX6xCwkwBnI1aGm828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDt+eLa3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDt+eLa3"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aec201b582so5511425e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 09:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134031; x=1784738831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6UDATpfYZlmf++6P+nmVgStpBKytxc4QYZWjmMW1lBg=;
        b=LDt+eLa3hxTHw29rESDX1lODI3ARWh8fEG63zlCCp5OXimGAs587vz/ygnZMbY0lwP
         R1RLRNMzdTLdqehTY3Dp9ZpGRf3J3b1RArltJ/jXEpSlso7z3vDzu+Dvd0KYMP4p2mYn
         H9ZWiuf681ucuxiKDXx6y/Mq9sm7QFm8orwW8BV2YvoxMv2qnNXq1/3x4wvK8IjTSwRx
         wunv5bWDR4HAKxmAcIo1Xl/BkFdHh0N5P9tOFOeCtKYfIiJv5t76SgDdGblbb1xicxcU
         dLuyKZzvridLmT5b2fTNFISwz0ZbIAn6vA8OAT6sDPmTzq8hR5wI6QWGcsOsfYu6bwaG
         Ws1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134031; x=1784738831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UDATpfYZlmf++6P+nmVgStpBKytxc4QYZWjmMW1lBg=;
        b=THS9D1f0kudCQYSC//6ktwOB91tslyVx4J5q4XUvnI+CCuLTK4WjmFOfw2LpL8Hih5
         sU0OfW9IxBf06HGXez5BivfOh9BlCSexuBJa1hq4GB6ncW5ztF/H8YKbOR2kfyAQ8ZAy
         3axq6hq3e3jK4LI6oXeLSVdOF0iA6GhFEqAEUluzHOYdTgxar1LZJC5lwbasjEd/wsVH
         PCE3HgENNvF5Y8qoSTEsJEF5LyL8PsDt/TjpdyBhGeTJzeCJYBZKRZjoohzVJqE5idNt
         MTYc5TcbLTCMMB3REb9GQpHYUjpCPcF0PcZXqlANXkDpOv6/p9Jk1EJDwDis6ASDRgJg
         eDpg==
X-Gm-Message-State: AOJu0YzWbZoKuTxGmMMqG2BVguZwkbzD9AuPSeYXs/kd/A2JJ0yltB+a
	vPQEFER3zvCMsBVLGxpKyMzno4770hV+ShuKkwR532XtzYaJFE6cEBrp
X-Gm-Gg: AfdE7clrtVi2CdfTElORm08nOopXNyekualN7cQKeP8eElbTy5YxBwH5CmPBHXvwIZL
	So+UxsNl5xILTyGDEI5g37n6pgRB9QaR1WBSTPW7ZrvuHlM1DhrlBs9ACTecPu0YRFYRJz/h1f/
	Z1MYLuM4JLjjVslC7X0KUeoVuYV0U2tWE0r4xQTLWcrlHAW2XwF0Ns3VVeYjkH/KVxfn6ojXQQ8
	2gKqKIgjCJQoO+u9iffzUSRJSFNXQvRnNM1HTJw5iR+2hFi813qhZfwpZ9XrwEjVnSLYy6aNOic
	UBozo9nWFhciqGa+k5KKvYwuuIq2rQIEfC1zYjCE926g0m4wquez0lPBeihJTJRifZ3L88nTAEt
	CTlk1zeIukw54TidZvI7R/SYDQcu96Dw4Fur8PPnnnnXQQLV/HlIQv7ufnMR73/MgW4kc2QrZyP
	3Y1mpMgzHAnlNMHBM/cOdmS1qncNbeQq/oMZy9OA==
X-Received: by 2002:a05:6512:3a84:b0:5ae:b952:6c with SMTP id 2adb3069b0e04-5b15d76a8camr922937e87.13.1784134031207;
        Wed, 15 Jul 2026 09:47:11 -0700 (PDT)
Received: from DESKTOP-PGTNBU2.localdomain ([178.131.96.22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa66cbsm4326265e87.61.2026.07.15.09.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:10 -0700 (PDT)
From: Amin Madani <aminmadani112@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Amin Madani <aminmadani112@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Replace msleep with usleep_range in os_intfs.c
Date: Wed, 15 Jul 2026 20:17:13 +0330
Message-ID: <20260715164713.91613-1-aminmadani112@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msleep() for values under 20ms is not precise enough and can sleep for
up to 20ms. Replace msleep(10) and msleep(1) with usleep_range() to
provide better precision and allow hrtimers to be used in os_intfs.c.

Signed-off-by: Amin Madani <aminmadani112@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54..24b55a542 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -992,7 +992,7 @@ void rtw_dev_unload(struct adapter *padapter)
 			if (cnt > 5)
 				break;
 			cnt++;
-			msleep(10);
+			usleep_range(10000, 15000);
 		}
 
 		/* check the status of IPS */
@@ -1092,7 +1092,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	pwrpriv->bInSuspend = true;
 
 	while (pwrpriv->bips_processing)
-		msleep(1);
+		usleep_range(1000, 2000);
 
 	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
 		return;
-- 
2.53.0

