Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671804;
	b=zkAkljJll6fXbaDux4uoxBuQXM4FTRtVo4ibTr1xyf6mDwYbbpz9EfYrnFeXWHbtdq+E
	 AhpYLPFGU7XHP1eilUaMjKpYEGqgwzx7sTEUgCtbFvtNX3FGjMLnoNsK7yJvbBtkQAKwR
	 QeEHnJz7CAn55fTkeuNhuddNkqagmtOMgj7SFEUn5/60HQXxPWEL8pj4u/l1cRylsr840
	 9q9OuJUG42YplyTcQSDvhNtv8KXmTMgRBFYbrQXbBkmtmR2QrNnOidtWacOVbl6S6ZLAo
	 fN7MiM14yXdYm+m3DzEAwYwg0CQ0W+SbLiy0ui3PFtHdqjW7z7MuLDD0gAIJaRYJwQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fJgprVGDWF0poiYwsa71a9OD44gaDa4G8wp7yZTVF1U=;
	b=sA1BGtpG8MQg1hC47tzlH9FFN08ACHEwHVr4za5eIaalDmVlTvsA656ZIvrewjR5c+xy
	 BK4C+6UrJRNGGwzBHNfmbCp8fG4nukCEyZVNoAEYH1O4ukNzgx6O24JuoHKWZwwrDgTDo
	 lyK37IibLcSfC+ZZIE40XQJTMZnV68aMarGRKEXACG+aoxvfWKWnDcnAStEDSvDeOXYex
	 8ctS4l5+9Ne323jn8gnVcdgWYLguRaQRoN99vh0d5LGokFHew5gLWFl3/SpJbqZNM4raz
	 2XMmII97BK+/CCY/Pq3JsoGeGs8Z8jvHi8RK/AB3USOl0qlAnvvzX4bvwurD5T5HTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eA++yMj5;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7748F606A31B
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 12:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7748F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eA++yMj5
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1153920f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792671803; x=1793276603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJgprVGDWF0poiYwsa71a9OD44gaDa4G8wp7yZTVF1U=;
        b=eA++yMj57x73qRVdm+7q1BWij6Qpq8ldBWGAe4Z0BxeC7ZLcsMVxjkgiRqTf2QxSxR
         moOPUYH3R7uTYWGde8aZHw+M7dpjv36zfhWomLY/IacY4YszHvrLawJyDtqc6u7HKOuj
         yAdYMCTXt0uLEa7IUmqpoQt1Gl7mAFIDJM1kvQa4eOzA8VVUXCyc4KMc0wYbc41Pn1Mh
         yFt8jE7WFxa55wWN6nD7Q0U4co5QTcRCJkjr9/YB5GgxzMmmjSbu5EBvMu6Wr3+ROZuF
         18llTE7GzKGUyMEkb/r3ArSLyhhIHO8igd3wG38VUWT0Vtc5qxJcOri9s8OVMMPeIyhr
         r0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671803; x=1793276603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJgprVGDWF0poiYwsa71a9OD44gaDa4G8wp7yZTVF1U=;
        b=PEKla0WDkSQVf7zz7T0MonMZ27q2RY1APbO/I7Y8G97OK0ty/rXDcFB4ln1P8OnqaG
         MaExlrMQ7HIqb80BvYuUCU6Ranf7dFzdLYDHq4WC1hXXhXDd8+wwl+SvT4FCtNhGFvqY
         kqRTt10ttNVCngCmSFZ7pakEQ2Wa1vvT4kT3MvPod5pQv9xfw6SXu1oJm2WeGV2sR+4w
         wxd22vMjggkP57Q+4f6StD0LWf3j/wpTUMsRnLOz4KP8Hwqj5Axw7ZLpCkLen3D3DNzk
         Ig7RIXnPhWPihnvzTPkuPULqfrDGjABElGHHl+hSJf+KLtb9T6reKaMAXnVHnBQZC3L8
         mUMA==
X-Gm-Message-State: AFq9FYIJobEfbrfEOZoKWgCwOZmTZ3lrbTq20z7eEIv9RT//RnDefUQ/
	u9uH1eTj1yJRaJhU+ZPQi+NG9q+YLTEi3WIggbmELw8b1oPBuEhVT7sK
X-Gm-Gg: AYBFou2UjCavte3pmw2I2nS6xfb697lgxtSbFUL/lO5Jktlt9sDkHUbKUkjpx6K9mqn
	M+9FTIlOWnf5iXCBPTti37n93p5oAgOCrGgi7csrmihnihaiKFXZfXFVlCYVmpD5m0+q/nesvuP
	VklBbaq9HN2F/HedOPMlrkBnnbZhCCdbDhpGExu6AeCU8fFvmEJfgrrRh/Vflkhw9gorehMSo0P
	IXfzL+h5bY/4UaVG/wtolKSJ8cMQE3pENT9xg4ScePD0gBlxFXyDgcQ3jFwF9ajcSIWkbFLda5O
	Yu7nVruFwlaAU9emAcZtwkT9UCmTAV9xX8XneWOUkI/uI8fkkpMKjyaT7Bf8a49OIDnVsSvU+sT
	Kh4769ryPAcmDmej4ZxVfjnRNF9ohMSct/mM4h2xrN6h+OgHt8Xh1cQxFITr1Eb50PGhnDlbdHQ
	GbY1/vmXvtK7cKELhWoev1FKQHX3rQHY1HJQ74X1WghInVYNY0CApsNQvOebK+xahtSxGsUm9l/
	EHlfEeezTwn5WantEAmhdE6XQTWJOdA4CNnOjFOCpOv3m3/uEk6XxDFbkuA
X-Received: by 2002:a5d:6a4d:0:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48e264f2c50mr8284125f8f.57.1792671802341;
        Thu, 22 Oct 2026 05:23:22 -0700 (PDT)
Received: from localhost ([147.161.188.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254ef1casm9458499f8f.7.2026.10.22.05.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:23:22 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename rtw_setstaKey_cmdrsp_callback()
Date: Thu, 22 Oct 2026 14:22:34 +0200
Message-ID: <20261022122234.443631-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames rtw_setstaKey_cmdrsp_callback to rtw_setstakey_cmdrsp_callback
in order to conform to kernel code style.

Found using checkpatch.pl

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c    | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_cmd.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 9fc62cb1ae01..81aef5ffe685 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -34,7 +34,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
 	{SET_AUTH_CMD, NULL},
 
 	{SET_KEY_CMD, NULL},	/*20*/
-	{SET_STA_KEY_CMD, &rtw_setstaKey_cmdrsp_callback},
+	{SET_STA_KEY_CMD, &rtw_setstakey_cmdrsp_callback},
 	{SET_ASSOC_STA_CMD, &rtw_setassocsta_cmdrsp_callback},
 	{DEL_ASSOC_STA_CMD, NULL},
 	{SET_STA_PWR_STATE_CMD, NULL},
@@ -1876,7 +1876,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	rtw_free_cmd_obj(pcmd);
 }
 
-void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
+void rtw_setstakey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp *)(pcmd->rsp);
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 75a774f8c4f3..9b801a61b69b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -593,7 +593,7 @@ void rtw_joinbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
 void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
 void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
 
-void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
+void rtw_setstakey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
 void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
 void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
 
-- 
2.56.0

