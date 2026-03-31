Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BFA230BDB
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 04:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774932377; cv=none; b=lGLqwOmGtFUb7iQZpWtugdKX/ZfqfiL9C6iU2tqqLAJRy2SXiRudwRAhd1fU3NQwr/wZUsJm4XGHrJyrDSiXNMTM59KSbvTSrm2YEuD0LUX6vpHQQVBQ8Bl0n1Kuo0+h/kZoRlXMT9iwTL1+9Mw8Qvjs2qpJTq/HzfGuFbUWurc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774932377; c=relaxed/simple;
	bh=D0CWpgdCF1w82idFtEe2PNJBaxyQXvgxuuV8QkYnCag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hp2lmscwyS77pDAEWOUrAYtfJunvQxHq48GlMkhspGSYvuLoNy2kDn9kyy1p9qq3XbYTJvFWqgRTym+JbBSNIY6ZZ0hx2xhfUMEqIEH5iaHJOZeMJMhnpvHORUNLLThUXh0vCCRxYOJc6mUgc5Jvr/wnv+sy88d1OMnLr515TLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSD81/5D; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSD81/5D"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50b29c4e554so65239591cf.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 21:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774932375; x=1775537175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDZ2SSzxkszFiKZpcVuW8LkHWn87iMpO7Smeyi9xxEs=;
        b=sSD81/5Dz0u0eCJs53HFj7p7mVGusDTriwoRTzZKF5usDAtwoxhf8Ai5NWT02nR9Fw
         K69IZpj17vZvgjZWunfy6BNkRbB8pEKJeBmnNk4Lq3Kn7fSW9STxFjlApKrv3+yrH+kO
         AoMP5Io/92AWIyoA8QyKRjhsnSqhmRaYoeeruLJTkTHL2LIF/hpzFH/FixSZthNceQxX
         Ffd+mw+PkxNSzf06DlU0HZWArG4EEFgM2aNoW6X7ketPFPhWbwhukK35RavN78Rr798M
         +CyKqkAcl5laPvFPNhTmHhaHUKGaBVGty7Ks/jGGi/efK6Qiagb2HzDHWmjJJUwfDWT+
         E6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774932375; x=1775537175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDZ2SSzxkszFiKZpcVuW8LkHWn87iMpO7Smeyi9xxEs=;
        b=j3QFdwKJBRRc+CEpo2udRtf3lCz5XgbxI9D/1CDdV+Fji51Ekf+UgcKDL2ojJAzBFO
         Ud/5E26XE8tJgctmT68ZCXlv2RYlxu/31DZpIwzXeFi46QEfzE3At76NsqWivZiiRvOi
         FSIOqb03g2VSsiJTPW0XTIG4ZOoDS6FmFyNztSQ53pKTSKyZwVXn3K1GmAqcN/dEDqCn
         LG4ZfSKPT2GB0G602AuZHpgrcOJhxPRha6j0vxI0Gw264r0+3KCcahbJTiFiVJNS3oyq
         25uD7sq+VE1yJGRAUJKC5Ov1qRb9ChfgaLp/RzlT4K7950Gc6xULlRzy+BBo+euJGlwl
         X1ng==
X-Forwarded-Encrypted: i=1; AJvYcCW8YwrJ45r1qDGeGFP1uzTbWtsIkMTvIrgP/bKN3ICUx+Zi6J4hOzSVXoMW1PET7ZxmCvgjMc9rBb/N+kW9@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+fT6QPZISH0k/7q2BlVCWZGJhUzsF1sotMiI0uhSqDkXrs/06
	2oosQoObnzZjktX4KcNR9SW55pgXNeOJp2fbi9QLAIAeASc6u01BCcSVpSP290rScqA=
X-Gm-Gg: ATEYQzzfzG+q+hzqf54QKT7qYKhTvF5uRH1gg92u3WKKfMYPw+8qAHLKJotGWKNzqg5
	syXYfPjlSulIH2jICpTGvfCVsWqTMrNgDBPqNe4OUNix6mg2On1MKTxfjC5HHNS6yYFxxj8rG3C
	Zf3J5UBVo4kAc3wCXf0rQQqEbILIz+kwUrxD8bkaRxJ8KzXxVenTNqwNUB/eeoztHvKxpnVBavc
	P1SdhwiidtUbQJ6bIlc3PaR5D+cT+1qlQJbi6uhtyW6e6gpKY/6hdbrMrABjed6z4sWNP0EJiYB
	hkoPByycgyIhQulwCPez+vnGE9M2yIrOxopJxcviMX1jZAjWVTjDrc3naeC7UpkOQhqNPaDvJeg
	VJN7AVTe3VJhKJb6UeQ3eDTVvY0fA/+hN2rXm7WNvhBTHr3b7mfwtXYFls+h9st2w0SdazCWIyy
	oAezGzDaK8lCwpcYeWKrvuzGbBA03/BsVjhIGV
X-Received: by 2002:a05:622a:6690:b0:50b:bb59:5ff4 with SMTP id d75a77b69052e-50bbb5985f1mr82064161cf.67.1774931997038;
        Mon, 30 Mar 2026 21:39:57 -0700 (PDT)
Received: from m2 ([2601:5c2:100:2f60:64a3:4494:e5c6:133e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c96a5asm77746291cf.10.2026.03.30.21.39.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Mar 2026 21:39:56 -0700 (PDT)
From: Xiyuan Guo <tommyguo039@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	b9788213@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiyuan Guo <tommyguo039@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix CamelCase warning for READ_MACREG
Date: Tue, 31 Mar 2026 00:39:54 -0400
Message-ID: <20260331043954.5400-1-tommyguo039@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the _Read_MACREG macro to READ_MACREG to resolve the checkpatch.pl
"Avoid CamelCase" warning. This aligns the macro naming with the kernel
coding style guidelines.

Signed-off-by: Xiyuan Guo <tommyguo039@gmail.com>
---
Changes in v3:
  - Dropped unrelated whitespace modifications caught by maintainers.
  - Rebased onto staging-next.

 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..eb902c810ac8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -11,7 +11,7 @@
 #include <linux/delay.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
+	{GEN_CMD_CODE(READ_MACREG), NULL}, /*0*/
 	{GEN_CMD_CODE(_Write_MACREG), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index c4c3edee809d..d204426799ef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -630,7 +630,7 @@ struct _cmd_callback {
 };
 
 enum {
-	GEN_CMD_CODE(_Read_MACREG),	/*0*/
+	GEN_CMD_CODE(READ_MACREG),	/*0*/
 	GEN_CMD_CODE(_Write_MACREG),
 	GEN_CMD_CODE(_Read_BBREG),
 	GEN_CMD_CODE(_Write_BBREG),
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 95769f90d196..d14cabd5e47c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -679,7 +679,7 @@ void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf);
 void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf);
 
 enum {
-	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
+	GEN_EVT_CODE(READ_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
 	GEN_EVT_CODE(_Read_EEPROM),
-- 
2.53.0

