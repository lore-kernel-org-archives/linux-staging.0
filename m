Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABAED1
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 16:31:53 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id o5-20020a17090ad20500b001ca8a1dc47aso16163956pju.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yu+DOzbMStngixhP79yoddJQGuRy4inbocK2zOrcGto=;
        b=pCBhWJqmkG0mgoQPc+uUcPxA8D+8AD22e3F3/BZ25oBw6cCRjlJk7ImQxzrRG5L1px
         +qlffMHhPNyftxtKIRaokWzKVYSSCWsB2cThwTDKaIV4xx+6RoZygWbogU6DLrUfRcJG
         54uQWXnhFcoAB1Fj8VBRGN99O4qv1Tbl6K7rvxiIsn8E7kUK/MSpmBY5bgp1xZU7IsVd
         zu3ZhOAhaBKdlos3Fh1Hi41ftSfH0S2PS84uISdkZJ+taXlQ3udZ6WHQV6ZslZVk9Zqh
         NBtwMb1pzJae+DUoT2HtZK61UHz2kSmF+gA5WNK4XyHfo8tOIJqIwqBIfkGmojkJnseH
         J22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yu+DOzbMStngixhP79yoddJQGuRy4inbocK2zOrcGto=;
        b=bt3uFRjcfgx+wRoTuRzef+YoCn5iuuFJZcbFgH2s8Sivu1kXxn1iHcZ/aVErjy6b6i
         P+M9JHSREYkLIlayeNrhTZH8vc11rfVHDRT5M4cAKLk4DMi0bNZ+tO9PCecO8Vl/VKaC
         6iR56Q2HIbe6rgcdaQIeoWo81NupLT/pdMgcrlhBTBTrXpKOdAlq0pdTI4VggnzoLTwY
         R5daAkQZr2lFf2nYilkSISzWgaIFCXJzvOVc9UCMu41B1b6LvptRMOMdYRHrLohE/Y5b
         p4JrZQgyQ7tACOrHRbv4sGU5DCj62NUmuRV4+tDvu9NgSGBz2fK5LuaS0l/oKOtt2BN7
         ZRaw==
X-Gm-Message-State: AOAM532UkS3nXjvSzGuvEnBdc7p+xXvmJl4hMPuUnbumTvn5ddWGQzKm
	ykELuD5xjMKHUnEduRG3eV4=
X-Google-Smtp-Source: ABdhPJy2YFIzY4kdYR8dLnADsAt5RhTaoQDlRcF3K0qZQBq0LdjOi6dvjWhh2kjDU4gUSuB0uDDENQ==
X-Received: by 2002:a17:90a:5d0b:b0:1cb:42a7:8af5 with SMTP id s11-20020a17090a5d0b00b001cb42a78af5mr13831325pji.170.1649608312624;
        Sun, 10 Apr 2022 09:31:52 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:606b:10e4:2085:6825])
        by smtp.gmail.com with ESMTPSA id f12-20020a056a001acc00b004fb37ecc6b2sm31940021pfv.29.2022.04.10.09.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:31:52 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 1/6] staging: r8188eu: drop unnecessary wrapper rtw_free_cmd_priv
Date: Sun, 10 Apr 2022 22:01:12 +0530
Message-Id: <20220410163117.3964-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220410163117.3964-1-makvihas@gmail.com>
References: <20220410163117.3964-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary wrapper. The logic of rtw_free_cmd_priv can
be moved to _rtw_free_cmd_priv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 7 +------
 drivers/staging/r8188eu/include/rtw_cmd.h | 2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c | 4 ++--
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index f036a980e..4d88bc847 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -87,7 +87,7 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 	}
 }
 
-static void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
+void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	if (pcmdpriv) {
 		kfree(pcmdpriv->cmd_allocated_buf);
@@ -157,11 +157,6 @@ u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	return res;
 }
 
-void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
-{
-	_rtw_free_cmd_priv(pcmdpriv);
-}
-
 static int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
 	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 6b6d560d7..d3a20dc23 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -83,7 +83,7 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd);
 int rtw_cmd_thread(void *context);
 
 u32 rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
-void rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
+void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 
 u32 rtw_init_evt_priv(struct evt_priv *pevtpriv);
 void rtw_free_evt_priv(struct evt_priv *pevtpriv);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 390d1cc0e..702e5b350 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -534,7 +534,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	rtw_free_evt_priv(&padapter->evtpriv);
 
 free_cmd_priv:
-	rtw_free_cmd_priv(&padapter->cmdpriv);
+	_rtw_free_cmd_priv(&padapter->cmdpriv);
 
 	return _FAIL;
 }
@@ -572,7 +572,7 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
 
 	free_mlme_ext_priv(&padapter->mlmeextpriv);
 
-	rtw_free_cmd_priv(&padapter->cmdpriv);
+	_rtw_free_cmd_priv(&padapter->cmdpriv);
 
 	rtw_free_evt_priv(&padapter->evtpriv);
 
-- 
2.30.2

