Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0971A3A80
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 02:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752804030; cv=none; b=u/YrgbDvW7Qx9ZHxmGq2IoyY9BkjzaheaQZzw1f+HN0prO3xt76eIt7EybSm+ehIJYPkVP4itGE0C0V9gTzIVQehHZLUpRdaFHBAi22PZwFy4Qq8NQixg+ZqJZz8H9nTevzXydCFq+uvH4IXZvB7A2V+qQrnQDJLBjBbodl2xV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752804030; c=relaxed/simple;
	bh=RtGwBwsoM+YdBqJCMoMBjHu4AUT6wQVKiQgBOmsy2zk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=DoWD0gECVdj1BQGrXK9jkWov6+N8TVJXTz7dMp0F7rvkG/UmNbA+QEHYSkeHdkC3i1c58dtt/XjhJEPp3s2QhrH5meKyROAt8FoIyFUxu4xM6A16zMif3uQX7AHr2BBLq18umBNJ9kXOeYKOIajV0V7NhIj8ddqGAD63ll0pH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+K6lZ9i; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+K6lZ9i"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab93f24dc3so28943211cf.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 19:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752804027; x=1753408827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9COw14ata83P2hN7EoNI52jllfLH9udiIyK4NEOuRdc=;
        b=f+K6lZ9isEx7DT+XGYHKjkgW0cyYTdreFOvXzUNYccPDbI+PapvGvUSV+zFumCr6om
         yVdwF/Jfo5vsp+Fafr11Pj695Zgq/3DirdPPouSm8UaP3mVQo2yCzchRMR4/+gFr4pSN
         aDP7amZgnrjsBgo5hHLaZ0v+6Qgb+3vBJ2vUOqVfb1bFH0gwad3334ee6i/FBdoh3aYR
         tZmhzFKtbIk5nxhTmjy5X+UqpDoFUk+//ultDszKGW9hGLhwX/9rnp3L5eHFyefjok7I
         VOMgc4XD/GozMFHM74jX74zw/92DKY3VV1T1V5byISBFhKDDzmrvg9I+JSkfht5fthj2
         +MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752804027; x=1753408827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9COw14ata83P2hN7EoNI52jllfLH9udiIyK4NEOuRdc=;
        b=IkEd2ekkWgu+WdXwCbxaRxnFu4v7+rMfzyYeVgCq2V/HmMmXWgnOktZeu3mMC/SYNg
         dib0Akdqxfdj0NjRhmoIXe81c12VqF7o5w5UMqHI5QFiFkrNx1dq8M+9WJgcnwN/S0Re
         Xotjb9YxDa4Mug5el0rlpJFTX1EA7l8FzedJeGM97tpD3f2NgWeTgNsG4itMVa+ghool
         lYMr4dKQZeGS/8a2Gv3WWOKwPQ4UqaJ5StqTrNv7MkOSK8gdf5RqJ/FUeKPj0mYS2x7l
         UJOiVxm87gMene99el24KFonU1TgXyNgkKt9EqJQE9n6ilc/G+ha1tcV+4ZYSx0b12Di
         mFBw==
X-Forwarded-Encrypted: i=1; AJvYcCUDv+nBhWvf7n5is0HuduT/TdxdX2EFOXXDIsYGvSo8xjfY9alijdjlxU0U0GK3EBJYK9shp7NY949nCttH@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6hqCOw65ZZZl5Nd9THaXbltNuDGF4eVdL1rM4QZz2y8u/oQnP
	KX5e6MeMEyWzxLehmMZAK0NcLSvyV/Gk6tL2yxxr9LEPDStdDQhwgtr/
X-Gm-Gg: ASbGncsmzW0MJ+01DJ7DtPerMYEAclEYRf6qffFaBtK9YQ9X8rYxraHRDWpy85utac5
	5meZ2g3/KStqcJuBk+19xrp6e1Q7tLEL7JEci2OO9stTAyFyjCs7JM5g8whNFU7oo7t9gTbVN5c
	Pf8AOTc2a6UBMxX1vboEjbSoW0dM/ViGhthmRBfQNs04rAn/yUIN/ZIpMQZUDggQXzuvAUP4tGB
	4gtdeeKrn8NQ1VfSsmq0TCUQftVO13FoUSZvtLq1VgucI5mvtubhUN110+pmgM9NMDhdqkUdrBi
	P3iwHtmEPtsC1/F/bkZfVZEb8vxDte48m29yHM5BpcDxb22g4p0nMNnEgjtNN6EK9MbSFfogfwA
	g/QE0AtQO3nDGRTD6RR+M9LO2IQUAHGaj3Cq/XusQa0qKGJVxyog=
X-Google-Smtp-Source: AGHT+IFnuc6J+FrFQP9DOdmL4XTa6mu7FhA0kgysswrAIgU175zByPCXQT3aDqaALDIInWXrUeE/6Q==
X-Received: by 2002:a05:622a:1827:b0:4ab:5337:618e with SMTP id d75a77b69052e-4abb2caf197mr19548721cf.19.1752804027123;
        Thu, 17 Jul 2025 19:00:27 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb49c7867sm1992201cf.32.2025.07.17.19.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:00:26 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4] staging: rtl8192u: Rename ChannelPlan to channel_plan and fix index name
Date: Fri, 18 Jul 2025 01:59:25 +0000
Message-Id: <20250718015925.162713-1-vivek.balachandhar@gmail.com>
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

v4:
- Tested and verified Makefile EXTRAVERSION removal does not break build
- Removed EXTRAVERSION = -vivek to keep version clean

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 Makefile                               |  2 +-
 drivers/staging/rtl8192u/r8192U_core.c | 16 +++++++++-------
 init/main.c                            |  1 +
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 997b67722..a31bb7e1c 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = 
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

