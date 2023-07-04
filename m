Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1066E567B
	for <linux-staging@lists.linux.dev>; Tue,  4 Jul 2023 15:33:14 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b82bf265b2so26228805ad.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Jul 2023 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688484794; x=1691076794;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SCJF9OcKxcQRRkN3q/ruFVGi5lpCYguCeajY/bnYrzI=;
        b=Qegsm2xADNZh+vRXK2cGwSSE3B1YCYiMXTRmSn7xMDd2Tlt6nkqF18ivN5gfUmIlw+
         k24HDMJXcV13IoZpJZs9tuQpZ18Tz7yXPHQWhJabyBP75uG8lcYr9B+yv8SlDAqzdFOT
         gUhpZOLojFGm1um+J5VuJUOKZfTuuntNoiZM2lKe7wfQqbymJGwSOIQuVhQJ2sLUtVuY
         uLced89DmOlkOkbrLbiFbW+xDfqFp9v0+fIUq0PT6ElEZ1LujSQJ+yUWyXWMFfjjXSVr
         xrrFyjyFWOTJ0Y7LkdvtoUV8cyan1DiaeBfoWY4qh59KiDDFtL2jOJHPFNsTlsMvA/1e
         E8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484794; x=1691076794;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCJF9OcKxcQRRkN3q/ruFVGi5lpCYguCeajY/bnYrzI=;
        b=Y8ZhHN2Ac2bp92V23ZuGu3s2H8b8hx3HvIXUbWCDenFKvYt8YgmVudfWhjT+dcWR2U
         SVnOKktmZScjGxkgZQ6wP1sFme7lYpDM0l11i2yZVFS2aI9ClzGuly0U9m68lM5DTHLS
         1cXci3WbSQI4A5aErnO/OuufL3RsbR1VtbKnV39R85xVxLBIVO+IvPUEIDJ990/CIe29
         Sl8E7yf1pNJcXQVgpphs4vb8hvF/gJDiIinGkj8D8gHp2gl7Okn6HKCf6e3mb/kdtSgo
         u3Eb6Vik0trGdDk8lTc1/rNAdqoYiC5azH1z4r1G4QdZNuh/XypczQQfgDZj7S7XTo5I
         jUmw==
X-Gm-Message-State: ABy/qLZRgWgOvnAV78l24z5ITNKZGgL0/SIxdYopo5aw4nDRzmLlxtyd
	QmKi7pnT7KRFzXEjfoPGWPo=
X-Google-Smtp-Source: APBJJlGIEOMOr/5lssWZoyi7OaWDUIFclDtyzbu/pokMuqCAwqVTA+MpycSkL2a8oNeVbnXgE2A/SA==
X-Received: by 2002:a17:902:d902:b0:1b8:5b13:5958 with SMTP id c2-20020a170902d90200b001b85b135958mr10492147plz.31.1688484794338;
        Tue, 04 Jul 2023 08:33:14 -0700 (PDT)
Received: from fedora ([45.90.208.186])
        by smtp.gmail.com with ESMTPSA id jw21-20020a170903279500b001b80ed7b66fsm14316071plb.94.2023.07.04.08.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:33:13 -0700 (PDT)
Date: Tue, 4 Jul 2023 23:33:09 +0800
From: Wang Jinchao <wangjinchao600@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: wangjinchao600@gmail.com
Subject: [PATCH] staging: rtl8192u: Fix keyidx assignment within if condition
Message-ID: <ZKQ7tYa9I+PHgef/@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Refactor the if condition into nested conditionals to improve clarity.
The condition is currently in the form of (E1 && E2 && E3), where the
variable keyidx is assigned a value in E3.

Signed-off-by: Wang Jinchao <wangjinchao600@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index ca09367005e1..5da8ac401df0 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -1121,10 +1121,12 @@ int ieee80211_rx(struct ieee80211_device *ieee, struct sk_buff *skb,
 
 	/* skb: hdr + (possibly fragmented, possibly encrypted) payload */
 
-	if (ieee->host_decrypt && (fc & IEEE80211_FCTL_WEP) &&
-	    (keyidx = ieee80211_rx_frame_decrypt(ieee, skb, crypt)) < 0) {
-		netdev_dbg(ieee->dev, "decrypt frame error\n");
-		goto rx_dropped;
+	if (ieee->host_decrypt && (fc & IEEE80211_FCTL_WEP)) {
+		keyidx = ieee80211_rx_frame_decrypt(ieee, skb, crypt);
+		if (keyidx < 0) {
+			netdev_dbg(ieee->dev, "decrypt frame error\n");
+			goto rx_dropped;
+		}
 	}
 
 
-- 
2.40.0

