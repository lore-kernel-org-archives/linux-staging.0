Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AA2175A64
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 04:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776660417; cv=none; b=pHDPL1G7zhDZx2Sb8yjsAZwOgi6L191x3zrmv+abavs0mMdFXfY+G9CHFwdD4xL4ldfzYzSXS1+rSKscy18ydBBjFFnC9isjYWJmtuvII8igRHAx3T1swRTyha1/yV3eEm4qDfS8Hf6xEe2KD+ksKrsVNK7+77xv+jmd+MSBNls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776660417; c=relaxed/simple;
	bh=zkffNv0LBhinx/E63CYkZKeqr0eyX33feXqDb6ciV70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=slmIqZhPow9/GRHYGE0UD6os5rD1pNmBPsP4WxnryzsT0XNWdJQYYXsFPi7VVPAG44vRJXGM9XhaX/iDQScvDrHtXxvCUOhXJq2FFdoxlwW3E+CJ0hS03TY0jMPIwQzd8QXMlXQ9pgvPf5FB9O06DtgBVKB3IAZmstyKYFswBIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In+cGOmP; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In+cGOmP"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c736261ee8dso819850a12.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 21:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776660416; x=1777265216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H7FzHqG5yNceP4KZ6RnjXraN9OcKgDDAExN55aKDfUY=;
        b=In+cGOmPvWyW7wqgezH6j/tfpokqI52Meu4m5gQlWMlr6Nw9sDAEbRTqlG5WYeDOcj
         7lTgUcr9N6H3welNtmd9mZ1KPugA8AjYOT3yCvmQUIUiQRVKmDuZdkRHV5Iuq2sq1k26
         Bay2/ssMd3JLjmzDMrMsFoyQs8VD8MnOokvGh1K6aNV6ocxt2IQto5m2L1cfVUqnpnzv
         nghEyVr+juA0XPypyPZQZVwCyk7n3fP4Gj2+SAKAWDW3Mov3fESHbd/GcSdiRy1Y3HHs
         CDNnFiNtfS9oLgoyts2o/Ug9lQrM1yqgEXmyREReZXbjrfk1az82kWkqLgFtw7BQ3LMt
         9dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776660416; x=1777265216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7FzHqG5yNceP4KZ6RnjXraN9OcKgDDAExN55aKDfUY=;
        b=ZQhXAv0E3nWtT+nN62TdsubHBpSrMhVJ+mM6E54MgelNzufgqby+0mrPTOhH9sA5mi
         RmukUN08e4CjHuR+UsKA9QJegimnkP9NNxtC74/Mbq+qVyPPPvjKhZGQ9oEtdy2+1WLb
         SQDnXJZ1ewXbwtdP7UmGnvwTEtmkjOlojEbIArJP7VJHJIw6w/GcWjL4QkXLpYnmnf+z
         9eifsTDAaBp4MVkn/Be2BcKIcfEedrId57g8wj8km+16KsiSJqx+1xosogZlPIP10VWN
         qBjD138mCxIw/ePqI0vRuzf71g2LjqisQ09blR0g75KBzjOkO/TcmAoBEtUN3Foc2uei
         oiMQ==
X-Gm-Message-State: AOJu0Yz7nPor0x3Y0jGX7waEvgWaaqmVtUHzenOKuiQB9NpjLckZpKRz
	bndd06uopHok8pxBvC1BsrHwEbiUJKzXP8aI2epGOzGSLMEmM0ZhBmEP
X-Gm-Gg: AeBDievsie/uZvsdz94QRlCJyKRcKm3nOQQJl2/PlMjgNYGyfK4E5Z15xr/U4XgZe4w
	z3tZPZthh+fYBJz/DtoLCvjToQxKd788CkekEL7X/fxYklq4koVtA/2Qgddr00UQCbR+tIDQtXJ
	dIE46BYNcQHKdXfeuVvW3jsZoEGMe2NyuQjewbh7R+ngsZopyK4+buh+vULV+csPvyHkqzh7b3F
	bCiY7hKFXdqwZvAXe6+NvaSmtD+NbIxDWA/KaC+6Lv+maA4bWXkryGBbUDhLX2NKfeS34LhUf3r
	DcHwpR5BKY4wEINfnO0Fu9jWp374KtDPMcZXUe/pbRtVRnuTHzcffwtWfiqmm6LlGYgkONNb0Ff
	cliZr+yTGTb238HtmgtnSmvZyq/iN9mA2LdrdnqmjmQ5Jk5qk73izb1gEDUqn/NWqpN67A7RFhM
	Kl44Y5o0sFBdRxp9aptIohm5rSHhaC1E7NTZbl
X-Received: by 2002:a05:6a20:7350:b0:3a2:bd1d:d68c with SMTP id adf61e73a8af0-3a2bd1dd849mr2961437637.50.1776660416125;
        Sun, 19 Apr 2026 21:46:56 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:1f1c:69e:a169:4508:2d92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703be34sm6401881a12.26.2026.04.19.21.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:46:55 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] staging: rtl8723bs: remove unused offset in phase 2 _BlockWrite()
Date: Mon, 20 Apr 2026 11:46:42 +0700
Message-ID: <20260420044651.164450-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c1314fe4d28f ("staging: rtl8723bs: remove all RT_TRACE logs
in hal/ and os_dep/") removed the unnecessary RT_TRACE logs in hal/
and os_dep/ files, but left the variable "offset" in the Phase 2
_BlockWrite() function unused, so delete it.

This is reported by Coverity Scan with CID 1408950 as UNUSED_VALUE.

Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..988829d5f3c3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -68,8 +68,6 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 
 	/* 3 Phase #2 */
 	if (remainSize_p1) {
-		offset = blockCount_p1 * blockSize_p1;
-
 		blockCount_p2 = remainSize_p1/blockSize_p2;
 		remainSize_p2 = remainSize_p1%blockSize_p2;
 	}
-- 
2.53.0

