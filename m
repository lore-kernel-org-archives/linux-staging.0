Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0943FFAA7
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472067; cv=none; b=pZ+9nerhzZinpDed6QoqGWvf8HtJtaG0g6mLOXkdkRxQAFgreUOKOG5jMgSMHxBpcGQuj2J1TZAEYj7eF9btprJRUNdr2O8jA1fgXkzZ0IPD+POP7Wl9wqrGcZxrDvZZ0+vG6MIdOS9ycPB8KeJ9yJ+H7hahECPlv6ktKbsbwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472067; c=relaxed/simple;
	bh=08RidtlahiJ8c10vz6uXOCC0lnAJVvKCOPsHPm83Rbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddD4J5GwqF1wkBC/695+f31lRq1cNuSgktdfUzJAo7qOhXV1j4x8wkZb9O5YZC2EzIFMg81SVFq7eYinxsxkif07PjHKYl3p+iVzELBI6t9/N66mqR8vEErllkuafj4DrYUz0LREKdFtObUcTQDKXflhF3NdkKGrhfpMV4/5CoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtQS4z6c; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtQS4z6c"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so9426291a12.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472065; x=1781076865; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPiXO1dCCP98YnBjWC02+T/M/Rv7LEFPOyMbOWtK8IE=;
        b=JtQS4z6cjyWPDDWhk9NE+I4jT1oPmKgP6DG3nVEGzatl886K2tBAbzrD8Qr9Vmjd/4
         wvcWjrqhc4AuBybCBzofyjI8DHls6h0PAGpFlT0smoGFb6E1ovHnpRmdOXmOIz7JtAxo
         YXd03/wfBLWXHq54XSfkHBbGUBpDRYjASI5bX+Cfdo7yPZsP7j90AkFHl/3vjJPyhiM7
         RQcd38VXlLXUP51L/+uVUMrfZzvCdHKfCHcQQMjTxjpt3RuEpD94R5IlniN7mUseiaQt
         khIj8ErcRHQnUsn/tM9j+AVSaaIjqbPd3OTiEik6siRpqzqR+dBTQemiTaLuUDk8sGnd
         tw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472065; x=1781076865;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPiXO1dCCP98YnBjWC02+T/M/Rv7LEFPOyMbOWtK8IE=;
        b=mVX2HQusXxBMEHysk9ELBZx8rv6oO8NsedpXngPcgmPAhV4Tg8/BnW3XKvSfeCjh0L
         VBXzyR211uUmw40SEQszL5xoqnP97k+q/hX//WYfFlD2f7Lp/NwuUaZNrBorBmPprflK
         884crQqu99Db/Hb0srfKh0kS9nKm76Ym0HigajotkxGIG8SBj4BI8weib2ePqEQCxVsy
         yeucz0v4BWedEXpWIMNWqX9zEFnCRfvFiOT1Lhhle8YsVYaB5ZRKPYZJJFpIbrrLwGP9
         fVzvCWvifh4bwVsGXrgOM0mG6Uyw7wz2DkOycdmTsimFslUPBO8ceunkd31Xiu0EYos4
         Ff3A==
X-Forwarded-Encrypted: i=1; AFNElJ/mSy+mO0UghLcsGJnxWoXYbsh5q6PYBOTqqHGiFwapZ/Z+QbiLAy5sdEyyYV+R/10PU7S+3MjekgQuOqL6@lists.linux.dev
X-Gm-Message-State: AOJu0YzsX1ipa8JgIV+dC6ZPW6iL/GdeZlqro7pjur3Ns3auXayd8jRg
	6ct6QBeuFHUcuhSEWnCCH/er2z64nArXK6nT+GdUKWvNs3RIABvJ+zlz
X-Gm-Gg: Acq92OHzBB7csFtFAQc2aWbxPJQfS7DSdNxXP+I+F/5BvXcW9Z7eZomaRwrGyUFW/Rh
	8BHWY4n8rIuLgfrIC+YMZvCpGFkaNXW/TKCcYvoaiBBp6gt1h1KQUVxQCntMwAdcZSWqe7Hthxy
	JzFWtNJW22/21BdvtEUg1zGfnt5NKUpRsqhwk6OLPxaBAyzcMvCJPwPm+BzK/sEWyidMAF8+3sE
	2hyT1F/Pl+OOakeNTbVXtAxfkjxn7K9/8SV3qbcxbznPKoqaWqGFDxH36c8vTWaBlGEVAnZ6PwX
	b3hbwzfuvMAbSrKfTsM7O4r3WzVO1ChA739cB4UaOMH2GHeFpTyoZFxZtwRASxqBbouhUjFcK3R
	aw3Lyz9SWzQJ1XAQLe9rpcs+MA77IHX8JGA6XciBy5dUucaUpqo6avImQ2YcWaOxgGo2JL37IKX
	a97EWxr6hYAoIDVsFJcoUBe/RqIKQo2Q==
X-Received: by 2002:a17:906:f58d:b0:bec:64d4:3869 with SMTP id a640c23a62f3a-bf0b0fdda85mr96495066b.4.1780472064614;
        Wed, 03 Jun 2026 00:34:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm102019166b.9.2026.06.03.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:34:24 -0700 (PDT)
Date: Wed, 3 Jun 2026 10:34:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chintan Patel <chintanlike@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: fbtft: Use sysfs_emit_at() to print to sysfs file
Message-ID: <ah_Y_Y2RtqeGxchF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This scnprintf() uses the wrong limit.  It should be "PAGE_SIZE - len"
instead of just PAGE_SIZE.  We're not going to hit the limit in real
life since we are printing at most FBTFT_GAMMA_MAX_VALUES_TOTAL (128)
u32 values, however, it's still worth fixing.

Use sysfs_emit_at() to fix this since this is a sysfs file.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/staging/fbtft/fbtft-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index d05599d80011..343545e83a37 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -98,7 +98,7 @@ sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 	mutex_lock(&par->gamma.lock);
 	for (i = 0; i < par->gamma.num_curves; i++) {
 		for (j = 0; j < par->gamma.num_values; j++)
-			len += scnprintf(&buf[len], PAGE_SIZE,
+			len += sysfs_emit_at(buf, len,
 			     "%04x ", curves[i * par->gamma.num_values + j]);
 		buf[len - 1] = '\n';
 	}
-- 
2.53.0

