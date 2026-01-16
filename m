Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC41361DA0
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565180; cv=none; b=JTzXohBwxxzRKU/ugvagHgfcHmBCK5JbEgwtF6pqsL4B3UBg8TKYsWy1tTLd1XHAkmtL3bqE06NBwGm240zv6RW05tYhz3OO1d4Cnfot5W2o2JVmAWo8Ecp0qeY6dOK1T7++LlQlm2VbSvTriWKU4+qhDZPsoWKVD9sIavKrCVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565180; c=relaxed/simple;
	bh=XHO05eFk4+VHOJzoCEYWtODyGC0MCEqBxsU2LeVjJQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYA2x/XOyx6MXWTjpMT3dcmORTivnnUk0yDWCdhgTCCPYIDkyN1NxIL5z7r7hG799lrvxSZxi+ADcFbN0VA6X8K/tSYRa8Wkk5DqW5eGgknVsIeAU1lG+4t0bW194pvJ8fJ6I7qXqA9tVC+YelQ1am74K0c89kDjYuW5G3L84sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6owo5ph; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6owo5ph"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-34e730f5fefso1281068a91.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 04:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768565177; x=1769169977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/IqIx0fIWZ9A271phJ22GlX6QqU17qoNdrAcy03LEY=;
        b=m6owo5phoK9iAxtatbfdZ6vU+yoi8CspbhsWXypwr2xiDjmYP7gJQZmXj4MJbvt4Vm
         KZ8xIbjH9GG1kI75WR6CKdxuvzB9Txphp7MUCOBay5nIkOhL0uq9qra2JqiaYGeHKS3L
         LwodEeAOhHbo+EHS0kBIzS/qpScsSPunj/8WsLJMIdDse9m6LBzYmHDp4HrSkMeO0K8F
         dhG03yOb60UMkjv0GO3wr1gNbskYe+WW8nZtXhd06rCfUiCl0cKjYAFMCcWnFtunNhyE
         W4qc/4XVuukmofJ2YziRK4T62TaCeExfwkT1mKfBmWtaKJt5FKA1AjgAg8/EjWX4W7s0
         GaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565177; x=1769169977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V/IqIx0fIWZ9A271phJ22GlX6QqU17qoNdrAcy03LEY=;
        b=L/qtxWfAkqaw/2eY/dFfXimJm0VlCo+m3miv2X7rdcQbTaVfp//cvbNe4EIZ9Yz/dE
         HQNF8v0Mfq5yFrMPuGc5SPNlVl+oYb0RuZjyFfQc2mpqVj40MI2PRlZYhONfhqI8yCr+
         0+gaZxC1ZFFr1/bGOwoqL1IDILcYljeSm31ZXdPbsAv6AVQA2z9SFWxxERjKwyeGSmTA
         0ofFbJiKn6oX72NLa8Ra0pHKTRSxtxLPDvCgEY5s5jNN4E7I1hhvglDE9Jg3e0MkwJxH
         hfgFnEHYO5vlBm7D1IdsnCWGZ5+CecGOTnTqwT8xlf41hi5gzG39ewb+LfQoAU9ZCQ6l
         iU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoV0IPHqS/ZQ2vi8W/EhsE6SGX9WEZ3mLa7TclhtLj8K771wICcyDSis488UiiNxb4y569n7empi4ZPYZI@lists.linux.dev
X-Gm-Message-State: AOJu0YyNGIlA5Yg1KjL88Enmtg/8Uw0x4Nhl9tKJAFV0trbUqECQv03T
	iaURbbqByexuEKjAAwpZ9X0XNgTSn5Et8uPvebnKKJrkHI55QtKdjJbe
X-Gm-Gg: AY/fxX7jOsh5drnjInVzE/LnxNXvV9TsswOlvq0CuiBi3dkuyXht2xiUhuCJ7JU5qD3
	P2RrkpIA2uiGhRkRpCWBwluhHNG6fk3Sw1yxtk4rgBQBCdFi+4Di7h1MSn5ixBfPQeYuUlXynly
	w0OIAaDGK+V65ONVPBwIUkuFNTHDiUHpgidjB/IUbr4y8CwQOyOYR8OiESrbUdWQ4auHC5zy5A7
	fH42gB0GTgNFerDPhoQ3eaSt23JJPRdE04fDi0GYccdLCZwq3yifCFpp9q7C20jdOreOMKE9D4H
	W8CJAEXcPsYhEGmPl+KusPMyQg/Mw1CnCYG3OomJdTMnmryPxblRnjXR8xbmA6xSH3A68CGOD8/
	6wdcsej0SI7tVxhqRHgS7tskoBfkK7orN0ykTBwLvM8tTXCBBtSUlIGRo0XCB872I+npzls4Wtp
	HqOnJUQSTJ1nDhd9Tx31hMw3gbxNG5tQY=
X-Received: by 2002:a17:90b:3906:b0:340:c179:3657 with SMTP id 98e67ed59e1d1-35272fbf5e1mr2279686a91.33.1768565177511;
        Fri, 16 Jan 2026 04:06:17 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527310202dsm1992539a91.12.2026.01.16.04.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:06:17 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v5 4/4] staging: rtl8723bs: expand multiple assignment into separate statements
Date: Fri, 16 Jan 2026 12:05:11 +0000
Message-ID: <20260116120511.48272-5-nayana.mariyappa@gmail.com>
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

Split multiple assignments in a single line into separate statements in
osdep_service.c to follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 99a6e29cd949..01ca423faf87 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -223,7 +223,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->write = 0;
+		cbuf->read = 0;
 		cbuf->size = size;
 	}
 
-- 
2.43.0

