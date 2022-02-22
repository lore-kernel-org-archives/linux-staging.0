Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F507E
	for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 08:28:59 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id s14so17649551edw.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 00:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0UMhoqvO6ENLxC1LYsXqT72OwTuutJDRaWt1RySjxzE=;
        b=frQy8xE5Q48UYglVBLtvg+MTWzX1vQejrd8uuX/0WsUkOqCechJJCFAEKyCSsvgLmN
         i2hcyjrQW5aerzDaveJCGvbAPZBXV+cfuzcvElznoO1KS0Eg9BD8/VnPSstA1ZJB+cYD
         O+/om76OPESqB1JcBpChocbdIpEP6oAS+R65b9zfe2wiSQ3B+ElKj/eUNz6rIOEfcpev
         QdpQIc/B767WGnAo9BJmzp4GvZzF0G64xkch0oyYXV12sr0bNwEiZbnlA8C0Mazq0Flb
         IIq/k7PPXxtgBMnNuqsIOr/MtU+xJuGFw2Jf6MmD/bSJo9GZMc0ARFteGUzqIvPSJMVX
         ClWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0UMhoqvO6ENLxC1LYsXqT72OwTuutJDRaWt1RySjxzE=;
        b=eWUZ1Pzrb5KV2qGdShaZobvc0Zz+8uTOBcZtvz6jbv+2JbcLrDO6GEkgWQtm6n8Se+
         ZePqyxpfHhuiziq/kDafFf74Cice5+wMybEts2xEvBtcijEWrbfudUTAgm+230JrIvit
         XD6GDhtwgAr1cPUXg/2aYRcnYMpMCB/2cLUhwwSl9F7AP35aMImQb6VsAwKseMsA0u62
         clnQJ0/NtwaB3a+SOhZ+4tynkxi5DK3XzKUMsk8SQGqiZlfRp26X+CwHapQu8QDq53cQ
         7hYY5Nh/T2XdlvVEn1EGLmVN9TMFXIye7BgnUgxtPDqOjTbGQD88K/XplTU/c0c0kQfg
         vQ0Q==
X-Gm-Message-State: AOAM531o4B9vVzm5u5SJ+pkWlfai1pGaQ9c5DLsixRLQ4VUfOl7HVY41
	OwwKBeXh7TS8/x3l1rRzxhA=
X-Google-Smtp-Source: ABdhPJz2e1oWv0FkjbWR3Z//1hhYeL5xwBnQ9MW/NyOEOt+kqyCib93ouedmgh+gvwlQNYxTn23NJA==
X-Received: by 2002:aa7:cb8b:0:b0:410:9aaf:2974 with SMTP id r11-20020aa7cb8b000000b004109aaf2974mr24726526edt.173.1645518538404;
        Tue, 22 Feb 2022 00:28:58 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id v12sm9831926edr.8.2022.02.22.00.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 00:28:58 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/3] staging: r8188eu: refactor rtw_ch2freq()
Date: Tue, 22 Feb 2022 09:28:46 +0100
Message-Id: <20220222082847.6687-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222082847.6687-1-straube.linux@gmail.com>
References: <20220222082847.6687-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the array ch_freq_map to a simple integer array and use
the indices as channel numbers. This simplifies the code and avoids
looping through the array to get the frequency. To avoid out of
bounds array access return a default value for invalid channel values,
like the original code did.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
Added a check to avoid out of bounds array access.

 drivers/staging/r8188eu/core/rtw_rf.c | 41 ++++++++++++---------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_rf.c b/drivers/staging/r8188eu/core/rtw_rf.c
index 51425971782b..68178699a0c6 100644
--- a/drivers/staging/r8188eu/core/rtw_rf.c
+++ b/drivers/staging/r8188eu/core/rtw_rf.c
@@ -8,32 +8,27 @@
 #include "../include/recv_osdep.h"
 #include "../include/xmit_osdep.h"
 
-struct ch_freq {
-	u32 channel;
-	u32 frequency;
+static const u32 ch_freq_map[] = {
+	2412,
+	2417,
+	2422,
+	2427,
+	2432,
+	2437,
+	2442,
+	2447,
+	2452,
+	2457,
+	2462,
+	2467,
+	2472,
+	2484
 };
 
-static struct ch_freq ch_freq_map[] = {
-	{1, 2412}, {2, 2417}, {3, 2422}, {4, 2427}, {5, 2432},
-	{6, 2437}, {7, 2442}, {8, 2447}, {9, 2452}, {10, 2457},
-	{11, 2462}, {12, 2467}, {13, 2472}, {14, 2484},
-};
-
-static int ch_freq_map_num = ARRAY_SIZE(ch_freq_map);
-
 u32 rtw_ch2freq(u32 channel)
 {
-	u8	i;
-	u32	freq = 0;
-
-	for (i = 0; i < ch_freq_map_num; i++) {
-		if (channel == ch_freq_map[i].channel) {
-			freq = ch_freq_map[i].frequency;
-				break;
-		}
-	}
-	if (i == ch_freq_map_num)
-		freq = 2412;
+	if (channel == 0 || channel > ARRAY_SIZE(ch_freq_map))
+		return 2412;
 
-	return freq;
+	return ch_freq_map[channel - 1];
 }
-- 
2.35.1

