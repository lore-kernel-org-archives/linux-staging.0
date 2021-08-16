Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24026D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 09:59:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id a201-20020a1c7fd2000000b002e6d33447f9so2949040wmd.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Numga2hqtD01622lT/5bjEpXP8+Om7SgZ96+WGsQTRk=;
        b=ZHE7l0A/jC1ogN8tUXdtbzpjmzb228cQYd9kyxVufzH1FDPNdeJxzpId5+Ce2e+vaV
         4/rpREGlOYwgAB2boHXyUvOgilOJQBT07cegirefHAm7YTEPwAdOY4MjAtzo07aDYSof
         H4DVlRAoR3DidXoXh4B2/tV3qi8Cgf00yiwWQwCroBGVALojCVFJt46voQ6v6yLKpesD
         v8iKqP41S9hrlpF8d1O8ErAq/sH5wGo5fh82hyIVfyD6iwPLPTwPOb+36ez+64c68LAb
         IGBETucBOIADKTAdfT4d8/+/eesEtIOjynj5QoueLpHvZjxVnZRkqJen4d+tHbnZswn2
         BiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Numga2hqtD01622lT/5bjEpXP8+Om7SgZ96+WGsQTRk=;
        b=ViQBE/hBMFkM+GQQNg13wsSzoL+/8yZrVuXUynxGL6r2ISsyBcIyyCZcW0W+h9x9pT
         Sn/j6fvOqY9N5vytOZZMXEy7r3ZQqAQI6EC+ivUEU4zrQZ56/l7E7q1aSjEZyhTB2Dyb
         45rtioJJecmqNN+x7BS2xlK161t7qRxhPhf5qTqJjNHUzRsjeUvgNXI/Mq0jnYERf9Lt
         3czeT79QByM7gJw7eJVJ+87qDHEVPyqhfKej/M4xRScpy/L59xsZzIj+vwLYUihhNWoW
         9ZUo1v3Unb5UEns1VVQEGbl7GDnWfiFS8jDAjt6w6EJ8YaqIAM0Vus88eU0/Z4t9v1xd
         3q2w==
X-Gm-Message-State: AOAM531S70TAH5s4ZtvwbhXWutD/0h6c5pieIFh4rAL3pBRp6BQH9jQB
	4MZ/1nLOnLVdvrqvZlnpDnI=
X-Google-Smtp-Source: ABdhPJyIke+MPO0KYbzPWDNTLA1WQFAkQmmAMGGdzdCES3dQA0fa43plOkooJrRHwa27bCxbJG5fcw==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr14383455wmi.176.1629107973356;
        Mon, 16 Aug 2021 02:59:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id g21sm1946635wmk.8.2021.08.16.02.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 02:59:32 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: refactor rtw_is_cckrates_included()
Date: Mon, 16 Aug 2021 11:58:37 +0200
Message-Id: <20210816095840.24259-1-straube.linux@gmail.com>
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
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 0c7231cefdda..beff2ab73a1a 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -70,13 +70,12 @@ int rtw_get_bit_value_from_ieee_value(u8 val)
 
 uint	rtw_is_cckrates_included(u8 *rate)
 {
-	u32	i = 0;
+	while (*rate) {
+		u8 r = *rate & 0x7f;
 
-	while (rate[i] != 0) {
-		if  ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) == 4) ||
-		     (((rate[i]) & 0x7f) == 11)  || (((rate[i]) & 0x7f) == 22))
+		if (r == 2 || r == 4 || r == 11 || r == 22)
 			return true;
-		i++;
+		rate++;
 	}
 	return false;
 }
-- 
2.32.0

