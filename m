Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ACC24BCF9
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836142; cv=none; b=PxTXAO5TlgFe57TGWd0U9leAr0EfFxk1x6U5ycE2+1lxsrf6ilikiEl1DlDgvG/Q3d4fClK+oHJi6fkANdbfqxttp65VYsoY+pRnE6v5HyMG/3tB8ZEY3Q+eJn2e9Q+aun93eJt8syq+MFwHwrLinq5HjkEKpL3Zed9hFURyqhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836142; c=relaxed/simple;
	bh=qXuKC8wKMseybKQRKVoj0KYHcQgg1A92iFP+uea8iuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N29aUIeKDLMHnie6dlH68eXqoflFELvdu7BhXC5blgvfNFbO4A/Ru2McWwjvfRMKjALes4ffrZSqm0O5sSdHss13KBbw05zK/uOrg4GqSRKWOWrExhaPThhihdw0IQ7w7US/xJvCQlt/dGhirEPUF4FqzKSkrgqTENindCZdwWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=XjsTkmQu; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="XjsTkmQu"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7398d65476eso81976b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836140; x=1745440940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTuxdgSBH9onldJ0zjeMMUuM1GqYJzLHWyE75BJvR2I=;
        b=XjsTkmQuLt4aoZrClk3P4WgpLl7N8iIzC7kzxZ8vkPjhMt9nTQPggv+lsoiu59y+TQ
         IIZ9X5M7VkX7u8A/vuvoemCXRoqTF5McUWBvglSAKd5NwTpW7qeqQucn6vU8+qCdSO/Q
         W0ju/u+5phqW28GYE508yc48xM2fsYTMsAdYJkl5/c9dkIMf/j7SXMhL6g0TcFb1mxyI
         d3OX4S4yJVazoXUM4MIyRxHJTKYiEznSsLXPITN9mKmoADeiw4hDKI/y/oQxxxc5wPpr
         RO9z3HEYdOtcaLzpskmQbu7H6DzQbJfKGSaOqtb43zwi8o0EPi+OokPqdaeM7sDgGBFq
         vbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836140; x=1745440940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTuxdgSBH9onldJ0zjeMMUuM1GqYJzLHWyE75BJvR2I=;
        b=nlAWjUiINDiYPncPAq8np7DRxhOjj/9leFhaMz3YyOJUQ+siHE4FWPcBlZspVFZIR6
         SaM5KNS+nRA94FcPP/cF75DcPu3T69VoimzUa9mkNpZwn+4450NASIWJAQsRWxVC+2s4
         hB5rCSYA7c2nHMU8We3PlhUsokicIPUBGreOKOOWFWWOCoNS2dutSNuXWMX3FATrf3rk
         UZMs0C2emYDBnvvsDMqVSeFjCb568vl8xCbFInP8dhBUSRtOOaVznACaM/kfZ0aeYPZ0
         WQdaawsYFUFB2uWWhoQwkDPsXudtqGoYdCRNPzWaFuEP8euFqdMziDDsmht81G9tszLL
         o6pQ==
X-Gm-Message-State: AOJu0Yy3kAMNQ1pRU5NVaPRqdL6RqiVzBnnyUaLgZliQB0f+KDDw/4Ox
	xlu3hmWoQEVaRi0MTxuKViELKOMhnkowik0uEl8VlvzHfZ4tG10pgtlkOeY6/g==
X-Gm-Gg: ASbGncs+kLjeb1gh8gROWSRD9i/7u//BQ/8cdIuYD5+6JqsvRzVG7cAzaM2PN0XxLNO
	izdxNx3YwKOOMWWqWcJWSd1qA3F41vBfMEreDJa/N7aj/p9y9IaT+UTNQDNfa7phImf+8O41bQx
	zBBkWyzckZJMGizignSStKkCdoU6SPP03P+VqD82x0hBhui9CXeVPloYtldlu/vJB5mB3UFcXN2
	XlJQ6Yyc5oTPzVfbMmLpntKpAL71cGb+6G4a0C0AxzOrolfUJ3pHtSLHd76JihNw5HQixViWF2Y
	u+vJ+NII28ytx6vi217ns26X1PDyRO/+UlCY0kN1UOrZHmR3ZUfYsh1HgF2YhViIwRDFpdeTqcX
	sSg92Sg==
X-Google-Smtp-Source: AGHT+IGRy1yX3/hgyibQ51xQgGHxSxovAxyZtRPcAb1wo6YzYcR8ITRaS0eVJ6jgzVzyKvovKr4gXw==
X-Received: by 2002:a62:be0d:0:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73ce5544dedmr380527b3a.12.1744836140526;
        Wed, 16 Apr 2025 13:42:20 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e02fasm10803980b3a.81.2025.04.16.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:20 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 11/18] staging: gpib: hp2341: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:57 +0000
Message-ID: <20250416204204.8009-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 5ca0bd2f1a08..1a32a2cc421e 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -411,7 +411,7 @@ static void hp_82341_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp_82341_unaccel_interface = {
+static struct gpib_interface hp_82341_unaccel_interface = {
 	.name = "hp_82341_unaccel",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
@@ -439,7 +439,7 @@ static gpib_interface_t hp_82341_unaccel_interface = {
 	.return_to_local = hp_82341_return_to_local,
 };
 
-static gpib_interface_t hp_82341_interface = {
+static struct gpib_interface hp_82341_interface = {
 	.name = "hp_82341",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
-- 
2.43.0

