Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299D18035
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 01:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752803754; cv=none; b=mfmoFGvENAHlAKFXFKbh1r0IVotmRW+0BLBR85/4088ARtpSbMIaaomqcmr2YzTB/gXRCv26vZ4H6YKgXnwpCqKqcPyqua5OZBiywC+TrlBRXANjSiMCd9m3BW8bAgzjFTaG0OkwKF14tZ8WLmVP1IlPLd0Ivhmw0dZYDlTVFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752803754; c=relaxed/simple;
	bh=20DCxdKAsTeDjS+r8T+9Ikr6q/ALKVAVb135jUfAnEA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=kZiMM7OHQte1Q/1I2nwv4xCLrJvydSWpzb40jZ2RQd07bZPdC+HqVYRHb/6oyHIrPvIp8CeFcSqzvZmKXa/nYo4KKHyglkf7XuSws2gIKB/6T83O1bsDk9tkv5/Qe1ag9Zcdss20sH8eOp07giYHU7jxJEx8nrtdFV7AlW39lrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhAq9uT2; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhAq9uT2"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d7f0fcef86so152535185a.1
        for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 18:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752803752; x=1753408552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtFfofjayrjeKW0qhDCX7H6D6mu8v6iNbOK27WV8o6I=;
        b=KhAq9uT2I8uwVTKSDhxsBj9R/bRHEDSbZBQJ8ynAVh0iSIB+FcmEk+EHC0fvXQmVpc
         BiE18EWDjhETVzoOlyt4tIyZiLbvNeqYGhJ5n6VRnSBq7ofJAWPQbrL+jOw1OTjfS2E4
         mKHl05HdrRitB6UCcKesef+RUB1Cj0EkUiBouoI0DG2E1vPAnyZH4vd11ctta4+IRC3L
         abF2Cgtbw8qMyDtBLKo85Ej+F6bw7d+NdVTLrbU9vmyu5bmLb5FBILmW0hN5kmWiXAEC
         RKWHXewcv2UFvo/F/cLr4GzjMUBbCvSVRuY7LuwD+mtbKyHqxT6tiUTU/YZ0gxKJgrXd
         Wnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752803752; x=1753408552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtFfofjayrjeKW0qhDCX7H6D6mu8v6iNbOK27WV8o6I=;
        b=oIGi1CZBRORURRd8xDuWBW55nmNwvCemzMPv84SkA/iP5WpHITBQpemdgNnI2gTemj
         kjQrcP4rsWTi2JTJXKC3FrQETQ126kWKEApXkTjDoqROPHq6/YmBMTf/6iB1glPoBpXR
         xpODvnFgG5t3NZOYJfZo+y12bagzdQVCNKQLl3Qa7Mn0WJlbEjEXDQH0AqVntY6SnIUA
         T1W6gJ6bfWQ3ydWI5FCNTJJAI5CChw49desyLAb2lzOjMvElFC+XT8Zfhhri/kB4rknR
         pRTPhNSxkFEkDc3LJ1IwjBNRAzAnnd5uFP3IL4WMzhe8XjSKGPOimUvuxWmLbLJIM3xR
         aSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlWM0VjCxmiceABysr8qpkao76hsSC0dt04RwjYDGObwaUXqgTbfoTHKnvwuo7XZXqqavLwINYO5hdfAeG@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4ncD91TknxmQ3K9M5VrpMkteoqDa9wsWe5RqXBfIHJvVtV4Hx
	2sKDrc0pDCPWNuLFtElEeoBlKuA+GbqSzsOU8RykGb6SpEzG7d0NEouU
X-Gm-Gg: ASbGncvRnHcip6q239/tpRJJz9hwb7ByAIdeuo2AKSeH0LwCVds17HTVRc8V2YZwujI
	pXLIvLMnGD6QH0jLQPtnfSqLt7nX2ne247oXcNxzlZ+jyBR3It/VNOhv9SpDy7eHkUi1h2yiR52
	y3sGgHvlovy/nVRs/n1LDfet7NIaqornMYB/CPegZjzSWNKbL2e3YFCkYqdJ2ZkxEoZ9N6JPFbv
	CD8eRij+YRkShgUTOPkX072o8uN+M/Qpnjm/MoHPjpouFYJlm/38mWIlAQh9Nu3hXTcQxk45OB6
	ZHuJhsUMNi+nyIwsfTB0VEx5ZcbKV17Pqbl6/UqjXPPJaiJfd6xHqF+0hqyXuuYyjuHa6OwFt/q
	qrFByXgSKtJdpD4iZ+gtUh8SXkjf+rKzG3SB/TH4PuN6ybr7ffIQ=
X-Google-Smtp-Source: AGHT+IGlnfcl2f5QuL0UPlHYoxnPncK/CJRs0DM1FsmO46euhoYOdzFtKOhBp++MjORv8Dvtbxekcg==
X-Received: by 2002:a05:620a:2915:b0:7e3:3699:f3fa with SMTP id af79cd13be357-7e343658639mr1369121885a.58.1752803751815;
        Thu, 17 Jul 2025 18:55:51 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c3e32fsm32479985a.52.2025.07.17.18.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 18:55:51 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3] staging: rtl8192u: Rename ChannelPlan to channel_plan and fix index name
Date: Fri, 18 Jul 2025 01:55:25 +0000
Message-Id: <20250718015525.162561-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames the global array ChannelPlan to channel_plan
to follow Linux kernel coding style. Also renamed the index
variable from channel_plan to chan_plan_idx to avoid
shadowing and improve readability.

v2:
- Fixed Cc list to include Greg and staging list

v3:
- Removed EXTRAVERSION = -vivek from Makefile.
Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 Makefile                               |  2 +-
 drivers/staging/rtl8192u/r8192U_core.c | 16 +++++++++-------
 init/main.c                            |  1 +
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 997b67722..93b6fa091 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = -vivek
 NAME = Hurr durr I'ma ninja sloth
 
 # *DOCUMENTATION*
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 0a60ef201..b449d0d96 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -120,7 +120,7 @@ struct CHANNEL_LIST {
 	u8	Len;
 };
 
-static struct CHANNEL_LIST ChannelPlan[] = {
+static struct CHANNEL_LIST channel_plan[] = {
 	/* FCC */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 36, 40, 44, 48, 52, 56, 60, 64, 149, 153, 157, 161, 165}, 24},
 	/* IC */
@@ -145,12 +145,12 @@ static struct CHANNEL_LIST ChannelPlan[] = {
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14}
 };
 
-static void rtl819x_set_channel_map(u8 channel_plan, struct r8192_priv *priv)
+static void rtl819x_set_channel_map(u8 chan_plan_idx, struct r8192_priv *priv)
 {
 	int i, max_chan = -1, min_chan = -1;
 	struct ieee80211_device *ieee = priv->ieee80211;
 
-	switch (channel_plan) {
+	switch (chan_plan_idx) {
 	case COUNTRY_CODE_FCC:
 	case COUNTRY_CODE_IC:
 	case COUNTRY_CODE_ETSI:
@@ -172,15 +172,17 @@ static void rtl819x_set_channel_map(u8 channel_plan, struct r8192_priv *priv)
 				 "unknown rf chip, can't set channel map in function:%s()\n",
 				 __func__);
 		}
-		if (ChannelPlan[channel_plan].Len != 0) {
+		if (channel_plan[chan_plan_idx].Len != 0) {
 			/* Clear old channel map */
 			memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
 			       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
 			/* Set new channel map */
-			for (i = 0; i < ChannelPlan[channel_plan].Len; i++) {
-				if (ChannelPlan[channel_plan].Channel[i] < min_chan || ChannelPlan[channel_plan].Channel[i] > max_chan)
+			for (i = 0; i < channel_plan[chan_plan_idx].Len; i++) {
+				if (channel_plan[chan_plan_idx].Channel[i] < min_chan ||
+					channel_plan[chan_plan_idx].Channel[i] > max_chan)
 					break;
-				GET_DOT11D_INFO(ieee)->channel_map[ChannelPlan[channel_plan].Channel[i]] = 1;
+				GET_DOT11D_INFO(ieee)->channel_map
+					[channel_plan[chan_plan_idx].Channel[i]] = 1;
 			}
 		}
 		break;
diff --git a/init/main.c b/init/main.c
index aa21add5f..648589720 100644
--- a/init/main.c
+++ b/init/main.c
@@ -680,6 +680,7 @@ static void __init setup_command_line(char *command_line)
 
 static __initdata DECLARE_COMPLETION(kthreadd_done);
 
+
 noinline void __ref rest_init(void)
 {
 	struct task_struct *tsk;
-- 
2.39.5

