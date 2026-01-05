Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CBA325716
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 19:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767642222; cv=none; b=Xsc2wZ0DCmLJf5QDhLuuP7NwIPy1UqTJV9fW+Ez3EiR67R4oZujfiQo0820oKqhotAxPYWvCe7TF6nQ6fyFgqs2QpEh73MhlxyGPB/UiSFVirpj+UVSMdi3Z0UJW1oISaiN1r9xAHTRroSeJv6m6UqwGDyC4xmSbOiymU7pqOiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767642222; c=relaxed/simple;
	bh=LJ+uw0AtRjzsdZtayM+kbqRMfKt6DcwlUnQNf+xJ8dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sd4xLxvcM7OQ6xhLfNyTWXpWU4QeaOThvEWnfkx+ff/F1qh1rp8nEBRHOSIvcLHHkNBXnANMJTThuMEOWfnZtPXZfR4T05LKM3AbzvqIBJqDtVpRTMAH+I+QQ0Vlh4Krh6O2zsY27b9Q04wpQDY9drkbL4jNpREwtK9+HUpDUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Thxm35PX; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Thxm35PX"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8b25dd7ab33so21940885a.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 11:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767642220; x=1768247020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DXwvHK/27PJcu8KAdzccwir8HFbo41aW94hOHzpnGV0=;
        b=Thxm35PXpsOXrrZiS8c4CF0LJOqVVWMUElwJo5KCJtQs1PQpTgeWBr/d4k835U4Fpb
         cjJ2JCQz1L9NRoRLmrYuc/SoWbAKbV2iCtgpooWcromy51+wOFzEbRqgiQJtbQTr9XKF
         vDfkHlIHmkbRYRglDFmuW5G5vQDcusweHP5hGMrIpvKJTgA1AHsLInfHJrrcKDkdLoMS
         CCAnYwM2aA3HbYXoptN+echcSyeDbWnAf5neZ+0FT955tx2YtAV2naU9CeKZPgpX5VZ5
         t1KaOh5beQem/7Eqqdl4S8gRCKaJ92MxJ/O/5q4K1FozLWkj2sBOBluEmxHiGn/s/Ge7
         4M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767642220; x=1768247020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXwvHK/27PJcu8KAdzccwir8HFbo41aW94hOHzpnGV0=;
        b=D4pOKMGo2Ou8L7ppA68dWQwTlcf8v8gwhqFUVRpHL32ZXeeFnQj0qSBa2UDf1rj9sx
         dGgWLVJ5z4BDcMId6WFpH9tT0Nthr95yqS3Hni/QlB9y8fEvT8gkct/jb1HVqpOYp8IE
         y+EtRucJC++hhqgW5lJScGAaESBQ75oCn7hwrU/+rS9GLZc5i0OfKog4R1J+VYAs/t9m
         vfb5oKmMR/0bkvj92v7IVRuUeDBh7sUs1ohljdE3Qi7d9/Wl1c/tQggnzdGAKBiQ1RG2
         84tw+gVzXA2jwaahy+y0bHQ7J9l1GwESFgmH5TjwXmiuD51iFdoQKoOVwUasoKI2J94N
         DyXg==
X-Forwarded-Encrypted: i=1; AJvYcCVCPNtFxXjKlkFotAFaPFaoWeSGpVBPWDl2b4JP/wVN77rDN6Dv8n2mVgU/f0QwEQ3yK+OR9uAyzbNZykq2@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmh4fBc7AtQDltmZ1PFqWhIhK6u0aPDPDyVGpjBcxru+sdqbgX
	uOYUkhGBiYmcIOk00qnN5qc1b2CPWYbJ8JiiojWw+3lvOQx2OK75cIa7vBYCetRjtBk=
X-Gm-Gg: AY/fxX6Sr68NWrPJrcpEj0ms0/2kYL/jfP4Ti5AJjMZiBpfRfZC2tnpwTG52HFBhW4D
	P47XZ6NYZboYsKKhrOGaNS4Q8ltNKZAgfLhSH9nJ2gEAiQWeGBRzV9NAIg8BjVrFeKsLwih/n+R
	lbMKCR2Pl3oiBJKpa54WPDQSfIgFmj2wXOkQ8Mi6Vua2nsVdDTJW6k5IJV2sefT70wQ5ii12is7
	C33i1Q2IIHhg0QL7SvPN50SVBNXyUL2ctU8K5qVEnsQYvuDbTXMujQ9xAD4wkxapoASdKuVngij
	G8Ak++ANYVG8zeipn8HdVNbMEvCP9o7AOdexiQpnun8YoKET1vCu5Z/STBumtIURayU+WnWwgeN
	hGHSyCp7IuoMmMarGbynVY3q5fBTDMVE2fmr1U0jAQORRqkfqzQy1slMcRMx29u5pQJmdUBF/GM
	I7Q/STIRcVfn+//LTouYh3rh0Ny533TaD4OkkG+TEC/QY=
X-Google-Smtp-Source: AGHT+IFYMM1eCLm5uzX2hcu37vYPBAPIuYPGAfgI0DSeHGrdd00WcRTt1ldUkbd87y+Lng/ZjDRDYA==
X-Received: by 2002:a05:620a:2808:b0:811:f742:c752 with SMTP id af79cd13be357-8c37eb7ed6dmr113140185a.36.1767642219747;
        Mon, 05 Jan 2026 11:43:39 -0800 (PST)
Received: from Archie.home (ool-435601ee.dyn.optonline.net. [67.86.1.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4cd7a3sm20351385a.24.2026.01.05.11.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 11:43:39 -0800 (PST)
From: Philip Thayer <thayerscirez@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Philip Thayer <thayerscirez@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix spacing around arithmetic operators
Date: Mon,  5 Jan 2026 14:42:27 -0500
Message-ID: <20260105194226.57035-2-thayerscirez@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed coding style checks where spaces were missing around subtraction
and addition operators in rtw_cmd.c.

This aligns with the Linux Kernel coding style standards.

Signed-off-by: Philip Thayer <thayerscirez@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..5cdbb556d2e0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -175,7 +175,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 	if (!pcmdpriv->cmd_allocated_buf)
 		return -ENOMEM;
 
-	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
+	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ -
+		((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));
 
 	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
 
@@ -204,7 +205,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
 	pevtpriv->c2h_wk_alive = false;
-	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN+1);
+	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
 	if (!pevtpriv->c2h_queue)
 		return -ENOMEM;
 
-- 
2.52.0

