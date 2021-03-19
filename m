Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1A5F
	for <linux-staging@lists.linux.dev>; Fri, 19 Mar 2021 08:58:45 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id l4so8416239ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 19 Mar 2021 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xTE0saRdg1HsN1EnA4Jq0r+/ZgbH4gbf0pvKWFq0G4=;
        b=sHbqQmRLJsfWvwKSFK5pLm8ZJhyl1QxhYB8e/ZHzRxnb3mZpcYevIa58/8MORE93dY
         rXaHXBdBiVU2C71qHQF+88WbETtLV0aQGM613W6a5yMp/sZKBI1NNhPxNGWYcJ7WJSzk
         wMj2KZZ0K/ObFf1pLHOYUEUNt9HFtF1OmysHS5nWCGbuoSE197J0q1tMWGgF17/E3FfR
         FzjY4ZrhiQDFF10amYSyd9tqyj6/UXyEkTbCpMOudmCc3+Qc5y0UOWy/01LodzY5Fr2R
         R5kRdiafUe5mYxSRjUOjf1fk9eXxA150FywvxEx2JxL/sy8TrHPYX+euMfoSHYZvyrq3
         k3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xTE0saRdg1HsN1EnA4Jq0r+/ZgbH4gbf0pvKWFq0G4=;
        b=CvPOZiyuy5yR7ri8RGLf2SWa4Xcat8caaLFvmLxL0sYW7YpIhO/kfgUDwNlYNTyrF7
         8XzZQoRdB/bt2EFGhNsiMUe7IgemvhQVInqKvEpesKhi+GsdrHGYYJveqxG5+KnZJnKJ
         HnFoAb7GfxFS9ozzxvtNr8cNUBN0OanVfp43dhqTsFLs/U3wVOojZ8998NS/73bN1GJV
         n1XZ/6nGlSDt+rkmGcNlNH8gpp/x0mZ36yEU6uWMLhLEyl8S6uQ1nkfprKU7G7z1ELPH
         L9PEDiIdoEDQpjZWGBVTFYbmMAx5ASw16BKK86fmrbWjvcw8g8vQ6WbQueSBPyGZoUUP
         za2Q==
X-Gm-Message-State: AOAM5323s6RXzclcGhj39Qt+Yx0a5SYGeld49aVoq6oSeZxUAXm6T4ja
	LM+9f027c4SzvGMKnAKqf2Y=
X-Google-Smtp-Source: ABdhPJxe1oYFepFttZO8myg+sBvUn/11IPGgad2p6AEhHUgbVCAQHvnIyZbRl6Cc9dQRZt6A1v5JnA==
X-Received: by 2002:a17:907:e88:: with SMTP id ho8mr3167568ejc.199.1616144324555;
        Fri, 19 Mar 2021 01:58:44 -0700 (PDT)
Received: from ubuntudesktop.lan (205.158.32.217.dyn.plus.net. [217.32.158.205])
        by smtp.gmail.com with ESMTPSA id b22sm3447818edv.96.2021.03.19.01.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:58:43 -0700 (PDT)
From: Lee Gibson <leegib@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lee Gibson <leegib@gmail.com>
Subject: [PATCH] staging: rtl8712: Fix a possible NULL pointer dereference in function r8712_joinbss_event_callback
Date: Fri, 19 Mar 2021 08:58:36 +0000
Message-Id: <20210319085836.8259-1-leegib@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC 10 analyzer reports a warning: dereference of NULL
The function r8712_find_network can return NULL and is usually checked but
no check is present is this case.
Fix by adding the check.

Signed-off-by: Lee Gibson <leegib@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_mlme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index 6074383ec0b5..f5886b39b3b5 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -728,7 +728,8 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
 					     r8712_find_network(&pmlmepriv->
 					     scanned_queue,
 					     cur_network->network.MacAddress);
-					pcur_wlan->fixed = false;
+					if (pcur_wlan)
+						pcur_wlan->fixed = false;
 
 					pcur_sta = r8712_get_stainfo(pstapriv,
 					     cur_network->network.MacAddress);
-- 
2.25.1

