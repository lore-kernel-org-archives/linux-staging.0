Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717552771D;
	Fri, 24 Mar 2023 22:10:04 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d17so3129832wrb.11;
        Fri, 24 Mar 2023 15:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679695802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmc+Yh3XTUiALV4q5vVltlntUVE9IZwmAKsrbcMIn8E=;
        b=bNPlIuYIBzrqhtaoy7xHmivpmU2OfSBWDYwRCu1ODldBBcHsmid5AeRgr7TiYc6p0H
         ZsiQFUqvyW9lYRiLcARM4JpKj6backof5tP9hyFQ72Db/gtBmusvPj57j+c0tfDGRJiO
         gp7nI9A5/sOHYU8x7D8WdiN4jFXM5/GpI6uhqPBMXik+LVROMKCXK1zTFIoRpfYEyUAD
         iBXhnXQGucRLIfx867s1r7vrrJmiUxtB1YxKrdXVJANyXMVTqxaFek+ArcBq/FsI+6Bm
         6cyFRw6NicPPYaCjNaMJDCMCw2OOCNN0vxDQRRgrlmLFlU1/EgXhmw3hiqgCvdt2ZXl0
         Y3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679695802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmc+Yh3XTUiALV4q5vVltlntUVE9IZwmAKsrbcMIn8E=;
        b=BLDSDxdyztfomacCst59BWpeqUGYI6zt2WSnI25xdb6FMBdC7EBiBBYDlinvlYWT/W
         hzn1K+PXii2zXeYLbjI6u0ipNTj5fSwUrU1y+cnM7CAAnvVFHewfEPMklr6gJv9ySWXE
         rF4V2RxSWVElCeA8JKu3UTvvP7KxYNl+u4Ac6nxgMGbZdWz7fl8ktnm0vV5oIuew+2pb
         ePk8OivwjGZ2SCYTXTUqpm7fhVSrh9YA1opJNXyIUuVxytyejj6paV3/KQC5ITNmVNKg
         fIQkgtbKTH9fMwFDGGjUiib//NJn3axeTuhzCCbQpZD60XtZLYeXpTuVa/gkD8DDePbQ
         NorQ==
X-Gm-Message-State: AAQBX9eBrP6yMJ42TM07S2FOb4COeKbqivMkTypLBA4zY/1pgwXalm19
	UugSNdFzcryLIO2UNWlm3O110OUzq/lKcg1V
X-Google-Smtp-Source: AKy350Yk6TS348ocuPvtjqqhydMRLE5llnNXAN4RasfwNkcS/+7lIDOzkZt6YHeIH7cxc7jtilwDhA==
X-Received: by 2002:adf:f887:0:b0:2ce:a9e9:4905 with SMTP id u7-20020adff887000000b002cea9e94905mr3875825wrp.34.1679695802535;
        Fri, 24 Mar 2023 15:10:02 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm19201736wru.89.2023.03.24.15.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:10:02 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] staging: rtl8192e: remove blank lines after '{'
Date: Sat, 25 Mar 2023 03:09:51 +0500
Message-Id: <e7cd8152e6986d361f81289868040889224bd1bf.1679695111.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679695111.git.kamrankhadijadj@gmail.com>
References: <cover.1679695111.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines after an open brace to adhere to the
Linux kernel coding-style guidelines. These issues are reported by
checkpatch.pl

"CHECK: Blank lines aren't necessary after an open brace '{'"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index f627dfe66d90..b649d02dc5c8 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1167,7 +1167,6 @@ static int rtllib_rx_decrypt(struct rtllib_device *ieee, struct sk_buff *skb,
 	if (crypt && !(fc & RTLLIB_FCTL_WEP) && !ieee->open_wep) {
 		if (/*ieee->ieee802_1x &&*/
 		    rtllib_is_eapol_frame(ieee, skb, hdrlen)) {
-
 			/* pass unencrypted EAPOL frames even if encryption is
 			 * configured
 			 */
@@ -1207,7 +1206,6 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 				      u8 nr_subframes)
 {
 	if (unicast) {
-
 		if (ieee->state == RTLLIB_LINKED) {
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
 			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
@@ -1552,7 +1550,6 @@ static u8 qos_oui[QOS_OUI_LEN] = { 0x00, 0x50, 0xF2 };
 static int rtllib_verify_qos_info(struct rtllib_qos_information_element
 				     *info_element, int sub_type)
 {
-
 	if (info_element->elementID != QOS_ELEMENT_ID)
 		return -1;
 	if (info_element->qui_subtype != sub_type)
@@ -2696,7 +2693,6 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 		ieee->last_rx_ps_time = jiffies;
 
 	switch (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl))) {
-
 	case RTLLIB_STYPE_BEACON:
 		netdev_dbg(ieee->dev, "received BEACON (%d)\n",
 			   WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)));
-- 
2.34.1

