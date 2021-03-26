Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB355F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 15:53:20 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c8so6089804wrq.11
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5k/BVMfwAegukvEElIIGUwfHYfApU29sbEenfi66cXQ=;
        b=cGVxh0aGFLtX5bmpyNUup4SVjQaADeguIlmuvskWpz6ghfhMzQpiVrrOj5sV8mv+EC
         tb0kGKF3tl5llVQjvUiZhXeIEcggEyLN093fVlAM6UQJCkOTyMpcnX4+13OfrTmIrNU1
         JBZn47Dbt9SKfx1uIFRd0Tr2DnzBJ23NEstVdQKVHW7daKdUwwJHDi1DH38kE+Oqtjt1
         zERs64eoTDtKDDN+o+fTNnm0uvP98P6dHKQzlEHCffjjQUuQH9y2JHqSev3WA7Ox3QLE
         nmRilC+hbcsbtanHckG8cdcuLFtaPp57SwkjDw9GwOMYR/52i0GE8SaxRFFKaA4wDIWi
         zNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5k/BVMfwAegukvEElIIGUwfHYfApU29sbEenfi66cXQ=;
        b=GmEX2Xzy6koGZ6H088WAv/Xt42I0lAXo7oHAUTvIscyI3TEVZPBgu2Z6tHo4ifgJrg
         DG01ZR9xMnPeKGY1+n1pCd9R6MERxqLwfffmBRPcy9FPrwflJLl71Sc8PEl0wIp4pN74
         2lPVZa5sihwZedV+zhioY47Ob6TAKB6uxvyw6oR5wMZwBpzjtKiqFkVWCn1e4xhjHcEy
         jMBSNZ9mvHaCZOD/o7YEjTKYiUCYGytWyRxxr9uc3Q6E+peQMi+VCIC/dX/3xMeIT3td
         cJWar3dcleC6PoKssc5WdfYNcStrhou+1ywlijQM06Vuu/Z4FFfGCr3BBTmaMI9ZCLWW
         69Nw==
X-Gm-Message-State: AOAM531mgN3WNKnaPRaMOyH1o3n4gxk8F3eKkcNL+MzOoClvO4y1JWaG
	h3SYTV1jwVCzGjeDTptyrNo=
X-Google-Smtp-Source: ABdhPJwNWPcwRly02eq531zgTLQ3emt4eOoE5mMtsIz8wgWhWaDUNO6xneYGf7lTwDqLRep3BhY1Yg==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr15141963wrd.47.1616773999060;
        Fri, 26 Mar 2021 08:53:19 -0700 (PDT)
Received: from agape ([5.171.80.141])
        by smtp.gmail.com with ESMTPSA id 135sm11939750wma.44.2021.03.26.08.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 08:53:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH] Fixes: 65f183001f6e (staging: rtl8723bs: remove unused code blocks conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*)
Date: Fri, 26 Mar 2021 16:52:52 +0100
Message-Id: <20210326155252.6746-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YF3qSsH/3vRy7BRy@kroah.com>
References: <YF3qSsH/3vRy7BRy@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix indentation broken by patch removing conditional
code blocks checked by unused
CONFIG_INTERRUPT_BASED_TXBCN family defines

https://lore.kernel.org/r/9157000821fd6febf25566b8c712fad1995c7c78.1615907632.git.fabioaiuto83@gmail.com

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3cd9c61eec99..dc56477eb084 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -907,9 +907,9 @@ void start_bss_network(struct adapter *padapter, u8 *pbuf)
 	if (pmlmeext->bstart_bss) {
 		update_beacon(padapter, WLAN_EID_TIM, NULL, true);
 
-	/* issue beacon frame */
-	if (send_beacon(padapter) == _FAIL)
-		DBG_871X("issue_beacon, fail!\n");
+		/* issue beacon frame */
+		if (send_beacon(padapter) == _FAIL)
+			DBG_871X("issue_beacon, fail!\n");
 
 	}
 
-- 
2.20.1

