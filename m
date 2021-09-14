Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC56C3FD0
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 23:12:39 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id bb10so445167plb.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 16:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWF2WtOQjAs6Ovh6klQEAngD4cRkCFvS0VTfme6VCT4=;
        b=KTIvKdzesMcqOvAs7OwROrymyXZA12bmc+NB7bdfGkjEokRuwR0tGexoJk1ja1RD1p
         nEx2U7T25bCDeEGOKZJQElGLw237vqijuQmf47EURwniIkQwZwCmTDDvqWFvb3X/nu5B
         ftFRCnCiiVicJd9tUyUZqtejsfnt+dsD0XJpxqzAg1I8YwcZWlm/rNWpqtmixBrOvNOQ
         evUdW7Gf+DZS60Kaf2Rk+3/pvww/bsQzsL68tueHBgh4XqAnwqlkye9L6JN5VkRsFwRl
         qnPoSmkVD1gDPtzhtWdrWpgH5ZJX74kxQBtcAaowl/JQwfNwwTsoREPcP8TXQJDpIjMK
         8Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWF2WtOQjAs6Ovh6klQEAngD4cRkCFvS0VTfme6VCT4=;
        b=RQftyrV5pvvHdHFQN2djMVC+anriCJOj78rCPRk7j8pXtRlvRXDLXmp3kJcYLBgk3F
         8O2wusAQmjb5Q+EUCewqKzs/+6/sjRzY1sBFBLnoUaeVPkkK8NNs/BRfRNKzF3o9nUvg
         X1imYyeXPQEy53XzjI6Jp5zYst/i9DjqFTAjkgk5HOrJxhUXQpfplBv/AeSaf1MdZsUX
         Ha/e72g+fj/28Xsa3a4V2U0BD4D+yEOhH8doQoDEXcUQmBH5d4hsVwsLBaaSPe9I/2ya
         UjCi+zq8RWfHxn9OI1ggDu9LUpK9a64n7iHT6OzBX9oG+OJebG6AHH81+KoC1V82ukBd
         tDLA==
X-Gm-Message-State: AOAM532Ged1pabsiRCtt9laXUOpwb6An+D+6CefWWefY/tPJgteZWbfN
	IyCkYkfArb9Rwa5xKeUZxhM=
X-Google-Smtp-Source: ABdhPJzGKF7L1i3XQOo7gLwGzX90rZl+328xh85ltmchWeD/1bRhG1P3nIMULjdLiFrbddjQjTO4YA==
X-Received: by 2002:a17:902:654d:b0:13a:50b5:da29 with SMTP id d13-20020a170902654d00b0013a50b5da29mr17155313pln.68.1631661159347;
        Tue, 14 Sep 2021 16:12:39 -0700 (PDT)
Received: from u20.vmware.com (c-67-180-127-245.hsd1.ca.comcast.net. [67.180.127.245])
        by smtp.gmail.com with ESMTPSA id u24sm11531933pfm.85.2021.09.14.16.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 16:12:39 -0700 (PDT)
From: ua1422@gmail.com
To: greg@kroah.com,
	linux-staging@lists.linux.dev
Cc: Usman Ansari <ua1422@gmail.com>
Subject: [PATCH] Fix checkpatch.pl error for prism2mgmt.h
Date: Tue, 14 Sep 2021 16:12:32 -0700
Message-Id: <20210914231232.1592-1-ua1422@gmail.com>
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

