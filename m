Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AD72
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 19:20:17 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id mz5-20020a17090b3785b0290176ecf64922so6126024pjb.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 12:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CrRX1VhMUAEaUUT8thGMO0K4ycJXwpkO93/cKNKr8tQ=;
        b=XhiInS6R9iLLmqs38cqgjFNnwDu7I/9x03NmxPL1dcWgNnAwCjn4l21KgMY3rKaUtN
         e7YvoQ21mlK3B/d9LwJnrD9f2YBZ1g0ac0U9zjTOyvQWBI0+2gi5xE01Jcd8IC0+G1Id
         hInFstS90GDkPNh7iCEv9PcYSyvGg0742ACbWAJecBPfBqd0iFlcPlZG2Xw3j99ZFWFR
         NVOfT0b8INoh8XvGINwBSFNLCFkePUYsK8jvdxsxDJzt4pUdHczUxnkgipRDvQChCGmM
         N1s/B6zEt3ku58gvsXl7c6QdJwYkNSvDly1Jj8qAut8fE7eO3NyuNtngityCFN6j/k0U
         CPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CrRX1VhMUAEaUUT8thGMO0K4ycJXwpkO93/cKNKr8tQ=;
        b=bjrpSiOCuV80Dnc44gPF38aUc0a4UN7XL2opLEGty/B30qf/2ostoRZ+OACUKEef05
         pUh/wo4krxlkLXtsS1FJDlq5eiimW3e781+DECpUQQQNzH7XNCcrFH/aUTu1Toi87Km1
         1SgCHfSVoOWscFWdK0GFPpw9v3HkRkBzjxBsT3SJkJyyitXltkk1ljbXQ1HrVIDuUX4+
         2AQ62joViroxglykI5YXXMjJF4pzl6yfWCYYEHqyo5nZgM7yhAlWseFdP8BedN0hk9jx
         3g4d+C1qur94zJjIBviZEmuI8ZSG+BX7MuReDfWo4RnpbGNnDgNmM8dIdO1QGTlZEMoM
         YcDQ==
X-Gm-Message-State: AOAM531sMuUXGZ1aUaC6tJwwog13980kjbBVUhIqdnqTa04SKlgUOYuj
	M7jX52J9gzh15QB1KwfqIy4=
X-Google-Smtp-Source: ABdhPJwx0POUhAiXJMoouWsuLANSyRpZmo+F49XSM6A0A4L/wo2B/f+8I2hkoNem1WUov1b/ihi1Sw==
X-Received: by 2002:aa7:9115:0:b029:359:69db:bc89 with SMTP id 21-20020aa791150000b029035969dbbc89mr24489253pfh.32.1627413617366;
        Tue, 27 Jul 2021 12:20:17 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id f7sm4317096pfc.111.2021.07.27.12.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 12:20:17 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH 3/4] staging: sm750fb: Rename vCursor to v_cursor in lynxfb_crtc
Date: Wed, 28 Jul 2021 00:49:52 +0530
Message-Id: <58dfc3f12deabe3a786ff2b9c75ac24f51724974.1627413010.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627413010.git.benjamin.philip495@gmail.com>
References: <cover.1627413010.git.benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct lynxfb_crtc has a member named vCursor. This name is
CamelCase and is frowned upon. This commit renames it to v_cursor
and makes the necessary changes for the module to build.

This change also fixes the following checkpatch CHECK:

CHECK: Avoid CamelCase: <vCursor>
135: FILE: sm750.h:135:
+	unsigned char __iomem *vCursor; /* virtual address of cursor */
Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/sm750fb/sm750.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 4093d5e898c6..8952154739ac 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -132,7 +132,7 @@ struct lynx_cursor {
 };
 
 struct lynxfb_crtc {
-	unsigned char __iomem *vCursor; /* virtual address of cursor */
+	unsigned char __iomem *v_cursor; /* virtual address of cursor */
 	unsigned char __iomem *vScreen; /* virtual address of on_screen */
 	int o_cursor; /* cursor address offset in vidmem */
 	int o_screen; /* onscreen address offset in vidmem */
-- 
2.31.1

