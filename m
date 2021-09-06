Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A23F3FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:03 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id i21so15151401ejd.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qc2GV8eyLuBArlRm4HdaZBsA+XfwTyg8ciFIuh8ckds=;
        b=pmoVLdJklMzp16dnMTMZVchSnb5AYgOoCCNU+noJLZ4pd31XGwu4cBCXMIMpubJxVc
         cZGx7Q/2+0qwKTrw8wxYKcBpc/6wRdWuasF44Y0oTLrsoPIJL9aOqhdwJ8MJrfRQ8mOn
         XmWxkBfjJEHdhmfgTMDJhE4SyQwJ8cz8XDRusNeqFVJ8SAFI5plojKqMEBKfEjTf0vwZ
         3/PPJheRnp9CebW8FdrqyFdB1oHbkQDwKgHHDG3FY8SnX6wXlJZF84eJSt/Xf3qLjVEW
         aarmHKImWuJu/abMicuO9WfsiaDSrKp8qlp4PpuCP6Rtw+s2rKKq/Mbb0zjwUJYp7r8u
         vYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qc2GV8eyLuBArlRm4HdaZBsA+XfwTyg8ciFIuh8ckds=;
        b=YezBP0AwnkU0DLVxDZKVfhQaQvvL7RzwUJcvrCQ/zPlPtMyxfQvQhAZeJoj7ap1MxE
         ao/63Lck79DeJtv4mCRfVhFHSs1PT1t7sqx91YfqnXivnEFj040HHqe/gr+k27nb0xO4
         meb4ndWad05bS1ISSJWb9OH/L7vuqw6wzkIzSWNHlzcJHIS4X/bN3bgi5yTqgIuapCc1
         k4Fhgfld+p+NC5Id3+NeXGL751+Vs4DbT5ONNyAI8+EeCN9JBCM0OcZplgAFxh9eugOg
         V8pApmT3t4SLkruiagbTS66UYIJUF2Pvoz8qQQNh7Pfpikp55EkYlQSePL6MK4cyMhkR
         +XFg==
X-Gm-Message-State: AOAM531Amv2RvOOrxyI4MkI0tvcv2zDiyATXzseLNZ05Y4z26ZVaWwUF
	IQ0EfGp9VlmXQYc9Mmg2s/M=
X-Google-Smtp-Source: ABdhPJxFyOr1ERQ6qj1fHmJSBjHzQKvakGk9IBX6omhramNy7o4gpxkRBi7IJOsExI0qCsUOYtptyw==
X-Received: by 2002:a17:906:d52:: with SMTP id r18mr14819291ejh.47.1630954981814;
        Mon, 06 Sep 2021 12:03:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 22/40] staging: r8188eu: rename hal_EfusePowerSwitch_RTL8188E()
Date: Mon,  6 Sep 2021 21:02:05 +0200
Message-Id: <20210906190223.11396-23-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename hal_EfusePowerSwitch_RTL8188E() to get rid of a wrapper.

hal_EfusePowerSwitch_RTL8188E() -> rtl8188e_EfusePowerSwitch().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index c7edb9ba4085..b5d0cd332165 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -707,11 +707,7 @@ hal_EfusePgPacketWriteData(
 		struct pgpkt *pTargetPkt,
 		bool bPseudoTest);
 
-static void
-hal_EfusePowerSwitch_RTL8188E(
-		struct adapter *pAdapter,
-		u8 bWrite,
-		u8 PwrState)
+void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
 {
 	u8 tempval;
 	u16	tmpV16;
@@ -757,11 +753,6 @@ hal_EfusePowerSwitch_RTL8188E(
 	}
 }
 
-void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 bWrite, u8 PwrState)
-{
-	hal_EfusePowerSwitch_RTL8188E(pAdapter, bWrite, PwrState);
-}
-
 static void Hal_EfuseReadEFuse88E(struct adapter *Adapter,
 	u16			_offset,
 	u16			_size_byte,
-- 
2.33.0

