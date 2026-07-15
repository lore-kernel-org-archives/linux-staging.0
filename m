Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DDE47A0BA
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119844; cv=none; b=JTyXJ2zGn+MNAVFunzy43L5SJjG3CFxIzddnURXv5A7svK9uwkmstVpWEpPPFoKIz+EVH37lDLDVTPVMG99q3ksCvm9vUhL/bqUBoOeLDcJiq3suXBQHt+NbUdiSJ1DKpdhTerJTXpoc830/ftHW8ssPyA6qK5Kize5kAP90auw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119844; c=relaxed/simple;
	bh=2Dgf8HyAsawosrrXRnK2QIVNgW2NN2lADqyUxbdOPos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4eTzw81WbxycLoKZUGPf51hlGgquyaYSrLZpEs1jwGpisfSj+6YzT8ycniDqt3Z83Qv7laWs59ORbN5YO2gAT+05yTx2wLqMGLoYlZGOD4sdw9uJEHNW2ud8wb5EJSOj9RmrI/qY7reFAQvYqKq+gGaSeHG4X/GkGXSxH63BsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLFdLtuj; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLFdLtuj"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so2102281e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119837; x=1784724637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMEuJlfO+SP8MWqJmA/pbwlftlH0vhRr0hh+YpswdiI=;
        b=hLFdLtuji/48nWRIO9ZxLkNiRvFCy8Zwdvo7vP0iSMRtgex+MxVHNfiaECz+iPxHW1
         G6sKdZHVRgNLQIVB7suVElAkzBd8iQ/EpqHwL4HF7iKkWw+z/sAOAh4puf7I8JR9GM+0
         EzK5ky+GF3OTGZ03GNVt5ULzE9uQ48RyjfAwcfnB8EVFue741TbCAj2hbSoJb/eAK/Va
         hQ2UrlNkaZJq0aQN6s+C/QLCHxmpvrGEDbMhGprsbcSJzYBYjHIutg9oyvchHE0ONAPm
         wQs7+7IA8TuRw8Un48zapBBt8BtsM2F7KV/Eer96iN7wS8rEuB6HHFCfcjJgjE2uvuR2
         E7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119837; x=1784724637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMEuJlfO+SP8MWqJmA/pbwlftlH0vhRr0hh+YpswdiI=;
        b=d6dl+0buiZUxMoH2s8jKT+Y3VjKqWdJSmI0V0yFb+X05jQKNbmylJUG8jJveyzkr8d
         L+DPIU1ufFpD4RTGDIat1GPYOMWFQq+pFZkUBAHpjlOzjcYBhROGnS2LphTX54/USF1Q
         0diGBww0Vbqo4ovGR+5aaDztHHuuu0f5UqTOJP/7GrGYUMJ5EYt5/qxuFy0epYy/9Bke
         THa4ZPQxv4om8KExHKkb94gjpyvL3eoKSsCPtBl4VKlmL/xlzSAhSle6Q4a6fHxfJAIx
         K7q1zIYpsI/LIFOxQhxw4jHkmZCpYjxQaqvxyF8rMp9tU7a7oNJnngHy00NY6XMPxhGE
         /GHg==
X-Gm-Message-State: AOJu0YykQFtzOt1cKKw7glBmIL4D19z44smb/0hLHYMCDHQ+ngHIfNSM
	WKa9Xq69cZqePNE3zJvrMWQ8umy2rx7kYFJiepnymqxGTRjsllJ1Cir4T0BZYSWmqrc=
X-Gm-Gg: AfdE7cmCF+aMhT7315xrnlabQpzscM3uzggbbCnhX/dPH0xdfLhZo+hmYBA0Ck/r0LE
	5QCW4LjuCjnISo5yx/PY1TH6A2wFP54pNlCfi6S7GmX6tjsuNzQoCQ/E1T3Zmleq80Ea2bCZAz2
	6bJUPHcGevsJCVgJqMgP4UeQi6fnohyll3M2r8WWpgXy4o0n1giXg/ZplHIKBLvQSLn/4C8d3r/
	N+VAQ19NqrjNk8ih2CpfEN1djiwx9uHL9t8184nOlhUdQM7ULmCcloI2XB/GP/pM0X3ECROmcyO
	L9wAQ7EWLSowpUSvRpw7hV61mqIDdkZ8Co47QZiqqwC/MJlp2+GBFeS9kEXg1mgxjer0xgK0h3U
	dI1+NEcOzqjBjKvj85DNJK4Y5iaKIw5u5rkJkBhWMqtkQ0uD/bvJ7y4SyLTt1vPyb8Z7mosPKQZ
	bxFgZ3RbDXgAe9ZC3hTfsIHPNttYFC1eJuAuwpOt9JwAYBvsW40UmGRQg1vAbgb2rYSdzkfpIWs
	bcMczMZ1soZ9u8tOnuAcdCd
X-Received: by 2002:a05:6512:3409:b0:5b1:5ec2:45b3 with SMTP id 2adb3069b0e04-5b15ec24699mr502501e87.59.1784119836882;
        Wed, 15 Jul 2026 05:50:36 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:36 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 27/61] staging: rtl8723bs: replace rtw_set_oper_bw with direct assignment
Date: Wed, 15 Jul 2026 19:47:55 +0700
Message-ID: <20260715124829.90290-28-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant rtw_set_oper_bw() wrapper function from
rtw_wlan_util.c and replace its call sites with direct structure
member assignments.

The helper provides no extra logic, locking, or validation, acting
solely as a setter for adapter_to_dvobj(adapter)->oper_bwmode.
Removing it reduces unnecessary abstraction layers and simplifies the
driver interface.

Clean up the function definition, remove its prototype from the header
file, and update all invocations across the driver.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 14 ++------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 --
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index f610fa5b3..053861f29 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -260,16 +260,6 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 	dvobj->oper_channel = ch;
 }
 
-inline void rtw_set_oper_bw(struct adapter *adapter, u8 bw)
-{
-	adapter_to_dvobj(adapter)->oper_bwmode = bw;
-}
-
-inline void rtw_set_oper_choffset(struct adapter *adapter, u8 offset)
-{
-	adapter_to_dvobj(adapter)->oper_ch_offset = offset;
-}
-
 u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset)
 {
 	u8 center_ch = channel;
@@ -317,8 +307,8 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 
 	/* saved channel/bw info */
 	rtw_set_oper_ch(padapter, channel);
-	rtw_set_oper_bw(padapter, bwmode);
-	rtw_set_oper_choffset(padapter, channel_offset);
+	adapter_to_dvobj(padapter)->oper_bwmode = bwmode;
+	adapter_to_dvobj(padapter)->oper_ch_offset =  channel_offset;
 
 	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index ae4c4586f..4b05779f2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -439,8 +439,6 @@ void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable);
 void set_msr(struct adapter *padapter, u8 type);
 
 void rtw_set_oper_ch(struct adapter *adapter, u8 ch);
-void rtw_set_oper_bw(struct adapter *adapter, u8 bw);
-void rtw_set_oper_choffset(struct adapter *adapter, u8 offset);
 u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
 unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter);
 
-- 
2.55.0

