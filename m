Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFE72
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 14:47:13 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j2so8558243wrs.12
        for <linux-staging@lists.linux.dev>; Thu, 01 Jul 2021 07:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SY0TCyX0d4BuF/HPv+siMhswvjAmIedZMktaAD9ovU=;
        b=u2Xernl74Yji61o8FpP1QFlZJ3MDeUgpGyYjHnFF6lX4yEuqCtkn1J/WZjBTUphlgg
         bYww79V5TefMavQ01JP5Td4vycf/QBjlmelOHA+pXAfZq5S7TRW68Lu5Xni6PL44cpmy
         quMQGZTnYYuPthHONXRsmEswsoSpgXV73f+jWPToiAM4iggxNVfTAWVpUkqcjIac62Ve
         lN/KG6keQ/J7RieQTNmLTp2tgl6xM/XNIrnT1wPAoMMoKkRR0Bk2my7JXqWSymFOExWE
         Nd6DjQ+s5hcmB8AjTgJMeBDQr632N8tRYRXC1jYZUidOSu0ROzNm6xEepoGgo8hl6thg
         eZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SY0TCyX0d4BuF/HPv+siMhswvjAmIedZMktaAD9ovU=;
        b=JXUxoM+ne5flm2w393LgOL/swR0hjQ1a2zcg2aVjgW7AOtbgBRTYbTWTdGAhk42BRA
         nj5D7KxGVEpVSNTvSaPT3GRk7DEaHvKAAlyuwUABPiIznss0RJq3IGe7oLMKbk3qLqqE
         Az1MKEZ8DjUiAGkKiRlLnxB/GgGb3ADDbtlhUHDu2WKcEJpa29XgBdyrvRRmbWLamgSZ
         x0TfmCpdBDBzkYQvSRJKqdaRMRc7aLpK6i5TPNa6H1SpWK/PKaVvj8LpECeI/r1+95co
         3J5ZVLe7RGfnXpHBu2HMbiPm/0lAONq0Fw3MrNP4fUPzRSR0rZoqvpIVuaOK2xPAxgN/
         BXOg==
X-Gm-Message-State: AOAM531TMu2LamnX8iJSpf9QUgBvo28NHS9lVeT3rliHgi+1K8IgHywZ
	siULAWH7lG3efvoAwMUNyvA=
X-Google-Smtp-Source: ABdhPJwGbi8LLGy8LLTlbNJxGlQ3lktPv9icFHs9LJ4Kjya9Z5ESb+kfsvfPba1fbGy1DShHuOJP0w==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr26391wrq.184.1625150832202;
        Thu, 01 Jul 2021 07:47:12 -0700 (PDT)
Received: from linux.local (host-80-181-152-252.pool80181.interbusiness.it. [80.181.152.252])
        by smtp.gmail.com with ESMTPSA id y8sm18587wrr.76.2021.07.01.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:47:11 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8188eu: Remove an unused variable and some lines of code
Date: Thu,  1 Jul 2021 16:47:07 +0200
Message-Id: <20210701144707.22820-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused iw_operation_mode[]. Remove all the lines of 
code from the function rtw_wx_set_rate, except the "return 0;" line 
to not break userland code that somewhat uses this IOCTL.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 .../staging/rtl8188eu/os_dep/ioctl_linux.c    | 72 -------------------
 1 file changed, 72 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index b958a8d882b0..a66d8838c034 100644
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
@@ -1266,73 +1261,6 @@ static int rtw_wx_set_rate(struct net_device *dev,
 			   struct iw_request_info *a,
 			   union iwreq_data *wrqu, char *extra)
 {
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
 	return 0;
 }
 
-- 
2.32.0

