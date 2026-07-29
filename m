Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D4438466
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315283; cv=none; b=NkQDyTzEgti+odTUTWsAgWNRzUdXIVE9RynMxIXPPF1coXgbI0TuRDLpUCeKjHED7qwqTbxGc4Ht3LxtBF6Vy2WWbSq5RBgAGEr1JgXO65h0/nx+KYpkF3kcv/upwOPeBXtmZ4Wf1nHqX541cuiv9NSV6LNVtv+pDELGIsFuEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315283; c=relaxed/simple;
	bh=qJwmClLzgumrBPwq7xaGOl3KNhOpuiUrTx9mJx6S/DU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVtqWHWdQKK2u4vDLGd1GunDz3IPDvIU/7haQrmWaUylabHAwKkxfO+JSD1lbR/m9AZ6i8Q2nsiiD22Q47Kb06X1eee0XlJzcuuYwAzLQAD9CEQ88Jpf5zXl1vaRX2ho+EUSM6miZGIREcF2vVBXBH6qNE5Py4AQuoWKBy+BmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OX8B1p0l; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OX8B1p0l"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso496637f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315280; x=1785920080; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yL086NNKcgDKPpzaDMtI23K8Mo0WVQ6OPsT+w/5lrsQ=;
        b=OX8B1p0lYaH82srAvp51hB+XazAx/GSJ+w548AkDs8jEbDrzn2zVL1ckpbwCWxCYGz
         rbrCwtoixXTj8bZfo3tsFULEO/nX07IJJKFURnB091e+/hdcc6dLoyx4zXtNfLuDuSun
         YcAXAsucPT2pFhYLy43SBbGf/vgTg0jQjrJbLV3HU0PZtteZKEQCssJDIxEUY2YHvrqj
         gRXMHNF2xuIilTov9wwAeMfAL7GnqZb4Fx2oR9AZkHf4yUoi+01in6nzAqyuMqNG6pXQ
         EoFwZABx+eP4iY9orNk3QDzsTVIQoPxxh8kMQbQANTMr1miDwG8K4Ab1LYbkXGLLyj0r
         3umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315280; x=1785920080;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yL086NNKcgDKPpzaDMtI23K8Mo0WVQ6OPsT+w/5lrsQ=;
        b=Lt4ROv8ZDzqO7iThGZJfg2KiF/IgHRmV38WPwxhP0va7uIg16Fc7zgeIzNQfE4HlUh
         HOj7nmYzdZy8AL7PznqAitptzTcdJpTUDlVIgPxt/YYmjcmPV3p/S42pVQrKuRrFMKX3
         cMagM+WjvGuxTLafNW2ayxfceFH7iDi9biPNaAt8asFcap38naZAtzt5KS2lR80mA1sP
         JHI6oksyZ9LPA13NbNOU/sF4RRf/HeAjuC4rSgx/fti50yTo/jif3PEUjoRPmDv4tjag
         EUqPti+wq2lqz5VHWAZCXSgXWDwSuSunjgcCLueL2m+dVlcJhUKRMwMesJ6tSMuVa8rJ
         dftg==
X-Gm-Message-State: AOJu0YzUz6U2uxhD/Qv5sJO19c9ANQ6Up4hRqHJLWF1ZPEDTnLC+gsmN
	dxh60ZZAa85giB8VZ4qG7qDm/UlS5I/CQxtG+jwPcmSk1JxCkpHI6WUN65A+PgTc
X-Gm-Gg: AR+sD11hucyXQmQqFoR+VlIqFjFotatc5UqzZ8oraPxA7z09pvtY63T49tpt+vdQriV
	bumlk3W9GBtgCKDwqsLhbmOs3KlpP9inoAH7D0knhRI1lfZerqrhQPIOdIWZCsr039GIfg3SDnS
	HfKtMcNAOBGKnQAPJfZUNtkjSOWV9BmLkJoIODepidXe4QxQO7+wrv0ei1K97+o3DQh3oHSphLo
	BTEWGmgE4YWqAD15rkgjh+VmekkcUKfhw0lsZR1G3g5WQB8dDJsa2MPvEUWPcSTWaCR/sSNoSDl
	lPB+8c/6+xW5BG4+gNfdkh1RPzhwfQNippCb/7dIIWcM0IpypsZsSNMTR8OPHRwLj3QcGuOSgjL
	jDvOPnHS00BOo3hO2F8sIza2rGuDwAIUYe0pcSDobo6+C5PUaGUP5mA2rpoRgXS+1d9wrSeyGKF
	0zeS+WFIaqmAz2ZKTO2wPGFTIJngjnz4UDoFJKNWZVfrxmwsPxZDy44g1c2oA=
X-Received: by 2002:a05:600c:3b25:b0:495:39aa:1359 with SMTP id 5b1f17b1804b1-496c641309bmr66762285e9.3.1785315279811;
        Wed, 29 Jul 2026 01:54:39 -0700 (PDT)
Received: from fedora ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6acfdafsm5726798f8f.15.2026.07.29.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:54:39 -0700 (PDT)
Date: Wed, 29 Jul 2026 11:54:30 +0300
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: fix line length warnings in os_intfs.c
Message-ID: <amm_xjWhiP50C5lG@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

This is a v2 patch addressing your feedback on comment block placement
and providing the missing commit description text.

Thanks,
Bramwel

---

From 8fb05fdee4c523bcafc5b425851b95e69e22182a Mon Sep 17 00:00:00 2001
From: Bramwel Barack <bramwelbarack89@gmail.com>
Date: Wed, 29 Jul 2026 09:33:57 +0300
Subject: [PATCH v2] staging: rtl8723bs: fix line length warnings in os_intfs.c

Fix coding style warnings where comment lines exceeded the 100-character limit. Move the split multi-line comment block above the target variable declaration to comply with standard kernel comment formatting.

Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..796e7340d66c 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -71,7 +71,12 @@ int rtw_ht_enable = 1;
  * 0x01 means enable 2.4G 40MHz
  */
 static int rtw_bw_mode = 0x01;
-static int rtw_ampdu_enable = 1;/* for enable tx_ampdu ,0: disable, 0x1:enable (but wifi_spec should be 0), 0x2: force enable (don't care wifi_spec) */
+/* for enable tx_ampdu:
+ * 0: disable
+ * 0x1:enable (but wifi_spec should be 0)
+ * 0x2: force enable (don't care wifi_spec) 
+ */
+static int rtw_ampdu_enable = 1;
 static int rtw_rx_stbc = 1;/*  0: disable, 1:enable 2.4g */
 static int rtw_ampdu_amsdu;/*  0: disabled, 1:enabled, 2:auto . There is an IOT issu with DLINK DIR-629 when the flag turn on */
 /*  Short GI support Bit Map */
-- 
2.55.0

