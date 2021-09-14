Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B8F3FD0
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 23:08:47 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id m21-20020a17090a859500b00197688449c4so855209pjn.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 16:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWF2WtOQjAs6Ovh6klQEAngD4cRkCFvS0VTfme6VCT4=;
        b=b4SbGfynDJ3oXl0iBEObPwfZknO9rSiX0uTjOwgvDchoSpasHMR4Yfvj3cS6/enDrP
         y/WjqPjYF1J8NY5eoBiyc8l0ToxooUTf8yj0TZksBz+hnHw9cpPIVu0VvL7bXVGrYdyB
         gWLCU8C0WrvycRZ3nATMUW1T2osCid39ZMQwsFXyTIM9zFcWU9ndbRbbp0cfBA3iXyui
         fEZXzuY8clN3FaP3/a2CuxElK64BvR+vxrFaomMmXjjvT2h9gaUm61ueC9incp6BNxA1
         dcnxF2YDwrTRwZVvD7Kq/X7bEs9ivVGiMVN14Gvq3c/v/L86wjKQWy8vVb9PLFv6FP1d
         8WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWF2WtOQjAs6Ovh6klQEAngD4cRkCFvS0VTfme6VCT4=;
        b=M7Lm0hsMIrLVI2r+9Tu062XQPsqMYMSdN2yDCDYa6coO9axXBiYjM481AZtaZk5+Da
         3vFso23yZ4fVo5QFcTmHjr+RXEKmG+jsCl8nAjz+0zKepD2Ric2RUcfj5XY9Hzxde1U+
         w7JdnZjIb5mcUvSjr4rPnIX/zKdeDMpc2Crk0WOdiRPpZ2pnK8xlCbGcbJNFbs1lXe6k
         xFe8LL8MkgNJFDDk0j2++oSsLfrTR7n6zZAbEOyRhdWX9NpHO0OXjPCFCYcD9nbKG1iR
         1/+hqctUCmGilSKB7H8HLh4Q5TxLz0LVku+gdtzpCmn5KpDuPhBMAU8X+LBtxmhKKlAR
         krlw==
X-Gm-Message-State: AOAM533iAXHtHf6njY+mFhPmBf3cvqnnUGucHmzbcvhU+u+ON4L751I1
	CSDKzGqciMbrgrufD6JUI7Q=
X-Google-Smtp-Source: ABdhPJySpApN2CJRFkSzjIhPt8Qj8GAKEIXqRNJIk9c0Xr27VY5v3FnpfyTL3ba4hZFp2fLtC7TYwg==
X-Received: by 2002:a17:90a:ab90:: with SMTP id n16mr4730236pjq.157.1631660927629;
        Tue, 14 Sep 2021 16:08:47 -0700 (PDT)
Received: from u20.vmware.com (c-67-180-127-245.hsd1.ca.comcast.net. [67.180.127.245])
        by smtp.gmail.com with ESMTPSA id 203sm11291916pfx.119.2021.09.14.16.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 16:08:47 -0700 (PDT)
From: ua1422@gmail.com
To: greg@kroah.com,
	linux-staging@lists.linux.dev
Cc: Usman Ansari <ua1422@gmail.com>
Subject: [PATCH] Fix checkpatch.pl error for prism2mgmt.h
Date: Tue, 14 Sep 2021 16:08:39 -0700
Message-Id: <20210914230840.1528-1-ua1422@gmail.com>
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

