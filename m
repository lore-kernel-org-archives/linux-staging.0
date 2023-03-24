Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E827721;
	Fri, 24 Mar 2023 22:31:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q19so118380wrc.5;
        Fri, 24 Mar 2023 15:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679697102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmc+Yh3XTUiALV4q5vVltlntUVE9IZwmAKsrbcMIn8E=;
        b=TOehl8DELE79NdFccOToF+06ibX42eREC2NRuACv6k+1L5EILYAaJ7eaGX9WtfZZxg
         uH1lZE6QJMgtcXHVjDgZX7zSSBfw/3S1nfZWPB/PN2n97Omf9frrDP07axSF+nsSqDPI
         D8/wzXBg+IZsIfSQ0KvQ6KAuNXjD5CYIAf0JmUIO3fvPNuJb6f3HDwvull2tHzh2Qrg1
         QMmEemNJgr3lGUqPE+jlAh4LTFuBBCvI8fga+jlnSSy1f8j03ZU1boQoE47EgQUYTFqJ
         jEGJ4b5t5CyKAZYJJHcGzY/iJErLw+VbUUtFG0IWQc9N12pxwFu3cpXH4ylBgbfSH6gC
         zihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679697102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmc+Yh3XTUiALV4q5vVltlntUVE9IZwmAKsrbcMIn8E=;
        b=abR5T3umwjZsyo12VvlEBto0Yvq2vM3yeTRbx9VtjuAdbeWEWV9ngtQVXrteFtDGk+
         Y069RmcIMDSmW4X9PqqCDfwJNYwhC/9iTxRmPED/r6aBus2LDJ2nNJtZLsLI0ZCaaHXy
         eVCs7gcXhmdbJM6dyc0ftn/ZuJMORXgwZFnTMRskx0DxIbFQf/lHdDaVnT9PawM6ETJM
         6xp4klt1KDR5omU05CjVRbN1HIv1fQahXir1kXIlZjtUOMFLSZMONftoKz/xHfGZkJxt
         1LG5bZKHrOTTkl6O6D+VAGfon8ZVCXC8sXZdCagEK2PY/3mYhSAc1+8Y6IW+q+tOpYky
         iYOA==
X-Gm-Message-State: AAQBX9czoQY7vYWcnylBps/Tk0nZEJp/gNCSKgHNLZPvZlKE5hzXLXo4
	b224I0kqb7ENPVt+wyV8SHs5vgBbo2Ou4A==
X-Google-Smtp-Source: AKy350YW+ObTwB8qFEBil0ujwjLpj3qCbbiuQ6mZyifEicheKw+4GJ68D+e0FKPwPpuhRJ62pVsF/g==
X-Received: by 2002:adf:e683:0:b0:2ce:ae5b:27a2 with SMTP id r3-20020adfe683000000b002ceae5b27a2mr3107845wrm.17.1679697101860;
        Fri, 24 Mar 2023 15:31:41 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id d7-20020adffbc7000000b002d5a8d8442asm14984138wrs.37.2023.03.24.15.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:31:41 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] staging: rtl8192e: remove blank lines after '{'
Date: Sat, 25 Mar 2023 03:31:31 +0500
Message-Id: <e7cd8152e6986d361f81289868040889224bd1bf.1679696777.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679696777.git.kamrankhadijadj@gmail.com>
References: <cover.1679696777.git.kamrankhadijadj@gmail.com>
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

