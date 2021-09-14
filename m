Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ADD3FC4
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 18:38:13 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so2248694pjb.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWF2WtOQjAs6Ovh6klQEAngD4cRkCFvS0VTfme6VCT4=;
        b=oAqG0kYUZAq4fWtej/OoLFP1uXIib66u548bFdZF+xzysNdaLV7DwuQgeIQLag4YuZ
         FL1yfncvf2QSiTgZmngp2zKcNxJLQ6bQfiKMTYtkxN9HvNYNjhanI0iWe+hVA7tFDIMF
         ijlIQHaoTCECHs6hVqt9vlOkE5tEhGTDgY0D+3MvfQFykHQ8izPaWFdOGcWr+RCOxdcR
         y/AOrbe7XdbQ/PGwBAJscWTQsiM6GCl8q574+CUWChL0PMtUJhitcCCoXzUVgws9j1VM
         mcf7tmQ0llJ4KvCM7TsU0A9NR4WHy2BL5WpCF7Pg1w3qafZ8GZY73xfbz/zbGniLyKRc
         l0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWF2WtOQjAs6Ovh6klQEAngD4cRkCFvS0VTfme6VCT4=;
        b=FZb5y2/uNu7FWcZ+iIOHSvQohUB7BR8V8noNkbbIld2+opBtPeZ8V8PJ3eyFX1YCqY
         paprt34fkQX7pgfhw+Z6yc/1f692Oj1CxKAzGpxrzTn+7niazTAz0VF3zUoE1ubtez0f
         KjjL8gU5X53RaNw7T7qIKKoi75SqGklnRfcPHtwRcTogx5YwPGivQkbq99ucyvvFMzew
         7wHuzvQ7PB8FCL63JRFzgzpSetlFvqFqYUsyshkqFy5QX1KaZCHpr177NjQOoYT8eyMi
         d1xml4rX/jntB2y8ags2nTCR+3fbeOJA5lCaay1MQeRF7gDmL6cohOJnmm3b+UNXXXiA
         /ZCA==
X-Gm-Message-State: AOAM533gapMJkfl10YeB0jckSFpK+hx/QFtiKZsuK5MY/lj37feOoARK
	nxJ8dqlFDfbgWzv1+CgaRtk=
X-Google-Smtp-Source: ABdhPJwDyv2208gHc6mgiSZqW2TaIxABoN8GKmqg5YROIPpzq5i77vw8U9G91CZXpg+kAG2iS88z7Q==
X-Received: by 2002:a17:90a:d312:: with SMTP id p18mr3642184pju.64.1631644692876;
        Tue, 14 Sep 2021 11:38:12 -0700 (PDT)
Received: from u20.vmware.com (c-67-180-127-245.hsd1.ca.comcast.net. [67.180.127.245])
        by smtp.gmail.com with ESMTPSA id u15sm11725173pfl.14.2021.09.14.11.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 11:38:12 -0700 (PDT)
From: ua1422@gmail.com
To: greg@kroah.com,
	linux-staging@lists.linux.dev
Cc: Usman Ansari <ua1422@gmail.com>
Subject: [PATCH] Fix checkpatch.pl error for prism2mgmt.h
Date: Tue, 14 Sep 2021 11:38:03 -0700
Message-Id: <20210914183803.1616-1-ua1422@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Usman Ansari <ua1422@gmail.com>

Signed-off-by: Usman Ansari <ua1422@gmail.com>
---
 drivers/staging/wlan-ng/prism2mgmt.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2mgmt.h b/drivers/staging/wlan-ng/prism2mgmt.h
index 17bc1ee0d498..19e648a81489 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.h
+++ b/drivers/staging/wlan-ng/prism2mgmt.h
@@ -58,8 +58,8 @@
  *    --------------------------------------------------------------------
  */
 
-#ifndef _PRISM2MGMT_H
-#define _PRISM2MGMT_H
+ #ifndef _PRISM2MGMT_H
+ #define _PRISM2MGMT_H
 
 extern int prism2_reset_holdtime;
 extern int prism2_reset_settletime;
@@ -91,7 +91,9 @@ int prism2mgmt_autojoin(struct wlandevice *wlandev, void *msgp);
  */
 
 /* byte area conversion functions*/
-void prism2mgmt_bytearea2pstr(u8 *bytearea, struct p80211pstrd *pstr, int len);
+void prism2mgmt_bytearea2pstr(u8 *bytearea,
+                              struct p80211pstrd *pstr,
+                              int len);
 
 /* byte string conversion functions*/
 void prism2mgmt_pstr2bytestr(struct hfa384x_bytestr *bytestr,
@@ -112,9 +114,9 @@ void prism2sta_processing_defer(struct work_struct *data);
 void prism2sta_commsqual_defer(struct work_struct *data);
 void prism2sta_commsqual_timer(struct timer_list *t);
 
-/* Interface callback functions, passing data back up to the cfg80211 layer */
+/* Interface callback, passing data back up to the cfg80211 layer */
 void prism2_connect_result(struct wlandevice *wlandev, u8 failed);
 void prism2_disconnected(struct wlandevice *wlandev);
 void prism2_roamed(struct wlandevice *wlandev);
 
-#endif
+ #endif
-- 
2.25.1

