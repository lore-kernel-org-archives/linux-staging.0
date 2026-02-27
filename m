Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F7F823DD
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182003; cv=none; b=iKUxEOGEQpA7fB4TTSnR25WezVk1L1M/3DfjXPQeRAh+XqBnP32xa1UAI0FK67VlXjDx5qxVzA4hE3IYwFOiwBgglbn37Ksh8qzvhBs2lIUgbVOHaW03lWjq431Yod0tHPvvevmFLOD7hr36DTnHQMh0OTLXc6zqqOM3CWu0wFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182003; c=relaxed/simple;
	bh=vDweqr6bHq5FG8/NjbTq1S7UXeYcC2vcY/+KrrbVy3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWA6z/xSbxeT61m7tSoQhM9l/ixIRt5LOmz+ZzjahOWzBMADJsP4VY4jXGY21mlzy6WfLG08DNP8aLGXPZ94YWPFGli8HKWrwhmDVjouK+LIoVt5bBOTsTVZyFF2vOi51NDspWRfs9QYEmhTXe9jLrwyGSKFs98GHOkmtL0cp/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7F0kg+3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7F0kg+3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4837634de51so7624365e9.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 00:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772182001; x=1772786801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPU3uB6dbPrKouGdyhXgRGkV1Ar9viyHSm55bb7onD4=;
        b=D7F0kg+3MNFxR7OmxD2ylc1Hh0fcTecseAMgvskYb5BXg07ZpTaQhY0tLKR4aPtDiv
         QICevzOtPRo7LDF+2wtM+9PGVkI0Us2D6HHm2PKS851qYZa7Fpw3LMrGkuyIdeNh2aEl
         JneyV5E3Di2r4kx4O2ZOuJ2cRs+nkG4mONcPJfeJokvd6zFHsjAnGBKCHyHmmelMaWGU
         EviJuRqqBfmPBnUH+bz9SeNeOeaCqggYXmSUDpo34On8XlZ6GR5rUaqr9ZFdduaZLdlK
         /QSbxdH02/MByxtTtXNhJIEAwFcyZbHioJStQVb56pnr74hNjOHA6vhmw4uSW2+OwA6U
         RsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182001; x=1772786801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EPU3uB6dbPrKouGdyhXgRGkV1Ar9viyHSm55bb7onD4=;
        b=RDosxZF/+qToXhpxfyAI+8rP3P60upjL19hcDtYZOPB9h9NmyLQ+u10wbSqRVRAK8S
         IvR19QbFCSXbuqDgjCPzEn7tyYxdLLzm8UX6Kp1vTWv1iAkfgldZCODOxYMCsf7gPI/D
         EPWEq0VXOHM8bQcULBr511118r2SBuKsO6Ob3WOaM1VU+OqWfSKU9HLNcQsHBiejp79C
         QetqAzUlLMUTQaDHTMyUVfSumjuXPdVeJJXn//1qGwAPCiMVaumBcGDzQFwSAZK/tXCn
         NjZEYj6JeqSkUuUFvUQyd3XVAdOLQ0waUQ34Tw6pVaBN0nf7PiTkan3bSplwGoXXCHi+
         R6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCV1WsAkBdyJiltsOWUHzPc2tFwPXrhnkGlOQhPqIq7qNkweEJHd5+/JMH5TKzhNvN3KBgrpmNa9SvgcMTgx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+9cyzksUrhx6M5igiuptZ4H2A2D4kXun4nb3sWQeeFoZdePff
	8qVuewxxseU9ROw9BcbhmOyNvMhjlOrKATQY/dt7c7pTgjRlqlxLJRh8
X-Gm-Gg: ATEYQzyjsm4+B1IwUyDnTUvjvi7wL9rDnz2iwSdEgepX0Op3uuI7zx6wChE+Y3W8b1o
	l4rGGbYOIH2s7XlyvUM2lH/BNiuZp6XK5DjqG/z19nGDU3DHGl97ZHU6CpjseDuGUKN40M6E/2b
	RBqmB7so2YflBRZ9mOfIjzZeBI2N53QdalrjoU/15rqRS1FsUpldRYKCTnFSArx5B2rd7DUKwkk
	Z+a4DmILZjklt4zwH1ml/RqKACdC0T8az05sFHwwCA9a6eeoUpON+5TlMHkZ31GV4dyl9rCu/7Y
	8FglgktkB06TcBIuyeMLESvhcDlaQ5553ZJUhFm0FhhTQbDOlxQy+dDx0DZ0ijVIzM66OdX78qs
	Ye10ZSxVI4hQFmXo83+VU7nnqOtZNeW/9l2h6GSzxgk6FXNcaqi/ntEfBg/xGHheH/MTKTS+NQA
	8C9SoG00/XtQ9/X3Ux+qwAHXJtRVCiR/g4qeDHN7w=
X-Received: by 2002:a05:600c:3b18:b0:483:7631:befa with SMTP id 5b1f17b1804b1-483c9bc55d6mr25930765e9.5.1772182000415;
        Fri, 27 Feb 2026 00:46:40 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm92441485e9.15.2026.02.27.00.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:46:39 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: replace msleep() with fsleep() in rtw_cmd.c
Date: Fri, 27 Feb 2026 09:46:12 +0100
Message-ID: <20260227084623.209913-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226010536.179729-1-azpijr@gmail.com>
References: <20260226010536.179729-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep() with fsleep() in rtw_cmd.c to improve delay
precision and follow modern kernel practices.

Specifically, this fixes a checkpatch warning for the 10ms delay
in _rtw_free_evt_priv() and updates the 100ms polling loops in
rtw_chk_hi_queue_hdl() and rtw_free_cmd_priv() for consistency.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v2: changed to USEC_PER_MSEC instead of magic numbers
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..c689d3744ad4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -8,6 +8,7 @@
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 #include <linux/align.h>
+#include <linux/delay.h>

 static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
@@ -214,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		fsleep(10 * USEC_PER_MSEC);

 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
@@ -1495,7 +1496,7 @@ static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 	rtw_hal_get_hwreg(padapter, HW_VAR_CHK_HI_QUEUE_EMPTY, &empty);

 	while (!empty && jiffies_to_msecs(jiffies - start) < g_wait_hiq_empty) {
-		msleep(100);
+		fsleep(100 * USEC_PER_MSEC);
 		rtw_hal_get_hwreg(padapter, HW_VAR_CHK_HI_QUEUE_EMPTY, &empty);
 	}

--
2.53.0

