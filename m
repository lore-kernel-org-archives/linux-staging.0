Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611370
	for <linux-staging@lists.linux.dev>; Mon,  5 Jul 2021 13:41:57 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id gb6so12481735ejc.5
        for <linux-staging@lists.linux.dev>; Mon, 05 Jul 2021 06:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9JHSRbS7NzwHOfcGTHTpIoJzU8cGwqoybTQ0iNhpmp8=;
        b=V00TjrjEPngzpp26pcn5bMd8IyM2kRvIpqIyvPL4/YXEIofYPCqaD1gdzSEA/6VjJw
         norapAyVzg6NV0t7kmFhOfmWwO4aPd94feeqG6PvZ3NDFC3sSQwX2ai0PV1N0kvAcbHL
         QjarAg79J2Sek5cPRI1OeBAYohaBocNWdBB4Y9YgtNBUAx9dN/+R4v1wxBy+rgxnz5sb
         ZFd7ZbZuOtf+qCWrglEEmSz9PM/d7G7+LzIIW5IXj72c9J6DZEbWGtWf76NmC4Ygjx1L
         6uYBiGD+TlzDwk0C7nRdkt6y3HDOGcHVZH48fvtqvsSBu8xhlYtNPKHNyDdwQ7zM9Bpy
         Oniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9JHSRbS7NzwHOfcGTHTpIoJzU8cGwqoybTQ0iNhpmp8=;
        b=ZTnOezy4829eljCIxn4NiQPsPVUFJuiGsHq0dUw+LyfrOY4G8pHg0ZLd4JJ5aLp3Bp
         kYmPFc8JpGOWSz4wrMLwsuG6afObE4tfmUyNV8sovUokqFUKAfGBEUmaRJPKv6XoX/RF
         PK3qENFKJZzETO0C9+00Z3PRawc1hC1WdvuArQAEqIgL++UwB7qlZGiUxn4iQ+ogdpZg
         J+KvEpdpmElOX+oRA6yoHswf38MPpctbemvKOs1dRIVQKXWevxvuLOnhS2vD5nH4qR/B
         YZPHpmKSFaw838jcapn172Pvg7Ad/Ii6PeFUKwiMPenC5ROR3wLl5LVyTPcJEHwgcjdK
         UCSg==
X-Gm-Message-State: AOAM5332euhVvmVWHnxcSZ0msSK4R8mELuzVzbSYthXHLYm4Bw33VuuD
	jey18xhyDiXSeF4NPYiFDac=
X-Google-Smtp-Source: ABdhPJy7HtDdoNPcI9gmDtyg+rKd2ud+Mw/9PYbnSCPNP9O+2wdbCZjJMD1SBlmsWz0UW3Gm85ybng==
X-Received: by 2002:a17:906:2bdb:: with SMTP id n27mr13478817ejg.312.1625492516004;
        Mon, 05 Jul 2021 06:41:56 -0700 (PDT)
Received: from linux.local (host-80-181-152-252.retail.telecomitalia.it. [80.181.152.252])
        by smtp.gmail.com with ESMTPSA id u4sm4369663eje.81.2021.07.05.06.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 06:41:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: rtl8188eu: Remove an unused variable and some lines of code
Date: Mon,  5 Jul 2021 15:41:51 +0200
Message-Id: <20210705134151.15143-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused iw_operation_mode[]. This driver doesn't support
SIOCSIWRATE.  It just returns zero and does nothing.  Change it to
return -ENOTSUPP instead.  (This is an API change but we don't expect it
to break anything).

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1->v2: Delete rtw_wx_set_rate() and its association with command
SIOCSIWRATE as suggested by Dan Carpenter <dan.carpenter@oracle.com>

 .../staging/rtl8188eu/os_dep/ioctl_linux.c    | 80 -------------------
 1 file changed, 80 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index b958a8d882b0..eef8ed71cdef 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -46,11 +46,6 @@ static u32 rtw_rates[] = {1000000, 2000000, 5500000, 11000000,
 	6000000, 9000000, 12000000, 18000000, 24000000, 36000000,
 	48000000, 54000000};
 
-static const char * const iw_operation_mode[] = {
-	"Auto", "Ad-Hoc", "Managed",  "Master", "Repeater",
-	"Secondary", "Monitor"
-};
-
 void indicate_wx_scan_complete_event(struct adapter *padapter)
 {
 	union iwreq_data wrqu;
@@ -1262,80 +1257,6 @@ static int rtw_wx_get_essid(struct net_device *dev,
 	return 0;
 }
 
-static int rtw_wx_set_rate(struct net_device *dev,
-			   struct iw_request_info *a,
-			   union iwreq_data *wrqu, char *extra)
-{
-	int i;
-	u8 datarates[NumRates];
-	u32	target_rate = wrqu->bitrate.value;
-	u32	fixed = wrqu->bitrate.fixed;
-	u32	ratevalue = 0;
-	u8 mpdatarate[NumRates] = {11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0xff};
-
-	if (target_rate == -1) {
-		ratevalue = 11;
-		goto set_rate;
-	}
-	target_rate /= 100000;
-
-	switch (target_rate) {
-	case 10:
-		ratevalue = 0;
-		break;
-	case 20:
-		ratevalue = 1;
-		break;
-	case 55:
-		ratevalue = 2;
-		break;
-	case 60:
-		ratevalue = 3;
-		break;
-	case 90:
-		ratevalue = 4;
-		break;
-	case 110:
-		ratevalue = 5;
-		break;
-	case 120:
-		ratevalue = 6;
-		break;
-	case 180:
-		ratevalue = 7;
-		break;
-	case 240:
-		ratevalue = 8;
-		break;
-	case 360:
-		ratevalue = 9;
-		break;
-	case 480:
-		ratevalue = 10;
-		break;
-	case 540:
-		ratevalue = 11;
-		break;
-	default:
-		ratevalue = 11;
-		break;
-	}
-
-set_rate:
-
-	for (i = 0; i < NumRates; i++) {
-		if (ratevalue == mpdatarate[i]) {
-			datarates[i] = mpdatarate[i];
-			if (fixed == 0)
-				break;
-		} else {
-			datarates[i] = 0xff;
-		}
-	}
-
-	return 0;
-}
-
 static int rtw_wx_get_rate(struct net_device *dev,
 			   struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
@@ -2715,7 +2636,6 @@ static iw_handler rtw_handlers[] = {
 	IW_HANDLER(SIOCSIWESSID, rtw_wx_set_essid),
 	IW_HANDLER(SIOCGIWESSID, rtw_wx_get_essid),
 	IW_HANDLER(SIOCGIWNICKN, rtw_wx_get_nick),
-	IW_HANDLER(SIOCSIWRATE, rtw_wx_set_rate),
 	IW_HANDLER(SIOCGIWRATE, rtw_wx_get_rate),
 	IW_HANDLER(SIOCSIWRTS, rtw_wx_set_rts),
 	IW_HANDLER(SIOCGIWRTS, rtw_wx_get_rts),
-- 
2.32.0

