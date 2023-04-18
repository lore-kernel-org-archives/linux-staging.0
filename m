Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D77A2566
	for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 12:35:56 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id c9so33917885ejz.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 05:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681821354; x=1684413354;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AQZiv0UxCp4OymEbsrHftCkO5u8rlnCeM6fO8KZZ7oA=;
        b=lpIZOd1yw9OqgtEP+zkIXVQ9fudmwOeZOBngzOtwLDYvcbWmG4te+hOHcppf6MWK9t
         NAhTBcVx7hcYlMQEoPB/5zLcyB45/m9lxaeYGAxSj/gi4Nb4asRcYDHDos9LSXysI9Ie
         5ixw8nLHHPhOp8AJbKvHiNqfhlTnIMO0qLzuSFKmc7mg81nudUtmodPXf+LIM98bybnP
         fsE/SCq4CpT+F4pKGsSV0OC4jHFWZ2YrKg8ST7Ftr/xtBkETdUxXcPO92IVlMTLCNYR6
         zKesIa+pyecYdDcjvosb7jmlOGmE9agGgsV/1ZY0LjZB/L34TistmkEofPugno0igkba
         zn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681821354; x=1684413354;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQZiv0UxCp4OymEbsrHftCkO5u8rlnCeM6fO8KZZ7oA=;
        b=RGcL1rgjaeZG6M78UKWX57ysSMUGawqX8FYeMnXoCiRb4khD3Q2zL/4a5WD6fBzDVs
         rNGBiRxX/vIUcdmtKTJSwskMVtXNqJvM/Qq8Y3OcQr/VOxHctnraUastN2BBodzfIik+
         iwdtzXC6EjA8WpjN46b93HqPLptVl5g4my7SXtv+bKBHYDCiBn0BwSngYxNN5PHY4THZ
         pA1RsDv04iqjObpd+HcRCTOS2b9TStloALAGdPBIQ1hISrVIX2odarva4QY/m3LNV7vm
         plENzc6vjgZiGnAfaJngN+nkEZXBIfCokIMyV7Ni57QmPUEG0zZEX1Cu905G6jhNaIO1
         MdqA==
X-Gm-Message-State: AAQBX9fDZ/fwKLW8snH0pMLJnYICNdmkQS9Fv9Y4uHx4pacw/kpcpSJ5
	rVQGft/zGHo34nn3GyPddeA=
X-Google-Smtp-Source: AKy350bMdk0AqUL8HRao0ebs25xi2Gb579h3WyEFVyvdamsQncTRDyYcOzgp3MUqUailsClOEe0nOA==
X-Received: by 2002:a17:906:2b41:b0:930:b130:b7b with SMTP id b1-20020a1709062b4100b00930b1300b7bmr10127624ejg.6.1681821354356;
        Tue, 18 Apr 2023 05:35:54 -0700 (PDT)
Received: from kernelhacking.kernelhacking.example.com (dslb-088-067-245-126.088.067.pools.vodafone-ip.de. [88.67.245.126])
        by smtp.gmail.com with ESMTPSA id e6-20020a170906314600b0094a82a236cbsm7983681eje.129.2023.04.18.05.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:35:54 -0700 (PDT)
Date: Tue, 18 Apr 2023 14:35:52 +0200
From: Luke Koch <lu.ale.koch@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: wlan-ng: replace rate macros
Message-ID: <ZD6OqBOp1ezQDgMu@kernelhacking.kernelhacking.example.com>
Reply-To: f44f44e4-25c0-4489-96e9-8ca63fa294d7@kili.mountain
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change p80211msg_dot11req_scan_results rate members to struct arrays
instead of individually numbered member structs.
Replace macros to set rates with loops to avoid checkpatch warning
and adhere to linux coding style.

Reported by checkpatch:

CHECK: Macro argument reuse 'N' - possible side-effects?

Signed off by: Luke Koch <lu.ale.koch@gmail.com>
---
v2: - Fix array underflow and conditions with respect to the start at 0
v3: - Remove unnecessary spaces
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
index 9030a8939a9b..fc465261baa1 100644
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
+			req->basicrate[i].data = item->supprates[i];
+			req->basicrate[i].status =
+				P80211ENUM_msgitem_status_data_ok;
+		}
+	}
+
+	for (int i = 0; i < 8; i++) {
+		if (count > i) {
+			req->supprate[i].data = item->supprates[i];
+			req->supprate[i].status =
+				P80211ENUM_msgitem_status_data_ok;
+		}
+	}
 
 	/* beacon period */
 	req->beaconperiod.status = P80211ENUM_msgitem_status_data_ok;
-- 
2.34.1

