Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B443385AC
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 23:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772927917; cv=none; b=guVCtplWhjWqVpbr5kUoh1qZZJXowJ/NPEvsD7TyCUSzfwJOdAWV0UIt6aiX19D3dl2Z5aS2oHn5asTA0ND2QVKrHdT7c764CjVr+kCtb4eBwRPbWuEhTS8brea6b7mHBxRMuvkhXlN58Y9CJLpqvxcEgkwjwF5Vmcslw8KBb7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772927917; c=relaxed/simple;
	bh=T2xzwrc7SFfhOuO04+j242s/vRTPHWFw3wkQokCfN08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjUfzxhAVgJhXMVy5U2HKOG4lOiVCNXRZFLV/CnGIWxGuMwgV8/UD6cyl4ZwC0jewFayoMSzmAw9A5v6R4C/JOo49XW8H74bCvBQjv4bwMOGZ0akU9tykyiHDcapjx2MT9yRoJC1mE/G9jzUXl6vkwp3hm3cnZCWW4nvFRv423M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et6QHp0l; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et6QHp0l"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483703e4b08so102015165e9.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 15:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772927915; x=1773532715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TrdlyXczNX7cDAyEvArhWMon8cz9c2jth4yqtgwjn7o=;
        b=et6QHp0lAy+HDNkP7Y26WlN/xu7z0GDZVK2gHSxnisWtq3n1KaQxtCtxZgJ2Vn6E1S
         F/AiVKKplENJLMel2v7ic7bT9+sY3TbMjpIc8AKEX53VG9GUwktYJqtamkfIsGxkuFqQ
         Oj8+QuZirVxLfOOOdo1qLn7eUbuyQUWDeKDlxLn+hwsCZoDjYUJyP2h2GTfr3ouJnx8F
         GWzS21TnW2ZjUsuWhqVmoD9/623fUpIqmELYceMdyxL1tYh2EbqncGcVxzyfA2Rv9hO0
         TlioL45AtEtu/uGy1nAP5VD2NLixCv07+phqBcivKVHwHiAZ2mGvLoY8zxEFIgt1miA+
         GPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772927915; x=1773532715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrdlyXczNX7cDAyEvArhWMon8cz9c2jth4yqtgwjn7o=;
        b=PzTcsQvjvHhNTtXgOHxUxJCsNOraW9gGFzFCWU8813Kuag0v54sGcJgg6wY9d0bssP
         c5rIxsVTkZdlugdEoLzy7Qstfr4CVgKqzQsCd4dYVEseGnYLhU7lN7mXn/KsFaMzXdbB
         enL+dt+kIGyiQfEjKK5ByKWyVtOPp98OtDl5NGg03j0yKvdpdH3fg+uCxUzItTFdr/gG
         SK7btqipk/zNfSoZasHmir5gGHBqFceVFz8N909MNIR3JgQuq2h1id5SAYhJ9S3r258m
         n+24DqrYmufiVw/e2moCUZgy6VboQH/nm8LRkskFMD/p0Dd6VvpETloOOl4KJNXVaHlX
         n8NA==
X-Gm-Message-State: AOJu0Yy6XR4s89PDAUZRvgIeWJO8Zt+v91p18PbmccEV41w7KiVDY1bA
	LAFaKvZFN6mXFG32sRC8qy4zBfP+eyQJF+QeQcxxxWgJjhdOfSfYWv8R7xhb1XCI
X-Gm-Gg: ATEYQzzeLnfkchZ/M1LSC9c0jI1OFNLOR7yDI8lTaGPKXohZMC7QO9Dse9RDj/2eq6Y
	5OJ1FXtS8iGuIGFbbufgnQsc81sCzdZROt9mL2yLEbFgph6fFjCUqFQ3zMBAl9Gbyq/a7tIT39B
	zmy22wZs4kn6y2tyIMKdR5Ma8qbNS155ftdrM3so/dw2YGInJ/s4d13BjMsEXUvfNvwQuYpfz9F
	0S4+kkX9zUGaZTae8DCr2ZdtAQ1AICLjbMs8HAnNnMAVzSWjeBX0g5RQRpclZTO8YDi0E48fNLa
	PmwaIDhiHcThySU+gyFFBJWSHoJ0jNkhDNP37LxORYdMgT/+yqmUuQmvOEeDnz0hKofOOHQD+iy
	cor0ghFGq8aN//y4QkBMCjCFlf17i8VL+zigejivzHYeirMF7C4vWIwmxKQdewmDGjGi57oFg/x
	42/UfHa8IHR4X2fubqjMPyr3th8gjITchI0RXErQ==
X-Received: by 2002:a05:600c:c10e:b0:483:a2b0:d210 with SMTP id 5b1f17b1804b1-4851ee7a50cmr165772035e9.7.1772927914694;
        Sat, 07 Mar 2026 15:58:34 -0800 (PST)
Received: from MSI.vodafone.ultrahub ([83.106.9.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae36785sm13772248f8f.27.2026.03.07.15.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 15:58:34 -0800 (PST)
From: Ayan Mahmood <ayanmahmood249@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayan Mahmood <ayanmahmood249@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix line length in rtw_pwrctrl.c
Date: Sat,  7 Mar 2026 23:57:01 +0000
Message-ID: <20260307235701.7388-1-ayanmahmood249@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor lines exceeding 100 characters in rtw_pwrctrl.c to comply
with kernel coding style as noted in the driver TODO.

Signed-off-by: Ayan Mahmood <ayanmahmood249@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1c9e02732687..a0170628bd5d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -331,7 +331,8 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	return true;
 }
 
-void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_ant_mode, const char *msg)
+void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps,
+		     u8 bcn_ant_mode, const char *msg)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
@@ -359,7 +360,8 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			hal_btcoex_LpsNotify(padapter, ps_mode);
 		}
 	} else {
-		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
+		if ((PS_RDY_CHECK(padapter) &&
+		     check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
 		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
 			) {
 			u8 pslv;
@@ -452,7 +454,8 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 			if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) {
 				scnprintf(buf, sizeof(buf), "WIFI-%s", msg);
 				pwrpriv->bpower_saving = true;
-				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt, padapter->registrypriv.smart_ps, 0, buf);
+				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt,
+						padapter->registrypriv.smart_ps, 0, buf);
 			}
 		} else
 			pwrpriv->LpsIdleCount++;
-- 
2.43.0

