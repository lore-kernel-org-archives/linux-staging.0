Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DEA7B
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 15:49:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a23so26936985eju.3
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 07:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTYsVbDSvOAH4QYIkGgRDagMrOUXfFeihf5F3hcHwp0=;
        b=JEkHopJZKie/5DpEOnlLTQV+KtGhmNVl3cJqcA0CZGOZErKJxZvqO3g3aK6DHFuetW
         giGTYma2wCdU7kOlbDPI5FziKoLV4ukFcPnKy25N5PKSmZHKhBjN3aZ/m84nFwITAa98
         MhbGTXcAi/C1z3l1WMYeB8VTeYm7vzHvuU2seJX29IH3/NjBjhvqw8cfHNlanrai3C9B
         +UOZJ85ITqFLAqqs4lADjzCO+FNI6WRoiXwklnkTP2oG2Q67n9uwBKLOZmJZQ82GaAHB
         QTqOBElNBjhMChfMUTcFHm+RSP9wLcSx0uqoFVeSvNrfWWCINHgjkqM0iNi19sR9zwly
         v3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTYsVbDSvOAH4QYIkGgRDagMrOUXfFeihf5F3hcHwp0=;
        b=yaPXFkmAV1cfwWYwAPhx8a0kcQrdrU1rJqsi5UCJFmLYIyL5yYxsVibNMnByo7tc1W
         lJ57i1aP1qyJeMVfZzBO1l8Qoe63w12NlFhlK0mUAjbYS31ao5f1c1Ro8aqIZlHqeshZ
         wxUil3Nvitp/+ovtoOQMhvaZI3VAesgq0tzgHEedt5R2DsmsfsD7l6BIBkzXf3hf+1Ir
         22YG0WEDDHZ/Oyejq/+gwwM4VmKnHUqA6UZ4OaunAGOnHIdDrlIZg5MSvy/0Bu/NYnCW
         09xrHQU5Q+VmS4ZoEy64sCJP6VG/UZUN/aB6Z2Yem+Re3HoED2F7B6Ufkm0SRv/pdl7R
         suSQ==
X-Gm-Message-State: AOAM531R5htFgDiw35T/Ok/GCyfclEIra+gotJ4UKtCdFNbUmDrgl7qo
	j3kISjj4DSd4UV/jyoAMNJY=
X-Google-Smtp-Source: ABdhPJxdPwhPAac2wjri7r1WjHPjTNs0Zti2xNCwFgEFycMioLNm+X7124lC2XdcWXYkGpElccuBRg==
X-Received: by 2002:a17:906:538f:b0:6ce:98ad:3100 with SMTP id g15-20020a170906538f00b006ce98ad3100mr13288782ejo.566.1645372144858;
        Sun, 20 Feb 2022 07:49:04 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id ew6sm4178979ejc.217.2022.02.20.07.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 07:49:04 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: refactor rtw_ch2freq()
Date: Sun, 20 Feb 2022 16:48:46 +0100
Message-Id: <20220220154847.7521-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220154847.7521-1-straube.linux@gmail.com>
References: <20220220154847.7521-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we have only channel values from 1 to 14 we can convert the
array ch_freq_map to a simple integer array and use the indices as
channel numbers. This simplifies the code and avoids looping through
the array to get the frequency.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_rf.c | 40 +++++++++++----------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_rf.c b/drivers/staging/r8188eu/core/rtw_rf.c
index 51425971782b..945a40e6511a 100644
--- a/drivers/staging/r8188eu/core/rtw_rf.c
+++ b/drivers/staging/r8188eu/core/rtw_rf.c
@@ -8,32 +8,24 @@
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
-
-	return freq;
+	return ch_freq_map[channel - 1];
 }
-- 
2.35.1

