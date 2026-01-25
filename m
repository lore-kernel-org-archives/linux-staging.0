Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FEA3090C9
	for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 22:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769379206; cv=none; b=sVdHTMMy/OK5TS2Ce2qMoU++DlnsoKfARg7jtyhzWqdKYAAlVKbkZQHNP536zRks7GTTI1t9jSbJIQ/YW9yAwq4Dp1CYVqvLQ7hlkeMqfpQGDh7da8gwXo15AH+VUbfZpOydCCJT6/uvgMTIUfI3JQH+gvGVoPq6XltokkcE2CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769379206; c=relaxed/simple;
	bh=u+k23Z2isiZkAg51kRMJSGnp7gUH0oYPti07l903XhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MY9eq2emwTLGtG00fAtGthrBs7sZWHY7klZpqicEWFk5qW6EZtbr2tUkyswukwGiwhSyqHY5Ge0SzewkkEWAQ7gvaBhbappe5WSEg+J5eWAhZkwe0j0abzGSufi/7ibjGxaf7cYSMZFubT4gt8CzlUga2UFNQHTg/1krmJDstTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fed42Mg5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fed42Mg5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47edffe5540so45029845e9.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 14:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769379203; x=1769984003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IOtSDPAj9LHP/EGtr99y23OjP09FJ55hWknUkCivpC0=;
        b=fed42Mg5CCuPLRlNbyklzACEUYMJiCoA7L4pEovHUTaVBL3JkFEUL7+n3MNGmitYCH
         vG4MVihFn2GB1y8HZ2plY7Gy0MNkSSKVwY26PExtK6nPydz7YU+d+ESwr3c6E9U4lIyK
         uZvsI10gtFoog2O1fblCRnC/zaSFUyKaAxN1tkZjxsopAHq7ftOaSZiX0Q/ldTqOJrJ0
         Hb9up0eq2tNuuxDZS6oN8MvpipXPfRMD8v253XQcWkOZVg876/n5gFXNnWo3Dn96GjgB
         BXS1q9NCbESuzpIjYxZB+dNv6Vmx+SG50nqvrFneK3rAYcNJfg/c8gFUfPBNSsVo46CW
         Inwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769379203; x=1769984003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOtSDPAj9LHP/EGtr99y23OjP09FJ55hWknUkCivpC0=;
        b=wKNsRuFtUzZEPxRl6wKKk+SlL7Z5d1VCiX8vProoSfvQCK7UKyiDeFGWdckw09SMbs
         hDutslf2n52XkN4P2qOq+GnJQD2VKE/SFrAOphqbpWHRtHrGFHNU5GU3/k7dNU8rWNBy
         3qdkwweP7kt4Lfby4RYtvwoIo1vgaYsNJDstl59OqaYjIYu7c/G8YogbkhLOieCiWM23
         B9g6LLSQuSnDY/AYgGZUSdBYOx9ZzdqP1IRDrKvdHL6wYZx4/dDEaRvTPVe52tiFqE2W
         6kKdE1I8H+Js47NgU9IaAXjyEcKf9yUdSX5IWwNtyAGSDx3WQbN2TT9aFyiHwWZ5cuWr
         1fyA==
X-Gm-Message-State: AOJu0Yw+rQdbsNggZSTbWyOXoXABqyMEiESSn3Y1B+u/EYFWtO3WNfMc
	ScyvlAgDQ61zTIRbA+CZxbI47x9Z93XYSsgSk97gtgCfRYdvNRh2YKx7
X-Gm-Gg: AZuq6aKadVRhbwLI5vnWe7yBtqUzZBhAkVOAYuPpOgvQUBo8zwMYgB8GrXXNYrDjQ5O
	3KPPbO5JfqPIGEjSaG0fOUECxmvqTZYVru51yf07X7NfwKHCwG+YtEtKwvdF9r2luCDvmc3Mrys
	7sWwXMn10dOu+pDjrEEzEmFIUzLqLX5fsQoIpzoQbbrCJgTVlaHLMWj+M+oEfORW7UCg4qOUAmC
	6JYbjKEykvqR94d6aOqSnlyaOXTlm1sFcNCBINL0yDtJ5/qY1yr6vB+Jm5S0Q+BsCaJtNNt3YLK
	+U/2YX4m/2Ed2hQs8qQ2ayiLOt/iktLc/zBzxC3VKa77MiRVzl4K9BzihLZ3LboC+J6M/6wFGlR
	BvnmU2+oqNqlgVXunSnQBt7xPIyfEybideXKsbaNW3Ia3js9VE0gckn7p9ggfgzzevAtvUg1dMf
	Edt1OC6CQ=
X-Received: by 2002:a05:600c:530e:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-4805ccddb9bmr47802695e9.0.1769379203056;
        Sun, 25 Jan 2026 14:13:23 -0800 (PST)
Received: from TTPP ([31.176.181.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5b67sm229304495e9.10.2026.01.25.14.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:13:22 -0800 (PST)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace magic -2 error codes with proper errno
Date: Sun, 25 Jan 2026 23:12:18 +0100
Message-ID: <20260125221219.26151-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xmit_xmitframes function:
- Hardware busy condition previously
returned -2; changed to -EBUSY
- Transmit buffer allocation failure previously
returned -2; changed to ENOBUFS

The caller checks both errors and handles retry logic.This improves
readability and conforms to kernel error-handling
conventions.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index abb6fdfe7e1f..d1a427b2ef7f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -205,7 +205,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 			(padapter->mlmepriv.LinkDetectInfo.bHigherBusyTxTraffic)
 		) {
 			if ((phwxmit->accnt > 0) && (phwxmit->accnt < 5)) {
-				err = -2;
+				err = -EBUSY; // supposed to return -EBUSY for these conditions???
 				break;
 			}
 		}
@@ -260,7 +260,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 							   "%s: xmit_buf is not enough!\n",
 							   __func__);
 #endif
-						err = -2;
+						err = -ENOBUFS;
 						complete(&(pxmitpriv->xmit_comp));
 						break;
 					}
@@ -380,7 +380,7 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	/*  dequeue frame and write to hardware */
 
 	ret = xmit_xmitframes(padapter, pxmitpriv);
-	if (ret == -2) {
+	if (ret == -EBUSY || ret == -ENOBUFS) {
 		/* here sleep 1ms will cause big TP loss of TX */
 		/* from 50+ to 40+ */
 		if (padapter->registrypriv.wifi_spec)
-- 
2.51.0

