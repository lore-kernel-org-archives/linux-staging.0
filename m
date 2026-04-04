Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE4E20C477
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 00:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775264400; cv=none; b=kOEUSMh7FJp94R9P5rA0ioKIA9W1miKY++s/BpX5ZieF0z/yovw4jbU7v8se8+fAm1b/66tyWULLWFjaG1S1YabOoNHRnuAx+7MHIkyXq2mwSqlcz1f8QBob3vygGmcEX5G/bjqhxmw1lA/Cqd7OWNGYNARi6PfFK3DdqMjBc2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775264400; c=relaxed/simple;
	bh=3Aja+pzSMjMaQxPTK33xU4E8+wnM+XwaoaHEvsnJWQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saunGvFySK976oB0lAQ7+jng146FlcxOFOJosLN3rVdz8KSOLbd3CKhGc4TPnIcFLCl2KH61/4aONU2rrIl64PL3OmVVCWE57zqTSlwvwaTWXIAMQhXnvMNsNI++aDbbA9knpRLBqnSvXPMppFcYZpFJI2DU7JGgPnbRpu+pL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCaCqupu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCaCqupu"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-824c9da9928so1438572b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 17:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775264399; x=1775869199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7e0a6J7MW3qorlXdad7QG78cyghh5QXc9Vv+gvzN5gY=;
        b=ZCaCqupuHyeMyAgs5ZXIGY+oIRWJ+1UZx3qeSd5DbFjFRB3JIwzPeJBuWjP9AaTBaJ
         qbiuzCAIxuVkpeYQlowbr/UBTJu2ZdJxKMZMwa3FBjgwczWFVqoap5lkKL3Von/5Ru9k
         ZTcXq0eSq6sZD2vp3q/roVlexgjFNsUWc/sXnW+oPMEDyXlQF90MMo/0m2zIvFldMLQr
         sdES4KxUKsPTvuRli3WgDJAWb7bMOkNd76AtQSugBJcNiFThk355gas5rsurCzV1Few/
         HKQuTvMMCdgyZVqsLNELeLmidsFu1FvtBkb91VmWdy+I9UBOdp2cl/whr0K1g0eftiqB
         zgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775264399; x=1775869199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7e0a6J7MW3qorlXdad7QG78cyghh5QXc9Vv+gvzN5gY=;
        b=PETrItwyOGfPlOG0psS5IMcdmXqhOafciPYYv2SPg2LNDJd8yZcYUKd5U7RIweGfUF
         MzdK8X1tZgviGlmCwIyQYOkmswHcV7ge2ziT9YmWA6AaWpOYUjCgUcFJPAmQy2QNS02Y
         qKqgFmVyLwEaSMrysppjIAE0wdgKMwgnvyniYgtOh1PYPvTL1RYcLk6ytIlvhDHUds9c
         in1ASVgALsTKEzOaZoBMBY/9MdI/NuT7gYgRsqqDrJLTXxqQ81O9CDEEj5gj25otTt/y
         ZuH775BFAnXRykE3ar/v/P/O912YtnSc5+6wzrYRqqnGowvEOwaudVMgEKSJVqcLvEbA
         a3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyotgWKTFGDcA2kK3nsi3MxMIF3P0oYsgGCMA4tF9AZwVQQ0DXUh7Ogghr/80vdv9ewGhQzH3IYo8rerxr@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0tH+lNSb9gLmmx7KbpX/IzBhUq5OWbjGEumll+Q2/768LlI8u
	iLWDIdkTyZX51ucNJZ91owUjerca3Zb0fcQord4knaCt7NB40KRdOWu+
X-Gm-Gg: AeBDiesZiDAw4/0se4+30LVt/nTQ6ryYyh7DdQJo/5Tk7A1jfzMqw93vdF+F2tI3Ptq
	10Ka6ofXePgM+fC3Su9e1gL0JkPDuk15E3VDFohy4PVjXVKC7UG1UjBds1Yt0X1R6Q8niaYMkEt
	QvyXC6vjcb3q6dqIL0B406JEPNLfnH4dTHC33vXdv+8whHj6FkdI9WDcHLIEUl5rfEYdzgBgHgF
	l50UkxRerz0U2oVG9N9ISwEWzSoB+9crS4T7T5WQJI0pNFYLzWVjEluq2NmBbaiLp5qUjtXcSZV
	1WWQxxR9Kl7A8YHbdOknTFEgqgfrVJVjv98C5ihLxLy5moCMP3vr+AH3SOWKr6NQBREcuJL4R8o
	JCaCvc/r2XFFbUCOqlE2dlxJZwY/neQ90VwdXI4uNwHGN6sEDviZeIGY+xyn1xJsryHM5IceWNT
	yXWF8nNSvBq+KNEJt+wnJe1Mi7hod7bOL8sVgZUb5ufljW9mAXPhaw3YS0d2psp2lD
X-Received: by 2002:a05:6a00:1f0e:b0:82c:26a4:df02 with SMTP id d2e1a72fcca58-82d0db8b083mr4236220b3a.42.1775264398951;
        Fri, 03 Apr 2026 17:59:58 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:7de6:bf03:20c5:a0a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3aaeesm7565306b3a.13.2026.04.03.17.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 17:59:58 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	k.souta0926@gmail.com
Subject: [PATCH v3 0/2] staging: greybus: fix checkpatch style issues in authenticate.c
Date: Sat,  4 Apr 2026 09:59:36 +0900
Message-ID: <20260404005939.116701-1-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026033032-rethink-jogging-f3b0@gregkh>
References: <2026033032-rethink-jogging-f3b0@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses checkpatch.pl warnings and checks in the
authenticate.c file within the greybus subsystem.

Changes in v3:
- Added detailed commit descriptions to each patch to explain the
  motivation for the changes, as requested by Greg KH's patch bot.
- Ensured Signed-off-by names are consistent and complete.

Changes in v2:
- Split the original single patch into two separate patches: one for
  the 'unsigned long long' type warning and another for the alignment
  check, as requested by Greg KH.

Changes in v1:
- Initial submission with combined fixes.

Kosugi Souta (2):
  staging: greybus: fix unsigned long long type warning
  staging: greybus: fix alignment to match open parenthesis

 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

