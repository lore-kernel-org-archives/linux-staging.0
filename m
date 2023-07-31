Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057D217FE9
	for <linux-staging@lists.linux.dev>; Mon, 31 Jul 2023 11:06:37 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991c786369cso638095766b.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Jul 2023 04:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690801596; x=1691406396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9MdJiXGwyAkiC9mDh3NLqdU991BSWOeaVMH8LHr/VMM=;
        b=gIBxG5FZsM49TCiOEwGy/nkwgZSwyZyL00R5QXTBVFthMK/oAShm4WhD/TXuiwXwAI
         QB3kFzfjjjuwFi2fcm3s5vDCHAHuDd3jTJwm7TrtmCgyiYZt4k7N//qivLlHeICX5pIZ
         cTZcmbMu1BF6jNF32D4oubDsjfLg/W9yzQdWHRQKetUsSeoMw5Hv7LlCK8B6CQuT0Ad+
         rdrYY2KWMcfBDyHawpRcue8tCxUPRMPMmCpfN/J822SlEThnD31mYWEQGTpaVvVK4uwL
         FjR7WpEjzhRhV4O8IKbUmqEvhr4ZvNWg55NFSN+TUgszNG2BEnrCxZHfrgZBITOYELWa
         9Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801596; x=1691406396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MdJiXGwyAkiC9mDh3NLqdU991BSWOeaVMH8LHr/VMM=;
        b=T8kr0ijhn9GyF+WiHxJR+uHXeJTjwLAbDO6dw23/Nn3O/whkidmLCEt2TEe5H0Gc9J
         wYnOObF70HwcST+2R6a8OTeXaF+/Eki+Eq/a0NMsxwuigIrdXFqo47AgTre/O4Ug1M6A
         7GwBREFPpPHykTBPY45yJY1v75Wvy+/E7J1F1Nyu6HWBlVhjAQbLwLzRPOaiV75WFkxk
         oWXuvmGBjzO1cmFm52ZsSbJoL/pm88i75eAImmBYY1zDpP4aeGiNzFJYqRYJ1hGvRf1x
         qnrsahhqYr5J6eICTxJ61cFjxjFYMF49nIaIX0YzB7sxq+diI1IcPpulksu03SWldv9O
         t9tg==
X-Gm-Message-State: ABy/qLbOb8LD0uMgEUzeDgf9NtgQZmSDuxWKDdbDHHOpiRc+OIdThO2v
	Q/DzQaDiSsb8RFVJggvNbu0=
X-Google-Smtp-Source: APBJJlFysB5VO6gTBbAO78UVacGn24mY4IJgu1Ob2slRxFWBlhQfKkabRQJlBk5/mrLe8jps38MZYw==
X-Received: by 2002:a17:906:9b:b0:993:fba5:cdef with SMTP id 27-20020a170906009b00b00993fba5cdefmr6812802ejc.8.1690801595849;
        Mon, 31 Jul 2023 04:06:35 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906089a00b00992ddf46e65sm5961001eje.46.2023.07.31.04.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 04:06:35 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>,
	syzbot+b08315e8cf5a78eed03c@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8712: fix race condition
Date: Mon, 31 Jul 2023 13:06:20 +0200
Message-Id: <20230731110620.116562-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In probe function, request_firmware_nowait() is called to load firmware
asynchronously. At completion of firmware loading, register_netdev() is
called. However, a mutex needed by netdev is initialized after the call
to request_firmware_nowait(). Consequently, it can happen that
register_netdev() is called before the driver is ready.

Move the mutex initialization into r8712_init_drv_sw(), which is called
before request_firmware_nowait().

Reported-by: syzbot+b08315e8cf5a78eed03c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-staging/000000000000d9d4560601b8e0d7@google.com/T/#u
Fixes: 8c213fa59199 ("staging: r8712u: Use asynchronous firmware loading")
Cc: stable@vger.kernel.org

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 1 +
 drivers/staging/rtl8712/usb_intf.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index a2f3645be0cc..b18e6d9c832b 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -327,6 +327,7 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 	mp871xinit(padapter);
 	init_default_value(padapter);
 	r8712_InitSwLeds(padapter);
+	mutex_init(&padapter->mutex_start);
 
 	return 0;
 
diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index 37364d3101e2..df05213f922f 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -567,7 +567,6 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 	if (rtl871x_load_fw(padapter))
 		goto deinit_drv_sw;
 	init_completion(&padapter->rx_filter_ready);
-	mutex_init(&padapter->mutex_start);
 	return 0;
 
 deinit_drv_sw:
-- 
2.34.1

