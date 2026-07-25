Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0632DC79A
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987888; cv=none; b=HvETMicc7hk3cGatgHJqgmch6IdtrH2Rm+ldOiLRjEYS2e03QMcwB1LqLnOa1tI33GjhLNt7Aqs1U/LjuBEJwHXGpBDNjyaBhJwspk2cI6APdiJkOJUr4DTmY0lXpUMLuYsBLHnF2LnxuiP5zDcRU3MzTK2upeTRg7FrN/wjllI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987888; c=relaxed/simple;
	bh=h4lE8npdOro19BXjq/VqeakmnSd9H7oO6FyEJKcj+u8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tiCVHlqAjPfwiPZwvTMXyyW1RDbYvN+A+HXU+BygkO2j8YI/gSCxTTgSdjiBioUnHC1c8uz2b332TZsnH5fOggZz+k6uWdS4eVMlWq4jNjnLLapf6O7uKOEPjQYW1odFEIjxo/uIUUXP988EI6vrwwEMP12eFFWqOodxVUrMFW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLiSUJRM; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLiSUJRM"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a3166398so1153881e87.3
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784987885; x=1785592685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eT8DTYTGh16LqAX+4rfwM3Ar+YqRfWotV14StUD0/VM=;
        b=cLiSUJRMofYioSR5097bDHi+HoycEEbKuL50SfwvEgRiFvLZrLQSNYAvOs2ZDMv9EQ
         4A78uAxyT4AwB3Iq+PVI4iRFIMiUoRqR5oVYA+QQXWu3XvgyTNJoRnYgbDso1/Fn0XUY
         Nyvk6cDbccrOYCQDUgVN0bLS5oPxHpn3F/R5m/2s5K9BovOHTLW/+acex9Z64IwkynXZ
         XD2esfwFBXgxD2I9oG/wN7uRc+hZ3K4Mn/NSOwP8SSroXaLJcgCiRmN8wwIIIAkPoots
         dVB5bobu7ilHnPo7CCLdE9N73XMVOrg94e/FzIfxYziQ/zFKYsvql3OQ31Mxex74K1T9
         umqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784987885; x=1785592685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eT8DTYTGh16LqAX+4rfwM3Ar+YqRfWotV14StUD0/VM=;
        b=qCZ7GBZesyL820c5TaxbpF9dzWfmLAIsw406zupIfEMU/leQTSs0fbSn/zrIt/hto3
         xySoXTIwh6kfkZeh2XEaOL2ClxhUhGkGeLJQ2iAC0A0N4blRi0gV/turwyCagLxqudrZ
         bIXYkBeD1pUtbokejCqvqOEiq/UIZOZu86balkBPJrUWvAhaB1HJLvKomzOQww6Fs8Tl
         YpkMnJjt+LTnmTkKHKpaMfVIHDTobRT6BA/OvsluskDJAW1KQGd00WRXJYjMl6hV8E4s
         xzBsFj3kEem/ulhC2CSZBZlaADR0quJwVRGo1AeL9crObPcbqpi2Y5bJ7OjI6ftc0gcN
         FsOw==
X-Gm-Message-State: AOJu0YzWc7gEtWA+yvAOhwL1THocPdj3sNcJnUs6VAD0AVxXQ5yN6CDh
	SISwG9rqHNRuZRq9uS2cNOOpTaGNitbLNLnCSHqfbDHll2CWti3mVlpEnWPNmpjRxxg=
X-Gm-Gg: AR+sD12crbh4DOIYdVSMqTCk7rWFay+85G9r1aQ7X+JN1f93x45DKcpfqM7XE1tDzLI
	GK4pVKllbuMceHHnHkP66r/LJ/0B1NMc5c6O9Geydb64p5gcFTxnC2QgcMWRM6GATmybkSXJEhS
	bPNHGFPC2U4TSDy3snupSj9SJ+6WWETecLdeF6oEWhgEmpTWuvoBMIE8vhwYxiOEO9AbLZKk+LY
	Dwuqvr+fw9mh0Fu9u6n08uk0Jos4wvqh7LnAwHlfN7RbBD+sf/dbc+DjBtrSKkfIUnSaJIqTEny
	Ro+i0NZqcnVSiLeIrzF06Ac2daLTjdB2nFJiEBD6Z2OzMJhuvVqclTFBmxh4V+TYLlCMS3T5Xxf
	GCW8FXjVLaM35BxwlxDSQnvZMpkRgLAxMMN1lNQ8zgyFI4RpX/qaYoF4FbeALE5oSpsFX5IoiHK
	uSoOQ3fXAIp26xT1M+jjEZUIMBzRU=
X-Received: by 2002:a05:6512:3e07:b0:5b1:5457:a930 with SMTP id 2adb3069b0e04-5b2c1b08d38mr441356e87.16.1784987884465;
        Sat, 25 Jul 2026 06:58:04 -0700 (PDT)
Received: from localhost.localdomain ([78.156.235.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be0777e2sm466897e87.4.2026.07.25.06.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 06:58:04 -0700 (PDT)
From: Akhmad <akhmad100913@gmail.com>
X-Google-Original-From: Akhmad <Akhmad100913@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Akhmad <Akhmad100913@gmail.com>
Subject: [PATCH] staging: rtl8723bs: coding style cleanup in rtw_mlme.c
Date: Sat, 25 Jul 2026 16:57:55 +0300
Message-Id: <20260725135755.39512-1-Akhmad100913@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple coding style issues to improve code readability:

- Break a 140-character line to comply with the kernel coding
  style guideline of maximum 100 characters per line
- Move comment before the code for better readability
- Fix typo in comment (varable -> variable)
- Remove dead code: empty if block with only a TODO comment

These changes improve code quality and compliance with kernel
coding style guidelines.

Signed-off-by: Akhmad <Akhmad100913@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011..a29ab63f7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -52,7 +52,10 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
 	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+	/* 1: active, 0: passive.
+	 * Maybe someday we should rename this variable to "active_mode" (Jeff)
+	 */
+	pmlmepriv->scan_mode = SCAN_ACTIVE;
 
 	spin_lock_init(&pmlmepriv->lock);
 	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
@@ -2426,9 +2429,6 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 
 	len = 0;
 	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
-		/* todo: */
-	}
 
 	if ((pregistrypriv->bw_mode & 0x0f) > 0)
 		cbw40_enable = 1;
-- 
2.37.1 (Apple Git-137.1)

