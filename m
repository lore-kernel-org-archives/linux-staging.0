Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A029A8
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 20:05:19 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1322d768ba7so3454540fac.5
        for <linux-staging@lists.linux.dev>; Thu, 03 Nov 2022 13:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QJqmk5I6DAgiLsobZTGa57P2bCxeBPQdNtIGsZHnmfo=;
        b=fhg/fjhDvPlrIUzjSmWqpspjw+rGGlKIeolmzQWRiNGUdii5IMjJx1jz6sN1AVjccA
         Fo7mo3HkOMRJBFiWrECJYtfzGpBrvxUd+h02JAqrV6NEZdKghONQDyxTikE6kVCa56WD
         /E3tkjjQLUVBnzKmwBckmnzvpkiBJky00erYc0viedcQID+Ua/TvESwDB03S2ND8eF0O
         va8n8xHHuFuAntxHJRIAvhZla7bXk7z4i3Blaxbdja6qfkASmvnIolYyHYIdIC7HNXO9
         JPB2c9y7idm53B5OFPBSVtFZ1CLAcTqSWtoONJSbqEFOBwVKURkyo33ndJLs3U2cnwKX
         6pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJqmk5I6DAgiLsobZTGa57P2bCxeBPQdNtIGsZHnmfo=;
        b=25Qgb+7IYqGg/hVwukvDws7hgbCeLbQ+CAkBqQ3+insFwMiVLSk/+t0UXaq83IwLg7
         SnO/lC/82AegkPlsPITft7g5tezVDYKHeGa+XExOyNJ5d4mmUXd12pTVfQBEOsMyN1Jl
         koOp2nnSgzn/i1C6pxgSC0MHajdDT9tcxPUPVK4mnvitPlnSUcqplii2EPS3B7XVbaL5
         PLsYB2mUBizMAspDAC9MoM1DEwoeZcGD327dDxpHwJomXklEPyUuZmGYXpS2dAC7WfQS
         mwFGRexi+2TV0P//uuNsLV16PRxV5PaZ/Yvhh6L/MQtiacS0YI555Ql3i+dMfh1XsTMc
         7FaQ==
X-Gm-Message-State: ACrzQf10n6/HGgLuG4dkfPAy59UDsNhCfLsX7/FzbGAXX00I2qyMttkb
	aozFZK53U6rIFJg97UDnSvA=
X-Google-Smtp-Source: AMsMyM7EfiNrp3ewtr+mhaU+GV1tgaMCY+ryP1oN2nP0SoFejOu/QzoP2U6LFoUFqTKpfKb1cMVAXg==
X-Received: by 2002:a05:6871:891:b0:13b:86bc:7b51 with SMTP id r17-20020a056871089100b0013b86bc7b51mr19830284oaq.174.1667505918579;
        Thu, 03 Nov 2022 13:05:18 -0700 (PDT)
Received: from localhost.localdomain ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id r3-20020a056870e98300b0013bc40b09dasm842286oao.17.2022.11.03.13.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 13:05:18 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] staging: rtl8192e: Fix divide fault when calculating beacon age
Date: Thu,  3 Nov 2022 15:05:07 -0500
Message-Id: <20221103200507.14304-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the configuration parameter CONFIG_HZ is less that 100, the compiler
generates an error as follows:

../drivers/staging/rtl8192e/rtllib_wx.c: In function 'rtl819x_translate_scan':
../drivers/staging/rtl8192e/rtllib_wx.c:220:57: warning: division by zero [-Wdiv-by-zero]
  220 |                       (jiffies - network->last_scanned) / (HZ / 100));
      |                                                         ^
In file included from ../include/linux/skbuff.h:45,
                 from ../include/linux/if_ether.h:19,
                 from ../include/linux/etherdevice.h:20,
                 from ../drivers/staging/rtl8192e/rtllib_wx.c:18:
../drivers/staging/rtl8192e/rtllib_wx.c: In function 'rtllib_wx_get_scan':
../drivers/staging/rtl8192e/rtllib_wx.c:261:70: warning: division by zero [-Wdiv-by-zero]
  261 |                                    (jiffies - network->last_scanned) /
      |

In fact, is HZ is not a multiple of 100, the calculation will be wrong, but it
will compile correctly.

The fix is to get rid of the (HZ / 100) portion. To decrease any round-off
errors, the compiler is forced to perform the 100 * jiffies-difference before
dividing by HX. This patch is only compile tested.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/rtl8192e/rtllib_wx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index da2c41c9b92f..7013425102dd 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -217,7 +217,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 	p = custom;
 	p += scnprintf(p, MAX_CUSTOM_LEN - (p - custom),
 		      " Last beacon: %lums ago",
-		      (jiffies - network->last_scanned) / (HZ / 100));
+		      (100 *(jiffies - network->last_scanned)) / HZ);
 	iwe.u.data.length = p - custom;
 	if (iwe.u.data.length)
 		start = iwe_stream_add_point_rsl(info, start, stop,
@@ -258,8 +258,8 @@ int rtllib_wx_get_scan(struct rtllib_device *ieee,
 				   escape_essid(network->ssid,
 						network->ssid_len),
 				   network->bssid,
-				   (jiffies - network->last_scanned) /
-				   (HZ / 100));
+				   (100 * (jiffies - network->last_scanned)) /
+				   HZ);
 	}
 
 	spin_unlock_irqrestore(&ieee->lock, flags);
-- 
2.38.0

