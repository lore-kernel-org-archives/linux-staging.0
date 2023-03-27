Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51587494;
	Mon, 27 Mar 2023 19:49:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso8102392wmb.0;
        Mon, 27 Mar 2023 12:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679946555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+ndiX5rXJ02XC2sW9a3uAWMCd1mtaGH5vgN2+hWRpM=;
        b=lUNofYe7Tgq1WR1WRbmtJUtFok3sGtUwKGREElZ4LpzBWRMH/Pj/fB7F9IV5PRSqgL
         WMKAHfmsN5N3kzwvYzWgP8CI3hWurW7tbeL90ggZmF5moLrDhwmUtPiDgp7pAPtktiya
         pooetdmRKwC3ZX+HpH1cJxqWjiJlHqAWCyDNmfb7MtC7hHMmu+QuQsJv0YLu/Ax6gd0b
         KZoDS17T8Wm82hodqADDbrJv+jVp5SeL30ZbCkcOp4LCNScJswtgtkqjY6/3Cv3gxVrL
         dT87qvq55x4f4v0qMVvjngTlEOwJFQ/gzfp+73p0Omhgm50eHgh+YTznp9lmONMGWzKv
         ATyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679946555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+ndiX5rXJ02XC2sW9a3uAWMCd1mtaGH5vgN2+hWRpM=;
        b=qzgxwlwqgEIZouseT5x5iHs6DWJlLjOTJMdERAY1w5o/7A87GqyLiNvAz41kF+khsB
         B07tSOeDbwQLGbRIdqdZkY/boF4dRokSxjr1o9h3SPmPZNV4R7wq4REn0Wjts0zwHzxO
         My1azSHPWND5du8uEIVB9H5V+b2+ear5/SZwAqvOfjk4NFEF88FI6irMndz0mEjTWzR9
         iXVWrmwAcO4FamEsytHvFhoM65exGVxkLuFulkt0CFdBcoI+6mdH3TZ0YBg+usWQCLIa
         s9NUXjiyTJ6wfiZj6/7ehs4M7lPTovfl9lDHRr2ZsiV1OTMIv0aiC6MMMrKYNmwxXWq0
         f57g==
X-Gm-Message-State: AO0yUKXe24nF42Htpq7QF/JLmMip/p4TfDZYIIBvUSrvL81o68wcKo2B
	vVLyZFZcn9aCkrruhr0i3oqobzC++inU2131
X-Google-Smtp-Source: AK7set+tT4xHUiGnq6RSW28Uqrpa66lsGupdL7ofW1l7uQdAEe3MdFr/Wn45tTxEDyUolU6rWSZ8Qw==
X-Received: by 2002:a05:600c:28b:b0:3ed:5cf7:3080 with SMTP id 11-20020a05600c028b00b003ed5cf73080mr10030913wmk.5.1679946554791;
        Mon, 27 Mar 2023 12:49:14 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id c13-20020a05600c0acd00b003ee42696acesm14661366wmr.16.2023.03.27.12.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 12:49:14 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] staging: rtl8192u: remove change history from comments
Date: Tue, 28 Mar 2023 00:49:06 +0500
Message-Id: <95fff39231ebb2bb683c2a8f252a93f4845fffb1.1679945728.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679945728.git.kamrankhadijadj@gmail.com>
References: <cover.1679945728.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the change history information as it is not required in the
comments.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 45 ----------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index 6a33ca02c3dc..b1ebb776fc42 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -7,12 +7,6 @@ Module Name:
 
 Abstract:
 	HW dynamic mechanism.
-
-Major Change History:
-	When		Who				What
-	----------	--------------- -------------------------------
-	2008-05-14	amy                     create version 0 porting from windows code.
-
 --*/
 #include "r8192U.h"
 #include "r8192U_dm.h"
@@ -274,11 +268,6 @@ void init_rate_adaptive(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	05/26/08	amy	Create version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------*/
 static void dm_check_rate_adaptive(struct net_device *dev)
 {
@@ -1589,11 +1578,6 @@ static void dm_bb_initialgain_backup(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	05/15/2008	amy		Create Version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------*/
 static void dm_dig_init(struct net_device *dev)
 {
@@ -1634,10 +1618,6 @@ static void dm_dig_init(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	05/27/2008	amy		Create Version 0 porting from windows code.
  *---------------------------------------------------------------------------*/
 static void dm_ctrl_initgain_byrssi(struct net_device *dev)
 {
@@ -1850,11 +1830,6 @@ static void dm_ctrl_initgain_byrssi_by_fwfalse_alarm(
  * Output:		NONE
  *
  * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	05/28/2008	amy		Create Version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------*/
 static void dm_ctrl_initgain_byrssi_highpwr(
 	struct net_device *dev)
@@ -2269,11 +2244,6 @@ static void dm_ctstoself(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	05/28/2008	amy	Create Version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------*/
 static	void	dm_check_pbc_gpio(struct net_device *dev)
 {
@@ -2303,11 +2273,6 @@ static	void	dm_check_pbc_gpio(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	01/30/2008	MHC		Create Version 0.
- *
  *---------------------------------------------------------------------------*/
 void dm_rf_pathcheck_workitemcallback(struct work_struct *work)
 {
@@ -2552,11 +2517,6 @@ static void dm_rxpath_sel_byrssi(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	05/28/2008	amy		Create Version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------*/
 static void dm_check_rx_path_selection(struct net_device *dev)
 {
@@ -2871,11 +2831,6 @@ void dm_check_fsync(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *
- * Revised History:
- *	When		Who		Remark
- *	03/06/2008	Jacken	Create Version 0.
- *
  *---------------------------------------------------------------------------
  */
 static void dm_init_dynamic_txpower(struct net_device *dev)
-- 
2.34.1

