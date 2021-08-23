Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E265229CA
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 19:31:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id i6so4034396wrv.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbeFXa1zC8iknta7RykccKAQcTiUi7bLBPrj54xI+js=;
        b=RLd6nUQsicylMhgvgT7JCI9mK9Zrc9q/UFb4/HX2orYHbUWcCZts86CiwLQRSBLSyc
         6cGfIC9nDpNoAxHZaSW0FguylXyXvCeTWsGYlonmABuHMkGns8rwx7eebrOM9E4If+96
         18znWkgFUNB2+zjZm6rva0vIc6N8daU/F3BTVPjfNktEp6NPfno186zjsn1Au5bc0bNR
         Vqeu5r1i1axRZh2L+X9+M8xAJAirCZh4ModIiuaMs+l7ew576fraUy5uWYYf11KF3F78
         ZZDPm1PWofKsA7Vg1FUcDx9Z5WbgsmR3qdQFk7KurhdSl3eSbpAHH+SP7tAQuRTgtMvJ
         DLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbeFXa1zC8iknta7RykccKAQcTiUi7bLBPrj54xI+js=;
        b=CB/B7xcKcvFLiwq7zWQFfdud+PEbIW/f30MSMLE/4HYViISVz/Z8aXWmIXWctUl7fb
         u44xmiQVAS2hBo2jSQaWJOhNJ0pdrW+foXRZfmf7mvqNHsafgfyBr2bsTzX45Qg1/MB6
         AOoEgaKTi4KGFq5xi/H+uEvFrF6kZ8vUCxN/sVtUOTgx/Vle3B8cQ8JPs6xDvpqAtiIN
         kakPcBFFmxgpkIJNhPqW3OeMoLWXO2xVJebFSphaoKjC6BKBbSguyhxvJbm8lckpKN/D
         rNKV5ZDQpI77F//T03T9hCzrMDQLHpgaoXRfxEdtSeX6c9EaZCbe/lbWQCNXSMvUswFV
         4dfw==
X-Gm-Message-State: AOAM5332tRmmYcvJDIuZ+NPQ5Qm+BbBKBjb1lxkZ+0LJSjZJuo9L/pZ4
	ubx9F6uPJgG8mJQ29Hi351s=
X-Google-Smtp-Source: ABdhPJwL0UD+0oB61nmDyueLQeXiC0eF7ptd3XKBnIlHEqFZkOTQEX3xQ1S3e/6RoTs1HLSapJImvw==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr15395215wro.237.1629747105328;
        Mon, 23 Aug 2021 12:31:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id q3sm80398wmf.37.2021.08.23.12.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 12:31:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove 5 GHz code
Date: Mon, 23 Aug 2021 21:30:28 +0200
Message-Id: <20210823193028.12391-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is for chips that do not operate in the 5 GHz band.
Remove some 5 GHz related code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 30 ++++++--------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index ab4a9200f079..81d4255d1785 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -208,17 +208,10 @@ static char *translate_scan(struct adapter *padapter,
 		else
 			snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11bg");
 	} else {
-		if (pnetwork->network.Configuration.DSConfig > 14) {
-			if (ht_cap)
-				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11an");
-			else
-				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11a");
-		} else {
-			if (ht_cap)
-				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11gn");
-			else
-				snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11g");
-		}
+		if (ht_cap)
+			snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11gn");
+		else
+			snprintf(iwe.u.name, IFNAMSIZ, "IEEE 802.11g");
 	}
 
 	start = iwe_stream_add_event(info, start, stop, &iwe, IW_EV_CHAR_LEN);
@@ -737,17 +730,10 @@ static int rtw_wx_get_name(struct net_device *dev,
 			else
 				snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11bg");
 		} else {
-			if (pcur_bss->Configuration.DSConfig > 14) {
-				if (ht_cap)
-					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11an");
-				else
-					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11a");
-			} else {
-				if (ht_cap)
-					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11gn");
-				else
-					snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11g");
-			}
+			if (ht_cap)
+				snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11gn");
+			else
+				snprintf(wrqu->name, IFNAMSIZ, "IEEE 802.11g");
 		}
 	} else {
 		snprintf(wrqu->name, IFNAMSIZ, "unassociated");
-- 
2.32.0

