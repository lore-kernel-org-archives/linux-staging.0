Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE523D7DE
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770793460; cv=none; b=jCAwDO077BQMVxEyjfwRUbg5b+kliT+xqXtiOsNoQinaPi8wa4Oa/LwjlhThGDF0ssr4VLArnAKmGMa/XkITHjpa60fLN3geqNKSoOMAcIp42IfiLoTw6BAbMpRPTiwt6jkYosyWyMe3WbM0N8MItOfLQhz0R4j+ADTcS67K9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770793460; c=relaxed/simple;
	bh=CHyUgEULuYp5qCXLC1lu5kK3X/KuHl23QSbi/N9HlBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LtTi3yeQsgW/8aKFuUJZlUrrL1G8dpiebTjRkIUZs2u4IenFSXcfiRE8+NOQRHDxCXOaBD4LofsB8tzdp5lEZQF3QCYOOXEQ2v/PK25gcnrlHOJQBrn5FG4OwXxLCII00FfcDwMKzKbYBv8SMF+VyVv47bX0pEATjlDWKIE1/aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBFd8LXh; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBFd8LXh"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-35621aa8c7fso2513756a91.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 23:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770793459; x=1771398259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qfgo1bMyA1+O2TOhveKuRNYHV43dL1WbgCO6K43Frpk=;
        b=EBFd8LXhYbB4oZIqzK7C+UYsJGqj2xM7i4k+1d9RultwZ4uCeJRO7FFzdW2+bMs/Ij
         +2jIyrpGIbaamYu6B1t+1Xk/CrutQqKiRpcnQvHpEC5yVu2s0l3QpkAILiyF/mhxawzJ
         q781BDkBFrhJTPiASdDq2GDA/wXP0J7fCk1zyM/xHE6XX5fa1FthTAgCALfRbHfKdjuD
         bi8xsP1qiC7p7aHYy9TyfaNyvLZRTkq47bOmCcsZCstZTEsdzJsg0FKrmerM6z6T+xDa
         6Vj61nnnBKr5x9eqJsUBBoGzAJeJguk2uFcuz6qI26Rz07tbNLjK5c0aIJH/9diGNoe8
         svkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770793459; x=1771398259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qfgo1bMyA1+O2TOhveKuRNYHV43dL1WbgCO6K43Frpk=;
        b=ogLr4LF7+rtiM0L0bbLg9Lg8m2PG0jkSYe1kMAXz/hrAD1U9ZVSpbDxg6vcz+NpLJY
         bvOdFppsEbNu9COzYU8Qg9wX8dkLLdTb2b+prPA96MR1ynnNF/qbtt1Q+xpyan3My1iq
         y1EI6XjajIvp9o4EtDhDxbVq1YXChPn0uCCnTJhg77+zhI2xjwjkTqSq9O2hcz8Grjo+
         QNG9IaSNtDyQGkfln57UBY8JZbvG2fZiKDi0LpNB3ur9NgNrZLzvMN4PRAcUTzq/S27+
         x/WUmnFqgf2lifxYSkqBYf4xY7At1SWgJYIl7oYbLOQyyrke1qYcoUnROZQfjTcxxWoP
         2qjQ==
X-Gm-Message-State: AOJu0YzM3oCN2TbQg2CLb38CUawLgdOY0VXkhpMxf7RpE3OGXCi2ncfs
	7DAWT4ln2BsSMYSxIEjbj3hLV/Z8pONPRg0qJv1Pgh1AzxXtpf/jA8zp
X-Gm-Gg: AZuq6aJmUxULsvxytjfQ/taaC6AMVPndXkw1PtqeBQcm7CbIpsUkbEU25EB2F/cGcMc
	yRIdu3Cmna27SZUySDpWns167khMbBhn2Ojwrw/5mF9RSgWEiABoZsW9eBXdIXJDECexJqPJKpi
	Q+mePxWju97ctGGZVadojkdP0f3i+DzXpOSc2mdbMizXvRi59GvOMe1wwbKK3zzpKNcnGOwbmFw
	6tgknrgU/uaJBmxaMlz31s4v6/+tAsiUOXM+B70PKFI8/yBzkkt9uWJpM7ny7wW0ZuQh7r0m31A
	Leh7IK+ikY8ZS8X09VpArRpjZWZpGsoeijDBpfPUBIf1j+/pkOZ0E/ZxhlyFMJ4efZjqXggzNTM
	Yl7e8kcnvXyRTri1H/eAdwrosjcjyOPbDUZXQ8JPk7y3jkjOOtgCYiGXg5fsEWecc8SAVkABbdt
	LRTX0CxvuCBR0xlW9eoWVi0mwac9j7AarkP4gOljvi8hwJeRj6k8o=
X-Received: by 2002:a17:90b:2d8f:b0:356:2fee:92c4 with SMTP id 98e67ed59e1d1-3567b079547mr1505789a91.24.1770793458976;
        Tue, 10 Feb 2026 23:04:18 -0800 (PST)
Received: from ubuntu22.. ([113.59.185.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567c94260dsm843199a91.5.2026.02.10.23.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 23:04:18 -0800 (PST)
From: Juyeong Jun <juyeongjun.knu@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	grizzo <grizzo@ubuntu22.04.myguest.virtualbox.org>
Subject: [PATCH] staging: rtl8723bs: split multiple assignment in osdep_service.c
Date: Wed, 11 Feb 2026 16:04:12 +0900
Message-Id: <20260211070412.5231-1-juyeongjun.knu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: grizzo <grizzo@ubuntu22.04.myguest.virtualbox.org>

Avoid multiple assignments in a single statement.
No functional change.
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..19b378b49809 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->write = 0;
+		cbuf->read = 0;
 		cbuf->size = size;
 	}
 
-- 
2.34.1

