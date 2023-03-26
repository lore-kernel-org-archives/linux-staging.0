Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE3920E8;
	Sun, 26 Mar 2023 12:18:35 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id d17so5915468wrb.11;
        Sun, 26 Mar 2023 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679833113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+ndiX5rXJ02XC2sW9a3uAWMCd1mtaGH5vgN2+hWRpM=;
        b=EoqmL4czwnpypXkaiLwq1mubxGdDsD3UtFSRq0VlXSagUdJuJiwG092u9P+gv4TGg+
         qh/RrA2Jd/4+hj8CUVxUKoLlpsH5zVuy2kbiL/EmrC4/we1sWh4/qXLSxXvKh7UfhsNt
         yuMfrKtJEwM6Fhk/AxPWNbZraNYj0XSH31CDf8CfjlBSZcmOpZZRUvoEhuHmCOgB3L1o
         fGr9yQmc8bv+GffjKeZgwjTpGsVuLGeBrN1IjFS+k/oC4iG67t1SEZS2TomU02cV+yNA
         ZYulGTtVllI0PZuNWSDHsR57qqRIxki4v5OsVgcN8C+H68zskt6tLCyvieT87NZQlaHB
         V97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679833113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+ndiX5rXJ02XC2sW9a3uAWMCd1mtaGH5vgN2+hWRpM=;
        b=OeIGw2p1aw1YCQ+yfJkHFP1k+9ACj2ZzFxtRlG/ekKbfLfMU7dkNvqrukNiQQHx6Ug
         8+j4uKb5hx3o5EV40XK7g1TV1XAGpo8324YeKPithcjyGfcsOIuoJfNJNgjbfQnWWAT7
         BLIsltq3T+4ITWIGgXiT//EHEPaSeX4EzwgvBFeL5/Re4tQSJ7NAyk5zDACZMpIlXiXB
         /1X8ipADEKK6P9+Q4L+/a6ZosG1M6/k1W7EAi6MgKTBUlNvfI6karuVgofOk0etvoe5w
         z54evUWpOz9+om6qFspY/j4KR234SEayu3hFtI+M7ojsWIAmb/hHSNGGd9Alp91y+pWG
         Mq+w==
X-Gm-Message-State: AAQBX9cKlqIrIGafTFY16EjLJRsvOIETVff1KH20Zq2REgHT/DxUFRHm
	gMnl7G1uxfHxSCwk/LNhFrH8vF91tLL/nA==
X-Google-Smtp-Source: AKy350YMjAbzJOfnKXGFcAGBqbNrDrgu3ap6fRspTjdB8n/uIzLaKge/KVY+6pCNjHZH1wfH4l0R1w==
X-Received: by 2002:a5d:460d:0:b0:2c5:5a65:79a0 with SMTP id t13-20020a5d460d000000b002c55a6579a0mr7660558wrq.53.1679833113210;
        Sun, 26 Mar 2023 05:18:33 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe88a000000b002c70e60abd4sm22740265wrm.2.2023.03.26.05.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:18:32 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: rtl8192u: remove change history from comments
Date: Sun, 26 Mar 2023 17:18:25 +0500
Message-Id: <95fff39231ebb2bb683c2a8f252a93f4845fffb1.1679831899.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679831899.git.kamrankhadijadj@gmail.com>
References: <cover.1679831899.git.kamrankhadijadj@gmail.com>
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

