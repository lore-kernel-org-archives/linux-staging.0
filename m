Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E35C29AC
	for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 14:10:48 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id q23so43214686ejz.3
        for <linux-staging@lists.linux.dev>; Sat, 15 Apr 2023 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681567846; x=1684159846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76jxwJ6jG3EVovd2wqVi8mn9JUvzlGKza5NgD7JN3r0=;
        b=mWCl76CaG5oaPuUkZ1jW+U7kaBetwb0e3ZidvqL9neEoU6nHcW1kPTNml+OFOiEEyf
         9l6uJCBhfYeiNS7tH+XBwgSjyufzOKPAt93KKNKKeMvzjd3uViYoGcAMOZv96y0H4Vfv
         OvmAjj0MVe9i51vPEjwwd4Fu+fQEo9+2U4zWaWMW038fGuY1G/ZBYzSIw1iCzDan8KTE
         dJex03DSIudUf7hZvZg44MCpEeQBVHSZ8xzWqT25ygaxOVFR6dCybYpQk0GdHokd8LT6
         xdDJ9xOH/X3gUfr6/1LY1j/f2Z1feZ2xWCEx1uJOhRKXvDC37Em+aS4jfeipp0uS6DST
         pI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681567846; x=1684159846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76jxwJ6jG3EVovd2wqVi8mn9JUvzlGKza5NgD7JN3r0=;
        b=g9oMdbAdaJoPViSpMvhuHI/sfOgAmk3WbakFmolO2hPY/LEkDXbls4x7aEuzA7tsh2
         mc/+WbBqQg8RiUsRcS9fNPOPzsu107nlH/IHlQ1l+zAlmkD1+perEg+GZeRIrBN8z4HD
         7nVkQprmW0BrGYwsI8PkbvnpRqq5EyP6e2cVMIABYfK8JIzSud2Z2rxbKL67xc9sFD9e
         8Lepx3kvaTmP04BPAwCFZLolNnqwI1zEmGWlWHXpS5hH1bVhGjZVXrIuMGpKfsu0Edty
         vVG9VNd5v2fVLSM5zPaLTByPDBeFM3JbM0MtHb4/OllnJr1qcqMD9nbw9PdHMdfSEX6q
         B6zg==
X-Gm-Message-State: AAQBX9fdNrfuCzwBNNMizOaE3p7XdEtJxdEzRJSaTIdcCCGSGwmwOnZW
	GBYLh0seNdav2rlwZ+4ni6c=
X-Google-Smtp-Source: AKy350Z1+uwvDnkMqDZiym8jlIpJgo0Qj6dRh5uoZNYz1mab6V0egraY0VmLgy5oNjiddINwb6BI7w==
X-Received: by 2002:a17:906:5610:b0:94e:ff98:44a7 with SMTP id f16-20020a170906561000b0094eff9844a7mr2292516ejq.72.1681567846100;
        Sat, 15 Apr 2023 07:10:46 -0700 (PDT)
Received: from kernelhacking.kernelhacking.example.com (dslb-088-067-245-126.088.067.pools.vodafone-ip.de. [88.67.245.126])
        by smtp.gmail.com with ESMTPSA id b11-20020a17090636cb00b00930aa50372csm3851696ejc.43.2023.04.15.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 07:10:45 -0700 (PDT)
Date: Sat, 15 Apr 2023 16:10:44 +0200
From: Luke Koch <lu.ale.koch@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: wlan-ng: replace rate macros
Message-ID: <ZDqwZKZHyZZX4b2J@kernelhacking.kernelhacking.example.com>
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

