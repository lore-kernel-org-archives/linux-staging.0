Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54363B6;
	Mon, 27 Mar 2023 17:16:58 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso9637141pjb.2;
        Mon, 27 Mar 2023 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679937418;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4jniGifalHk3jgCmWOViESTHRe1wKM9YHmb9m3c7Ds=;
        b=oUyDh+YV7AZ4MduYscsg4KrMX6ziIZmhVhxo+HUwPhIRIxjRDMM9shdvGXq5BX08iZ
         ZlxMSwIlA1wd2xMYj8bHLBDOGETMTSQZGdwPpki+UgYUHCkMHo5mVgSPlpZnci3fr38e
         fOn67MBn1zzcVTa7IIIErn5Q7cMZrs7WFRVmfpdFNDy4muUwNrf3q+Tkx+0JM65exOMl
         L0eyfgpXMq5u591T9BYmmowwNOhiL+dG2CoSeP3et4aRz3q02DZCin0nNS4o43mF10Vn
         K43ntmpHbunwnKGRsg7U/jG3aEthGKiQUh/7LprEaDpVFppMibBM2fHZ237eTO1YPJR8
         Zc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937418;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4jniGifalHk3jgCmWOViESTHRe1wKM9YHmb9m3c7Ds=;
        b=qKL2A19M4+iLth06p6mZ/mAEyakI+ib3vdOMsSS6n2tNSHiT8G805MDyOgM1jbW7Rz
         y6PPf7qjr4O1FUy9465EKZzcw9C1fos9HekyaAYuPz+KOrL/N93l5oD47XOZfU+x2ji+
         46/5OxnHYLAXz3WQsb231DL9G/im0Et4pDvVFshg3c5KHZUn515+aeaw9+DfMYFEBK0F
         VB+s7vc/VmkBKszU7hEDyw4CKhaeUrBVtf1mcl9fIeLmJbDRv8KzJO8lqM5jHaimdPRu
         rhsuHjYF4zeTH/Jh+j4tnKnxRFqPJyXegmaZ5uxtq0o3PmGuUZhVanYPvIMYcL8dPqY2
         4efQ==
X-Gm-Message-State: AO0yUKUTOWJ0GJH5pbLCSt/H2bBiARb8OxeQOCkvJ6DS35ekMPnnCutl
	PoKnmPJB7uMyoYC4GUgXKBg=
X-Google-Smtp-Source: AK7set+G2kqgwZDwoaL6KNUHunRXTnEpy4BLg3BsGlA7AK5w7UARFy0ca+u/kTW2kVjjBlJczyDPBA==
X-Received: by 2002:a05:6a20:811a:b0:d8:161e:46 with SMTP id g26-20020a056a20811a00b000d8161e0046mr10942044pza.58.1679937417893;
        Mon, 27 Mar 2023 10:16:57 -0700 (PDT)
Received: from sumitra.com ([59.89.169.114])
        by smtp.gmail.com with ESMTPSA id n2-20020aa79042000000b00625e885a6ffsm9097830pfo.18.2023.03.27.10.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:16:57 -0700 (PDT)
Date: Mon, 27 Mar 2023 10:16:53 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8192e: remove extra blank lines
Message-ID: <20230327171653.GA188371@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the extra blank line in accordance with the Linux kernel
coding-style regulations. These issues were reported by checkpatch.pl

"CHECK: Please don't use multiple blank lines"

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 1ce4c29dab13..c1b4e9e7c091 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -308,7 +308,6 @@ enum rt_op_mode {
 	RT_OP_MODE_NO_LINK,
 };
 
-
 #define aSifsTime						\
 	 (((priv->rtllib->current_network.mode == IEEE_A)	\
 	|| (priv->rtllib->current_network.mode == IEEE_N_24G)	\
@@ -653,7 +652,6 @@ struct rtllib_security {
 	u16 flags;
 } __packed;
 
-
 /* 802.11 data frame from AP
  *       ,-------------------------------------------------------------------.
  * Bytes |  2   |  2   |    6    |    6    |    6    |  2   | 0..2312 |   4  |
@@ -984,7 +982,6 @@ static inline u8 Frame_QoSTID(u8 *buf)
 		    (fc & RTLLIB_FCTL_FROMDS)) ? 30 : 24)))->field.tid;
 }
 
-
 struct eapol {
 	u8 snap[6];
 	u16 ethertype;
@@ -1199,8 +1196,6 @@ struct bandwidth_autoswitch {
 	bool bautoswitch_enable;
 };
 
-
-
 #define REORDER_WIN_SIZE	128
 #define REORDER_ENTRY_NUM	128
 struct rx_reorder_entry {
@@ -1372,7 +1367,6 @@ struct rt_intel_promisc_mode {
 	bool fltr_src_sta_frame;
 };
 
-
 /*************** DRIVER STATUS   *****/
 #define STATUS_SCANNING			0
 /*************** DRIVER STATUS   *****/
@@ -1441,7 +1435,6 @@ struct rtllib_device {
 	struct rx_reorder_entry RxReorderEntry[128];
 	struct list_head		RxReorder_Unused_List;
 
-
 	/* Bookkeeping structures */
 	struct net_device_stats stats;
 	struct rtllib_softmac_stats softmac_stats;
@@ -1738,7 +1731,6 @@ struct rtllib_device {
 				     struct rtllib_assoc_response_frame *resp,
 				     struct rtllib_network *network);
 
-
 	/* check whether Tx hw resource available */
 	short (*check_nic_enough_desc)(struct net_device *dev, int queue_index);
 	void (*SetBWModeHandler)(struct net_device *dev,
@@ -1811,7 +1803,6 @@ struct rtllib_device {
  */
 #define IEEE_SOFTMAC_BEACONS (1<<6)
 
-
 static inline void *rtllib_priv(struct net_device *dev)
 {
 	return ((struct rtllib_device *)netdev_priv(dev))->priv;
@@ -1903,7 +1894,6 @@ static inline int rtllib_is_cck_rate(u8 rate)
 	return 0;
 }
 
-
 /* rtllib.c */
 void free_rtllib(struct net_device *dev);
 struct net_device *alloc_rtllib(int sizeof_priv);
@@ -2113,7 +2103,6 @@ static inline const char *escape_essid(const char *essid, u8 essid_len)
 /* fun with the built-in rtllib stack... */
 bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn);
 
-
 /* For the function is more related to hardware setting, it's better to use the
  * ieee handler to refer to it.
  */
-- 
2.25.1

