Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219D76F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so1115287wml.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZitrNETvdur8eFqvmfY6Ygo5ijaLf42cxFb7jgH6wBw=;
        b=MSvOnI7RZ05w6bkFYc+LNsrsBqKm59qNtaFmkqWPEX+AsKLvUXBkKHDnvD+wRA+ue0
         0bsY0atzET/pldyPi8EyfNbcQC9ImGFXuvqHOiIjI2hZTL+NDU+gQZb9yZji0hZbllsM
         KWGX/4wgO/nyqlkpLdi+vL+1Qmddlx/lJdD+AF5mvoPWeTup2Q+kVPjjD68CR/cR0fn2
         mMqACMSXly1rKtfiipxa92UBOOxlmYFIsrYB9ezdp9zadBuS031O1d9Kmh+wB4e+qGq3
         XZCruFeB4TyaAQVSEIgGQ9i6UXtajpfvDk7lczHnq5bJkLSdp9g1/iuSn0//motVK53m
         O9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZitrNETvdur8eFqvmfY6Ygo5ijaLf42cxFb7jgH6wBw=;
        b=WvOYODaSDTFJB92pWLtIn53s1HATcnC++f8xCMSG/MuXRQrHkQEC/oYDvwU+CX3uBn
         arG9DjsuHKmGqLVnBd3kMvuO7V7ML5dIcpY+7cMNte44u9hICx6qFgx1yHXpsKO4+4IE
         DKEiQJAZ37LbMt1aYe8ynSqf20Vc5GxqSU7jDH1qDkB1TbRISvi4u7haUZ8qnwFuQuxj
         GnQOLutyGXO1oe2sjv0Cpv76Yj3QBQaBSnPjMqdrJbemq6eReZQMaDQSWewN0MoG4Qm5
         aT/9xRoy7oForWXr6FWv+bMz5EFe8EMAxZAWw4Te1mrbkY9REMst3rYIhptA0h4KgZlC
         /QjQ==
X-Gm-Message-State: AOAM532Qc2Eaype3y+iy1SS8oM/K0JWFGF+xs9K1PMauxQcZM/sVh6Vi
	JcszPNR7+Hc796qCB+1hs7+Cw5fibI4=
X-Google-Smtp-Source: ABdhPJxlavQqmON/6Zi2iEAH3vk/FlnV+mFrxW4x0rtq8+b2Fin4mhnpw6Z3edU2c9LsOEGtaTEhCw==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr2779089wmf.144.1616589914528;
        Wed, 24 Mar 2021 05:45:14 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:14 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 30/33] Staging: rtl8723bs: remove named enums in odm_DIG.h
Date: Wed, 24 Mar 2021 13:44:53 +0100
Message-Id: <20210324124456.25221-31-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
hal/odm_DIG.h:

	enum dm_dig_op_e
	enum ODM_Pause_CCKPD_TYPE

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.h b/drivers/staging/rtl8723bs/hal/odm_DIG.h
index 20d4b88da9ff..88cfd542df16 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.h
@@ -77,27 +77,11 @@ struct  false_ALARM_STATISTICS {
 	u32 Cnt_BW_LSC; /* Gary */
 };
 
-enum dm_dig_op_e { /* tag_Dynamic_Init_Gain_Operation_Type_Definition */
-	DIG_TYPE_THRESH_HIGH = 0,
-	DIG_TYPE_THRESH_LOW = 1,
-	DIG_TYPE_BACKOFF = 2,
-	DIG_TYPE_RX_GAIN_MIN = 3,
-	DIG_TYPE_RX_GAIN_MAX = 4,
-	DIG_TYPE_ENABLE = 5,
-	DIG_TYPE_DISABLE = 6,
-	DIG_OP_TYPE_MAX
-};
-
 enum ODM_Pause_DIG_TYPE {
 	ODM_PAUSE_DIG = BIT0,
 	ODM_RESUME_DIG = BIT1
 };
 
-enum ODM_Pause_CCKPD_TYPE {
-	ODM_PAUSE_CCKPD = BIT0,
-	ODM_RESUME_CCKPD = BIT1
-};
-
 #define		DM_DIG_THRESH_HIGH			40
 #define		DM_DIG_THRESH_LOW			35
 
-- 
2.30.2

