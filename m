Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4887B70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:10:01 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so5551714wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LuVUGCrDYwzS4XJl5GG9GlS8NguBAubSl2Epx6ZZHf8=;
        b=pmiAGbRSMQbcmi8fiNSSsEWBLqaXAi+gA7rvW+EboM0H6bbmzfRsFSkgZRo/JWBn7M
         R2EZFn014knD17A+/+oNrG17BMYKHXRChXE2V9kNYQrCVBqj+gXMLvKkFFtzJdrddfCe
         vW6UjdRw8rQbHAfdKRHoobpQeRaycKsncYjwIwN0CW2jSqCypfkEqvFFiEP9Bwu4CVvy
         Wadc8mjHeeAlooFKaohllZfm/NZPRG/08eSd6FLfiKZcmRRo3dy7s1Z5Vi2EpuOs64df
         URklx61g/flWV+nXOwnqPN55LfNuDFqaPgr2byHyKnBS8gF3IBUOuyTSe8FOEKLfk2Gc
         H3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LuVUGCrDYwzS4XJl5GG9GlS8NguBAubSl2Epx6ZZHf8=;
        b=EQniEwoUr5Srw4KSJwvHqGQ0nmj+p1r2bbXERG/Xs7aq3Q45VLPFWSYXa73SwIKn0k
         1WimmkanSBdgXOwBF6CJKz+vcRoLEqZL2LkQlZTNm4tNjMHvuBHsRyboO8CbGyMQU1iP
         mwKVXVHSGt2T/Wct7Yj8vmlpUXuMxrghONM3B57xUw2xevAGXCEj1udIMNxbrdLWAXor
         jrMApbpH7vXZQWOdV0N+2951yr/Ty6g2hiDvEqBupqMjhKm+dBla1Uq8GoIrpogP5D8n
         OmIFS14YaQpnc+/50Z5znx90QrOzqmxMTUPTThSd0QbWb/V7EjuacwbMfQ0IlGIsZrqZ
         sTZA==
X-Gm-Message-State: AOAM532GoIB5EuK7ZAbpG/NQ6bO8RCBlHe5agyJWDI4XVWx6BzeAwzel
	Heh5aD17shSFE8M2dt3GUeE=
X-Google-Smtp-Source: ABdhPJz2kYNQwUxQxkJPuRENDkny8o4TLotxnKyeItE1GPN9vo9e3uZ1fQwKly8CWxs6R8ewitlP2g==
X-Received: by 2002:a1c:6309:: with SMTP id x9mr11987480wmb.62.1616749799841;
        Fri, 26 Mar 2021 02:09:59 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id p17sm9431395wmd.42.2021.03.26.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:09:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 12/15] staging: rtl8723bs: put parentheses on macros with complex values in include/rtw_pwrctrl.h
Date: Fri, 26 Mar 2021 10:09:19 +0100
Message-Id: <09367497eed0c43d8e4745c50c2a20c6c23883c2.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warnings:

ERROR: Macros with complex values should be enclosed in parentheses
92: FILE: drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:92:
+#define LPS_DELAY_TIME	1*HZ /*  1 sec */
--
ERROR: Macros with complex values should be enclosed in parentheses
241: FILE: drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:241:
+#define rtw_get_ips_mode_req(pwrctl) \
--
ERROR: Macros with complex values should be enclosed in parentheses
244: FILE: drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:244:
+#define rtw_ips_mode_req(pwrctl, ips_mode) \

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index cec9fc0cf794..688436cf3610 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -89,7 +89,7 @@ struct reportpwrstate_parm {
 	unsigned short rsvd;
 };
 
-#define LPS_DELAY_TIME	1*HZ /*  1 sec */
+#define LPS_DELAY_TIME	(1*HZ) /*  1 sec */
 
 #define EXE_PWR_NONE	0x01
 #define EXE_PWR_IPS		0x02
@@ -239,10 +239,10 @@ struct pwrctrl_priv {
 };
 
 #define rtw_get_ips_mode_req(pwrctl) \
-	(pwrctl)->ips_mode_req
+	((pwrctl)->ips_mode_req)
 
 #define rtw_ips_mode_req(pwrctl, ips_mode) \
-	(pwrctl)->ips_mode_req = (ips_mode)
+	((pwrctl)->ips_mode_req = (ips_mode))
 
 #define RTW_PWR_STATE_CHK_INTERVAL 2000
 
-- 
2.20.1

