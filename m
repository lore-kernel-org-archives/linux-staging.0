Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A6E70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 18:07:19 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id x7so6472004wrw.10
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 11:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wAmD6ytTwrfyQlONs9BcZVLvDpM+VeJBCdcfqLiuEa4=;
        b=QleMF9P1oL2czwD76yMt9OAUDXUEDVsHYcJZUYOsgnbEMywbKpX4fWUJyJg6CALK6U
         Enx3xMvFJNOAPObLvdKRvR6VwRpjukJ1SFGMx7tAgn61w4mUpxCDsjv+cczEfFV8/dfP
         g6hDmwx3sNAc56vwdWPvNNbz6Ito+9jBX1MC5mhufuH5kAXgZelGARG23OhfXS/fpHrk
         VXmdt3HR55j7rQS2JAzk3JVOgGYvJyPJ5qfWyJJw/pcITXZNaAwLIBtPJHhk1Iur1IC9
         bcEIyxWPxGsqdIvpseqt5E6VId6gV+sfPARIr7TsYkvAlHDm7j8PggthRR36W+95FZQ5
         4Wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wAmD6ytTwrfyQlONs9BcZVLvDpM+VeJBCdcfqLiuEa4=;
        b=YNyAunsogkkyBd400iqboBMr0gR16r2Zc+XCe9E7PB4joIVJ367WisUdbi2M7CdDk8
         rMCNGzUROGRmKwA859/lQrQ1DqpAIfGFjp2t5CWi9/mOsK+cOl10wWg+l0q2IrCcecJ1
         rQXd9sDvWckBFW6AuniHIJiy4mqIPLw6KyVpsXfFWfyCu6XEiuzPYG/NkZDs51gxA2vE
         Jkak3Ui5LdBBdMiBVA5EJchZLm94dw/zmwSkGVsMvsO92AHTsfYpd0bzO3AHcwHHkEc+
         8iur1TPBCGgUOzG2zlhSr3usu/53UvxRjqmuiqr9vhbjhzr0zyVhVX0xWsLxZQq0Ix6f
         jy3w==
X-Gm-Message-State: AOAM531fJXyluEZ18FAwr10GrIhC/3o6+qDF2zqlAodx3ToFWDUUoKJi
	XlMvPcmWBbN4awWtgOAbyFqpR5OkJF1Gxw==
X-Google-Smtp-Source: ABdhPJwnk7b4LMXe04/G3qi1KbAsSIeYZ307khr9oQ24D2Ylkab7QzqFANcRb6vjmRuPljO/baED4g==
X-Received: by 2002:adf:90f0:: with SMTP id i103mr15423979wri.318.1616782037719;
        Fri, 26 Mar 2021 11:07:17 -0700 (PDT)
Received: from agape ([151.37.215.119])
        by smtp.gmail.com with ESMTPSA id v7sm13030022wme.47.2021.03.26.11.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 11:07:17 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix broken indentation
Date: Fri, 26 Mar 2021 19:06:32 +0100
Message-Id: <20210326180632.1859-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YF4J2JVz1tHiFsGJ@kroah.com>
References: <YF4J2JVz1tHiFsGJ@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix indentation broken by patch removing conditional
code blocks checked by unused
CONFIG_INTERRUPT_BASED_TXBCN family defines

Fixes: 65f183001f6e (staging: rtl8723bs: remove unused code blocks conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*)
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

