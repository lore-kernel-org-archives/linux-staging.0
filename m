Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C64E270575
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773463575; cv=none; b=G/e3bQpGT2Lk2kN955YJNfLemtCjxhgtuIQOVZ+FgSY/7S9gMEc2tRfyAx/dHRNCKsrgdm5dN7dpWqaUV8/Zg2VK1tH8qnckPbx+u5od8gqIPvl7SirwqJ9T8nvoj6aMaNIayKmcSqMq006KJhTdBP9l+cdIpTbMiZ+OkOcxItc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773463575; c=relaxed/simple;
	bh=dt9HvyVtHOpGf8cl/fzaYsVXFldiHWThZUXOUhWOzMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQvSivHSoJYxWGwfVwQfmxENrpH2rhbQf+ECizhR980Xh8YINlsyXcrw979amfTIQNhecRNMJfAsNioxyBQA4peic2dRRvOcC4HEDrznCzQTrAdxn3EQlxjVYTYVA6U2rCYeQ5CX0oabloUfHD8mcCeaHoOv3wSfvJ9tXpGkRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wvwikzr5; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wvwikzr5"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3467876eec.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 21:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773463574; x=1774068374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+XZITC93obnEiyv1hn2jMlEmpSTCt1vKp9RM4rMY+JY=;
        b=Wvwikzr5tQfEN8FJiVX4C6HmYo+9wU7W+/ftvmgQgmMjS4chW2a2aW/lvWNu4f6QTm
         oVX5ABB2Ucp1+dfwijbfb2DHSmOgqo6jhc8tEEqLi2tIkdcE9qR/4K+CdM3sMx4xiqjY
         YNO4IVMxBy8HNXBWW2asmUASaP8yuHQVl+/Laqnchq/uymGxEOpGPkNfevHDhJ/CUwxm
         g9JlTzf98qdQFjtjUnvF3VJyIUgsxdqxtUWSp3STtkDhm23E26lcBlDXzb7Bub48tTy0
         tlSyCyMs14iRrXSP5ynoUnpU8IV/23W8XthWBIKlnMccrZeSFyf92bVBUSMdKc85Kw1q
         +hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773463574; x=1774068374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XZITC93obnEiyv1hn2jMlEmpSTCt1vKp9RM4rMY+JY=;
        b=iJabkUOv8KPmcI491KTjUeGZz+KRiL6TBrv1kT147D6evmdLJorFBlAPzX8hD2nyQH
         CG60O/BZGlxirT9rvPI42V9q+nOiAKYn/DeFrt/2FmUyPxtNlXw3RDESXU1uEIsK6j9r
         /aLJNF3XxYe8dDLyjYoINhjZoqBEC46g6qxgkNa8K1sHU3lr6EjCv/XshWCQYl8kl5mc
         VzioW/ttPKYPyZRYrLLn4D4rpbYrcjIvgZ3VBxrawrCq0KzPThBinTrPvxbAmzAL1OPI
         rStcj1rZJjF1+h4pu63+Avcp+Qo2JWjFKnsRfPdcHD09hdUVQnGAm0bg3KniB1w6AuuP
         mXAw==
X-Gm-Message-State: AOJu0YyAeiUOeDNZ+oDnR7SiC3nrHPIFdnY6ztgH9UuDKHbVN2QGrEeQ
	w3sssrT8JHkmG3GW2UIReabYhgnYzOrHvLsCafMqGtfThx2/GeBGniTY
X-Gm-Gg: ATEYQzzyn5yp2HbTTA9YIcuT2yadiZ3MAyyQ/uglj5FMGfhAuPRvjMO4EvmxBOBk8Kk
	DYxLp9YmBUBjA51eJiLHC+5+A3aX/p+9GBI4rXhn/NpnyCLbv7G/GTf6h3/XiYvr1nOFXee1kI1
	pjuUTJmQJ98dh4Mwk4rxzzXxMahfSe7z7RydgunKc22j2ZZ+a5cwoXWpazwFRMf+BcZT+DG0v8m
	XGG6Z2SkQDB3KkMER2m2fvPjlpi1Shkv/6t5reuMAi0rBpNCs7dZn2mJvv+Aw8koh/VDEK3JZi0
	4K3IkLXXrHn6gk3FaNJMvLrci125whePbtKl0Z1nRckz0qsymqjN2SP21PrnAEHSXta9DSN6fSi
	GP313+IotaZNM0468dBAiZ7eASTdyoo8GggB1uTVQZXjLtHTbhaUgkLQK3olrwq/WbjI4KiPnWU
	aHUm9ttRAw8SBLEPhcdGEIUMz04ENUNI6AgeKrMQc/9t6auqqHiDnGVZmtEQ==
X-Received: by 2002:a05:7300:6ca0:b0:2b7:13f5:43ac with SMTP id 5a478bee46e88-2bea5441b1bmr2403905eec.15.1773463573548;
        Fri, 13 Mar 2026 21:46:13 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab525c5fsm5255277eec.22.2026.03.13.21.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 21:46:13 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	marcosandrade95963@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary braces for single statement
Date: Sat, 14 Mar 2026 01:45:58 -0300
Message-ID: <20260314044558.86929-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces for a single statement block in an if
condition to comply with the Linux kernel coding style.
This resolves a checkpatch.pl warning.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
Changes in v2:
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e2549..a86252cca 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -146,9 +146,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.53.0

