Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5552137923
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 06:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491635; cv=none; b=RS/yokojk0KZj4dFO98VmOzc7UFMyTnYCPv99iJl7VQv2h91zJJTuZhsMjV5ALuOY37xuYeAF1sGk6RYGEzPnKeBA4axhmY1DUPpf1OVmjbeZdQ9iL8OUUyEOkixEaxQPzBXqdstuZx8sNRunol/kRvG7H3gyLjhsR8CxaOx++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491635; c=relaxed/simple;
	bh=zZUky4Ti5K5b2I/qYxTuyBNkejcUG9ciqS41NGWsXyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uppgE/iUejXH7hhVrViGmE4RTuHm5gJbf74PLbxy0gAM4tnhUoWpcd3S7hlXxYno1hRlXwn3Ws9e3TXgfbSy0tZaYMBMmGqSPgAZq8HbdKIPo3D87LIMpzkC1w1zRV/dBgEc4jlZ8VcXYIEN6ExNPLtdgPz0q5AJiJUndYI36+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqhBYPET; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqhBYPET"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so214153a12.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 23:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783491634; x=1784096434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrPN1YlmcOQDFtv6Z8Zs8QVwWt20pN0jNfxZqZuHP9s=;
        b=TqhBYPET2zAymFk8M0qksgZk4y8rLL9AkePeyHVZJv8BU5DmBdM32TMnB+t2BKkhPN
         1Ia4bqSxePvoZf6e4PIhZAJ7GT1RPKconBt6C8TirTbwUBy55YmTojakwK1hUuukfreF
         TAsouHgnwWRSqP83iWqHJ/iGuJy4mqqrdd+XXFL+TaT591IWJHo5tITEROF+49iZXPIB
         98sE6BgWki410rjfnhHtVW0t/A/P2hREr7CTAI3gmdRbOn8R6Hp7lJPvMiW7oc3pqxfJ
         Eby55lG5j7G8+Mfvp8/ovv0/6dBGRIvgJjJ4mhMlCZzb6EbXSbj6i3JjsMEC1x7Xpoiv
         Tz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491634; x=1784096434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SrPN1YlmcOQDFtv6Z8Zs8QVwWt20pN0jNfxZqZuHP9s=;
        b=RQn5qn9dZvJ9i51L8OxcpfuRpfR5yI2+/6ADXyFCOW54I/wpJHBPZFV6DbsvYGEyTe
         PoUZfxlir3EBxb9dxZ95cmGJXD4cEb5iRdsW7NSVV8Vc/aYo5SFLOtZEjq0A89TbaTh7
         iAuPZMHe6ufWDtrhIMRpWrtLjYWtbFDxeP/gWxMD1w9W9bx1csvS85DA1p+aLyTOye58
         msugohDeb/K09Yh1IF3W8Or/Qtl5iMUUVu9FIAqFyihgZTzp7OGcuRC36VGtQvlfaW9p
         Geup49x8cvVMZIU6WmAJQIFWSPAFwxGSXQ2Vc3J9Q5OWe28+DKmUbmF/1EK87a6kRSOD
         RHiQ==
X-Gm-Message-State: AOJu0YxidnbOkjP1641KhiG53QsYQXT/l1SaFRuvAJYKJNWW1GGtCiG9
	IFyM3mYynG2GpOxuzBFtTlf6NcMGdTph6Hkh4LPckAO3uoqSVUQugdUCkSsUwa1U8Gc=
X-Gm-Gg: AfdE7ckCH+qGduXnYv9H6uoQZWYmFabMwSehRLsTXXXXczTzVD398VAMPrDnGtY2gpR
	bTjIqVeFP/c8Z91QxcbmYKMDCGzmTRCjtzp2hQOHe5VWaGZsbtl9BZxYMFBCDHMvSd0Nz+WigEn
	EZZmidDPJ8eNalabfwsFpy7tuCPLCXqyP76ms239gKw/JUFw9JFoh7KG4/xr6LzN4DWINUOu0nQ
	Rz0E3Y8/amOS3ub+EmXP6ZFVwXnbIiRUCjllZJpdQmuxajmAUHKZYlz8r1u8oh8b3lxwFTJDCuL
	fqFMhscs8UvJ+J6lNm1JfQK/H6pn1LrokhsNCD75s0bGK8g4OdlkiRi1FFXxQo25F0+WmOa3F4h
	3iPGMJCqAb0SB+VBLdRIph0NOyaq8AbzmIJFU2yeVt1U8iaZSTPcOsyhKGeQ7SafOHTlt+maU6X
	Mv1z6roeqwB2QtIsNDl+a/3YkWK83mtMjd1fqL5Cxg+/6Xr8wPPRQc86kXaSRqDP8yU7ayzYU9u
	TYBkATxAtIshL+qjArO4rPqJEF8nurnK3qiiZo=
X-Received: by 2002:a05:6a21:4e02:b0:3c0:9c1a:8941 with SMTP id adf61e73a8af0-3c0bcd20057mr1214329637.73.1783491634026;
        Tue, 07 Jul 2026 23:20:34 -0700 (PDT)
Received: from ip-172-31-35-55.ap-south-1.compute.internal (ec2-13-232-101-197.ap-south-1.compute.amazonaws.com. [13.232.101.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6596681fsm18075489c88.8.2026.07.07.23.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:20:33 -0700 (PDT)
From: Anirban Bose <boses156@gmail.com>
To: gregkh@linux-foundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anirban Bose <boses156@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: rename camelcase variable bAllow
Date: Wed,  8 Jul 2026 06:19:04 +0000
Message-ID: <20260708061904.4136-1-boses156@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260524142309.88007-1-boses156@gmail.com>
References: <20260524142309.88007-1-boses156@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local variable 'bAllow' to 'allow' in
rtw_cmd_filter() to fix a checkpatch CamelCase warning.

Signed-off-by: Anirban Bose <boses156@gmail.com>
---
v2:
  - Changed the variable type to bool (as requested)
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index aa9ad4d05e36..623ce064d395 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -296,12 +296,12 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
-	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
+	bool allow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
 
 	if (cmd_obj->cmdcode == SET_CHANNEL_PLAN_CMD)
-		bAllow = true;
+		allow = true;
 
-	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
+	if ((!pcmdpriv->padapter->hw_init_completed && !allow) ||
 	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
 		return _FAIL;
 
-- 
2.53.0

