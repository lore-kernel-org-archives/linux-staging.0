Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9799872
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 11:56:20 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q6so11698848wrv.6
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g2xGLfnPPWqf54A6afov/9HyHzSrHz7FHYNX1qYDG/8=;
        b=bvcRXoUpV0tyWRQHkCxXBGYcQuP9++d0ETBCxp2QzTQj1pOL3mhLrPNlSOpyQ9ws4P
         clpObso0ZzlzAzPXmiGeDJ2v3w1CroSfc2j7BCe8X/K2C1p5Brw0tLIm3GKV5F3pRqRe
         uhiq+65lqO1puBb5r/s9S9D9zwbl1vLilwzbWRONuQjdJh54N0n7+E/gVwUzLHhcxsX+
         J6HhSVOz+8pH8fW2pCWmpi3hKXDI/LLN17+ey0xAcoT66Od99ajMSg71g74l6zOnec37
         rsR+wUhSgsOML0V7WEnQ8qE/UZW4s7GZkNnLcAKnJooyu5G2aW5Hcxo30iMkqWtM2YmG
         Xy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g2xGLfnPPWqf54A6afov/9HyHzSrHz7FHYNX1qYDG/8=;
        b=G6Ifs+cpbAy8gyUrd3O5nShS+Bz1bcRL8MLbwHOen6QfOk+E1aOdLwRMd86IXj3IqX
         w6hAJdoMvtYsSxpLWBW3J6WWktzQhs9p3O7MDZmqJ11pUKd/1O+9g2H2SiGuthwKYlx7
         ME1yyv7Equvc8t9h3eZFXeYmpfT0MQjNFqVY83Toa/cJSnsbbkba/6L54F30gvdGTkIB
         BaCVmh9W0qboL+OV8qPZ1xJgaCkShUf9Jf+7rDgJn5bUcmbOFVJihra1IiebqvevM02f
         TwSa4WZZ3DSjlK07bI4KtPzHUDbkkUobUZ/LmhEvPFFIu54DASBRIdS9eBQkhZf8YpvI
         S4/Q==
X-Gm-Message-State: AOAM531cyL762fJD7fwEYNt3YmZZ6y6sOvm2LtaX9YMfRW6zdkYwRVUd
	r9Z8fty724JfOdVIxA1YM3o=
X-Google-Smtp-Source: ABdhPJzRoO7OxaZuMnIs1lR/oYUcvVZVP3Y1tkFoIbWgvTFojB6bsitGNLJsu0DGc/wMdXHXg1X6vQ==
X-Received: by 2002:a5d:694f:: with SMTP id r15mr17841148wrw.86.1629114978987;
        Mon, 16 Aug 2021 04:56:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id i8sm8397107wrv.70.2021.08.16.04.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 04:56:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/4] staging: r8188eu: refactor rtw_is_cckrates_included()
Date: Mon, 16 Aug 2021 13:54:27 +0200
Message-Id: <20210816115430.28264-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor function rtw_is_cckrates_included(). Improves readability
and slightly reduces object file size.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2
Refactored to more compact code as suggested by Joe Perches.

 drivers/staging/r8188eu/core/rtw_ieee80211.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 0c7231cefdda..964255a8c778 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -70,14 +70,13 @@ int rtw_get_bit_value_from_ieee_value(u8 val)
 
 uint	rtw_is_cckrates_included(u8 *rate)
 {
-	u32	i = 0;
+	u8 r;
 
-	while (rate[i] != 0) {
-		if  ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) == 4) ||
-		     (((rate[i]) & 0x7f) == 11)  || (((rate[i]) & 0x7f) == 22))
+	while ((r = *rate++ & 0x7f)) {
+		if (r == 2 || r == 4 || r == 11 || r == 22)
 			return true;
-		i++;
 	}
+
 	return false;
 }
 
-- 
2.32.0

