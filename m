Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C3B425
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 19:12:35 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id r9so2479339oie.13
        for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 11:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9IUy7GLABZ5KCsScXO19g5oGUisQlGEvz/MbBgHRXn0=;
        b=UpNfO+fLo0XtRNq+Zjx0IvXDu61ZVqKlEhHq5TH7jefsHQFH8m7qeJvJa5NBXqflIY
         LiZStuvaYyz9nQAr/njjPZxgqSDCu2HSAA0mu3VEq1BBU2lq0NyzLus46sephBrBwZ+H
         JB5Nr7nZpyDM4yN0fwHBHqwnWobnYP0T4rFNt0zC4HqfOx2RdoYZTeHyFwSKPbQHqE9Z
         6Z8ZwBcJlTvUSdionPgEFDNkgujetb30X3cI8j7k7UUbwbrejSwU4cYF1BZSdbEOkbxK
         PX4j5pT//oReOn/yhDleAzoB2jkD7ef2KKfTicRU3NDTUY4mXcvXo3VVnlJoqLXIofMy
         Hf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IUy7GLABZ5KCsScXO19g5oGUisQlGEvz/MbBgHRXn0=;
        b=JGNa5qr9gIESeFwIcBTpf9MrANeh00wuYubKC437Xay2uw8lYBhn9Af/+2yznfKINc
         tK6Zc2ZZYH6xRJ5a9a+34DfzobQj/mI4jAIrQch7MlwP6gsBHWOu0cmlOeVzqkswR1Cb
         jX4/ILTb1s4xDivzUBYCYggc+n2ZLbgHKxSkNF+cQgZPjDC5m2cma7npE4unllcSayQk
         tVqEawrDHaRCLmxjXHN51jJkuonF7lLp0pdKglWYe/0ROe0PvSK10avBivgYRNbB0XXg
         xoB1mfydTH99MNiJvk43iWJEceLEN9d06DFSFSspNmhNYoYisqlDsdPFXitFR+BqENvJ
         SoEg==
X-Gm-Message-State: AFqh2krEXHanMx6HLDZQEKCaeS4rQqhs4nBuclwlwzEyNsTmvhuGoCwC
	8WkL1NVI/OhsZCzljABwgDY=
X-Google-Smtp-Source: AMrXdXsz2qG9hNhQ2wRQBsd7Jr3zo+UJhvpVrm4FIJlPBrR9O/h7c7M4pfciMirVcNLa5MRC2rzPcg==
X-Received: by 2002:aca:3402:0:b0:36a:3a8a:212d with SMTP id b2-20020aca3402000000b0036a3a8a212dmr4224163oia.45.1674155554544;
        Thu, 19 Jan 2023 11:12:34 -0800 (PST)
Received: from localhost.localdomain ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id o9-20020a0568080f8900b0035e461d9b1bsm18431209oiw.50.2023.01.19.11.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 11:12:34 -0800 (PST)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Gaurav Pathak <gauravpathak129@gmail.com>
Subject: [PATCH] staging: r8188eu: Fix some endian problems
Date: Thu, 19 Jan 2023 13:12:19 -0600
Message-Id: <20230119191219.12080-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse lists the following warnings:

  CHECK   drivers/staging/r8188eu/core/rtw_mlme.c
drivers/staging/r8188eu/core/rtw_mlme.c:1197:49: warning: incorrect type in
					 argument 2 (different base types)
drivers/staging/r8188eu/core/rtw_mlme.c:1197:49:    expected restricted
					 __le16 [usertype] mstatus_rpt
drivers/staging/r8188eu/core/rtw_mlme.c:1197:49:    got unsigned short
					 [assigned] [usertype] media_status_rpt
drivers/staging/r8188eu/core/rtw_mlme.c:1275:57: warning: incorrect type in
					 argument 2 (different base types)
drivers/staging/r8188eu/core/rtw_mlme.c:1275:57:    expected restricted
					 __le16 [usertype] mstatus_rpt
drivers/staging/r8188eu/core/rtw_mlme.c:1275:57:    got unsigned short
					 [assigned] [usertype] media_status
  CHECK   drivers/staging/r8188eu/core/rtw_mlme_ext.c
drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58: warning: incorrect type
					 in argument 2 (different base types)
drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58:    expected restricted
					 __le16 [usertype] mstatus_rpt
drivers/staging/r8188eu/core/rtw_mlme_ext.c:6842:58:    got unsigned short
					 [assigned] [usertype] media_status

The second argument of rtl8188e_set_FwMediaStatus_cmd() needs to be in CPU
order, not little-endian; however, when it uses that value to call
FillH2CCmd_88E() the parameter must be in little-endian order as that
value will be sent to the firmware. Note that the conversion from LE to CPU
order was le16_to_cpu() rather than the correct cpu_to_le16.

The definition of FillH2CCmd_88E() is revised, and the proper conversion
routine is used.

Note that the original code performed one byte swap on the secong argument
of FillH2CCmd_88E(), and got the correct answer even though the semantics
were very wrong.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
Reportewd-by: Gaurav Pathak <gauravpathak129@gmail.com>
---
Greg,

I intended this patch as an example for Gaurav, but as it has not been
resubmitted, I am sending it to you. If you thing he deserves to be the
author, then please edit the patch before applying. Thanks, Larry
---

 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 4 ++--
 drivers/staging/r8188eu/include/rtl8188e_cmd.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 8310d7f53982..788904d4655c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -193,9 +193,9 @@ void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
 
 }
 
-void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
+void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
 {
-	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
+	__le16 mst_rpt = cpu_to_le16(mstatus_rpt);
 
 	FillH2CCmd_88E(adapt, H2C_COM_MEDIA_STATUS_RPT, sizeof(mst_rpt), (u8 *)&mst_rpt);
 }
diff --git a/drivers/staging/r8188eu/include/rtl8188e_cmd.h b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
index 1e01c1662f9a..c785cf8ed683 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_cmd.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
@@ -85,6 +85,6 @@ void rtl8188e_Add_RateATid(struct adapter *padapter, u32 bitmap, u8 arg,
 void rtl8188e_set_p2p_ps_offload_cmd(struct adapter *adapt, u8 p2p_ps_state);
 
 void CheckFwRsvdPageContent(struct adapter *adapt);
-void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt);
+void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt);
 
 #endif/* __RTL8188E_CMD_H__ */
-- 
2.39.0

