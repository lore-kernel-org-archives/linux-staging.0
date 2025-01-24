Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBFF1CDA19
	for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716494; cv=none; b=i4sZ5jswBEymrYLFvPnPD8gMDJwSe78kaPno+0+JC6sNFNusVYEiW8gejuqh1+3HSyNdVc8nD4GO1SJQpxY/nu9ITrP370bYTxKq4Zl88XOcuqWvAH23ki2Uwb3fzbaHszdpxEL63o6fUi8u//vt6JmT4sPUltLg/+rM0/wAsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716494; c=relaxed/simple;
	bh=2y9QcdyURhsOTT4phqP/68t5bbg59K9y07oHH+MlTmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaSJIDJPCas+HLvZW0XujlkzJkkZqAIxr7qGyO//D9OWGnprwIPvh/kMtianxjHVIVbUQKeofuTCE0IyaHYwWDdrLoP9J63Q+nPbFgK9OFoVimhk6bYwwP96a40fJar0QfzTKh7hmjKnLAuh3rSFezMjVmMW6ZUXZcwDtXCN9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zfa1hcJP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zfa1hcJP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4362f61757fso20042995e9.2
        for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 03:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737716491; x=1738321291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SU0v4OLfbyg2BcXH+Gm7C0wnMA6JMbZdY3F/aBWgBnc=;
        b=Zfa1hcJPcmJVeyL7dk26Jz+t853v1+lE3HsZ/2bMg0TIHWDPKy89YrnK+VnOr1q5d9
         eBLLBzspC0Y31HBPLAlKpTCIaooUOz8NsfHLUDNP+Hd4W2cuMe7ZUhaFFPTFgHmrxEZV
         7TzyXsmInKQUU9uw7QuAuQkeo5Bpn87KpFF3Yvbl8bgGN+JyIJIWHTgyQ1BAH9Yy1g5j
         QZdPhFAuYWQEQet9lUE9AKNatTt3b+GPA7MIuuMBlXDAKt+OJPCiOFHPfrm2LBweo+lf
         mWvTb9TeDwDdE5igaW4mgssq0/IkANhEm5d6rFBZw58AtdMj/gjQq/XWcvqAQQupXom1
         fxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716491; x=1738321291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SU0v4OLfbyg2BcXH+Gm7C0wnMA6JMbZdY3F/aBWgBnc=;
        b=WpeEzaSEd3+AjceW32Rugmyoy/6B5czvn8mYNpz/J1eaLzwsPuYwjF9djWJWZ7QC2u
         1TQKYUWENPJFZI2M8Fn08YbQtYdP8kxwRSqGriC6BXt+AzRvxTPgS4gDgkrmBjfdoTlx
         ArPtVMNXbI99MJcOpMBeIR+ZIBr70hoyWAfPi4txnML3lz+kocwm5e3mOBaYb+uG/7NW
         PqMjVaBpfKfPqJ4DkvHWSSyphcR40+/EEswS2h/iCiuYPqPz8e2tAIHRUkpwJbCkicno
         6pnEtIDJuQdp5h60W3FdnJpu6/FxcdLeOFX7Z18ZLvXCK8zy0+EFqXFg8z5DG/aI4HH4
         ZLfw==
X-Forwarded-Encrypted: i=1; AJvYcCVRh1D8mmlMdQsE4i+aAc3HaAT3nQm9EhPu4XMvwH9StE9OYf5iRreY3ZBfyVsH+O/2h+b2UhzKSB9GFhr8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9AjaVHMM34xEFtpHNwGZ/gXtCem3AiBVuX8404dyBFvXxWU1T
	CoEew6hDetykx8voCsjlT718pUshf2S06Q2lhfJoY14+W4GQ3ZPl
X-Gm-Gg: ASbGnctFFjJXbIOndLaTLoHfnPodAhlVhnAroWLf23jYfG+fX9zAalQ3Dlitg388d9f
	VpCX9UncyVB2PCKmbwW9yFRTjWgzylm0S44lQUcLUZflwxki5jAeTJQHCexEqmf+OCeYQoWKaX0
	cCI3jpUWOpP4Ts/XZfxw0Jf0gBFv1C7ksg0XhWIY6V4mB1qCAoCsUPsssTiCGOHDCnp1aVQ469q
	CVizBdqJvBRhdGE9L675OaeHScxJ9khuz3KaI9HvkvXulHZ83H+3skXF2dOGl43Xk9Z+4PO2q5L
	SCnlurF8pHLdVzvZzxgWbpbPtOOVqEIj981vgyNa
X-Google-Smtp-Source: AGHT+IGU4ejgFSioRIT0T+/LllXGVfXWrqYGm/tEsmQ9EqlzD3jz/OP3Nr4w6Cj9FvgI0yTmkcYJ7g==
X-Received: by 2002:a05:600c:3544:b0:434:a781:f5e2 with SMTP id 5b1f17b1804b1-438913cabedmr251091075e9.8.1737716490321;
        Fri, 24 Jan 2025 03:01:30 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501f1esm22101185e9.12.2025.01.24.03.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:01:29 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jaroslav Kysela <perex@perex.cz>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/3] pnp: isapnp: Export isapnp_read_byte again
Date: Fri, 24 Jan 2025 11:58:59 +0100
Message-ID: <20250124105900.27592-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124105900.27592-1-dpenkler@gmail.com>
References: <20250124105900.27592-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build of drivers/staging/gpib/hp_82341 driver was failing
with:

ERROR: modpost: "isapnp_read_byte"
[drivers/staging/gpib/hp_82341/hp_82341.ko] undefined!

because the symbol was not exported for modules.

There were no errors building with allyesconfig

The symbol was removed by
Link: https://lore.kernel.org/all/20051030202734.GN4180@stusta.de/
because it was no longer used by any mainline modules.

Export the symbol again.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20241014162054.2b91b5af@canb.auug.org.au
Cc: Jaroslav Kysela <perex@perex.cz> (maintainer:ISAPNP)
Cc: Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/pnp/isapnp/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pnp/isapnp/core.c b/drivers/pnp/isapnp/core.c
index c43d8ad02529..d2ff76e74a05 100644
--- a/drivers/pnp/isapnp/core.c
+++ b/drivers/pnp/isapnp/core.c
@@ -843,6 +843,7 @@ EXPORT_SYMBOL(isapnp_protocol);
 EXPORT_SYMBOL(isapnp_present);
 EXPORT_SYMBOL(isapnp_cfg_begin);
 EXPORT_SYMBOL(isapnp_cfg_end);
+EXPORT_SYMBOL(isapnp_read_byte);
 EXPORT_SYMBOL(isapnp_write_byte);
 
 static int isapnp_get_resources(struct pnp_dev *dev)
-- 
2.47.1

