Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D12C449EA9
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580030; cv=none; b=T2yRpGSp4NoCMbm5htof4rPJnY9fx1RJf4WJHzhPjrv4SnmjI24V/ZzO4JsCTb7PxoSz2daYh7mEmpgkSR+VFzaljrGQriZEpyRXBWk9NqKdyVmngdu+WbvXYHQ1CylDNheyb+pebQHlVMo0ZuVFbtNSUSKHXeeenxvA5uWetI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580030; c=relaxed/simple;
	bh=Ey/g0s8kBxT+ZD6jEWAOa5+ynCnh2fBSkjF6Jxdb5+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OfRbbIH7IxmVz4TGPVxB9Bzgibg598TtfDYF1mWGDfQEHcIrse/Dfg0g/0OMMGD+1cdPVE/9JABVPPrVlzri33CdFMSMYi+dId8z8XATUjMa+05HCyYLYwIM9mSKW7ZCXukRNp62UCUuUquePzjBH+YDvNAsJxAZ/2ZYxQoyQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cn3YxoNV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cn3YxoNV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso556771f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780580026; x=1781184826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0N9w0NcpoevzC5VyLVmVPGnT4XvGQAjwzUN/WuPFpE=;
        b=Cn3YxoNVIripbPIQHKdmWal2Uyxy1RlLQwXSbA8UGnMe5ivzGOsWkcyDEUCA3dlm55
         +yYTR1solZ6yASMxyzTA0HjeYf4yKVpUfixG8YcFFPgi/8cOjZFr6GfGMHiq0KtlvT9z
         gl/9q1Ftt1aBa1jig5gPz8yvsWtPo1Xhe7RKjqqjO/IiybOhiSy2wozcUJeXa7LfjXxt
         i5+iPPWrFibCvlVX6PYW5oK5s8niKORJGHSZcS94E75A+4B1kHN08E2jnLMK+QbdOqpr
         Zp7GwxOQBGBz084nxWbBw8s4lNFIPVv9GYqi2R/F8R0QHLfN1lYvTBUhJDDeFEpfOnOh
         CxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580026; x=1781184826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0N9w0NcpoevzC5VyLVmVPGnT4XvGQAjwzUN/WuPFpE=;
        b=rZ0inUgNINYIGHiZMfIVSS/m1ZT3WS7Fu6uigU/izyD1w5tJtk60JzAEAN6EilRQew
         CWEXJjSWmf0R1jdAf12D5fEju/tI8Iv+OpkQBiqjEGPFy+0g8GNFdyX8Eg7kFGyF9vFr
         xkTkPizFrCMUIPgGYypHpgV+WNvdVGAG4G0f/6guJrQcTR/LxyijOAOK9VW5pQwkJ0/X
         rs/plq5DTyuNrEarZIyeXUyly2dwf2HDdWocSHMLU50cz1rOKHwtvNONd61QXiriwU3v
         hL+BYeivXcSJRgtf99+/OsJmSRLb/wVEXtMWn/aeCVE9QbdOZfC8U5eMSUyM8lzVd3VY
         vXmw==
X-Gm-Message-State: AOJu0YxJ39o6+vjKZN94u6VCf2BWH0lJviMQnt7Ua4qbiWMV87O91laK
	d3bdTRozxH/ZqrQHo+NxSRzgaDATcPUoKjzYaxHoKcB+WAZSuDWFVBRD
X-Gm-Gg: Acq92OEZSQgctumMlWjU5ZWFvSBsPwM20e004kHuMDR2j2MjJwgYJhPUuYDuTah6vQJ
	GfbPfK7FyLaTiJvZRQ9BJ8bidhnr6PWk8gHWLPMQOP2iQ8zjdukKqmXpeES8gC/ub+dmEzU1CxI
	7nIFFGz4TZxwAGj4++zZpYoppeWlYKV1jLyw2QKtWfCkNZ/Y3iEDwecj0EFbVj/1brAdvOl8lTO
	GHiGtuDnNoWelqH/KJnDnyLF3NNaUMyY1ZMCKc1qHMt4ccVLKYDurZ8Dlx1kO5EOVjVYygaG6mO
	C1ZkAtdNewa7U8ceLH9vEYgr1pLQ66AiwPlyvrRuHGPJ1nCqf0DjYtwvhutwEaiELxpaVzHN+tA
	jEw+e5wCqwa47oGRONPCns4LSXpDd2l4cj6m3/SE26aArk/ImA/8UIM9j2zXfeIi/pcKdfe2jtz
	jzwFDloIaZK+26bLl/P7u/9LLt7WU1KydVKJTxCKrHjr120qEhUDe9BRmt6tA3xNtG/+fTrOquI
	SpvTD5ivFrdn8M=
X-Received: by 2002:a05:6000:4029:b0:45d:77f4:1ac2 with SMTP id ffacd0b85a97d-460215f27cfmr14353881f8f.0.1780580026307;
        Thu, 04 Jun 2026 06:33:46 -0700 (PDT)
Received: from fedora ([102.78.131.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm16424770f8f.9.2026.06.04.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:33:45 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: rtl8723bs: call scan/join timeout handlers directly
Date: Thu,  4 Jun 2026 14:33:15 +0100
Message-ID: <20260604133315.188125-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The survey and join command callbacks defer to the scan_to_timer and
assoc_timer at 1 jiffy when the command fails, instead of calling
the timeout handler directly. The TODO comments in the original
code explicitly note this should be done.

Replace the _set_timer(..., 1) deferral with a direct function call
to rtw_scan_timeout_handler() and _rtw_join_timeout_handler().
Cancel the pending timer first with timer_delete_sync() to prevent
the original timeout from firing later and invoking the handler a
second time on already-cleaned-up state.

Both handlers use timer_container_of() to recover the adapter
pointer from the timer field, which resolves correctly whether
called from the timer subsystem or directly.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25e..cf0a67aff 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1793,8 +1793,8 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pcmd->res != H2C_SUCCESS) {
-		/* TODO: cancel timer and do timeout handler directly... */
-		_set_timer(&pmlmepriv->scan_to_timer, 1);
+		timer_delete_sync(&pmlmepriv->scan_to_timer);
+		rtw_scan_timeout_handler(&pmlmepriv->scan_to_timer);
 	}
 
 	/*  free cmd */
@@ -1821,8 +1821,8 @@ void rtw_joinbss_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pcmd->res != H2C_SUCCESS) {
-		/* TODO: cancel timer and do timeout handler directly... */
-		_set_timer(&pmlmepriv->assoc_timer, 1);
+		timer_delete_sync(&pmlmepriv->assoc_timer);
+		_rtw_join_timeout_handler(&pmlmepriv->assoc_timer);
 	}
 
 	rtw_free_cmd_obj(pcmd);
-- 
2.54.0

