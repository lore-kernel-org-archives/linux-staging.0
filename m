Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CA912D1F1
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 09:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777800994; cv=none; b=EyX3hdj4FWgYrxRQ3T/4pdpp3p8iQudmW06LooGLF75sCekQ2UVxHh2/k4+cssWiYTaMqw3z0wmGeyquWrZVWkHlStE/wdxMkFfXLGoGpDG94DvhxfkIFk6TvPbHk41cFDgOb9TWORNKeBsK7TqSVfkl/m1gAUYwvdyYVMharEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777800994; c=relaxed/simple;
	bh=RXfgIjAGbxIo0UKBK/fu3hOlYZW4whqx2RazBg+Ujt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dH6hFgX/Gm9iV2HSMxLuVh9N+ID56fzhsI7FLBT018/KDOcDhTuu801La5ds4z2b81O9VBL31eE/lm+zJlTHTXPlHhq5bWmnvvS5M0m1uyoI5fCgGHoiP2DRKUKxCPCwnPGUmImMBc2oMsJgAuOLJ9aA5+2Bw3KngO9gwLlrKRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rm5gX26X; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rm5gX26X"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3650a628473so1393143a91.3
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777800993; x=1778405793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDatquS85Dk957E39/1YLiRAqp8ipy0ImMN6jRWaHFc=;
        b=rm5gX26XtXqfrMYU9WxqtAM/qmgp2EvZ1UCkw4nyuv8ueIFLML1ad9vudImsgwbh+4
         t1mKqeErWggiWFyW1ezgMdGOjJb+fP911/iliY6P+/UJQkiD3k/QnCwvS5kKENKjUlF+
         1zvuPw4WemOSvz9KBm8M+K0dfamauPtN3ngcSWjGg5RO7tZdQMM6EIchy3ktVGluu++L
         43xF5gYWZMnp8AWI9t3hx25pucIQMwjO7ikBZZrRwGEwG+b3czEZd50TfZXYhFasaMxU
         Za7Tas4VbM0YIoN+O95hsy+fHezYaxWW+2eNMP02HeLpzQnelLgFJaJMLADg/+1SiE/U
         ChfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777800993; x=1778405793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDatquS85Dk957E39/1YLiRAqp8ipy0ImMN6jRWaHFc=;
        b=WiMzAmR5IiabXmM0yujbeAyTMq+VYRclR3O8fKfwZ94/L0lHUBAi0O7TISXLpq1v5c
         DttCx8awl9pmSbKCmeiAJ+8nlgQWBwmUSbe8ubjE7ed/rQO2vxdPLekHk8+ctDNkpBsk
         E3/M1uQnjosQfBV2WboWuhEUfY0rkU46HumhgpRHAj0l5hPqFaTFkav2YUcgPNDLY8JO
         Q1VZnoKUPuskRIvoHTk4Bz+r+DvtaWp8CJgnWOfycFV48nDyEpoQZMGjqjANCgXFUjvL
         SdOPeprHgGTRyAetnCfpHuNwuVMS7sDVv17QHOM6EqfLQhAl2lazqJYVdSw9U8tiicC2
         N9zw==
X-Gm-Message-State: AOJu0YwPF3OY3oejVaUpgB5n1gaFHJYD+bqz9OxLs7HRk2/a6XYSr+Yp
	ND09HpFJ7THmiLOwui2SgT/wppGyjy9ZEXhCEUO6A9rONK8vSrAFAMbW
X-Gm-Gg: AeBDietU3tdYiAmohfZMKBwdvUvpeING6ZCYs4wcBwmwo4dYJuVmyfTvTW0lp2ashhT
	dDViVs8P0HXmvkY1EguNDYtBtm5rtyXoFjFt69cqZWKOgIJQgKiiaHkJVIZTCRtapX8/9dRTKWK
	LHKFjbLZrPfkRLW0vSvNuMLXEfxflu/wJR6Rl88hQPq6EijLx1nlqZyoVpkf3zSZvgS8nCj7rMk
	8TSKbSS7PEIgAxeNu1W9DR1NvpPXTOG8Q3FIFAMDLZZ156apJrLzNxhatS9iSC5o5CL2OuJvSBJ
	K6INS0OyOg4tyZ/FISsD5ybxWME56ST2GXRbsTfpbdkn4plu+Rn5VunacmgI7YQPDxG40i+zWtL
	t+ACmhuqF/TFDZRMUE0N6pR0jYOxGtByjQuvPCFZAQ+BMwFjYgyjK5xoMzwC+95YWVIdk7MDOpn
	M2bzhvPBE0GTKgDesl+x/Ofcs9en25d1N0EgiRP66ItnHb3ZAWZF7oGlM6GzWLX/0qyTV1nqxvc
	gXFMhTjynPMmAiVzg/ZPp9QXuYZSigfMz9TKg==
X-Received: by 2002:a17:90b:4ec5:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-3650ce8ef90mr5890966a91.14.1777800992550;
        Sun, 03 May 2026 02:36:32 -0700 (PDT)
Received: from ajanth-HP-Pavilion-Laptop-15-cs1xxx.. ([49.205.204.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbbf3a0sm6589960a12.11.2026.05.03.02.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 02:36:32 -0700 (PDT)
From: Ajanth Badiger <badigerajanth1301@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajanth Badiger <badigerajanth1301@gmail.com>
Subject: [PATCH] staging: gpib: gpio: use sizeof(*ptr) in kzalloc
Date: Sun,  3 May 2026 15:05:58 +0530
Message-ID: <20260503093558.68105-1-badigerajanth1301@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sizeof(struct bb_priv) with sizeof(*board->private_data)
to follow kernel coding style and improve maintainability.

checkpatch.pl also reports that LINVAL macro should be enclosed
in parentheses. However, LINVAL intentionally expands to a
comma-separated list of arguments matching the LINFMT format
string used in dbg_printk() calls.

Wrapping it in parentheses would change semantics due to the
comma operator, causing only the last expression to be passed.

Therefore, no change is made to LINVAL.

Signed-off-by: Ajanth Badiger <badigerajanth1301@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 374cd61355e9..2fff9ec9a01c 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1066,7 +1066,7 @@ static int bb_line_status(const struct gpib_board *board)
 
 static int allocate_private(struct gpib_board *board)
 {
-	board->private_data = kzalloc(sizeof(struct bb_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -1;
 	return 0;
-- 
2.43.0

