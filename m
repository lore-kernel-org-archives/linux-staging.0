Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133BE1F7569
	for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 19:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769367686; cv=none; b=swX0dn9k72tkTldbn0IJE0vS6K3UofkbZEo6s0VZ+1qdTJJvs++hg5mgSuaR+JZ1buXz581qL957LJvyLbuZ7aahO/J6IFVyXlqj9JrGQbOGWdQVqLkhJ6Hq5bS+Ck4WObaZU3GNEgl+He2FfAnvoLi7ASek8P9A54fZglBty58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769367686; c=relaxed/simple;
	bh=tuhoy2Lw00W6dIp43dYjcONzqLpDm+5Wykh+BlqheYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GP3foMpj5Kv6JUBXKvYrUJTDd76nR6lQneXu3geduM7HIBBUWSEOhSMmv1lXHvDxfGUC1CfFADCnYqBRlkMbl4fiOcax2l5ThrWPx/m1SLYx6gKSWb6J8Vu48iPrAADWapC9+x1h8FCYX9C5gIJxiamXS2cfSwzbcO0iQLwvOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdQNEGEP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdQNEGEP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so43729185e9.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769367683; x=1769972483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUtSedzDWvWvdTAZc7yW565aisDzKk93FTjd7LenP6s=;
        b=XdQNEGEPd5OwubLwgrxg4QbNEJDAY3kH7Pvq1CIFf2OUUFuWc9+MGL8gXKwuUPxfSA
         nrBDXdBoZJb18U9+od6wXlHjvJ5fQ3mcqGoICEThZwNvKOYG8Gmu7OvMGdEJ9BBrEVMi
         B6oiMEIOxV8VH0MnbiTCuKkUMvq4AuRJSeDp1YKtHTwWcPGbkQNaVSCINF9PnTYHECbX
         /DqWN0JVnBw4QTsdvxYKAn9mGXzckNRhbGHoCts7VCYkGXEhtrddKFgUK5q4jAda5bNl
         YKYMvzaihnuCeZWa5jqNyigYFw7N85AlLx+0MsalU2myX/ilnqZAnZu8wovUqQ2VoNm7
         QgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769367683; x=1769972483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUtSedzDWvWvdTAZc7yW565aisDzKk93FTjd7LenP6s=;
        b=TLHLncd+c+9MPf13yt8eStHoR0WPyDo5Rru6WH6N9bnTM6CqFG5jOnEeofkvW9OAHn
         G5T9oltINbeevk+/pG1ILpXu65SWY/kO4Qu5VrtowvasO6Pfys2jNusSfIo78HdAOo3t
         b0ldL6zEOuoQbKHL5PFCY8OLNA8HaEQBEM8YVqZlxB6UjVudWcZ5RV0no3TQDd3DcYOu
         n2NFscyOgLDORi9zO8HvdpdWowdc9V9KersYiTGRythVoU0OW4ufrVNdwtZ11yg0DUgh
         EkkigmBLuo5EuKEzH7JSM2MYMTJw67wejgfUbwm53zJRm7HrT8CzfUVoK3vEE5rashWO
         Lctg==
X-Gm-Message-State: AOJu0Ywce8b/zmXRnNUMPi6SKJJRh56cOPTCdZt2Jo5NccvXD55YB79g
	Tcf5n9N9sL3QZHZIXXrM5gr8NEXXil7J2LFvC6WbVwuPmHmV5BOCcupM
X-Gm-Gg: AZuq6aK/4wx2F3bwooQ0TzUjUS/tTmAoxN69jKPfG8qO03op8g7b7ips+GzCqjf9xtH
	MNMf6FJYVN1Tso8SX9dDnFJvXuw/LEJAk+OARSph+8Ps0yKIu9oJmx9go4gq7jXoGSLdTH8bVwG
	iyJxPGAMh+4QWBwknb3YH8aLIx9oz0LcWXYkinASQSB1lfwKk+uwmKZPwQzMAQY+V1ZKA6Su1C4
	85RAntRwkmPFRNR57cpg78UA2Jk15jvar5ExDqJdksRWAp7UwHbxfZ3aQbYrVFGjahbD0BysWGY
	OQ5njB6fg76NiwiK3nUhNllDqQz0rtFHnUNagW/SWLLoIGQ/GSoRUTt53Rndvqlp5sgmeex64QU
	PI8VDjE5CL0/umqv3MgYTP2ZRl94WQpi/5kEgcxUGDVF6xxs1gFdmywkP+JZF+Odi7hI+d5rdUb
	tSUJ/GYoo=
X-Received: by 2002:a05:6000:1ac8:b0:432:8504:befd with SMTP id ffacd0b85a97d-435ca118be8mr3765423f8f.32.1769367683124;
        Sun, 25 Jan 2026 11:01:23 -0800 (PST)
Received: from TTPP ([31.176.181.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f744e2sm25880683f8f.31.2026.01.25.11.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 11:01:22 -0800 (PST)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace uint with unsigned int
Date: Sun, 25 Jan 2026 19:59:55 +0100
Message-ID: <20260125185956.13882-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace non-standard uint type with explicit unsigned int
to improve readability and conform to kernel coding style.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index e893cb6fa273..ba56a84ca9d7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -501,7 +501,7 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 {
 	u8 *psta_addr = NULL;
 	u8 *ptr;
-	uint  auth_alg;
+	unsigned int auth_alg;
 	struct recv_frame_hdr *pfhdr;
 	struct sta_info *psta;
 	struct sta_priv *pstapriv;
-- 
2.51.0

