Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB43BB124
	for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787391591; cv=none; b=H3x9p9h9MjXzy7wcclO6rFDFGIRce8HvSAl4df9b+Dv4gy0mQ4QYMM0lhGij6XL4176i6rvBvpn0P4TeVNqDGfx3hrM6qlGCL8GUP/EpJLtPOsnZSlVmNSbe41wkhyeDf6G76gADWVw6MXyCGtUGS5xN8ClHcv5lKFZh11dFzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787391591; c=relaxed/simple;
	bh=mouuZA9THvSsjWzvxEAjOQo/9asAjwSSIZvEjUmcLAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFoaqr/W46qkhUjRZ4EY8+ix2+XCfF3O6Qj7Y4/iLfBTwwPT1arPYzoVEmZRabJKoCfAa3iA+wpive6GYkOWWUEBM4NP6wxSipwvYxyXeBKBZ3+Beiu/bKW7BP7XMTiRKvVWbaAJMQvSGv9RhooNIgzuQXiLgF/CgrY9iegLAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFm6ITgH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFm6ITgH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2055573c8cso271777066b.3
        for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787391587; x=1787996387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=suTUI2pDSFu8kIDNI0LEi/ZS/lfD2XiyEWlySHF3mQ4=;
        b=ZFm6ITgHmFPP4/27anIJbROGsux0s9on/sCN1sPRtlSpIWa8TmKBLoKit+M9r3bcry
         tvL5Y2o5qyy8ZEZiiNUKUuHDKhHgB5x28+kdVoYyWSLEA+L6DV4kRfEYr/7oTHYt3aXJ
         m68XWtIXmEY0AbFMEdTqQ6UmePby5VTLJIE/qvfQaOeRxseStvL3VukobrHTaOTVGb1P
         y1uALF48g+hzTID1dKMVAZg/SqDEGb3pu7q4tQwawgnk1BtQOefIxFRmuRMsjjsgCNy9
         l/3h+9rcatOIED2Hu2Yp9nE11teq1kWd9zkV+Sl9p7uECSA79/LqVUmywQYtUWgso9Ec
         egcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787391587; x=1787996387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=suTUI2pDSFu8kIDNI0LEi/ZS/lfD2XiyEWlySHF3mQ4=;
        b=VWvO84nvZiB5J8UT31G7+RToXJ2p8qH8M6VcNUK35EQ0hnuRJdfElo+B1ftGDFZQjF
         rtaYYDETmq80ieavnnNe+YNvuAb9u9BnJSCQdr7+iOBuNzxOf+sKpPKYBXX3YYVBB4Kc
         MFJL1J6+dssV7ui5HgDukgqg97pzlxGK6PecluhNqC+1LPu7Rs8lJ5f2zJxKcpRl7JMp
         D8vOUhUd5DT5qwu5Fun2sK1n3doeTgiTGQpvS7oIgPDA41pzhjhd3nl5cTAJ/zii2h2s
         gTauObMeRlJX0abRgP7Zv1SIFg6iiYNe1mDHaZMLn/IHvdEy4KrpeA1nMYJU51a9mBGy
         /WIg==
X-Gm-Message-State: AFuF++lqv80rPDpGd6hIWCK6V10pJLz/wyQ4LVac0db2Fn6kMRpIjXTv
	5ovZJyFfo5hfjl+tmcdjQt7MYVpQpM0QsLYHv7iZkgNbUN6vHQ80+b0Y
X-Gm-Gg: AR+sD13RQmcMP2dN51X8yYoYpZg7ABJDqm07QZdi9CvI6ryfkleiDMQNsWh2r6T2Kmh
	3tWeppKDRVIvkcaY25/1IgcCLyxroTeB+GcIzKwoaLfyV84zayq5GeS/Oe8PX6IeV1EtCnR/7J5
	MBg7pGDFvwjnW8/249/hE88UkNS0VWOqJtyNkUdJOslONQbvpTrdjgcCDG5V4m+0dnRE+7cXkj2
	DKf9o3tIGYkPtbv5UweMkd4gmlPReeL+7A6atdB0luqklTA5WNP6l5fRcD0nzMU8fgtKqbPz9iR
	7gBiF6M9zmPKbc+d9Rdyuu4Zystgq9T01TmQaf9vJ1T8N9B0fWF9eiG8lRJxRJej7oOZ2zL8vYw
	7yWQDkEor+EkvMAQ7FycuePdIZgjMUECGueKVvE32PpMsZ9boUz8lZqOje96w0hWoib9sjZdXIy
	nQALh5MP5/HxmbelhSIZ7nvkUUS2wMcI29eV+jg9fIjD7AjL6B4gjKTX8lWJz5y842oOCQGQ==
X-Received: by 2002:a17:906:6312:b0:c24:6445:d19 with SMTP id a640c23a62f3a-c24926f3cf9mr531146566b.17.1787391587035;
        Sat, 22 Aug 2026 02:39:47 -0700 (PDT)
Received: from potato ([31.176.173.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f8f2asm251682266b.36.2026.08.22.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 02:39:46 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] rtl8723bs: remove misleading comment
Date: Sat, 22 Aug 2026 11:39:42 +0200
Message-ID: <20260822093943.94739-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment says that rtw_unregister_cmd_alive function is called by
the ISR while it is called by rtw_cmd_thread which runs in the kernel
thread context, which is why it's being removed.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index b9f8cf1014ed..a0ae2849f2d7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -891,8 +891,6 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 }
 
 /*
- * Caller: ISR
- *
  * If all commands have been done,
  * and no more command to do,
  * then driver shall call this fun. to power down firmware again.
-- 
2.53.0

