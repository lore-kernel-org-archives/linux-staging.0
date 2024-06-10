Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519918B14
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998543; cv=none; b=S8O4GMBv+9oTbs0WFEUkjecg7x14/kADFF2Gzh1vUAAiqlywWwx9gB4HMhaHkCNdnXlJibdrhmFqERqKgrrCKmZ6hNQ/LMje7D8AqTj3aRjapFSaLCP8uOf5Cvuf9NxN2CO7i8ozpCEvO7I+izBBRSSWqjX+E1FmWOVow3N5uUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998543; c=relaxed/simple;
	bh=zidFy4gIdsQ0BrGYX9heGZLqjVgFXnbJ+lDwEHU7JF8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oka/vD2CfPKtoxOER6cfi9/lqJFz+XEtR3nSUd7XPtK6CvcWweu2HTbLHEjtjgDxJ2IHxJlG7Kkw+dzQbHeVz4CGYlYiogS7C2m3M0hx4ZCT9zTsDwpCfR9brmGU9AstBWlzDUz8b9Oq6ynxwx9UVdegYl1YjCDWRkL2At+eJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=PKmZ7JZ5; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="PKmZ7JZ5"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-681953ad4f2so3101970a12.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998542; x=1718603342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8m+H7Lrb8URjJe8p9iiLZsUeYML//04IDlIH65oAHC0=;
        b=PKmZ7JZ5gbGAwfUv6rbnkff8PbnmQWqNKjDobaBqnISbRcrvLXmRIOhlzeQg5fEOPh
         7iZoigz/2xl2af076X7leHBbsfDujnvfDdXNa7qRuS4YxYjyyGrkZKxFAs5qOjtaX+mv
         JhODVIhouiCzlcQLdIO8qb/dM4TQxFSDMbkL0BvuVqKg/9N/ixz51kNa4M/rC80oq+oq
         w3HO2EUOrmXYJuPQdgkZyjqcAABG/3cccndxS/oDeZOMZ+ldPJ4xdE9hCh475LzNbJRY
         AVeFNe2TuORPiiAe1fbhx+ti9BizdTM4htVod74AA97WabmksETv7Tll0muKtMGVs+3q
         5oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998542; x=1718603342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8m+H7Lrb8URjJe8p9iiLZsUeYML//04IDlIH65oAHC0=;
        b=pjr4jn81l7yg/+ktMY6owmVSu3CDL3kv92eqakcOK33fO8M1+RfJUF9UIB9gZjfaVB
         x3DLURe8p6pEpdQGYpC6mMjAnUYOT4oMPTReWX1gOGih2MAOxMwmY9OALf3GgEFWp4mV
         j9Q7sYd2rrXpCFwRby/Tox8IvsBHNvm93kJ45cgNQ0lcYi44XmHpGeIKKgWCOHK4ibjN
         2BD7Bli9vZXr6wrRbGsA64WbqtqHWEqzPmt01HPuaPX8CW+3Ta9OpUUd/rApWdfkl7X+
         TO50qFbspT65dNfamWgCoZDkJZSYM8+7Lhuggc0iVk1npvAoeLd+j1Zzug7NXfInXKx+
         fWcA==
X-Gm-Message-State: AOJu0YyhxuKlwsgDLreC5zMulHC6kwCvwFkPuGe0jY2HsU++oOMsYVNU
	5QOJYqpZp1GTRJ7kIw2Qnfpo9+G9sBVp7XFpWfgI+xgUtgcfvnhm+RM5l3IIJ/4=
X-Google-Smtp-Source: AGHT+IF90T4rG8JGt9R8y4hHU8+SENL4GlTfeRTYK1NjPgBpYQZPIAOzjbuHzH49+31xD/eDF/sQgQ==
X-Received: by 2002:a05:6a20:8408:b0:1b0:2af5:f183 with SMTP id adf61e73a8af0-1b2f9a2a048mr8814696637.23.1717998541923;
        Sun, 09 Jun 2024 22:49:01 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:01 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/24] Staging: rtl8192e: Rename variable bRTSBW
Date: Sun,  9 Jun 2024 22:44:31 -0700
Message-Id: <20240610054449.71316-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bRTSBW to rts_bw
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index a305848dabd5..0131765e451e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -119,7 +119,7 @@ struct cb_desc {
 	u8 bRTSSTBC:1;
 	u8 RTSSC:1;
 
-	u8 bRTSBW:1;
+	u8 rts_bw:1;
 	u8 bPacketBW:1;
 	u8 rts_use_short_preamble:1;
 	u8 bRTSUseShortGI:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index be8de6703e5d..8c9072538688 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -376,7 +376,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	tcb_desc->bRTSUseShortGI		= false;
 	tcb_desc->bCTSEnable			= false;
 	tcb_desc->RTSSC				= 0;
-	tcb_desc->bRTSBW			= false;
+	tcb_desc->rts_bw			= false;
 
 	if (tcb_desc->bBroadcast || tcb_desc->multicast)
 		return;
@@ -447,7 +447,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	tcb_desc->bCTSEnable	= false;
 	tcb_desc->rts_rate	= 0;
 	tcb_desc->RTSSC		= 0;
-	tcb_desc->bRTSBW	= false;
+	tcb_desc->rts_bw	= false;
 }
 
 static void rtllib_txrate_selectmode(struct rtllib_device *ieee,
-- 
2.30.2

