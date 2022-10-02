Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6069923C2
	for <linux-staging@lists.linux.dev>; Sun,  2 Oct 2022 07:48:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id m3so10860109eda.12
        for <linux-staging@lists.linux.dev>; Sun, 02 Oct 2022 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JVknYk0vlwYwohwAqFrUHN5xYyLqUYp7SiDIhrNiOxY=;
        b=Igz04itpii7RGNiuS+9DpuNTcphVahzIvG5ruVoFw4ebYUzAnd63etx/JLiOh7eva9
         M2ljbdJGy/kg7pV8p8O/9+jrtHfQID5mAj5NKckSRtqHtZ0BJE8fpTgwqVwLAArDzB0T
         Vw6/yNB2xg6t2C5scueiPVAlmhsQXgIkiJG19Jnjegir1pxOEpxaItw1QORXnsQU0Ox0
         e56PCAAhqjhdN3DTtNpZBvZqXxadjWYyaUJ4H2Iw2Zd6PHt0aUu7VlXWrP4194UgNIKG
         lRdBHqBxzvPU/IM0Hs3aeiEcabq+Jz2wrrez3Gyree8Irkf9lLS8TNy9mKGmK9y9t4mh
         KjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JVknYk0vlwYwohwAqFrUHN5xYyLqUYp7SiDIhrNiOxY=;
        b=R8uzuUglyX6+tWvq2mnIvjRfO8oeR9pRg8Tv3A29Fcj8zacjzRor7slSsjlDMrqsM4
         O6+pWBWv+5wDy5CKZ6NDGjA9X6zsg65N+xZFl+5KkkR+FS1oqV/pqVad+wsxoGoC68Kv
         b+BVdCd8Z6u7XD3k2QHJjc8Nguh5a2iYRkynJdPBLe6T86F2IDNW9uncvUMAqQbGuLrI
         wnNbICSXFezH3EjFKxPfQt1mRZydMSfOWHLOTCjintRGG3hjohRKrpeyZWl0rqzfaS8+
         R3S8vGKHAePUDJ/aOJbSFIN6u5lmJ8DZ+z9CoL3G/bvVveQTmFDCqOHQAJ5XSufOgGnd
         Bp5g==
X-Gm-Message-State: ACrzQf3jMnuymhR972a4vn2SGI43vXXtQnDDHkMjccriOj+6B2KXoQU1
	9ikuIqoHA1mfa1utfkSv0qI=
X-Google-Smtp-Source: AMsMyM4yFvLMfierLQ8tSKmOj3vrAFmNAy5udDSU42cFRllBJIvqooektBP84mCkWUg+rR8AINJrHQ==
X-Received: by 2002:a05:6402:1587:b0:458:fbea:436c with SMTP id c7-20020a056402158700b00458fbea436cmr54348edv.407.1664696928769;
        Sun, 02 Oct 2022 00:48:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id q26-20020a17090676da00b0077ce503bd77sm3608536ejn.129.2022.10.02.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 00:48:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: convert rtw_init_cmd_priv() to common error logic
Date: Sun,  2 Oct 2022 09:48:25 +0200
Message-Id: <20221002074827.8566-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221002074827.8566-1-straube.linux@gmail.com>
References: <20221002074827.8566-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the function rtw_init_cmd_priv() to common kernel error logic.
Return 0 on success and negative value on failure. This is part of
getting rid of returning _SUCCESS and _FAIL which uses inverted error
logic and is used all over the driver.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 8 ++++----
 drivers/staging/r8188eu/include/rtw_cmd.h | 2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 88b939e42f5a..fdc0c71e28a4 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -54,7 +54,7 @@ static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	return _SUCCESS;
 }
 
-u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
+int rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	init_completion(&pcmdpriv->enqueue_cmd);
 	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
@@ -71,7 +71,7 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 					      GFP_KERNEL);
 
 	if (!pcmdpriv->cmd_allocated_buf)
-		return _FAIL;
+		return -ENOMEM;
 
 	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((size_t)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));
 
@@ -79,7 +79,7 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 
 	if (!pcmdpriv->rsp_allocated_buf) {
 		kfree(pcmdpriv->cmd_allocated_buf);
-		return _FAIL;
+		return -ENOMEM;
 	}
 
 	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((size_t)(pcmdpriv->rsp_allocated_buf) & 3);
@@ -87,7 +87,7 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 	pcmdpriv->cmd_done_cnt = 0;
 	pcmdpriv->rsp_cnt = 0;
 
-	return _SUCCESS;
+	return 0;
 }
 
 int rtw_init_evt_priv(struct evt_priv *pevtpriv)
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index c6c48e1fb961..8bbfeb42604f 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -82,7 +82,7 @@ void rtw_free_cmd_obj(struct cmd_obj *pcmd);
 
 int rtw_cmd_thread(void *context);
 
-u32 rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
+int rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
 void rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index dd4c89d7390d..490e0c7dc034 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -461,7 +461,7 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
-	if ((rtw_init_cmd_priv(&padapter->cmdpriv)) == _FAIL) {
+	if (rtw_init_cmd_priv(&padapter->cmdpriv)) {
 		dev_err(dvobj_to_dev(padapter->dvobj), "rtw_init_cmd_priv failed\n");
 		return _FAIL;
 	}
-- 
2.37.3

