Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A016D0D
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 22:00:11 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id k40so17738058lfv.7
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGZcYBQ2b4s2j0BWEMwIAhBZh9sckOPxFzNpQIAfc4g=;
        b=GZPRoV/Kb2mBlgdPnYzkyjpeRAK7XqXEHq3/9xHql/STuB4+0uf2DymK/akAs9Ftr3
         lKf4gznA/xMwq5As9VHiv3/hgz3KJ/g97gDlfPketd+9uUAfo0AEQ8lz7BsY7j9a45do
         p2Ss46pojf4BFv+sgx3PjsFlsZbhmRoLTMS54PejXlT35Vv4GrCC+WB9V0QoVsIe3wHM
         Tmv4OtOJrbodaDvRAJUa8CGlkH6pbIK8LVjWK87alfMG5LL3uBbG3DTzrlqvD5+izB6K
         fr/ggTeVaIrW/QCWIEzQ5AiMOYh5wejEALjraM9UZ0mUip50d3eEQJxpWUWFicALxTQx
         jBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGZcYBQ2b4s2j0BWEMwIAhBZh9sckOPxFzNpQIAfc4g=;
        b=LKNZpzobKngrs36w9WO2A/uZE0oLJoWWhQi83UZYNNcGSCmIHKncqdF1wgdb4D2k52
         o1m+8XOjikF7hSmw2i2PVNhi81omVUvTjd1VkVyICIfF2hK8USj98AwnlquWWN1H8Urn
         vVesEdB4toMcOclp98W8cu+h1GIRBBnhmzSKCHaS/1jg0dX964BHd42UWsioyjJUj8AP
         ITFsifOvMPuX6bQeYGP3m6tMmu2CRZ9h6z6BBY4lRlSJuhM+qYNL5FdfQpmXN9WQt+MJ
         f2AdpyvufdxJ5C7IVlzyrrTDt+fzDiAhmuvDqGrN9yXxt+Sny/3vgflC0wQ5dUjPahaP
         ktMg==
X-Gm-Message-State: AOAM532Aebsyt9GwmcFkKh/UlDEgL0MAY6CgMM880UFWG2oHOSDHwIsj
	SUqUg3LrhblYV0q/ESc9knI=
X-Google-Smtp-Source: ABdhPJxh8EjFB+47DApBXpyZ8syX5c3mpbt/xUX3NSDlq19VHF59lYaKMqhlixA3iuzxYfFlJJ8F3w==
X-Received: by 2002:a05:6512:3d17:: with SMTP id d23mr9769937lfv.596.1623621610131;
        Sun, 13 Jun 2021 15:00:10 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
        by smtp.gmail.com with ESMTPSA id d9sm1280739lfi.287.2021.06.13.15.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 15:00:09 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 1/3] staging: rtl8712: remove redundant check in r871xu_drv_init
Date: Mon, 14 Jun 2021 01:00:07 +0300
Message-Id: <d367e5f39f22af44c545f8710cc18fb00f10e66c.1623620630.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1623620630.git.paskripkin@gmail.com>
References: <cover.1623620630.git.paskripkin@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

padapter->dvobj_init is initialized rigth before
initialization check. There is no need for any
branching here.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/rtl8712/usb_intf.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index dc21e7743349..c482a6d1998b 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -380,13 +380,11 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 	/* step 3.
 	 * initialize the dvobj_priv
 	 */
-	if (!padapter->dvobj_init) {
+
+	status = padapter->dvobj_init(padapter);
+	if (status != _SUCCESS)
 		goto error;
-	} else {
-		status = padapter->dvobj_init(padapter);
-		if (status != _SUCCESS)
-			goto error;
-	}
+
 	/* step 4. */
 	status = r8712_init_drv_sw(padapter);
 	if (status)
-- 
2.32.0

