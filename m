Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B429CA
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 12:40:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id f8so6379269edd.11
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nA95kZEJJpqMfkhMGZ1MEF+fc5vdCxf4Uu1PJMOy2OU=;
        b=YvvvTJYOEjErRv9reh1VXfkRZUhqKZYgGhk87dO0FLdLDzHXO8FqmgbNTm7QEc5NMQ
         Q4vUJb+AWBWF/BdNyMCCtVGQK1DCNsZSUtomu9Qo+H9LtRlD0ncFJfgOCI2PPnAsOXvz
         cjLcfIMBofa+QgdG5FSYpzG+DtSuPn8o9ldqngah3f7WzvLSfDOPYJnbTEBBo0XLBc6R
         QC8nit4gmYT0v6mf7Gk1iVRHpCpgRZPNB9X6tnLFbJnlsaBzDGJRVP1vglW6Rew61deF
         Edx3139AQ5DtI9voQbbSAqweK0XL5C+wl9qAEhvGPESYaF5wJLohmljNUDGoziHc2OcS
         zBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nA95kZEJJpqMfkhMGZ1MEF+fc5vdCxf4Uu1PJMOy2OU=;
        b=dTtAvnXgmCoGfIo8acNOti711Cis1eqJSN4B0y2yMDQqxEDBh463p//mshOp8vGMR9
         MgOgbW/nRJPaaNzb8xvdI73b36Q82017zx7+K4kLkCu3zKrB698nFydLOvBItZidadJ7
         UjrMwCWARYSrpbQYxAIcMtUJzM5h8RyqbdIRQB2eFyTSdyh2LtSqcbbM/vQ83sMVliqn
         Z3v5G5YHS5vRivGEEnf3+LbssmgJ9SmXWMULXdR0g0kUeT0aHUP8pm2RcbCyZsjF6RMF
         PoDt6sZInzWopcXFItZpDgP2aqmgrVVHLoNpPsWv6kJdEvrx/R44cScAJFXYTMzexnPw
         lJ4w==
X-Gm-Message-State: AOAM531T/jWXujS7q9dOkeu/ueSCsXss/qQKBR4pbLswe74Kt6s0j4G3
	Hmei0DUg3J+jXYbJq2alGmAkCE7pck1mBQ==
X-Google-Smtp-Source: ABdhPJwdIV+GDWoNh41IlZJZQi/JBiJ9Ya0z2wGjn0zFd4GLcknJaZ2WadnuGYFNRbOZOmYW8SNwNA==
X-Received: by 2002:a05:6402:1b1c:: with SMTP id by28mr17271732edb.62.1617972009212;
        Fri, 09 Apr 2021 05:40:09 -0700 (PDT)
Received: from agape ([151.43.204.41])
        by smtp.gmail.com with ESMTPSA id hd8sm1172227ejc.92.2021.04.09.05.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 05:40:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove all MSG_8192C logs
Date: Fri,  9 Apr 2021 14:40:01 +0200
Message-Id: <fa7f52aa90928dc86b3249ca9c5b27f92c2b071b.1617971592.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617971592.git.fabioaiuto83@gmail.com>
References: <cover.1617971592.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all MSG_8192C logs.

MSG_8192C is a private trace mechanism macro and is deactivated.
(i.e. the default behaviour is _do nothing_)
The only way to activate it is to manually define a debug
symbol.

So just remove it.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e31ad3feed62..dcb7cb131432 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1787,8 +1787,6 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	else
 		pHalData->rf_type = RF_1T1R;
 
-	MSG_8192C("RF_Type is %x!!\n", pHalData->rf_type);
-
 	return ChipVersion;
 }
 
@@ -2139,8 +2137,6 @@ u8 GetEEPROMSize8723B(struct adapter *padapter)
 	/*  6: EEPROM used is 93C46, 4: boot from E-Fuse. */
 	size = (cr & BOOT_FROM_EEPROM) ? 6 : 4;
 
-	MSG_8192C("EEPROM type is %s\n", size == 4 ? "E-FUSE" : "93C46");
-
 	return size;
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 0251ddafe605..989f6974c817 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1175,7 +1175,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 
 
 	val8 = rtw_read8(padapter, 0x4e);
-	MSG_8192C("%s, 0x4e = 0x%x\n", __func__, val8);
 	val8 |= BIT(6);
 	rtw_write8(padapter, 0x4e, val8);
 
@@ -1192,9 +1191,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 		CardDisableRTL8723BSdio(padapter);/* for the power consumption issue,  wifi ko module is loaded during booting, but wifi GUI is off */
 	}
 
-
-	MSG_8192C("<==== _ReadAdapterInfo8723BS in %d ms\n", jiffies_to_msecs(jiffies - start));
-
 	return _SUCCESS;
 }
 
-- 
2.20.1

