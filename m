Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC13612DF
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565174; cv=none; b=itK0Zpjd17COzfHAEgdg4ExYf9jeO4UV3whbJCrm0OsL/zCpRzBi2iR/DcU8+zhzpUncZyhx4Fls1BuVj0vBNfqlEGu0070YIeDG5N9ifMGuWBtPGCjN5yVmkO/+rjrGEf8sgdjL1+zibTaVIywplBVrU2H7jjDG6y0Atq1onY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565174; c=relaxed/simple;
	bh=tBMDfsnLOfK3VP3BsApug0x71gC0Xl1Gn71vyoZGlv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJBlKZvfc2QGWNgTTl+fZybfDoBwN7iA0G5dcMS5qYkKhLzZ6Gb/K+SSnhsklEfYrDFMxatruzIyacc2YcKgyZvP+dXvZjhrm/G/gUDfIlAbpXFQAmAq2yD6ZAelcto1TmbN4SWU+EZ8dfFNb0HbLmeIBi11eJjBJ9dcATXsUeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW02w7PM; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW02w7PM"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0bb2f093aso11784595ad.3
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 04:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768565172; x=1769169972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6Cx4yvXg5JkfipcOD2ZdykQJL8xo/SHOCR5TjwrL1Q=;
        b=XW02w7PM+/fcezuUrmkeSEZGER3NLvZFGNvKonibjJ/TPxgvVH7//2RFOPbPig5rnx
         5iZmGn09Q002UdIwxEKZZwfSH6IKS/owBpCROl5nOMvh/uUTJPrSjt+qC/5EMr89a8Z0
         d13A+gW9m/nBRKqyRyu2NNo/NDm/xA8IdUWd5K25OkA4/fX/Ypo8QdNLAXSljmBYxYv5
         gXgFUSOFBt5TdJ5kaDtJOSCR/XuwmrK32IbsVKeS9btfeh5xApMKIAKNg49eZXWCC3uP
         EfZk/Yv0UM/5S4TpwUaTSsmvRRUm8f6LjI7S6P4VF+8nvo/vi2ak5R0TJATfou51qbgi
         IZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565172; x=1769169972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G6Cx4yvXg5JkfipcOD2ZdykQJL8xo/SHOCR5TjwrL1Q=;
        b=dZWYMt9updIqISpdN6Bu5DgZbL0ofXaAMgxInhwk7zjHMrMi2JrndTEmZbHVyN9q5y
         +SERymOOYKFYCVOmhjBum1F8hKZj70TqP4en6ezyRdOqokRyr6B030Y/KC/RODwTmtn2
         7srOzzRX/Flqw08n8R8Y/JFlCs/yDX7VAx4W+daPf5+x/F3oE6CaZ9kqW3dimGWK3M2P
         UGr2tGgok8tkL2cPUoBjnMKcGYSa4SuFf3RjNdUvTJQKipuHtFnVO7bxRKPTg7uPkFPC
         wrEwXK/zJTTOO8nccvQ/6GANYPdz7tBEBmSez9ny2GTO7RXAaSkrnJvkdy0sosEw5smd
         aqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDQEoZ4YltQqcF5GHbezZiCnJ5+0+eoDlCiybP/fENbYioODLfsE/Nd5x4e8yot/cjLybFWthk1U+ADBMg@lists.linux.dev
X-Gm-Message-State: AOJu0YzmbwDBuZAt+JXjO+32mkQ85VMNi6HePUXPkvw3Ully1zlEDfVv
	S4aYDxyBLX72t6IRv/l15fp4J2csCChC4R1rEA+rhv0+pZioXcaoGOaS
X-Gm-Gg: AY/fxX6ikwJR8qFshS94dTjzX76pxuwi9R2sQoD/e4oZrBnxMznAI1oRlOx4DKVC9v7
	GqNxu+x5WQU0wnSZmnPFawkb1ij2w6emUWFqWK/8X+9Jr+ibTJUkPtzGAdO6QRX6l+f5u/3bY72
	2ltAV2qEp2AEdX9C4DjJb+03zh+om0z6Fyx+/rPUPTqxwsQOAhFFjyQpOmOgKv1MTHvsFnokCif
	BuEN1SmUtMsnTLovVsfZrVvPUIPsO+wAcbOVweZ6FOItnlwdeB1Wd4QMVBUOrD06clcCy2N0/ud
	NPIafE/LNb39PJ1pvfCkxb9Z7L5U/XNk1CB9ccM+Iw4v0qGROT+gLGV5hQSqUGFML5O56PVUR7j
	3O0Itc/BLBDByG5yu6YbNkENERmCDOcAmudYHiJPQT/YJhUwYPDmUwWo2Lr3fFOjLPU/8dZj1k9
	danYFqevytEhF9qer/IT88
X-Received: by 2002:a17:902:d488:b0:2a0:d05c:7de3 with SMTP id d9443c01a7336-2a71751c24amr27383485ad.15.1768565172260;
        Fri, 16 Jan 2026 04:06:12 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527310202dsm1992539a91.12.2026.01.16.04.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:06:12 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v5 3/4] staging: rtl8723bs: add blank lines after declarations
Date: Fri, 16 Jan 2026 12:05:10 +0000
Message-ID: <20260116120511.48272-4-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116120511.48272-1-nayana.mariyappa@gmail.com>
References: <20260116120511.48272-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added blank lines after variable declarations in osdep_service.c and related
files to improve readability and follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 4eff0cc955eb..99a6e29cd949 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -200,6 +200,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
 {
 	void *buf;
+
 	if (rtw_cbuf_empty(cbuf))
 		return NULL;
 
-- 
2.43.0

