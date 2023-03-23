Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B002C95C;
	Thu, 23 Mar 2023 19:20:15 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id o12so91167778edb.9;
        Thu, 23 Mar 2023 12:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679599213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRIhiCMIYhlzOxpqNUvBzZ/DfwkIA0+Cejq18uIa0y0=;
        b=lRY8iaHw69WCs1URcFv4/laikeuajycokc36F6FdzbOd+szHEuJtUPQSc3rAvyEBd8
         PhzFu9iGZhI6tQcgvCbQ4Vtg8s4zM/Ft0ublnHympVGRZz4y6kjCaZaMZWX7+OBkmR76
         tusUCSPQ66ntZcNhbTRUbVEAfAUEPPKs+vsEn5Y8q2e3gw+RWFUkmC2+rkk/B2MRWulA
         9aWfqWwV7l5uqkigskT8iz1Val+oWI2IUFtNRaWpWtizZ6PxfFsmc5ADQ8eeTycaE3cZ
         HSFVC2L/WeKZsETyk3wJR366nK8+0Lwn/ygS+1vzDBNXhVIYy+uM/oq3oahKUwS09DmP
         royw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679599213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRIhiCMIYhlzOxpqNUvBzZ/DfwkIA0+Cejq18uIa0y0=;
        b=Z6NGTv2aMOx+lNkfaUF+jOTN7it9l+8MV54YQosGwUBXKLGCYWRI1Ti/cK+kQlgQ6e
         bt3Mp1ASlEz54G3qa2uA4uZJ7JZjTw824FqWjjGThvG0mqVD+nayVPRhaGai/vjfBeGO
         r5CR+CxBiC/JlqBTKYX0psJdWH2CeMB3AwpXMdizI3zPx3pguTUqgO3x7uJNOmzSgVch
         7w2VmqYgBgK/ShUlEByMfWiQt4ALaKO69w3lIbLxZRHoW8At4ZP2Ym6Yr+dCWUnw04zn
         64mXZA/O9igy00xwrKW3nELky7ysAxw8XG4+TQ84qs5S9dgOj19arHfU9S5NQhPyqDF6
         IrPg==
X-Gm-Message-State: AAQBX9c5jFptXPXB5tNy78qz265myl2Nk7uRXukoyzLI2fyFkqWwg5bv
	XpzWG680uPZzh1ENpTBRIJcAxuPl04q5obJb
X-Google-Smtp-Source: AKy350bv2nW0ssSW58xZk/A1hVR6vQGpLcJ1lDh0NrD7/70XHYAWOJKVIw/lFQwMBDo6Wl2JAZ8PLg==
X-Received: by 2002:a17:907:8c0e:b0:930:bc07:3bf7 with SMTP id ta14-20020a1709078c0e00b00930bc073bf7mr207842ejc.5.1679599213094;
        Thu, 23 Mar 2023 12:20:13 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id ia9-20020a170907a06900b00932b3e2c015sm8161409ejc.51.2023.03.23.12.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:20:12 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] staging: rtl8192e: remove blank lines after '{'
Date: Fri, 24 Mar 2023 00:20:02 +0500
Message-Id: <303a41480220a6c31cee91d40ece40b3fae3bddf.1679598576.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679598576.git.kamrankhadijadj@gmail.com>
References: <cover.1679598576.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines after an open brace as reported by
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

