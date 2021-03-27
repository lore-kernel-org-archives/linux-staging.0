Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030470
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:25:22 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id g20so4379023wmk.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xZs3dNT9UWakhsTbiMCB3Wvkb6oFdQ1r8pcWmig7jjY=;
        b=C9fCJYstJj7CbOqKdDBp60KrVwyfq2FGBkX1zsfPZNuwcVqM8z2mVte4BKu40ArSql
         9Pw0XdtjkBUA/HNtnJ4bVj8fxsdmjURcbO44QS6xpRPgBFrx6blhlWr3MepwSRnjAzmV
         rFLj0Kie7lSCvT5CNQ3VzfW3yhR6Ef96Scfh7FrS/r2bKKWG6g791Etc4gnCvN4hUma8
         XQP/1XDHuY6IOuCzdSHv6E4hXP9BQrlSi8hMTEATa0o+xRLyW/EllzQq0VjE0WW5JOJ3
         mPvGoRVV3SpMj7hisbZGaDjTxgS9tIItSkh3UjPTuZArP2Dw3ekArvnbBmL0xpffNo7w
         TcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xZs3dNT9UWakhsTbiMCB3Wvkb6oFdQ1r8pcWmig7jjY=;
        b=Y5vkkTcjSeIVi1GSL7ltK3AuugFe/b0GJSuOQUGmba2fACLRfoFPEtEPNPULuU8LQT
         0PeSZbBAL3ZINDsG3naC4HOP6hgxqOy5pzxx4VTgqSs3p5ReLhM210TJQRZ6OujSc6MG
         HoDLJFDhq3KH/EyNoF5upeNjKfAnPsvm9RUVHDwprdyv3nyJ/LrdMIvsn14RHA6hL/h3
         Ec4YT3+ngwoTo2FxswdYOT8Ilt1JF2egia+JPwr3Hvb+RomW0uOHESJrj2vL+E4G0R1f
         R5Rexbh2BjnOl/iULRV4UrL4ulMelwyeWfNRAXydyKwHZmwMmWm4GjnGO0h4oRkAhjqI
         RP2w==
X-Gm-Message-State: AOAM533LSFhcgED6V+uvjAgPHXooC9c3FwXtEoAxLdSqJpqwNEB6vk15
	IpQPFp5XsqmdYdWxg/dwZiU=
X-Google-Smtp-Source: ABdhPJwjwck/w27yLLLbvTWh+mKMy4ooh6xCxb1Twm0F22kBoIT8e7zkt6+rY6snoMjrKHpNC5y2XA==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr17308862wma.167.1616855121029;
        Sat, 27 Mar 2021 07:25:21 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id w11sm19298209wrv.88.2021.03.27.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:25:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 18/20] staging: rtl8723bs: remove unused fields in struct security_priv
Date: Sat, 27 Mar 2021 15:24:17 +0100
Message-Id: <b7ff4cda1cd4cd4e73120f8526ff53a745bcffa8.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused fields in struct security_priv

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/include/rtw_security.h  | 23 -------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 60b05a620eee..b71f0959108b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -168,29 +168,6 @@ struct security_priv {
 
 	u8 bWepDefaultKeyIdxSet;
 
-#define DBG_SW_SEC_CNT
-#ifdef DBG_SW_SEC_CNT
-	u64 wep_sw_enc_cnt_bc;
-	u64 wep_sw_enc_cnt_mc;
-	u64 wep_sw_enc_cnt_uc;
-	u64 wep_sw_dec_cnt_bc;
-	u64 wep_sw_dec_cnt_mc;
-	u64 wep_sw_dec_cnt_uc;
-
-	u64 tkip_sw_enc_cnt_bc;
-	u64 tkip_sw_enc_cnt_mc;
-	u64 tkip_sw_enc_cnt_uc;
-	u64 tkip_sw_dec_cnt_bc;
-	u64 tkip_sw_dec_cnt_mc;
-	u64 tkip_sw_dec_cnt_uc;
-
-	u64 aes_sw_enc_cnt_bc;
-	u64 aes_sw_enc_cnt_mc;
-	u64 aes_sw_enc_cnt_uc;
-	u64 aes_sw_dec_cnt_bc;
-	u64 aes_sw_dec_cnt_mc;
-	u64 aes_sw_dec_cnt_uc;
-#endif /* DBG_SW_SEC_CNT */
 };
 
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
-- 
2.20.1

