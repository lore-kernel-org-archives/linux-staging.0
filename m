Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DA63264DA
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781439766; cv=none; b=ftEvJ6Gz+GRjYGcV2llCYkxg+BX/VDn3XWMSsLtqyhZ1b2BSyLwVRSyoJjzQh1g3BKKblmbqWFwCVxXWmAzG5A3cK6UhMpiLPI/w/4cwV0d00VewoLqBsij1XJQ+IIMaMB2NP1jF93TSkwrDNLeL8JdxgG9Pit3h3pZuGIj08as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781439766; c=relaxed/simple;
	bh=Npalpcft7I7eHfa3WBDXtCXZJ533w3usjlZWnTw2dMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hK6GK1+gT5fkJ0L8ZP/MGWHneqXaqRPgBZtfB1p71fDM6JuJBaOxrET1mDm/VBKxTisIn8bkyOsF9FB8lV5X0nWw5do4bAcJw9QI0VM0Y9RBi4hY6Ugeyv6/wcGUUJCEOqdGAORZXhsHyCfZk1ZrTTqUBxG+5VowG5Vvw1Ow1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0pZBEp/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0pZBEp/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c2a68d01so16068385ad.1
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781439764; x=1782044564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O28pLQj256ufqacQLDJpIcOmRKTlRpbGD8/tdrCX9IU=;
        b=r0pZBEp/koyW6mUlL8p+ukZc3ovhw3oK74xZBMYz+Nggpt3dAGE+gxvWts0/9uX50b
         1z4QWKwQVk8b1xXc+5wfKEku+sUOkDQvPBuWJkWon0UcBCGy+zkV7qN96eHm/vF6GqVx
         DUjJ+4CQKH391T46OO17okMqA/Vu6apWw1bbObksnpCkxHj4c3W4m1f96ryzaACubQgd
         LFUPMWb/2lX7oFB04RjLOmbWVqg7m1yxEiL1yZuWj8mcdqxqVDImjs5sWT3hr6T0cq1y
         ViLjOTWy7EY1RXPCtDcniRFjk6mBpdfhBnMFd+wzmRNL6d8so/7rBFUx/eHLf6tAqrQG
         /Itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781439764; x=1782044564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O28pLQj256ufqacQLDJpIcOmRKTlRpbGD8/tdrCX9IU=;
        b=EnVQwMaxzDPoqa760SeL54U/BHpU9F3Dtir7/1kci7yUYAYYRj4gw0xYQ7FKzgdqgb
         CAqEtRVxDSGQC2hJwyNC7Dc2JIc3lP+pW9pujpZY6wBinNcHjJqy5cTRtD2qc7cNyubk
         laiFYfBUkgfEyloLzzhej5dU7UQKXhQbWqzeQ1J3Mwqa1Amj5KC3GsSsNCFZFFERg8lN
         p8wYGJZTSFBxtz/+SNxZpG63aB7pMlai7jYV0ZKBCb9oWsR4ln1hccS8g6+f/lvb+5Gn
         GwZOKc3dKfS5dvLKpPhr5sAvdoIBv4RjYPdSOvUQeSoFO6ZN50sdpOi1w9JhOdGYIMca
         eH+Q==
X-Gm-Message-State: AOJu0YwcIHIg4Ppcl0kmSdFTGMqWqEhioAYYB3h0VJHqFib+1KuNPf1y
	hZzQMhTFAEHjq49KhwNG45acbYgg7NlZZ4eVGkEN8YQndBNAjGVl6klK
X-Gm-Gg: Acq92OENb8aTu2DlD0Y9jWLSQnnJrlvK1PXCh2v/m+EfCCBs0qXMRySF6iA3U7y96Fj
	koCxexQUW/4SVkMNYErdsWBNRFpVRDQEqOdxRwrAAC2hAeVearrdWahs+3I5Jg2JzLLZtuXDoWk
	6nKtchmw4/QnhhuozAqMD1nn/q2xC6eRbb/nty/tpDYinSKS8dfXKWywhcs/99gKvev8x+Z+bXy
	6+b9JjzQ032Fc2hXeYqeE6fY9ZZfMkRs1hoZi8htH9fTvhdjA2v5j5YtR82AY4gM7psw03GFi0b
	Mwp7+cIAWWL4RucZhcYxYX0euf9kWfbRztuq7e/CRNyaaAcGL7H+OXBkRYYK7AnFjMseIDfty2p
	dEKam6fUHFQwEQInFdLqbKKt4Qc67RfdhUpmmKJ9E43e60/lZ9dA2s9BuCpWMCle2SZxlLXsoUw
	PPgdTyh4c7QC74vGbuSStgSWw1g3MiqwC68Zcem5fjBS2viqta7gCxyaHwChhloaZV9R1zbdxo4
	kBC
X-Received: by 2002:a17:902:e808:b0:2bf:281c:d2d3 with SMTP id d9443c01a7336-2c4104137c6mr112096105ad.9.1781439764306;
        Sun, 14 Jun 2026 05:22:44 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([103.58.154.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43326b085sm69157995ad.70.2026.06.14.05.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:22:43 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 3/4] staging: rtl8723bs: Fix missing spaces around operators in HalPwrSeqCmd.c
Date: Sun, 14 Jun 2026 12:21:54 +0000
Message-Id: <20260614122155.20034-4-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
References: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around the '&' operator in HalPwrSeqCmdParsing().
This fixes the following checkpatch.pl warnings:

CHECK: spaces preferred around that '&' (ctx:ExV)
CHECK: spaces preferred around that '&' (ctx:WxV)
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index 86404b5e6..98a3d7695 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -88,7 +88,7 @@ u8 HalPwrSeqCmdParsing(
 					value &= (~(GET_PWR_CFG_MASK(PwrCfgCmd)));
 					value |= (
 						GET_PWR_CFG_VALUE(PwrCfgCmd)
-						&GET_PWR_CFG_MASK(PwrCfgCmd)
+						 & GET_PWR_CFG_MASK(PwrCfgCmd)
 					);
 
 					/*  Write the value back to system register */
@@ -106,7 +106,7 @@ u8 HalPwrSeqCmdParsing(
 					else
 						value = rtw_read8(padapter, offset);
 
-					value = value&GET_PWR_CFG_MASK(PwrCfgCmd);
+					value = value & GET_PWR_CFG_MASK(PwrCfgCmd);
 					if (
 						value == (GET_PWR_CFG_VALUE(PwrCfgCmd) &
 						GET_PWR_CFG_MASK(PwrCfgCmd))
@@ -126,7 +126,7 @@ u8 HalPwrSeqCmdParsing(
 				if (GET_PWR_CFG_VALUE(PwrCfgCmd) == PWRSEQ_DELAY_US)
 					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd));
 				else
-					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd)*1000);
+					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd) * 1000);
 				break;
 
 			case PWR_CMD_END:
-- 
2.34.1

