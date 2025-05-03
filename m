Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95FF27E7E8
	for <linux-staging@lists.linux.dev>; Sat,  3 May 2025 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303885; cv=none; b=rZJa+qs3bxdZY0uFyOQhfDKcmzhEpCk+jFIUmW8cn/MrhZYGQPK7hh3pImworLd4mqqdvGtfwaIqQYVOO5Pnl7R/N1zNkDMwtRq34xF7vTtsgkFZnS2aMCUEfnFKmw6DC30QHk7VN50G2r/ZIiHAW+//GoR+g42vNzS7Pa2qOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303885; c=relaxed/simple;
	bh=TAHJwBNAeKqo1+l0Pi3fM8ptzRKXTosNkFT1juzLK6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=p82i0qwuBArj+PUXr1PE835zB/BGVyX42Wm6/5D/96s7ET0JNjMVXmfp46hZeVRmyj/TBLmagbAJzHrAGFH5hPwXFfF2kC+CVUcjFy2u9uhLXFszxn81vpR+gI1tZrZGY1E0qR/8B1aVgNaZJY7hEK6MlrTeDzlJDNQVJGTc8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I++ASuWx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I++ASuWx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30828fc17adso3170240a91.1
        for <linux-staging@lists.linux.dev>; Sat, 03 May 2025 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746303883; x=1746908683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2q5uKd3+lJbLrPjBN/39c8sZuHCSfc1w3O06tTdCSIw=;
        b=I++ASuWxVX48y4NJ3QwSdhBennKskvhF1JbgpenY5h9GNaa/HuNMdY3DNvJkhBra6a
         +w3r2JwH8ix1C2Je1NoyXiPsEpg+XWisPIsIXds3dMHeFJa/LNuXHyTa1wedbeB/FaPy
         4JnjoOBwZq3eb0rqkVRcN6PzQMp61YhUOOArI7NUOEu7ExS+TWQ4sFVHtgx9U1ZWy5O6
         fg7H/i3FybLs5wWrpwrEVjO0ANbYCHa54zRgpL4cW8V6UfyD8+U/ueMrjoV3NuDr1WLU
         4qrO58ALmgt2F7Z3KnyPD9kzo106akbYFPGcmCx5+VeLMB+k5vZo8ZsvBuOEHVQaL1rA
         1nPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746303883; x=1746908683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2q5uKd3+lJbLrPjBN/39c8sZuHCSfc1w3O06tTdCSIw=;
        b=Wds1QU7cXO0yU08BLg9M7WpAuiFd+wR6oxgJ3ogRH6kt5Dnklh9KDcgPLM+pkQJS02
         RUyWlChdhxnWNxp1pAS4g/mloxC9UvMiEmI9JiKB1ul1BzdEA0qu/V+UvIDg9JsNZTSv
         1QqgqIrbls3VVIe4NSrjFZ+ADmDUJrCdXYzgLDKJXIg4kyLS/Fqji7q+HKwxsaVvZTr/
         yWUZGVr37HB8agXGQXKErUn6GbQFToxahZ92sVQP9E+9AVRTu7iP6sbzZMSBfV55iIQ0
         9MHQvyTAcSZ46EI+MKN1mrFi6yyV3LIkjf/9DULG7wlZBfUSHJm3aC+omWxHr8nF6Dov
         Q+3w==
X-Forwarded-Encrypted: i=1; AJvYcCVKfHkTB9JJ6lAQly5g1/fbRKwuYSkYenGrww3L7qiBzYNTqvJcFBIfX8vtkriwhVbx0D5It78cbVjxIugn@lists.linux.dev
X-Gm-Message-State: AOJu0YxV/YWGBMMk57PPjZtkGbBA7wMm03vCL4Hlj07mHvku3PNyptGt
	LsKi44SXqQUAXGyYFTJkBA/JmJH29z9dA6HMzZ9Ix0ty1B6D2kOB
X-Gm-Gg: ASbGncvTzz315W4iqkGYQNV/6aZw+Za0O9VVV5yuNmkssJM+zaoO/kp24XTZKkcilN1
	0ov/vDJ8DFtqWSriMcLV3FqCeVUwgPXMCnAwn9Aa3NqhHx45Fv8cmLfOWGRrR8vku7Vh6upLm3e
	d//lzMrWI9n4Cmel4nRB1pwmVCP1Y+dlD3ayhms3p3YL2MzoHjG+Pe18oXqCQLLJohZwpMsgj2Y
	tHACAARm2mlb+bAR5KZD78DiobmPPWmiMTYGvgOcJArcGmqhhNHRAhvMxgrVxx/7WADd0MmEVRc
	i/GCql6MkV1dolk6M2+oRroBAmoLyv3OX6xQT73jv0ynBqyoGqE=
X-Google-Smtp-Source: AGHT+IFf34YJVXfP7Pz8cQvJg1IrQekx2IBw6l6EtPWiJtlZ1gOYmI6zevWfKc3dEP8I+9bndMCmNg==
X-Received: by 2002:a17:90b:264d:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30a61960f02mr3397166a91.2.1746303883063;
        Sat, 03 May 2025 13:24:43 -0700 (PDT)
Received: from localhost.localdomain ([200.133.129.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34826684sm8253198a91.41.2025.05.03.13.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 13:24:42 -0700 (PDT)
From: =?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	koike@igalia.com,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Cc: =?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Removed multiple blank lines of rtw_pwrctrl.c
Date: Sat,  3 May 2025 17:24:30 -0300
Message-Id: <20250503202430.6053-1-rfp2005@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed multiple blank lines in file rtw_pwrctrl.c
Found by checkpatch.pl

Signed-off-by: Rogério Fernandes Pereira <rfp2005@gmail.com>
---
 Hello, I'm Rogério "Fox" and newbie on kernel contribution and it's my
happiest commit. Any feedback is welcome.

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 74a8fcf18..44f7c1930 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -8,7 +8,6 @@
 #include <hal_data.h>
 #include <linux/jiffies.h>
 
-
 void _ips_enter(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
@@ -994,7 +993,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	pwrctrlpriv->wowlan_ap_mode = false;
 }
 
-
 void rtw_free_pwrctrl_priv(struct adapter *adapter)
 {
 }
-- 
2.39.5

