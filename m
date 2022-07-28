Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428A33C3C
	for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 23:11:57 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b26so4064060wrc.2
        for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 16:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jCCnZiaJb8QNm0YMMVTlHWHS8f4fktdY50PNwReg/Bo=;
        b=4qgcuoNhTzh1uX7xzytI6lBy4YQbvnypm6XzWt897AYOi1bKInizpFIvE97yxu3fzD
         MnB2ZXlfyT/znkyc0HmMEd7QRmFrRcMavcRgFTdWDuG5BvEZUYMEpCrUQCA8QfUGWyqu
         1g6PoCJWkl2E4XvcU3KQWi3n/KmLYl/W3eOpnDMi1bHUr8zgHIF9jhuyNfI5HcavsDGR
         swVaSluoookE2Yg8InSQedW1aEv8EcQcTg9/j6IXTpPSJYeVq2rWBZR73ZKstBR8VkKK
         i107apydqEgI4OnjMIUUdnA4/jhFsJvdVIcxcZaiqhTeXpGjQXaKRki68PF8Vxsq4sQt
         V0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jCCnZiaJb8QNm0YMMVTlHWHS8f4fktdY50PNwReg/Bo=;
        b=tuCpuocoOQMp3pI0MLrswje4nNT3d1rJLAAQy7l0yZRFQvGThX2qUKZHjXK/MiwF/v
         ppsdipNBe2jSkL5CN40fg7w58ppQ0okthMVbG2lNf04+u/rdvOLb15ovcIOYJfdVTXmi
         EUfwJ2WP6QVzJ0WlMylwsWbWmG3quzPRDPbYkRPZgytWaUGsovQ0YN5oDGs4oPi6YKVa
         Uh8uBZQo2H4EvE6cyTbwrsQiZ+u9NnWvbnVI53AdlNAxzL7qzDcBzwlRyTr+Ya/4VFFr
         Isk2js7lEaYmWdNOWgpgfanAcKkci3eSMHYubAB/20vwFfQ1EKdajKkf2TxjHlHuAIJQ
         msTQ==
X-Gm-Message-State: ACgBeo0kYqqx5wwZ/vikjI7whKsXPHT8ajI4uQUP5OsjYCwCUJ0L2+aJ
	aw5czHfH4rqTGTdUont2lJtvPw==
X-Google-Smtp-Source: AA6agR6x6e6SwyzVVGvqX1um4Ya0xhrWibkZzps8P7wvHfc2bLMEH7ExKE55xQmuKi3lraWLVy6D9w==
X-Received: by 2002:a05:6000:1f08:b0:21f:bbe:252c with SMTP id bv8-20020a0560001f0800b0021f0bbe252cmr640136wrb.340.1659049915436;
        Thu, 28 Jul 2022 16:11:55 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0021e571a99d5sm2089419wrh.17.2022.07.28.16.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 16:11:55 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	paskripkin@gmail.com,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: r8188eu: remove initializer from ret in rtw_pwr_wakeup
Date: Fri, 29 Jul 2022 00:11:49 +0100
Message-Id: <20220728231150.972-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728231150.972-1-phil@philpotter.co.uk>
References: <20220728231150.972-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the success initializer from the ret variable in rtw_pwr_wakeup,
as we set it later anyway in the success path, and also set on failure.
This makes the function appear cleaner and more consistent.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 8b1c50668dfe..75e655bae16a 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -381,7 +381,7 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	unsigned long timeout = jiffies + msecs_to_jiffies(3000);
 	unsigned long deny_time;
-	int ret = 0;
+	int ret;
 
 	while (pwrpriv->ps_processing && time_before(jiffies, timeout))
 		msleep(10);
-- 
2.36.1

