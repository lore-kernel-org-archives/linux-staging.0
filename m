Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD7A418A58
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160358; cv=none; b=C9kRFLthblPo/6ZM5/aJpSL7+c3mDva4LMFwnqjZEMQlHOaW2ZGYAIghpGUVeHn0FZDYr733hgHvoPZITWpuJ6sJUOLwIY0q48nAcBiGIKLBDSKjMo8Z5bNau9Uh+TcRJwj5Bvc/AhQUvotYTvwDq+BsQO0S2c6r4Iizyvn38lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160358; c=relaxed/simple;
	bh=E+OUUsyYJVZjGf18crnrjSlm9Db13CTv5JqV5khXifA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k24bLNhI70RCtC0vY6HOi/yatg8vZ+QsmWcc91LM2e64I4BwBiWLsQrsOT5IsCwtdcygDKBzlP7ZGkJNbe/gsJXVYn9DA2iBcVs4iKNoREcYBaH0vHDiaR68dUlKhOYMI/mTBeTcNxiR8fK5JuMz4VE2RykZiNjhZoQNTs5ixQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJ77q6B9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJ77q6B9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso4319583a12.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 06:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785160355; x=1785765155; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Y1+7hVU6l9zX7feJ7742rTG69x0PGcytMS2zYGX9j0=;
        b=FJ77q6B96TBj07KxruP0zpPHHC6X8b+X5CfjrAo06SF9PXMVQ5mOZ0Tc2bAtEtRxu8
         jE2I+rDoA6BIiEzx6Mw/5YLRznNIR1tC0V9od3rhvY9qMVbWgqwE40RzrMXNCd1tilSt
         Hs4iCsE6wwSCJIhPjZhsxmHt1LpcpKc142MaP+8yUo1PfbmK+Ge40oRP2ZAIo9aFEc6V
         tDSCXfakiSwpvyYQZNwl7YX4PqXPVgsj2XtOE4ncUmtGUp8/d4Nk5jGt1oeCITscmm6+
         r9hrfNbOXBwoWLuVKdcnb3G6/sp+xt0q4/zbo6m89wqcPGQLzyupKabTv1wYq9Vx7xb0
         djgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160355; x=1785765155;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Y1+7hVU6l9zX7feJ7742rTG69x0PGcytMS2zYGX9j0=;
        b=h/36u8Bgh6lHm26dxEiRtvKj9aPTvJN8UHbkT0Ov5/gvoZjc4MIBH3ZFIIj7+TJMbf
         bxayh9naoTEfLL/6DTv8e6qu96mgrGcONoCRojmeeknHQkQt8xd+k/RWIZOngOD+y6hK
         D7oN1b4bpJTV+e+IihrKMvZUsYc9e0Cb6UfGklJl8AzglB0roZPJojvk1GOLi3pSLRYU
         IUAAP1hlArjKIt8kRcKx3/cFJAsqqXuR1I4W3eCqjr3csR0y4Iq8zzzQ3vzdGH6G4TKq
         xOXv4uEDZVf2lOpCO996EAMPovdr/dzuylXILDNKztmv7UOG6hmBsEU7NLMANgd3psR+
         pucA==
X-Gm-Message-State: AOJu0YwKk9DN3OE04E8pE2Uj2uFpeZEmUvI2cxyoX25KMwksIjUwJ+dT
	5Bj9nxQALpRn6tC4TEYz8KhvfWmGNitgnV4Frzd4Q6rYTsF02FKqcn/ThjoGwAIZaB1BuQ==
X-Gm-Gg: AR+sD10h4QcYATkdq4DWycXCHPZBUJacvxsUkS9oTgy0v6CFSnRKuLU3VfNOztqJ1jF
	4uuJouKP6Imn6en7LO8Y/pq+atfoXHS3RtyGfpf4YRG7fOBiYJde+XKXrPiomzYNAxgwyvYQEkp
	gT2bw7NRcj0xh9mnbLL0UrmnZhZc6J5K+dGoUCJqPPzfXrJHCQbSBrLEIi74LVK56X9l7qnPKdS
	FljwpeM8she5bx72+4bVwWc39Vj4FiHciY3aSEgcumbABmqbjPndbjFFasMn50VZYskAeoL51A6
	7ok+Bpiof2B7kCK63Vx/xhschnErQiwv4m4sacNjtuUIFO8/fbo/LCLI7eA/Wp86opbEmOKoDHv
	kKb9XgniwYnEsJsrhtMGc5tCx0/dnuHr9NiBs0T7qE77vdemG+WtQPjrsTOuKg3EOs1OM7ihNdm
	LO+JYvX3N9a5jt1HpSnJLMyWPc3gEnSlodTg==
X-Received: by 2002:a17:906:794a:b0:c15:c1ad:36dd with SMTP id a640c23a62f3a-c1f1eabbad5mr350211566b.6.1785160354817;
        Mon, 27 Jul 2026 06:52:34 -0700 (PDT)
Received: from localhost (50708651.static.ziggozakelijk.nl. [80.112.134.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a7986bsm645701266b.7.2026.07.27.06.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:52:34 -0700 (PDT)
Date: Mon, 27 Jul 2026 15:52:33 +0200
From: Max Raulea <max.raulea@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rename camelcase variable psurveyPara
Message-ID: <amdioVP1iDimngb5@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reported style issue by checkpatch in the rtl8723bs driver.

changed the variable name to psurvey_para to adhere to Linux Kernel
coding style.

Signed-off-by: Max Raulea <max.raulea@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index d8ad1c75195b..6304b218bc2d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -525,7 +525,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 {
 	u8 res = _FAIL;
 	struct cmd_obj *ph2c;
-	struct sitesurvey_parm *psurveyPara;
+	struct sitesurvey_parm *psurvey_para;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
@@ -536,18 +536,18 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	if (!ph2c)
 		return _FAIL;
 
-	psurveyPara = kzalloc_obj(*psurveyPara, GFP_ATOMIC);
-	if (!psurveyPara) {
+	psurvey_para = kzalloc_obj(*psurvey_para, GFP_ATOMIC);
+	if (!psurvey_para) {
 		kfree(ph2c);
 		return _FAIL;
 	}
 
 	rtw_free_network_queue(padapter, false);
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, SITE_SURVEY_CMD);
+	init_h2fwcmd_w_parm_no_rsp(ph2c, psurvey_para, SITE_SURVEY_CMD);
 
 	/* psurveyPara->bsslimit = 48; */
-	psurveyPara->scan_mode = pmlmepriv->scan_mode;
+	psurvey_para->scan_mode = pmlmepriv->scan_mode;
 
 	/* prepare ssid list */
 	if (ssid) {
@@ -555,8 +555,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (ssid[i].ssid_length) {
-				memcpy(&psurveyPara->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
-				psurveyPara->ssid_num++;
+				memcpy(&psurvey_para->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
+				psurvey_para->ssid_num++;
 			}
 		}
 	}
@@ -567,8 +567,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
 			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
-				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
-				psurveyPara->ch_num++;
+				memcpy(&psurvey_para->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
+				psurvey_para->ch_num++;
 			}
 		}
 	}
-- 
2.55.0

