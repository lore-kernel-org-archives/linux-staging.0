Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BC32CA6
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:12:28 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id me13so33622639ejb.12
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8HO/N3phK9Cgv5RkgvHGJMfII6OZKPml7frfeVGhWnc=;
        b=mahg+qJ/yG4RGbk6JOlo66JbXDWodeNzkkJevG3145KRWDxInRtORgAt9VwhEk3HiD
         TJy3tUruSZwkVrOCjV6YkplgSE86niSQlx2XujJF7RoeVqvZgCezmPGwg4MgBcOdy4Fn
         XRmmAXvq/g8NmOkhVthZwN6xM5errYluqiN64Yk+toU45hBcsKTMDUD9suIZTk2Uw36Z
         o43mBcJC2SY0l0pZjxYjMApMqZP3qV5eMOyGAaBOYPqfBuaKLPRkcL3KywsMl/idYn1a
         xdIk9S17ZgEV2TKXB/WRyBZibwHOSlmO/FvL6fUpVb8cL14O0FyyxTDYTZTcRa8XjnsT
         Eh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8HO/N3phK9Cgv5RkgvHGJMfII6OZKPml7frfeVGhWnc=;
        b=sHWpQm/Yp2jwWKZLuAPwKDOCWBBWZXxnysU09GD+KxIyst/Xk2HiHDno+mf2uNBTAU
         4M6fSLyp2q5KlcwXFGAqset8N/RouDhgg0UyV6I/23K1o3IQWGVbjLXGT3LrUMWj+Olw
         kXgxr+BxTJ5dswRFrN7poALR74kQpNWKJoRTsSIMfFRidaKGPxrgvYrLn35LSDmaRWzt
         H1X+BRDFbYjrCmZB/1gULOUMxNCiFwevG5F3IlkbmnFIWC0A+Ak5OOZuE9ZiD9Bor/ni
         DhvJUplM5kD1p7m5prPO12ol2aoLtl4+zmUYAcBlCjc8UY7AHGTfIzMTn5XO7LIVxNXh
         +Uhw==
X-Gm-Message-State: AOAM5316pfZFlzemu0v1iUx8ydfRrJMl6Omtu06IBLuP1bQSgfw9OgPK
	Z3o7C0Cx09O/S4k4BTmh7nA=
X-Google-Smtp-Source: ABdhPJyDrcJBHEGmz08stab4Aak+vkpJcchWPLJvt4endsTLoeyt75MYtFpbTMCkt2Sc0SZt4pOUbw==
X-Received: by 2002:a17:907:948f:: with SMTP id dm15mr13497491ejc.52.1643541146720;
        Sun, 30 Jan 2022 03:12:26 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id nd9sm12129510ejc.169.2022.01.30.03.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 03:12:26 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: remove c2h_evt_clear()
Date: Sun, 30 Jan 2022 12:12:17 +0100
Message-Id: <20220130111219.6390-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130111219.6390-1-straube.linux@gmail.com>
References: <20220130111219.6390-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function c2h_evt_clear() is just a wrapper around rtw_write8().
Remove c2h_evt_clear() and call rtw_write8() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 2 +-
 drivers/staging/r8188eu/hal/hal_com.c     | 7 +------
 drivers/staging/r8188eu/include/hal_com.h | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 266bb7db5252..c7e8602d2097 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1331,7 +1331,7 @@ static void c2h_wk_callback(struct work_struct *work)
 	while (!rtw_cbuf_empty(evtpriv->c2h_queue)) {
 		if ((c2h_evt = (struct c2h_evt_hdr *)rtw_cbuf_pop(evtpriv->c2h_queue)) != NULL) {
 			/* This C2H event is read, clear it */
-			c2h_evt_clear(adapter);
+			rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
 		} else {
 			c2h_evt = kmalloc(16, GFP_KERNEL);
 			if (c2h_evt) {
diff --git a/drivers/staging/r8188eu/hal/hal_com.c b/drivers/staging/r8188eu/hal/hal_com.c
index 7f28fd08f0aa..f83375a389f8 100644
--- a/drivers/staging/r8188eu/hal/hal_com.c
+++ b/drivers/staging/r8188eu/hal/hal_com.c
@@ -298,11 +298,6 @@ void hal_init_macaddr(struct adapter *adapter)
 * BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
 */
 
-void c2h_evt_clear(struct adapter *adapter)
-{
-	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
-}
-
 s32 c2h_evt_read(struct adapter *adapter, u8 *buf)
 {
 	s32 ret = _FAIL;
@@ -340,7 +335,7 @@ s32 c2h_evt_read(struct adapter *adapter, u8 *buf)
 	* If this field isn't clear, the FW won't update the next
 	* command message.
 	*/
-	c2h_evt_clear(adapter);
+	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
 exit:
 	return ret;
 }
diff --git a/drivers/staging/r8188eu/include/hal_com.h b/drivers/staging/r8188eu/include/hal_com.h
index 95167f0b327f..4417054c0f93 100644
--- a/drivers/staging/r8188eu/include/hal_com.h
+++ b/drivers/staging/r8188eu/include/hal_com.h
@@ -150,7 +150,6 @@ bool Hal_MappingOutPipe(struct adapter *pAdapter, u8 NumOutPipe);
 
 void hal_init_macaddr(struct adapter *adapter);
 
-void c2h_evt_clear(struct adapter *adapter);
 s32 c2h_evt_read(struct adapter *adapter, u8 *buf);
 
 #endif /* __HAL_COMMON_H__ */
-- 
2.34.1

