Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA2D2F42
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:45 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z20so5524146edb.9
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rXYLqyvUZrDN2atFN2rBSj6q0FVOWGSmJ64xIojR0jo=;
        b=IyMU8Q0g1EDviaijWxU0HOP0rhogM+knpciweLZp3KyJeTUUfsKqpUcL45r4wJVS35
         HgXshxSpXPW761SZneyuC7aaK32j/UT9vNl5e0QuSXbkH3lnOqUx/exE4szyybj3q+Lr
         msmfs0kWzb4wZtTaVhOj3ZUDC6fQsiAxu2L9faFOWGRkU6tcspWigb139sBiioRTcjPD
         KvRbWWB999vwFaRDYZSC5nbQAY6sbP8ipXbeElTmxk9neAUom5GPknco566HgfU2iEb2
         QVVdMszSNR/dERKkypfiPVeC+c4nOQ6UgPpET9FmyXUifo6YiytjNM9bNmP9BSPpWOwe
         na2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rXYLqyvUZrDN2atFN2rBSj6q0FVOWGSmJ64xIojR0jo=;
        b=krutwr1xbasx90Z2xCKC0jSYN9tJ4zqrrV5/5ix0AI+kf5EaRmy/C5Pp1O1vIRrN6d
         cLyDsDkein1buprS8mwv6kabLz/fVIi+VsfW7kk2Flo76j/ux6OeaTpD9D/D+zLMSxez
         3BFBOqTx/cdy3Bx8tIdghg9MW7IzD3pbTaGD0QC8cYxaHmQu9kdczAGrrEFDo2IMrwB6
         +swiHGiZab3ohLdz01wCXkbmu83c4HT4Lh1vXDle4kspl6Eq2fX31neKcYj95R45pMeM
         ralFVUfzv4E7SP9BiWqfNaN65pFdop8ID0nLIDTiMDeHw6pUu9+TnI6a8NdxiG74Bz60
         5sUQ==
X-Gm-Message-State: ACgBeo3SbpRcqrLrlCH2EoNeIGxAc2G9J+PyjD/cjoApmxZazNGisLow
	JsoLd2/bXTzogAgY5m3Op/0=
X-Google-Smtp-Source: AA6agR6MxNlU186MP5egDDLOeR/KWwwZthJZ/YMEAcL+bp+EO/EOrwf/iSpBjapFlEJodROX5ynLog==
X-Received: by 2002:a05:6402:448b:b0:43b:5ec6:8863 with SMTP id er11-20020a056402448b00b0043b5ec68863mr5923937edb.377.1660913683809;
        Fri, 19 Aug 2022 05:54:43 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/11] staging: r8188eu: merge rtw_{os,}_indicate_disconnect()
Date: Fri, 19 Aug 2022 14:54:25 +0200
Message-Id: <20220819125428.8412-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819125428.8412-1-straube.linux@gmail.com>
References: <20220819125428.8412-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge rtw_os_indicate_disconnect() into rtw_indicate_disconnect().
The function rtw_os_indicate_disconnect() was moved from the os_dep
directory. It looks like the driver was originaly written to support
different operating systems. We do not need this wrapping into an
extra _os_ function obviously.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 6e51d735b2bb..3050c85dec2c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -837,15 +837,6 @@ static void rtw_reset_securitypriv(struct adapter *adapter)
 	}
 }
 
-static void rtw_os_indicate_disconnect(struct adapter *adapter)
-{
-	/*  Do it first for tx broadcast pkt after disconnection issue! */
-	netif_carrier_off(adapter->pnetdev);
-
-	rtw_indicate_wx_disassoc_event(adapter);
-	rtw_reset_securitypriv(adapter);
-}
-
 /*
 *rtw_indicate_connect: the caller has to lock pmlmepriv->lock
 */
@@ -882,7 +873,11 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 
 	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) ||
 	    (pmlmepriv->to_roaming <= 0)) {
-		rtw_os_indicate_disconnect(padapter);
+		/*  Do it first for tx broadcast pkt after disconnection issue! */
+		netif_carrier_off(padapter->pnetdev);
+
+		rtw_indicate_wx_disassoc_event(padapter);
+		rtw_reset_securitypriv(padapter);
 
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 		rtw_led_control(padapter, LED_CTL_NO_LINK);
-- 
2.37.1

