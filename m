Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF9248F7C
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 03:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783136728; cv=none; b=ff07vW16k9ia1G6Wi+pKEEQFCkWn31dUZEBE6Q4+bPYNImfgJ6D6R+Zft0QWgYkI048roplfcu2wUBEtdVoKKUGL6TjFRsf47/eRPztd/7BLJ/rDluicx2KcxfQDnaHWnJIsucpLMYxxbxQq833sWkwQTOsbme0s7n3o0w8lzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783136728; c=relaxed/simple;
	bh=YbtQ6gCGzqu62jVC5oZv87Pd4y6xIuRPDX0Cl2y5/jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQLziyvVFePOgnNa6PwMs6XTogc94QHcA6+sCMu2ODUIplus6ASVWjYobCXbIFHtseBPkHb+ysPCxmN5LrO/zplYNRYWBIycKSAl2sp4Uo2UB5kAB+fur5+BkOpoHISQokVLMjxTlJpAHCpFHaiOpyFx+juj2yA7NNIQGKPuX/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0vWykw0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0vWykw0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381b831d535so915352a91.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 20:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783136727; x=1783741527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZPKv5pWoT7feA8vYI7f6hPaN4dovsSw1B4KgYFEXf4=;
        b=d0vWykw0CxdL6hMVySvayuJn2CKpvZ7Kw3U/fFJjOAU9pCClqUbFj30wKyBDSMtmJV
         IeLZ5DL6ZyESUNi9yzZKoVWxYF98mDItq6S6JO0/rAjGBgBz/DQhJb90eFKBl3XpBT+X
         bnN5KvqQonp+VQLGqxIexyQJOn2Oji2fUvu7JBNParHRWDwVbC3qJdQjFyVO3P+7JzYn
         oWBZc6m9OXE4DodQDqIpanjO6MfHHnpHW3ggd7axEQI/KK/Iw08/4DZWanEva7G6PJkr
         Z2Oo9jplhOBHjRZxMSXQttWN2RI0nLdHnT/0ZGjlRb1gPsBB+bgS5saVT/0tgp7MHBmd
         40Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783136727; x=1783741527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZPKv5pWoT7feA8vYI7f6hPaN4dovsSw1B4KgYFEXf4=;
        b=geCPEaMAiHgENIiRvrNQj0CKloGB3cKm05PcgEXD3/z19FzmxT8zdlXdW7V0eNtvDZ
         eENy51s5PV7evjYV3tbLSv9sgjM58gvWgW9hWKc77qR1i9G8pNuyvt6IYZ5rrPoQ85z5
         oNun+dgZzNHmYF2ixNA1iCEt1hL2I9ctYOfmXprtG7xNixucAPmsXRKn+7ZFVswYB8T6
         GV+Auw0pvh1hPY8le1/2y0J0AZ8M+JYgHljZmaZ9Yww0GoTPnBhoNWdXMD+8iRJ37aFW
         Y9ICWJ/HPekxLFg1uGMOrOay0fV04eM6N8Fhp+IDIQ+PDWWfPGGsMFmSEW172GaskGXI
         oIPA==
X-Gm-Message-State: AOJu0YwOZLAP56/cIA9COfnc7SszAMGxEd/X6EAFIaB+yJBCTmBW7pXR
	zsozqfgzcGuZJ18ibPErlttsO6BVT+r6/RGK+57ht4mkNhZ86sMexObk
X-Gm-Gg: AfdE7cm/IsqOSd9vwtDlEvKRn1SRj2q6QsBqr/1nTUgQSqNAGqWL/37H9YVBHlShaHj
	70ICq3R6Q2trlREwbS+nxwpxKt/p3ae5iEfHECGl3hca2XjyBa8X+D3Naf7WAgvE87EhQGdaNAW
	fwmPyvodjd0iLVEoSMYQ/OVj6/KD5PvwCIgY6emQaw/rP/EQwRH9yR7Y7twjbt6Q5mIiVLXAwsZ
	CzOjEbWMvQEF5grwG53Nkdnn7aKyT7aee/8o97L0Hfaq+E57eXjqXKvfxTudwKvxKPjwXzK1DIs
	Nwlm1RrQQjrZfeBQyKi4YrUbH01k2h22hz1JuU3hYA4jduM0X2ebXT4hzRMognXa0b5MPtsBZqA
	boq8KVETq5AZI9PSe1ppmSNAcuMwj6bPT2NnQ8M2nfx1ljeuPxiLF14sm1EmRDVYDjix6nKKyA9
	kPu6P1LrfPlgrz6DlDJsrjQBSGJY7+ScEaZWICj8QUa32qdG+R6GIOSUjlyq4=
X-Received: by 2002:a17:90b:4a05:b0:381:29f2:481b with SMTP id 98e67ed59e1d1-382808b20b5mr2050336a91.11.1783136726521;
        Fri, 03 Jul 2026 20:45:26 -0700 (PDT)
Received: from ubuntu (d50-98-148-232.bchsia.telus.net. [50.98.148.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-381271a1f49sm1802442a91.0.2026.07.03.20.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 20:45:26 -0700 (PDT)
From: Freeman Yuan <freemanyuan15@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Freeman Yuan <freemanyuan15@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix cmdThread CamelCase style warning
Date: Fri,  3 Jul 2026 20:41:52 -0700
Message-ID: <20260704034152.115006-1-freemanyuan15@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CamelCase variable structure member cmdThread to cmd_thread
inside drv_types.h and rtw_cmd.c to align with standard Linux kernel
coding style guidelines.
From: Freeman Yuan <freemanyuan15@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix cmdThread CamelCase style warning

Rename the CamelCase variable structure member cmdThread to cmd_thread
inside drv_types.h and rtw_cmd.c to align with standard Linux kernel
coding style guidelines.

Signed-off-by: Your Real Name <freemanyuan15@gmail.com>

---











--- a/drivers/staging/rtl8723bs/include/drv_types.h	2026-06-28 12:01:31.000000000 -0700
+++ b/drivers/staging/rtl8723bs/include/drv_types.h	2026-07-03 20:13:13.040001710 -0700
@@ -307,7 +307,7 @@
 	u8 init_adpt_in_progress;
 	u8 bHaltInProgress;
 
-	void *cmdThread;
+	void *cmd_thread;
 	void *evtThread;
 	void *xmitThread;
 	void *recvThread;
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c	2026-06-28 12:01:31.000000000 -0700
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c	2026-07-03 20:13:13.046001687 -0700
@@ -11,7 +11,7 @@
 #include <linux/delay.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
+	{GEN_CMD_CODE(read_macreg), NULL}, /*0*/
 	{GEN_CMD_CODE(_Write_MACREG), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
@@ -163,7 +163,7 @@
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
 	init_completion(&pcmdpriv->cmd_queue_comp);
-	init_completion(&pcmdpriv->terminate_cmdthread_comp);
+	init_completion(&pcmdpriv->terminate_cmd_thread_comp);
 
 	INIT_LIST_HEAD(&pcmdpriv->cmd_queue.queue);
 	spin_lock_init(&pcmdpriv->cmd_queue.lock);
@@ -363,12 +363,12 @@
 
 void rtw_stop_cmd_thread(struct adapter *adapter)
 {
-	if (adapter->cmdThread &&
+	if (adapter->cmd_thread &&
 	    atomic_read(&adapter->cmdpriv.cmdthd_running) &&
 		adapter->cmdpriv.stop_req == 0) {
 		adapter->cmdpriv.stop_req = 1;
 		complete(&adapter->cmdpriv.cmd_queue_comp);
-		wait_for_completion(&adapter->cmdpriv.terminate_cmdthread_comp);
+		wait_for_completion(&adapter->cmdpriv.terminate_cmd_thread_comp);
 	}
 }
 
@@ -389,7 +389,7 @@
 
 	pcmdpriv->stop_req = 0;
 	atomic_set(&pcmdpriv->cmdthd_running, true);
-	complete(&pcmdpriv->terminate_cmdthread_comp);
+	complete(&pcmdpriv->terminate_cmd_thread_comp);
 
 	while (1) {
 		if (wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp)) {
@@ -511,7 +511,7 @@
 		rtw_free_cmd_obj(pcmd);
 	} while (1);
 
-	complete(&pcmdpriv->terminate_cmdthread_comp);
+	complete(&pcmdpriv->terminate_cmd_thread_comp);
 	atomic_set(&pcmdpriv->cmdthd_running, false);
 
 	return 0;
