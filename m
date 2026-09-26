Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2E2931C3
	for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420328; cv=none; b=X02pLrzV13KwFTojvWK14HRX6EKI2mXhlLf13O3ehBbBzajiRP4Etz+hrggeB371/REkBu1yZdW0ZbEDD2jJDwt2uKkSecjnLrXgW1d+7OnGPTw+enVGMABGcPqGDjCrg0R9KtIM/0nJKanye55eu28qTFmmXbXGmeQ/836jTBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420328; c=relaxed/simple;
	bh=f/JwWtvuPAULYcvOayIamhEEmNq1wE5KUJU0GTr9H94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlTARzhCOtMr/EI8M5/o4CKW5sUnWbseVwWu0novRoxVU4obhqLS2ZOR7Bw1P3+j3b2uHM8sEJfmUlXRZxqwEDl+NeoMvQqTCzhZ4TCVl5KRKnLe94u/XXhPLyL+oBJ89U6c6bcK/IDmq4APonJGhp4QXH3qFXG1Lw3uL34Lo5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq9w9Nos; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq9w9Nos"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-342d720df34so395523eec.0
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 03:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420326; x=1791025126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fd81XWpJncxZy0/jTiwKWSYGl8WWZuXxmAmM1ok50DE=;
        b=Mq9w9NosdamAEo89hhR42bnOlIywMzBE4S/h+NHXO8ZA80oJzXVvh3LSQ6hvG06pxK
         W8Yj1ut+MF7GC0VQMrKoNqTJ3gQEMq0SLbV7DHrsMNrUOJrc4WW7ITWci3zleVJHo44A
         2evvy7UcFFxmb4AX9stNFa0IsBtVfWTDHS7+OJNfk0wtUogXKtdR3aIz2PeDcbD8whll
         M5xXkUfGmm2N7s8wyu4eppfOqBtTqhGo+ds7fje8vBW3FRkBA0ntRN/g3IV4IyP0e8WD
         qJ7ldsWqtYXBVGJC+9dcjUUaW3O8j1xPCvtRK7oL6LD/WEUH60zK+LkprOWBtEdEDMp7
         M8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420326; x=1791025126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fd81XWpJncxZy0/jTiwKWSYGl8WWZuXxmAmM1ok50DE=;
        b=lmpD66PyNBHhQ2mGqBSzUXNcV4Rzp7mEYr/0goDJqteyXbKIgXlKCHPtaacfjMgacC
         tdrh/96+sEg2bEzYmBlNvQF6nlIWbOm5kr7ar1plC2MP1WymMJwVWjEH4IrZmf9oXiSq
         Gjz733aw1FARGI5MsBR6QwWS3Kr7xxI9F6+og0Xg5Iu4lmZb8oOPEDhaNC8+0pRKCL8f
         n/GmLNUliM1FS/Tr70SCsXU2Pa+Yzw/4o71Pz/X8K7WsdgGAg/LEb0lYsMW3Zujkp4y0
         F6+uj3AW5TLLPYju7qcuKhAhwfQCRiEZ4FTojlEtBHacSStruKemSpPkZKNDHClKKNbo
         zUyA==
X-Gm-Message-State: AFq9FYLn5fHQyTve5YNVjeFLA3lNduT96QXVVLALlcdT0fWZAVZjtAQ4
	1TTvftMWr2MUHi2jSRMR6ZViIz5aRqS9fxISMZTjL6n5fIjpPjVaavAi
X-Gm-Gg: AYBFou2SP11gPlED0IPb73NthjRyZMTcxhdTQZ5F92NVLMOsaCv+P9/fkZPNSaPDxGv
	GGZMd5VMAQ7UDQJYvX9eSGq9Qbo9184Uk/nHp1Zo+OPW0qPQOKSJjTtAmPXKu+YWqYV+mFCAw5f
	Jk/WKmAk+R2xmDWWPwUofYTaRCureacaptQN/124IcN6WRAUUyFagtoVwN1HfIu+Gww7IygFb7m
	Ls12FKiRCgXT2yGYGwFl++TWGZ5ruFYL23rpVhwHQ10LXLUq+VGXYuHGB5XU6ZED1sOhnnUsgC8
	4zGi637HWtfQEMCvLzsM8CY9oGVhMPVHff/ZhLLw7/9i4D2nhd3+7llsSk1gSc8U8XMkrn4u7q0
	jaavipLtvOnrfoIgsKgjSVYuH5pq6fFGKxNU4GzIKi9JaqChagdNQSQpHHEPycpplROrzJNEa+C
	pfS9I/Y+xHz1ZzkDVJeMpjCOy6TV1xQElSNf3zzfDj1itNZ5vUgNeG4ADJJXu6PfSHYWjN4S1q/
	1d5aeo0f3Y8/Wamt0plSxyF+6Q=
X-Received: by 2002:a05:7300:c88:b0:33c:e91:271b with SMTP id 5a478bee46e88-34273347562mr4014161eec.36.1790420325853;
        Sat, 26 Sep 2026 03:58:45 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm4458982eec.14.2026.09.26.03.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:58:45 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: make rtl8723_dequeue_writeport() return bool
Date: Sat, 26 Sep 2026 10:58:27 +0000
Message-ID: <20260926105827.3760-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8723_dequeue_writeport() returns boolean state and its caller uses the
return value as a boolean.

Change the return type to bool and replace _FAIL with false. Also use bool
for the caller's queue_empty variable.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..482dd1baf3ca 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -33,7 +33,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 	return true;
 }
 
-static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
+static bool rtl8723_dequeue_writeport(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -107,7 +107,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	/* pxmitbuf->priv_data = NULL; */
 	rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
 
-	return _FAIL;
+	return false;
 }
 
 /*
@@ -121,7 +121,8 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	u8 queue_empty, queue_pending;
+	bool queue_empty;
+	u8 queue_pending;
 	s32 ret;
 
 	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
-- 
2.43.0

