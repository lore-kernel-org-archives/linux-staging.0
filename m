Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96A72
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 17:07:49 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id z2so21999558lft.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xto8qI/A0qQwPlLzT2V7ZQFopod8JkuGsvPAgnxJwEo=;
        b=sZX9mQlvWM5DHaDz0Z4tP6sv7vieFMGNTfCO+oZLi/wnEmvbmvXI/MYtjs/T4QyB94
         QVvVFoXSvBpsI24mCxEvsAC+w/zmONjHCrTXehlHU6NcAb14GQg5/xKvrpMdCoeEradO
         mvQbXduaPA7qW2nqsMBhl/y16kGrocJv116FVQhaNIDhmXau3vHJzjE/aSY9CjpDebwQ
         TUIiS/UfKJMEgqVCzm2lry1Pv1jQaOsvLTIYgcZv4DW5eeVc3YuRaMERKv3jcnUSSjcw
         1ZoLFkRDqIvyno5NP753axHv3HnqoGXtNVdgIvbzPOgv6XHBueciZWGm1+jv46/+ePBa
         N0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xto8qI/A0qQwPlLzT2V7ZQFopod8JkuGsvPAgnxJwEo=;
        b=WqSonzvH0lEq5kGvaJKladGUh45dzjLORWZY/cz9gXFqNawhAxHa2s1V/y8n8kjS1w
         Olj2qhPAcHPSC+rOD1iPV/hMc/wI+42uN6Wydsi106DeHu4cUfls2Lwx5D9ZJwvCh5mC
         wwcOEpqUMlHpblnOeBj1Jbo0KAYxCqDJvQIOw58xwmRB5rnHCQVlU1zNMtzyhYqf8Ysb
         OUyBx1m72cfAQuBPqyssAIj6Zev8c12kDO/FA4GTvZD6tUNaMsf7RPRELscyGN/YovkT
         KtemLQ80qo+k+o3YmEXcDpmyCHVg3ZjpCbEIINxEnLsM8EV6RoO4hgl3XOb+zrhkbhE4
         nZ6g==
X-Gm-Message-State: AOAM531ly7ZhZAlWB+tR3T++opGT3z0y5qtHO3NVlVrM879vrJTLw9MT
	/ETcr+Ke+ttTSve3Ajv92xc=
X-Google-Smtp-Source: ABdhPJwpcIAZddPmjibeCGb0eMU0n6HW2yPMae4zk4lUBbvVTKS/lyMRXdpp/9aCOYUip6yFlQ/b0Q==
X-Received: by 2002:a05:6512:21c1:: with SMTP id d1mr14915539lft.21.1629479267235;
        Fri, 20 Aug 2021 10:07:47 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id g17sm674906lfv.34.2021.08.20.10.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 10:07:46 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH RFC 3/3] staging: r8188eu: add error argument to read_macreg
Date: Fri, 20 Aug 2021 20:07:45 +0300
Message-Id: <44a5a4ab2eae8e0deb969028a5488ea892008c8d.1629479152.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629479152.git.paskripkin@gmail.com>
References: <cover.1629479152.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since read_macreg() calls rtw_read*() internally we should tell
callers about an error on the read side.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mp.c    | 9 ++++-----
 drivers/staging/r8188eu/include/rtw_mp.h | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index 601a1fd5d4e7..6bbea1cc364a 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -7,20 +7,19 @@
 #include "../include/odm_precomp.h"
 #include "../include/rtl8188e_hal.h"
 
-u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz)
+u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz, int *error)
 {
 	u32 val = 0;
-	int error;
 
 	switch (sz) {
 	case 1:
-		val = rtw_read8(padapter, addr, &error);
+		val = rtw_read8(padapter, addr, error);
 		break;
 	case 2:
-		val = rtw_read16(padapter, addr, &error);
+		val = rtw_read16(padapter, addr, error);
 		break;
 	case 4:
-		val = rtw_read32(padapter, addr, &error);
+		val = rtw_read32(padapter, addr, error);
 		break;
 	default:
 		val = 0xffffffff;
diff --git a/drivers/staging/r8188eu/include/rtw_mp.h b/drivers/staging/r8188eu/include/rtw_mp.h
index b64b16554343..c063e6216249 100644
--- a/drivers/staging/r8188eu/include/rtw_mp.h
+++ b/drivers/staging/r8188eu/include/rtw_mp.h
@@ -410,7 +410,7 @@ void mp_stop_test(struct adapter *padapter);
 u32 _read_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask);
 void _write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask, u32 val);
 
-u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz);
+u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz, int *error);
 void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz);
 u32 read_bbreg(struct adapter *padapter, u32 addr, u32 bitmask);
 void write_bbreg(struct adapter *padapter, u32 addr, u32 bitmask, u32 val);
-- 
2.32.0

