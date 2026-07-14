Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBB82853EE
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036969; cv=none; b=oJAgYHNjRdhdCDKLowNhM2hrbhFTnPnMfoP6Mf4lRUgBq+vFKGRT8UydXp6XDbS+oc2trZ+duNZzHXU5rANbGK7FwDIMfChjM1XWTS6KpjVLYHRckExFq5/tsmy7qbY3RTev7WYPm2FQSHd0XI5hNysCFhW2pIum7LoGQlClZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036969; c=relaxed/simple;
	bh=4WcLQU/ZB2ddX2leJOxaOJJnbeYtNJImDgoylUFs7B8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oBFf7g532fmQJ+1evQFNdIQ6+w69whc7cjn6i2UrLq2tr0IG84ytnXFlYc7BYRUZcXJnMaxXsq+d1DVXww/c26IQSFANZIvp1shbZ3XDixMf33y3iJNFuqtWdQkbHr1IOnTAjkEAbjj/08cFCmCMUDoFLHPOlNveXIvps63dckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzPi3yk6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzPi3yk6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1215940a91.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784036967; x=1784641767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnpCUCIhUIUVob1+81rKKkOZhThYfFIyjzh2lJvfSZM=;
        b=RzPi3yk65Cr0o2lhJTM9shmnK3YxLCzMoYTO4ipYzutFrlYlhlQ7kko5+p5l1IsBk7
         pP32G9ghXdU/gJGfgvOJ+bs2RWbRifQLXtRSiRcJrLMgQ6FIQTLjCYHIKjumiY+hzmWG
         9yWcKgQe/ME0YljZ2LOymj3ePNvyAZ9aZw1fqJ+X4HbrHRAwNeHojhtSGqRTBYtAF26Q
         85I2E47ZtFFpqUripOeoKpGZfOhMdxl99yhj66Uf1ZwMjSIVatgX3GIvcg8+CrnncJQ0
         7JrThTXnQ/dsQj4Hog7jgiavCF/SNoNspiUYbsFL5FLwQKBDBB0PB/mSIc89xCpB3UMU
         moXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036967; x=1784641767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnpCUCIhUIUVob1+81rKKkOZhThYfFIyjzh2lJvfSZM=;
        b=Q4ved/+qc7Gu1igi8LzDuTrL1qFK0k+vC5dUAcfvmf/CQjjmHXDJR9HeUmZIdj9Wlv
         aT1K6lr4Bi6W9VJ2+ROAw2kxvmNC1xmkdtfN6F5vxqPpOagx0jPyaqkxlnaov6o6LYnR
         7JWVlcb6WrEJIRLMqls8YxA9CS+1m+JUyIMZ7fZIJS+shAFjAu0pjZIVr2HyuCSG2hQe
         WNA8+TOn4e0LzIimj1FPApemqgmzP8NODfqaVxcwhaJiTBW5ddjvKRc6nhGi4FI6dGL/
         rWgI41mR0g6ZqJ374nXKcKJFFU7HxBgsPMksf/S9mgPLpcfmWK3yw+eNbZwIND8xf7IM
         nmtQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7vj+jjWbB6mLCRBG/cRrRbeZ8k+sdjGGVcPZiLl271t8ul53jKnq4ddIu3O+/e9ooaFD5LrYHe9kkqQh/@lists.linux.dev
X-Gm-Message-State: AOJu0YyWzJR0zXSTNODdgZX5VOT0s7YLg2aYyggvt7EPUgJYEl9h7dLr
	VxNIdIJv9kdcVU0C8XUbpdbXeCyees8lN8HGqZQhn1atcbKH6BYz1bPaNBdyfTTY
X-Gm-Gg: AfdE7cmuCFFJDm1NCQxWDUGZ9trGY+QcJLXpUWAvJalQVYghW04z4/WZEHu8KrS8aXb
	C6mWiYhdPfR+Oxu1WIYL+Fy2Qb3nR01npr7vih4Q7cqTRyh4n2a9s7HYlU++h9b3dRFhdmKeZL4
	8HxU0r1A7GB/1fpTx0rOLCL72zabEfeJEVX7ieDK3hAXD0Q3Kei/iDWQkp1bU4CvHQB4CZ17NmP
	SjtRjzN92hxC6lSfb+8H7V44XzkpK+5td+iFO26nByzGUoVrpiMn5BadYVxJq7eaNHjXq2zghJG
	JyMYe1EO9QWx9Eekn2wOeUK2qEsmMd+cbhBCE7qdXrQnQGCnd5N7Wp7Jt3N7G6h+kKYX2DCZ9cX
	tmwObPpuZilIbMtYN288SI7FiFZXpaT1i5OH525oLaW7+sewVMsqKB5cIlYW5X2Jpu5HKjWol7W
	kb/CCbgQYduUcyvYx0AVguazQdNxfc13F9t1IrjRfcKH8jLVc7xc+DsIZ48Q5UnJnVsPBZcOius
	LNSxiJg9WbD24MrisFCg4cD4GfMTrNxEEEhAGanW5CwEePYJSyOj3WdQQ==
X-Received: by 2002:a17:90b:5344:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-38dc74d5646mr13154372a91.16.1784036967020;
        Tue, 14 Jul 2026 06:49:27 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm87462212eec.0.2026.07.14.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:49:26 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	error27@gmail.com,
	alfievarghese22@gmail.com
Subject: [PATCH v3] staging: greybus: uart: return tty_alloc_driver() errors
Date: Tue, 14 Jul 2026 19:19:21 +0530
Message-ID: <20260714134921.817-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM.
tty_alloc_driver() currently always returns -ENOMEM on failure,
so this does not change behavior in practice. However, returning
PTR_ERR(gb_tty_driver) is more correct and consistent with kernel
conventions, preserving any future error codes the function might
return.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
v3: resend, v2 was corrupted in transit. No code changes.
v2: updated commit message per Dan Carpenter's review to clarify
    that tty_alloc_driver() currently only returns -ENOMEM, making
    this a style fix rather than a behavioral change.
---
 drivers/staging/greybus/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..24b4dab069c3 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -951,7 +951,7 @@ static int gb_tty_init(void)
 					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
 		pr_err("Can not allocate tty driver\n");
-		retval = -ENOMEM;
+		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
 
-- 
2.54.0.windows.1

