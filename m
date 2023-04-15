Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB2229A9
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 13:51:43 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-50506111a6eso3171845a12.1
        for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681566702; x=1684158702;
        h=content-disposition:mime-version:message-id:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v5NGWM3o2GaqdwID0upo2WthgZAEDdDsYwYXfBe+fZg=;
        b=DzXSXDMTa//VKLuFIW7Z0WjyG6E5cewiG8T2900LoDmIvj+NvoAqQ1NCJF4q0nEzi1
         4g5tpVZwMJO6Zvut1ix8WoKuYAAwtPpJe1APO3wa4iMN8DNwDJOUKtz4G5f1EcXA6GrH
         E/hxLrmqX5ERdkcwJ1jacjepOb2YxITzCpuFvqs2uzd7Uo09BjakTEzm/UxnYJNdBqPO
         4UxXhc99byxfC31h2W5ZGD1jijLV4L8ABkXtx/zAkqVKKF64omWpFoRa/ZEaJTH/+QtO
         YCwMZJskleIXsfAYkiXC3hO5hT8jXmCbhRE27IwBQQ0VGZA6LPnGJrTw5tFwdyrVGWeH
         x0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681566702; x=1684158702;
        h=content-disposition:mime-version:message-id:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5NGWM3o2GaqdwID0upo2WthgZAEDdDsYwYXfBe+fZg=;
        b=ifdiwGEXK/h8Tzy2/Z9U2JX5ItAZhma1P53aYDXqaZPBLLZIYi8FQ6DIFQR8LmZ18P
         kfitgl+TJ1Z2EJKyBTJJGm17j1cr66zETwTQ+XHFw6lntDGs0Xv27pJMuL8wFBjQJlgD
         CuLMLM5zaTlUU+ScMxp4iA8CYtNK2iS8/7oK2HUIn/e4FYUPVVO2zdW6Pnosp2syocfv
         dHrAS0ouuhkIz72sb4TkSRq6ON03by5AUCjtP/gthZ9XdqzPu/v+FLPb7NoNCk4wdC1v
         aFgCbZNwcKtjZ9pPKkaImqkvyzPO78pvAMU3zkzbnSrZUhEKiCEkUi23OAhg0olb0IUB
         S80Q==
X-Gm-Message-State: AAQBX9fNuyE+FmOi6TVi0scjG41ZoOh9MSjWxcJxK5+aFiUqABzWeIoT
	bcSeaNdgQ3dINrsvfqtYak0=
X-Google-Smtp-Source: AKy350YOq+EfkYi7INh6Bbryu3v6RU7RuTzVauu+pzGKrbaXUqN/tAgJaVMWuLdwXQE+w7Zk83wbRQ==
X-Received: by 2002:a05:6402:157:b0:506:77e5:fbb3 with SMTP id s23-20020a056402015700b0050677e5fbb3mr6436134edu.35.1681566701840;
        Sat, 15 Apr 2023 06:51:41 -0700 (PDT)
Received: from kernelhacking.kernelhacking.example.com (dslb-088-067-245-126.088.067.pools.vodafone-ip.de. [88.67.245.126])
        by smtp.gmail.com with ESMTPSA id g25-20020a056402115900b004c4eed3fe20sm3380348edw.5.2023.04.15.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 06:51:41 -0700 (PDT)
Date: Sat, 15 Apr 2023 15:51:39 +0200
From: Luke Koch <lu.ale.koch@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <ZDqr62DTxJVXGKum@kernelhacking.kernelhacking.example.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

linux-kernel@vger.org
Bcc: 
Subject: [PATCH v2] staging: wlan-ng: replace rate macros
Reply-To: <714c5d3f-438a-4633-a46e-127f876ffec4@kili.mountain>

Change p80211msg_dot11req_scan_results rate members to struct arrays
instead of individually numbered member structs.
Replace macros to set rates with loops to avoid checkpatch warning
and adhere to linux coding style.

Reported by checkpatch:

CHECK: Macro argument reuse 'N' - possible side-effects?

Signed off by: Luke Koch <lu.ale.koch@gmail.com>
---
v2: - Fix array underflow and conditions with respect to the start at 0
---
 drivers/staging/wlan-ng/p80211metastruct.h | 18 +-------
 drivers/staging/wlan-ng/prism2mgmt.c       | 52 +++++++---------------
 2 files changed, 18 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/staging/wlan-ng/p80211metastruct.h
index 4adc64580185..e963227f797c 100644
--- a/drivers/staging/wlan-ng/p80211metastruct.h
+++ b/drivers/staging/wlan-ng/p80211metastruct.h
@@ -114,22 +114,8 @@ struct p80211msg_dot11req_scan_results {
 	struct p80211item_uint32 cfpollreq;
 	struct p80211item_uint32 privacy;
 	struct p80211item_uint32 capinfo;
-	struct p80211item_uint32 basicrate1;
-	struct p80211item_uint32 basicrate2;
-	struct p80211item_uint32 basicrate3;
-	struct p80211item_uint32 basicrate4;
-	struct p80211item_uint32 basicrate5;
-	struct p80211item_uint32 basicrate6;
-	struct p80211item_uint32 basicrate7;
-	struct p80211item_uint32 basicrate8;
-	struct p80211item_uint32 supprate1;
-	struct p80211item_uint32 supprate2;
-	struct p80211item_uint32 supprate3;
-	struct p80211item_uint32 supprate4;
-	struct p80211item_uint32 supprate5;
-	struct p80211item_uint32 supprate6;
-	struct p80211item_uint32 supprate7;
-	struct p80211item_uint32 supprate8;
+	struct p80211item_uint32 basicrate[8];
+	struct p80211item_uint32 supprate[8];
 } __packed;
 
 struct p80211msg_dot11req_start {
diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
index 9030a8939a9b..79a259ab209b 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.c
+++ b/drivers/staging/wlan-ng/prism2mgmt.c
@@ -437,42 +437,22 @@ int prism2mgmt_scan_results(struct wlandevice *wlandev, void *msgp)
 		if (item->supprates[count] == 0)
 			break;
 
-#define REQBASICRATE(N) \
-	do { \
-		if ((count >= (N)) && DOT11_RATE5_ISBASIC_GET(	\
-			item->supprates[(N) - 1])) { \
-			req->basicrate ## N .data = item->supprates[(N) - 1]; \
-			req->basicrate ## N .status = \
-				P80211ENUM_msgitem_status_data_ok; \
-		} \
-	} while (0)
-
-	REQBASICRATE(1);
-	REQBASICRATE(2);
-	REQBASICRATE(3);
-	REQBASICRATE(4);
-	REQBASICRATE(5);
-	REQBASICRATE(6);
-	REQBASICRATE(7);
-	REQBASICRATE(8);
-
-#define REQSUPPRATE(N) \
-	do { \
-		if (count >= (N)) {					\
-			req->supprate ## N .data = item->supprates[(N) - 1]; \
-			req->supprate ## N .status = \
-				P80211ENUM_msgitem_status_data_ok; \
-		} \
-	} while (0)
-
-	REQSUPPRATE(1);
-	REQSUPPRATE(2);
-	REQSUPPRATE(3);
-	REQSUPPRATE(4);
-	REQSUPPRATE(5);
-	REQSUPPRATE(6);
-	REQSUPPRATE(7);
-	REQSUPPRATE(8);
+	for (int i = 0; i < 8; i++) {
+		if (count > i &&
+		    DOT11_RATE5_ISBASIC_GET(item->supprates[i])) {
+			req->basicrate[i] .data = item->supprates[i];
+			req->basicrate[i] .status =
+				P80211ENUM_msgitem_status_data_ok;
+		}
+	}
+
+	for (int i = 0; i < 8; i++) {
+		if (count > i) {
+			req->supprate[i] .data = item->supprates[i];
+			req->supprate[i] .status =
+				P80211ENUM_msgitem_status_data_ok;
+		}
+	}
 
 	/* beacon period */
 	req->beaconperiod.status = P80211ENUM_msgitem_status_data_ok;
-- 
2.34.1

