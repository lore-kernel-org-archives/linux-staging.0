Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B221FB8
	for <linux-staging@lists.linux.dev>; Sat,  8 Apr 2023 17:56:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id o2so1410459plg.4
        for <linux-staging@lists.linux.dev>; Sat, 08 Apr 2023 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680976577;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8HHvXXQE6AIqWjXJvDA7LWgy+P/P9D+TTlEknNugiE=;
        b=lH9rm0b7ENP5XfL8VDlsM8Y74tKD50qq+xoIDUzEeV7T0Oa2V7AFxpoGP7eOiiVv6z
         1+AdLyH5NjkLPvhD/T6QQ+5E5Yqe9jMdlhhJx0h7q2JtNmB8QrBbMUmRQ+kfZuhLO++M
         8gq7T26BWuux0+NvyO6gMJuWKvEuUXapHn3DjnNlzbLFHix7v4OEvFsnfquHFQNvj3ss
         s8h8q/8KdNyI4/RXJQjd2cg5bMnI3u37mS4FrNHvh5WhpMt29CNUc0BG/DlO/LaW6zoc
         obTkNjzld3Y1fbNJ6SaRs+iIV385oPoRCyAcPkx79isue6mBOwq+FJ3jKopAE+jQHz/g
         NAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680976577;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8HHvXXQE6AIqWjXJvDA7LWgy+P/P9D+TTlEknNugiE=;
        b=wi8wcnbpVVI+GPfY1GWDYCABs8VBzK1A5SHCVsWyZLwAzUaV5Eqpw0vtL0QGK+JpLg
         tpsz4bRve+X7hSwE5O41ACJVVD9noXGADPXOMkIowbYpkFTf+jkIUTSUx1hUBsAwcbqi
         f61KxGWahPCYpfASEx7NAiHLbhMIADfPDrIa87kbgBo1tbET1ANM6xvpeB9ap/qPva3G
         EHIdGJEbT0AZuLeuYozgcbr3/ODhjmHMnctqUwGydz9MM9a6+8xgquEG2A8/lVGXGfkI
         4EV11KGeBmrQVjCrNwP6AqqVPc+YwTFvFqGgpYsMaVUUNgwohIoamjNduB8HpGHoaqBH
         +O+Q==
X-Gm-Message-State: AAQBX9d/GCanVtEpqZ3PBvVk4GkDh9ClSmoLZ82m1jdTETIGjPfQIKPk
	B/WD/w0iOGTIJQacx1CKtxk=
X-Google-Smtp-Source: AKy350bNjfM5ozBny+IjoerEvlIhXeNy0b1BGCWC6uP3KKJEJkiICgGpPy4/DpnUGFZbdPk+XUmBBg==
X-Received: by 2002:a05:6a20:3aa9:b0:d9:162d:98e4 with SMTP id d41-20020a056a203aa900b000d9162d98e4mr5923274pzh.54.1680976577152;
        Sat, 08 Apr 2023 10:56:17 -0700 (PDT)
Received: from sumitra.com ([117.207.136.97])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b0062a474cd46asm4974500pfd.137.2023.04.08.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 10:56:16 -0700 (PDT)
Date: Sat, 8 Apr 2023 10:56:10 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Remove unnecessary blank lines
Message-ID: <20230408175610.GA263094@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove extra blank lines as suggested by the Linux kernel
coding-style. These issues were reported by checkpatch.

CHECK: Blank lines aren't necessary before a close brace '}'
CHECK: Blank lines aren't necessary after an open brace '{'
CHECK: Please don't use multiple blank lines

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 1f2fa711e60b..c8e318f5bddd 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -25,7 +25,6 @@ const long rtllib_wlan_frequencies[] = {
 };
 EXPORT_SYMBOL(rtllib_wlan_frequencies);
 
-
 int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
 			     union iwreq_data *wrqu, char *b)
 {
@@ -83,7 +82,6 @@ int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
 }
 EXPORT_SYMBOL(rtllib_wx_set_freq);
 
-
 int rtllib_wx_get_freq(struct rtllib_device *ieee,
 			     struct iw_request_info *a,
 			     union iwreq_data *wrqu, char *b)
@@ -128,13 +126,11 @@ int rtllib_wx_get_wap(struct rtllib_device *ieee,
 }
 EXPORT_SYMBOL(rtllib_wx_get_wap);
 
-
 int rtllib_wx_set_wap(struct rtllib_device *ieee,
 			 struct iw_request_info *info,
 			 union iwreq_data *awrq,
 			 char *extra)
 {
-
 	int ret = 0;
 	unsigned long flags;
 
@@ -164,7 +160,6 @@ int rtllib_wx_set_wap(struct rtllib_device *ieee,
 		goto out;
 	}
 
-
 	if (ifup)
 		rtllib_stop_protocol(ieee, true);
 
@@ -220,7 +215,6 @@ int rtllib_wx_get_essid(struct rtllib_device *ieee, struct iw_request_info *a,
 	spin_unlock_irqrestore(&ieee->lock, flags);
 
 	return ret;
-
 }
 EXPORT_SYMBOL(rtllib_wx_get_essid);
 
@@ -228,7 +222,6 @@ int rtllib_wx_set_rate(struct rtllib_device *ieee,
 			     struct iw_request_info *info,
 			     union iwreq_data *wrqu, char *extra)
 {
-
 	u32 target_rate = wrqu->bitrate.value;
 
 	ieee->rate = target_rate/100000;
@@ -250,7 +243,6 @@ int rtllib_wx_get_rate(struct rtllib_device *ieee,
 }
 EXPORT_SYMBOL(rtllib_wx_get_rate);
 
-
 int rtllib_wx_set_rts(struct rtllib_device *ieee,
 			     struct iw_request_info *info,
 			     union iwreq_data *wrqu, char *extra)
@@ -403,7 +395,6 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 out:
 	mutex_unlock(&ieee->wx_mutex);
-
 }
 
 int rtllib_wx_set_scan(struct rtllib_device *ieee, struct iw_request_info *a,
@@ -434,7 +425,6 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
 			struct iw_request_info *a,
 			union iwreq_data *wrqu, char *extra)
 {
-
 	int ret = 0, len;
 	short proto_started;
 	unsigned long flags;
@@ -454,7 +444,6 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
 	if (proto_started)
 		rtllib_stop_protocol(ieee, true);
 
-
 	/* this is just to be sure that the GET wx callback
 	 * has consistent infos. not needed otherwise
 	 */
@@ -492,7 +481,6 @@ int rtllib_wx_set_rawtx(struct rtllib_device *ieee,
 			struct iw_request_info *info,
 			union iwreq_data *wrqu, char *extra)
 {
-
 	int *parms = (int *)extra;
 	int enable = (parms[0] > 0);
 	short prev = ieee->raw_tx;
@@ -537,7 +525,6 @@ int rtllib_wx_get_name(struct rtllib_device *ieee, struct iw_request_info *info,
 }
 EXPORT_SYMBOL(rtllib_wx_get_name);
 
-
 /* this is mostly stolen from hostap */
 int rtllib_wx_set_power(struct rtllib_device *ieee,
 				 struct iw_request_info *info,
@@ -583,12 +570,10 @@ int rtllib_wx_set_power(struct rtllib_device *ieee,
 	default:
 		ret = -EINVAL;
 		goto exit;
-
 	}
 exit:
 	mutex_unlock(&ieee->wx_mutex);
 	return ret;
-
 }
 EXPORT_SYMBOL(rtllib_wx_set_power);
 
@@ -625,6 +610,5 @@ int rtllib_wx_get_power(struct rtllib_device *ieee,
 exit:
 	mutex_unlock(&ieee->wx_mutex);
 	return 0;
-
 }
 EXPORT_SYMBOL(rtllib_wx_get_power);
-- 
2.25.1

