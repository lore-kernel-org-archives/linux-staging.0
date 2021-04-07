Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D665D70
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:18:05 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id v70so17610013qkb.8
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xIfUyYNnxYrEolMH/sMUfASa4wWn6Y+xP/kPL0t8+t8=;
        b=SurtwhsEkXWoCwNSVb3ddR2j3JJ7P3SY5msQzOw1nGih+ntgNnrS/fi8MiKno0gOLw
         6lv1KVyV95JkNahl9RrhBHIvcSe7wQoBDUM19FXFKctmb51hXfyavJ2X+McgGOpK471L
         MDSA3bNXUONeujYSLH8dtHL47fKcCtswOSqhiJ8M7VmSYBWQl/NqFw4mv6dGPS+hZlA5
         f1E336B7iEeikgxLNOrCg63Ptndqn6FMR+y5kCQRzQwF6l6IFaAmdOh4SSkNiJFVacjr
         qfk2pWDgibZd/KSjk1jBYO0xLcL3Rn5VVKAYMs+KLXKQQFWwypazDx9aWamJFrH3hazP
         0VZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xIfUyYNnxYrEolMH/sMUfASa4wWn6Y+xP/kPL0t8+t8=;
        b=kBcDgp4yVlDCXCB5XhJyx8jjlOcuniakihRQw9DQ8fzy5alYMb31SstRhaQHrR7vtI
         4vmlt/SiPMZ46LLo8GD/JVuITJa15BhnNjFsEjug7iN4btfcD9KbRbVBLaPQ0f1uVyDd
         lcU7O0Oe7i33owRkOloyDlcGt8+r5YqnycD+JzdRDyO1WUfqV1gly6TSY217DYZ2J+sU
         05byOK4N9E6QYKz1JBHL+Fi2Rz8ApYtIYqRduWhDg4utBwGpTygd8hU8RAKUq5ekzovK
         Rfb/Mm0P9d03bNnAgUt4kgn+TkRI9hCkBD6Y8g1VpWXoNdfhjEZ+FaUlWpNLjs0ipB1d
         eAdw==
X-Gm-Message-State: AOAM53086QHPCGvZEcDDSZIdZy5TLQ/YR/zEYz7n0o/QxTaKaoGcdLZV
	Ymb0ZrpEQdrTa+8vJlXGEMk=
X-Google-Smtp-Source: ABdhPJwFBPqZjnFHkJ2ofAOMmXA8OmnULvi8AcSJBtHEIjkij2FrEBkcRzVpSCaxKcRJhnjtO0Virw==
X-Received: by 2002:a05:620a:110a:: with SMTP id o10mr1711378qkk.281.1617776284949;
        Tue, 06 Apr 2021 23:18:04 -0700 (PDT)
Received: from ubuntu1.attlocal.net ([2600:1700:5435:9040:8fbe:64f5:9b30:a6f0])
        by smtp.googlemail.com with ESMTPSA id z6sm15771716qtv.69.2021.04.06.23.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:18:04 -0700 (PDT)
From: Vardhan H G <crazylonestar7@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Vardhan H G <crazylonestar7@gmail.com>
Subject: [PATCH] staging: rt8192u: change constants to be on right
Date: Tue,  6 Apr 2021 23:17:49 -0700
Message-Id: <20210407061749.13460-1-crazylonestar7@gmail.com>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When comparing a constant with variable, it is recommeneded
to have the constant on the right side of the test.

This patch silences the following checkpatch.pl warning:
 "Comparisons should place the constant on the right side of the test"

Signed-off-by: Vardhan H G <crazylonestar7@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
index 379a2ccf4d9f..6823e405eeb8 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_BAProc.c
@@ -140,7 +140,7 @@ static struct sk_buff *ieee80211_ADDBA(struct ieee80211_device *ieee, u8 *Dst, s
 	// Dialog Token
 	*tag++ = pBA->dialog_token;
 
-	if (ACT_ADDBARSP == type) {
+	if (type == ACT_ADDBARSP) {
 		// Status Code
 		netdev_info(ieee->dev, "=====>to send ADDBARSP\n");
 
@@ -156,7 +156,7 @@ static struct sk_buff *ieee80211_ADDBA(struct ieee80211_device *ieee, u8 *Dst, s
 	put_unaligned_le16(pBA->timeout_value, tag);
 	tag += 2;
 
-	if (ACT_ADDBAREQ == type) {
+	if (type == ACT_ADDBAREQ) {
 	// BA Start SeqCtrl
 		memcpy(tag, (u8 *)&(pBA->start_seq_ctrl), 2);
 		tag += 2;
-- 
2.27.0

