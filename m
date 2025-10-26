Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C681411DE
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761471171; cv=none; b=qWD7Ku/PaKu9FHz7BSqG1bJL/jX54fPEtoSSP+yn6odKQz7kIl0Zvnm6CVem5GMCeWjrQJr9ymvTzyxO8rk66YKkITKkI4RiEvZmLkGhgd77JzlGIEKcTFbedir6hEruGFUCYH7y0J1FhZ3ZR768cWQIP5zaS2E3Lf3Vw+yPLo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761471171; c=relaxed/simple;
	bh=Vlsby4nmC/zEuu5qFuc2bZUhFhXnU3yY6r+eJcLEU5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BMWn/3GZULxymXjFxoXO+XfWhEfbRuzwaOpnq2wNOhCfLMKPwf7W0dqb1PuJwOkCWcHCKM/A6st8DDARXBqsrKXhC0zT0T8D0EHNzQqDq08SCEx8OCtbeUG60sv+VwCJwXVyFntHRNAUoSc3fSMuOw9WIRWxbdvPrPk0QzMfyiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wsuss+3e; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wsuss+3e"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b6d402422c2so849225066b.2
        for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761471168; x=1762075968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PDPtJtL/wke0d30o7jIXHkpPh6QgbMOm1uJmUvYWjqQ=;
        b=Wsuss+3eFGDU6Mg17IZvLJrmJWu8HToHw4dq9MFcJ+vgcztm7fSUHnZMx/rXD1l1xp
         dhZWEeZw4ry+K66ITcAwZi9ZVRnm4LZKH7LC6f2A2AUK47zgvhbObuGu5dfbePyflRGX
         LiOSHS/CbsPlAdx2dgUKw9xY/WVJL1yqwnuh43Sz8SNoZJM6qFsLTH9qpQWtMSyaWWKs
         rSck397I/7f9phF9mEbCtQux4tCtAFAoLveWsHQQRaxacKD8pghB7vm6tRDYP/+i5HDH
         t+1oD4Jh95iOk5Pk0cUdsPERGU8IqC1pBc0Ia84eufPOf+tK/mv9RTSRFSTR4/W1pGZK
         fpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761471168; x=1762075968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDPtJtL/wke0d30o7jIXHkpPh6QgbMOm1uJmUvYWjqQ=;
        b=s68M7fjF8W8xtZqNaX/d+7+SuSVlTLtLSpy683Rjqzz83KbGDfGSDW+WPzZctM0eof
         8L4JRAl4OnL/20f/Ig6aRopDPXk+LKfC8Td/hAyWxCofk0XdEQ0FHZn6N7r8Dx1jxBoX
         pedbzEQ6RNdsAu+4beeIQq7I9M2BONYwXRQUMq0PKRlW+JaaIrt++n9AQlj2XWTgvI4h
         w+3Mv7D5bFue4/FVQwq+P0kv0Rb7v9274H3haLcqhRDEX4pi52QZy9UWZjc59SjLY+X1
         tJg1qKceSe0qdfS6E4mlEBhlId92TgUw4WRRRed/Us8+y6d8WRXdvV6UvDPIZX5yB/2e
         Rpeg==
X-Gm-Message-State: AOJu0YyV4yGhW0NSs0aaBBioxRLje2VrDdnaCtFqfuU3cwvXeU46LTtY
	qe3eI9UjQzMzZ/1geDZcRvwLje4zmFp0Rlmti2EJAxBmBQijlJYWGYYbM+VjrQ==
X-Gm-Gg: ASbGncsXkvW2s7m9wGt+vOlH2m6ToUFSJwEoWtn4yZNagd42TCi4k/5SY0l4JaL9qUL
	qValKRVeXcOv8VxV//JlGj/taC8iGeFxNclxj+jSJ8O6nHyf/+GTmfEZ+MrK6daAbP3tX+xEb6E
	XnM+EfCqQ6KjM+c6qKB/YArZnkEI9YYPAw2M63OB+fDwE9u06EbtTWjwa/a363AMr1ISSFu2xPX
	E7bwGSqi3wNfg2RJSKW5WHxbTaVUtgj3XzDj1gW+e/zqFwPtZW541xW0X2vQiK3RvTD2nIW0Djp
	U9y8glFIwTS3yclt/k3TtKU/1R7IRAK69hyFBEQMqWcVsM7hYaD9qCNnYUAUIpgZ/TqivFlU97j
	WRvt7m1BZpHvju4Q/IG6uOZvIObANwTCMnAneGdGQQcMMlh7fJbzFuknFAynpfYHDUSr326+65D
	oifG00AtzYwgkS8D6f2jfXWaTqdnjcCR2pkw==
X-Google-Smtp-Source: AGHT+IH3CJxZ8YLRJjSHIWJ2d89NjwLjbFQ2bWSrm/9PJahvGIS5lm3R0wZC8fy/U/ECY8oQOObUMw==
X-Received: by 2002:a17:906:7309:b0:b3d:395:3234 with SMTP id a640c23a62f3a-b647423d870mr4160493266b.48.1761471167428;
        Sun, 26 Oct 2025 02:32:47 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:7726:b432:b66f:d982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85369697sm432967066b.26.2025.10.26.02.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 02:32:47 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: rafiqul713@gmail.com
Subject: [PATCH] [PATCH v2] staging: rtl8723bs: remove unused rtw_sprintf macro
Date: Sun, 26 Oct 2025 10:32:41 +0100
Message-Id: <20251026093241.150826-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafiqul Islam <rafiqul713@gmail.com>

The rtw_sprintf macro is defined but never used anywhere in
drivers/staging/rtl8723bs. Remove it to clean up the code.

Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..12369ee2ce1d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -115,10 +115,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 
-/*  String handler */
-/*
- * Write formatted output to sized buffer
- */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
-
 #endif
-- 
2.34.1

