Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129BD126F0A
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774098967; cv=none; b=Lqxn6iCU708ClgZOjlJQQuqlsnC+SsLou/uu25r1hg+r1gFOU7wUYySFC+iuhMUK2UQEFKrocurmlX+UZ8iwhEpsbyNOLQmoQX/s0SSqXUMAkV7cdBLOFO8obq0GMqnpHzFg98s9RWNsSHkpboMOPRsURLUUDKlF3MoIKSH2Bro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774098967; c=relaxed/simple;
	bh=41MxnGx/gKk5k+CXjfVjoNLDIitgh6RVsJaoFQdJetY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVADIkHtXP+GfL9f8HLEaHIIZN0Xpc+COOyJU9dgKxhBTJPTWG/a2dJTFDlUyD7ITK0OW2gufhcQkN/01LBxDSo9Le/0zQ0SLGcWjUEa2UGBBqC18xvUXVtWTs2j+xq0H5AzpUD6xd/7lBuldzVuDmdZdzGSRvySwBRqadC6gng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiEBR6iP; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiEBR6iP"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35bb9070644so910090a91.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774098965; x=1774703765; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/0dTY2zxmA8OZPYnXYTgEM+JQDaZKRJPZ5LKTJIte8=;
        b=GiEBR6iPqCpVNjvAgBb7oBzi189IkNK2El8BJSqBivWyHaGGC7qVTCgl6B0W01kr+O
         UXjcvL9Y4ig2/cLS1TcFfzH1cWK3SeCtVUU0oBQSp1cFzSk+jUN2iq9a+ULfZvSQ/DGb
         r8NE0rwhqxA1u5tOwLdaPcQLbtRAmSsZJE3o+K7oVsiwnYzTBmoqVpExEnbCuBTIuNtB
         z6cqnJz0yuYYVpRyGT6X8C8KJMPo1Q/yfZLijMMgXjhs+pbikQcvEv28IMnQxWoJdgs/
         lHFwY0rjf1PrkXhMyYoV9iyAjvfhvlz3JoykOckAP8vUEWCx7xObIXB3zEdeCyMlKnxA
         wRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774098965; x=1774703765;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/0dTY2zxmA8OZPYnXYTgEM+JQDaZKRJPZ5LKTJIte8=;
        b=SFKWrE9z/8tavNbQI+k/L1sy8empCqHmdCNztBjbD7NLo87pp4CNLte2TY1NOx9Pe0
         TNXPL89c5ToyhzOpD7VnxYadFeh7P6yh0FfdlbHb6g1RqS3DbrmEOH0HrcixD9GWCzPv
         8H/B53h65FUTDX2UQpoiLHr3oglWGlOfyelzVG5YvzfzJF6H62vkXn/BMty8jmj8rFQc
         vGOW35xWdSJbsRSpzdvPPkA73Spi8zqhxZlm0JSeFMyuuIb3eDSUm4O+oO6zqXdWf4XB
         qm41g0cm+7R72lIHh6sntE0sCJQHZhzQrwSGIhJnA2NQZDtauIE2JHV2j+Qh9S4yYKM5
         qUSg==
X-Gm-Message-State: AOJu0YwqLMVMhpJbZqvd89i6OcGyjeMFZHWebrPWLdnZ3AQR8umJFfHw
	EaiUJaUiC7ehCh3fGa+Du91oMnhIYfL7UuArMxj3UpW/2pQgpCEuXOSe
X-Gm-Gg: ATEYQzyuGNNjs+PaEybmLLBtPdXm7I075C12Xuk46OhEdhR9ytkwR1sRhrYT5laZ4cH
	KgIqKaTIMzFauNAPmvF/yVImt8VmY8TxlULqzt1KtQgSN8HHIPmXn52ZtECDjkyENCIuLnYyR+c
	o9kdQnX1BrdDOn+sK8UC0Wl3W6SA/w9WoPS8YKOGALBDzPDnIgTg1DTCotHZuAZZwI/cso5u5yH
	8QMnlMSl6XHoqNy54MNO59KV4TivN8el3MKp8um1Jy1NbkPeAacKcSIRanuySVjnfYovxXs6Srn
	bSJJ40JLQuni2uzIkhAjkXS+Ox7jcIj5PlBuhCr27Hg2QatGQ4jCxTc8GU/H05FclsJAdeRdrjv
	eC2Vict22UvPvj3tsDZM0Tkc3AvgNL3CYcBcImlhSMPztB7KBdEBiZzTZwInFDUXWpUQk8qYI19
	VQMT3DUBL1SrOkPwHoNf1rQfSrEcKdRIoSDD8h7HLgAB02OR4sRH8GSBbdCQcdn+L6ctU=
X-Received: by 2002:a17:90b:4a87:b0:35b:93d8:6ab1 with SMTP id 98e67ed59e1d1-35bd2d01adbmr4790983a91.29.1774098965186;
        Sat, 21 Mar 2026 06:16:05 -0700 (PDT)
Received: from gamin8ing ([106.219.212.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd3d8c462sm4667432a91.0.2026.03.21.06.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:16:04 -0700 (PDT)
Date: Sat, 21 Mar 2026 18:46:00 +0530
From: Bhavya Gupta <anim8tor.ing@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rename camelCase variable
Message-ID: <ab6aELnTA0EnQI6X@gamin8ing>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename the "pIE" variable to "ie" to comply with the linux kernel coding
style.

This fixes the following checkpatch.pl warnings:
	CHECK: Avoid CamelCase: <pIE>

Signed-off-by: Bhavya Gupta <anim8tor.ing@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4cdcdddf6b33..4b4012411011 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1364,20 +1364,20 @@ static void update_bcn_erpinfo_ie(struct adapter *padapter)
 		       &len,
 		       (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 	if (p && len > 0) {
-		struct ndis_80211_var_ie *pIE = (struct ndis_80211_var_ie *)p;
+		struct ndis_80211_var_ie *ie = (struct ndis_80211_var_ie *)p;
 
 		if (pmlmepriv->num_sta_non_erp == 1)
-			pIE->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
+			ie->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
 		else
-			pIE->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
+			ie->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
 					  RTW_ERP_INFO_USE_PROTECTION);
 
 		if (pmlmepriv->num_sta_no_short_preamble > 0)
-			pIE->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
+			ie->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
 		else
-			pIE->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
+			ie->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
 
-		ERP_IE_handler(padapter, pIE);
+		ERP_IE_handler(padapter, ie);
 	}
 }
 
-- 
2.53.0

