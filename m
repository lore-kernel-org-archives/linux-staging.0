Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAED41D90DD
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752688252; cv=none; b=Cizjj1Wmc1QWb6H3g/j7tQeGQ99TFlvtFpom42fPG7WHW0YfSl9tUi3PcBwOnabpbyZKIlo/pgsdoOqUWiBChEzzNzuqDBqfaYPKAkSLcoO73+NlFwhcj6FTypiCHa7OMSXZq/no/W87cqV4YgSComvwfC19uGrwMo9LNZo7hWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752688252; c=relaxed/simple;
	bh=D1sLRr/ziIoVxL/Two6OuRxuC3JzCZxoYfA9sPEBATM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N/SnqOjVuCbUXJcL+F29rXFoIs++aDpwnCVcGgkbvcgAyKDsu1CsBs20m46QaGwIvq2TusdfIup2IP/1u1BPUlHylcAwaRivd6PBSNxaVgGx5aexDhIZbzSIJD1IEDm6he5jJzJN43Kr4LR8fjOmccBynhSJbf/ymlhYacruxIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiBokvxt; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiBokvxt"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73ce2761272so75147a34.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 10:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752688250; x=1753293050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPAsOiCsmY0qVn+ia8FQT+VzmreCnG+TI62Nw+vLzS0=;
        b=HiBokvxtjwxlnMAG87D/kbhEviCETxkHxL2TSonht8WBepKryfWvvNGRrO+e/GNiG2
         mmnbicQFhwRrpyL0Qy7z+1O/m1/xW17LaJYmOyriJaYUM4bkJxNZ4WL/4VtFvP8FXLlB
         dnG9t0wKzwLK+E5UoPZiKj6HxAUimoupfsrMskn3gmxNCXzBCkTCdcschzrOdljcwbz8
         4CBWuVqdP+0wHPY1rvxouygEJCCrBxQ7m7XZGJwbrjWZFfZVYdlclJZwRHZ1TuFdIAKH
         MrF07jrPX6qJ9JaFSkEzv/hgjmVGiCjV1LYOH9DVzs/NIVT/fWb9vwUI0ofSzowjVOA1
         Y/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752688250; x=1753293050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPAsOiCsmY0qVn+ia8FQT+VzmreCnG+TI62Nw+vLzS0=;
        b=hAjttGlcy828v7UxwQS+7yzLGxWaEovFxa+EMhUUkU80r0uJoEMrl92UW7Enu7HFU3
         JPg8yuhP+kGGQwkfLTvfEhXGt8oh8E0zMpyXjfavWkO+9suv/8DFED9aM2dALZkaeEiu
         szs7SXI8B7Elde3+bLxrTUKTzFUBIafXLhS6FEQUsQOrYkY11Fw9fMrrbAEBxT8/Mc59
         X7jz3q3ZEsl2qu0lqMJP6SlB+eq2/nIVZEuPo6DcZH7llOMQMbsVk2h9XR5LTd36cwWL
         PxCVBSqnir9SSWn7H/TEMsej7cd2zXGmvKWVDULeoqAYEENMUxzt3+bEx/DsGv/WBLnR
         cN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNto0htFuw8q7+kooroUeqHoAc83ITZzmznKgmASj5nF/jM035rK0DHkEjHk5quxRIuL95U1LYDOl6jnWb@lists.linux.dev
X-Gm-Message-State: AOJu0YzjuHhH6OZRTsI6N49PQRT1Qr9iOWWSYw0os1NLglNVFQ4ltULu
	ArlG/feCT0mmr0Y0cwRrXBIQvQu/zdp2ChMiKJ7l6tdL4jXUOTH9rvcf
X-Gm-Gg: ASbGncsJ+84Ob5Hn/VEmOOoivw7cqwqDnWSgaS7dpKt8SFvW88JRxYYDFKJecaEoQRd
	nmFeN3P78zEYokoByWdr/BX8Uu+G8ek06+CN5GQRzFPpQ/lr57MMv+T9qFcWd791fIp76ijFNA3
	77DxiQ0zfQTT4aBBRQQrTYH9QoYytatxsa3C3IRMuT0NXdOK/jYOVrVHG6BH16G2j2EF2V0F5tm
	UMtaTbWg0cXUwSsiXkMiuf++xFHqrtQu0xBhIt0C6iZlrOIbGreBFl0WSxrbMGcJU3T3z4cnJAw
	0D7eCAr08CDD0inDgUq2K827mcY/SGanPVx/lr35WI/J6oMq59B0YFV1wuJzs72dJub2wI7CQVD
	tZhWcMecfjiyISlnx0hHCOXqY9J/3V4122nDL8zn6BtAIRZP+yNUf
X-Google-Smtp-Source: AGHT+IEywPzafpJBDBfR49SRS6ZIm8XM5u4PSyQ3lKMB6SERwus9VNJSzsqVXAnv2JynH/I8PvBEKw==
X-Received: by 2002:a05:6808:1993:b0:408:d05d:8915 with SMTP id 5614622812f47-41cefe0aeddmr3245280b6e.22.1752688249785;
        Wed, 16 Jul 2025 10:50:49 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-414197c52a6sm2874649b6e.19.2025.07.16.10.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:50:49 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v3 3/3] staging: rtl8723bs: remove unnecessary commented code
Date: Wed, 16 Jul 2025 13:50:44 -0400
Message-Id: <20250716175044.81439-3-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716175044.81439-1-ignacio.pena87@gmail.com>
References: <20250716175044.81439-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Remove commented out code that serves no purpose, as suggested
by Greg KH.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
Changes in v3:
- Added version changelog as requested by Greg's bot

Changes in v2:
- Split from larger patch that addressed multiple issues

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 437934dd2..abc789def 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1317,9 +1317,6 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	/* struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter); */
 	u8 res = _SUCCESS;
 
-	/* if (!pwrctrlpriv->bLeisurePs) */
-	/* 	return res; */
-
 	if (enqueue) {
 		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
 		if (!ph2c) {
-- 
2.39.5
