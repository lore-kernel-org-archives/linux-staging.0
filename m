Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4B3248F57
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786286580; cv=none; b=V+lSULcDZmtw3tgr8C+FfwEL/lfzflLWTIfJEYIMhIqp8cL23M6+8NXptNYKwFXtrJRkpL0k4UiA5ybDwFa3qpmsf9TFbOQLD1Bi59iigu43HM0yRsXzyQSeFp1l94SoZYa6tr+53zSpYhtCID2IU8bSCGSw6ayMN9FNGbXP0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786286580; c=relaxed/simple;
	bh=CPismQ6W/2Td3+rlZczmV4XtD9YBcQ/jJOc3GQfmDn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F3HnxjWdMBApOIgJkKPW3vIhdVsoto2qxgiG+nGK0VhGYhNFhMGWSwfmz82bijL/YGkmJ9erifPFMTqLz94UV1nmUw1sXZfNnQrzmJg5KJXMzdGbuXIsV9anMyh9lL+RDd829L9T8lvWErT9uNti7HsHIKwJjnTRTUDfc0PQFQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCjz8/yX; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCjz8/yX"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so918066a12.3
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786286579; x=1786891379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhWTJz8/CoNHNZrcdEvoXJkFmlP3oF8DKLLwmhCVIes=;
        b=BCjz8/yX+N05kE9XZ/KCh/mbPloB4Woco+4xF2vu3R9iYgXbAfqKgXmwpS2FkKU080
         gfySiLYUjpQYiswJLD2Kjo7hC5mfeIeVCcwUahoVepkTg0yXI+k6IL05SWR73uNd1g+J
         4EnCendeac4S3KcemovUyX8hT8C+1r0vqhWL1i6iHghnDToqpa27KjnqFCrRcPqo5GMy
         PjAWNPY8XO+H2n/mnmdTr65Urg0N9WwV7dKOzVduhbAkxjI/BRFb3zk+2E2IUzVLB8Xg
         MFAzg7aqI0It24UT2nFzgWCpr1QW/JAz7DVASOf9aVI07ciN+xAE3zUCt8OUWc6o9+bs
         I0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786286579; x=1786891379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhWTJz8/CoNHNZrcdEvoXJkFmlP3oF8DKLLwmhCVIes=;
        b=hOxuvb+z48utzlhu1zXoTiLXnHf2LoOvp6sYKNfXmJbuajZwjTF7vBTfl7MzXuaG7F
         gNgsQym2h8dcrvafB9me/3iWoYsBEnxReiGxKLWJf7ZumUP3ohIU8bQ3s9gzpf5VEdx9
         Z8zgY4SIBmwrvV2LJMLH61bqZGJNzGNweZZ3bu1qDEu7ihYAJbUpbq7ZESc8xHENlUw3
         7pNzXreWJtcJDL3aHCezN6UEd0I2/z3JI6qViGr3IScI377qCOakvBC3VOmfin2jBQx+
         ieyHouO6ddteOPIdxlwIf5JGIQirHMCfwwNd4UQCxAr8qBUkDWBcgXkgrBwDQ0Q5Ppdf
         +64Q==
X-Gm-Message-State: AOJu0YxIJBRtgmbiW+3TO/Dydm6vTMKGBpFJX5wwZi75/ivm1B5hVG8y
	f4Sh9w4S0Q5AaGcRrtSpBlPa4YOdZdKmntBnSzTpVeHrvP0iBT1DlNE2
X-Gm-Gg: AR+sD13NKytfIRtPTzTBQU2Yu92kknbfQmvDrhttj1Lx8OGpcq4lc43ERFOZVhYpouE
	/rL/lU6tDxD7bBh4kt2vAlfsXWkX4ZNWgTytSH4zM6rWhbquo4poEUueat6RCgqcwRPgaG3GMRV
	Ee6kNKwuzY56LRyny4jGPFjYioQ+A7+TNJNV1mO7HppskyG0h27fQiS9M9y15SKGoWdLukzYfty
	JeMALPg89hitcAFy2qY9Q8Ngm7hRtdIyLMNG910MBh5gPsad31gIoR1w0zWbp855vl8BDrfhPyc
	G57On4w541s+1CAoDPIwUobqJkDFVdrC9vo4bx/dF6bvcuGC/aiSBYXyhLtjiFyB9f6C/uQFQRh
	hvmB0Ba+bDa0jr7AZyMZsPmEP7wSEV7ESpN7I417AecHMnQDO0BWMG63AZnWP68XBwgHBiJmKfg
	kUneE3pgKJBpuiqaMNLYCAPI1ADB5vh+J5ustHueO/T2fFhgel1tPMg+Yfos3Xuw==
X-Received: by 2002:a05:6a21:6daa:b0:3c3:bbe6:95c7 with SMTP id adf61e73a8af0-3cbc03b5676mr13772539637.17.1786286578597;
        Sun, 09 Aug 2026 07:42:58 -0700 (PDT)
Received: from localhost ([103.210.95.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019a0528sm27676143c88.1.2026.08.09.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:42:58 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_set_oper_ch()
Date: Sun,  9 Aug 2026 20:12:36 +0530
Message-ID: <20260809144236.127828-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary curly braces around single statement if block,
as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index c614c0b4c792..d900b946908e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
-	if (dvobj->oper_channel != ch) {
+	if (dvobj->oper_channel != ch)
 		dvobj->on_oper_ch_time = jiffies;
-	}
 
 	dvobj->oper_channel = ch;
 }
-- 
2.55.0

