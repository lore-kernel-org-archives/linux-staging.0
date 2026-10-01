Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B1472531
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849032; cv=none; b=BJSIKB1YaMqdduhdB+gUtDwlXxy07ACFCdRSQPItPLCwmBfJBZscfjmNjaWetIUcTGk9iDKd/QiUsotX9URAFR+xgo68HOyOYjDR5XbGquPk+ELfEIXAfoOhFaB0YEeH67xs1wcwv7Hfk+Y0vf3hy7ebt1rhN1LeuHE/PPWcKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849032; c=relaxed/simple;
	bh=VaIpTDJD6b0O9LgfdThrs/rsgDOAu7oastbAMYStvxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iU0xSbh+hPczFWGsYkJhCXtUOFSH//deBJk3BpxvNpqBn6fc4lm4lg0sTzDR7GO6ZLEwjrBtPjr+Splo/8oDK6fQFWNPRbi6ysKHEQhPY8omEQQkVVeXoo6lk5sVMy56k7IRPWlg78QH/xQSMXq/M37rX+NRJNzxQ1sRcGXAuRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqlSk7rm; arc=none smtp.client-ip=74.125.229.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqlSk7rm"
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso1097971c88.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849030; x=1791453830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=84WGXPG5BWnhkDA0xLnGT3XuLYOG0uz1Te11KxmlCVA=;
        b=TqlSk7rm1acmCoCoJqOxzdqX5RfwVRJXSp+mBRfd+rdTeqnDHpiCUDsyjkJWyp29LJ
         O4ENcXvk6p8hS+Dm4POcTRJkiBj3Yvia4Wo2OKfdNYgk9OKt19dhaaX4V97YGHp+u0B4
         XQRQqA4+aXDypc5Vb8rYkiCclrjUf0XTaneUGEPQGLnb26LXeyucDFGtH52HvxNk2T/3
         lx8K6DhL15FWeb5KWjgodcujsSQCUhZJcugQF8FvoyV37AF00bt07KboLZT6lObHGLmI
         bHu2L8O5Rvg6kyE8v/r9x9lDSU0DiugFb2DzGSv/N460BkrqkrlzScE2KioFReoHyP34
         xSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849030; x=1791453830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84WGXPG5BWnhkDA0xLnGT3XuLYOG0uz1Te11KxmlCVA=;
        b=Wr2T2ws3b+iighwVBaV2A7Vc1i1pDNyuvViuUazS0sc+ZM8R2zUgoOq0L5TWJuFaNg
         9bbLFCoN1ge/cuvz6NECSfvp0mtc9JNwwnq9Hibv66WVvoU8vmHbaw0Y+hfxKoY0Po5F
         I/+p+KbP66ZhLfhalgdJ4ktgCyKSxA1k3H43hMcT746LQcvCidNB32iIU+Mw/rjdhpqQ
         6xGjngkMwfgWjSblbwEKXGvJV0MDFVMWukOYEvWFK4WJmi1SVnC+XlR99R5ZuTk9G42Z
         70cV5ySJjlIM20LOEMc+lPhRa+PG7gAcDBr4WcF4F0kVfgb0GrylHw+/vqdO7beTwi8n
         4O3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxneyUDjxR/RvKY4PIFPSmtsx3Ym6hXZ0pPVaLB84FxT84yKZTpqoxiVfjg51vg7Hn3DrrjkByFmIfcf4qd@lists.linux.dev
X-Gm-Message-State: AFuF++kAlB3viZxR/4hUlshOTQE1lIP2XF77fL780zkEyuxdmHZIk94W
	G3hwVmYcTXMf8n+FK/TOlWUVbdT1KMhkWPVFQOoUqmYr15x0pkcJr5i/
X-Gm-Gg: AYBFou3zUqSdccmL+DXRZHCUAAZ+Z8eYVlWyaFGZjhxn8sxvVfipoaD7YFlDTJt/Eno
	EiCBFp77OQjdyg4tMCQYQBCrQca8b4/Roidy967BJeBc5WamQunoe5zlYeNjYiRH7PuPQlLsji7
	S2KgM9Be5qCsDRn7B305X/XQTlMPH1yIKgzXVfK2bDmglvAbxmzy3vGE7LGNuMyndYJ+QdgfQZ+
	hZJz960kN8hB70wEXEjEEGTJ7xQ6UFCacZLWPv9FRCfi2vvDkKEJe9LZoJypn3RfxcP1D42jGjV
	CvLyBVobSpGamW0L3dnMWqVq0S3TXVGxk9wuCINoO87sdP8pm6TZWOT1WaUs1CXSxewYAD6uvpB
	YZ1cmefpRBLCD/LkYZa/ExX1j4I4Mzng9Nz3pc1ib/Ji8xjBlHeUlGwbg0/15fbk996jjf3Ahdm
	0+jnTzCJJqqUeSO3lJeX9qtPSdAst9TdDwho5Pn5PX7R/95/lmHVUNVnIrY1hAWWqmxgxHxwI61
	69y7qPL20vDhESbBmSgcBRjkKI=
X-Received: by 2002:a05:7022:424:b0:148:80d4:84ac with SMTP id a92af1059eb24-14d331aae41mr5590017c88.29.1790849029785;
        Thu, 01 Oct 2026 03:03:49 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df359f15asm5537305c88.4.2026.10.01.03.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:03:48 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use errno in rtw_register_tx_alive()
Date: Thu,  1 Oct 2026 10:03:19 +0000
Message-ID: <20261001100319.6228-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_register_tx_alive() uses the driver-specific _SUCCESS and _FAIL
values to report whether the transmit path can continue.

Use the usual kernel convention of returning 0 on success and -EAGAIN
when the transmit path cannot proceed yet. Update the caller
accordingly.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Use the standard 0/-errno return convention instead of bool, as
  suggested by Greg.
- Return -EAGAIN when the transmit path cannot proceed yet.

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 13 ++++++-------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c  |  3 +--
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..00d64b2ff89e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -771,13 +771,12 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
  * _SUCCESS	rtw_xmit_thread can write fifo/txcmd afterwards.
  * _FAIL		rtw_xmit_thread can not do anything.
  */
-s32 rtw_register_tx_alive(struct adapter *padapter)
+int rtw_register_tx_alive(struct adapter *padapter)
 {
-	s32 res;
+	int ret = 0;
 	struct pwrctrl_priv *pwrctrl;
 	u8 pslv;
 
-	res = _SUCCESS;
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
@@ -788,7 +787,7 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	if (pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
+				ret = -EAGAIN;
 			if (pwrctrl->rpwm < pslv)
 				rtw_set_rpwm(padapter, pslv);
 		}
@@ -796,11 +795,11 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 
 	mutex_unlock(&pwrctrl->lock);
 
-	if (res == _FAIL)
+	if (ret)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
-			res = _SUCCESS;
+			ret = 0;
 
-	return res;
+	return ret;
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..77e5adc8731e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -140,9 +140,8 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _SUCCESS;
 
 	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (ret)
 		return _SUCCESS;
-	}
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 49f19b6ee329..a14da6c18201 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -217,7 +217,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
 s32 rtw_register_task_alive(struct adapter *adapter, u32 task);
 void rtw_unregister_task_alive(struct adapter *adapter, u32 task);
-s32 rtw_register_tx_alive(struct adapter *padapter);
+int rtw_register_tx_alive(struct adapter *padapter);
 void rtw_unregister_tx_alive(struct adapter *padapter);
 s32 rtw_register_cmd_alive(struct adapter *padapter);
 void rtw_unregister_cmd_alive(struct adapter *padapter);
-- 
2.43.0

