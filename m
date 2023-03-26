Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957E520E4;
	Sun, 26 Mar 2023 12:18:38 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q19so2868638wrc.5;
        Sun, 26 Mar 2023 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679833116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSLEXHRsEJps7ELpV4Jn/+ui6caTrq4Ep39Ig5tNybM=;
        b=kfhTWTquCifZnXz3iJ/NzrWHfXblvsyycFdUGhAxm+ufn4tk6Rmt4GePje+f9cG/H1
         9lccw77w0yFqYlURaTgGHfIY1pWb69XopfkMXi9Tvocb+PLaKxRUcBNv8P0diPYb+0/b
         DSvKqVZU7g+YWcnIz5VPshyrHE7m8EIOvXh8pQSwFoMTMqDTLdiqmZ/MviW2qXBw8yPf
         ZQEWxyb9DEMar7OjBEEGcx2kzgGgquK/B2nfwI44MqqPvhiyw8ze7Zv2xFeOR1OrUpK1
         gamN7UVehTR+9Np4KX3FoiWc5slCLY0wFHIkJN1ADCT+XnwWKSVu95ub7PsBPSrHD/We
         DgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679833116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSLEXHRsEJps7ELpV4Jn/+ui6caTrq4Ep39Ig5tNybM=;
        b=FTQ9k728z64HuIX8Ssb0hBUuSN38cW9YDoym4/9ccbgc2JMkVscRL8XcqEhWRO9Njo
         Ac7HgBKDSLmgOl6OAxDlUA6egCfNUPiH4n4USppXlSodhjiBZ33xe/zsZcIjgd3C/niA
         wEMYnB+s9nrbwE+t/HWKoo5bHjeABXIhKLJ5ThBauZ2GPwAdTrm2pLWh4lNStBw+sKOf
         xDMjWyWvVbpb09a8Nnk1q0BsScWL+IrA7xqE08s4Xq4xa2wYrDC/5jjI03rOLHbv7ixH
         P7ePWUGBzwYzof+kWH9AtJImv5A/ZZz+OnHVIyW0XoWL8lGozHoQ+NsjIvKsK2dixI5D
         Gq5A==
X-Gm-Message-State: AAQBX9c8/GMU1VsQSLf+Qgc/t3waRSU7xVJR2WzGP1j0HGTJRssA9il+
	m8E/mCPufDvjYnhH74lk98VcExuq6zyz3w==
X-Google-Smtp-Source: AKy350aMzS04QInZCbc9pY2PgmiJwpj0rj0B90FuRZhiUX8X70KNZB8tRT9j47TU3fM7Zj6adtpuUA==
X-Received: by 2002:adf:e382:0:b0:2ce:a46f:bbc5 with SMTP id e2-20020adfe382000000b002cea46fbbc5mr6852010wrm.34.1679833116595;
        Sun, 26 Mar 2023 05:18:36 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe88a000000b002c70e60abd4sm22740265wrm.2.2023.03.26.05.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:18:36 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: rtl8192u: reformat block comments
Date: Sun, 26 Mar 2023 17:18:27 +0500
Message-Id: <d49d15e620aa9239f3d68df1a5f8b600de77b536.1679831899.git.kamrankhadijadj@gmail.com>
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

Linux kernel coding style for block comments uses a column of '*' on the
left side and  uses '*/' on a separate line.

Fix block comments by adding '*' on subsequent lines and moving '*/' at
the end of block comments on a separate line. These issues in block
comments are reported by checkpatch.pl script.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 38 +++++++++++++++++-----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index e5c0bece4bb4..99c38a4cf54c 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -1,13 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 /*++
-Copyright-c Realtek Semiconductor Corp. All rights reserved.
-
-Module Name:
-	r8192U_dm.c
-
-Abstract:
-	HW dynamic mechanism.
---*/
+ *Copyright-c Realtek Semiconductor Corp. All rights reserved.
+ *
+ *Module Name:
+ *	r8192U_dm.c
+ *
+ *Abstract:
+ *	HW dynamic mechanism.
+ *--
+ */
 #include "r8192U.h"
 #include "r8192U_dm.h"
 #include "r8192U_hw.h"
@@ -243,7 +244,8 @@ void init_rate_adaptive(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_check_rate_adaptive(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
@@ -1524,7 +1526,8 @@ static void dm_bb_initialgain_backup(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_dig_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
@@ -1564,7 +1567,8 @@ static void dm_dig_init(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_ctrl_initgain_byrssi(struct net_device *dev)
 {
 	if (!dm_digtable.dig_enable_flag)
@@ -1750,7 +1754,8 @@ static void dm_ctrl_initgain_byrssi_by_fwfalse_alarm(
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_ctrl_initgain_byrssi_highpwr(
 	struct net_device *dev)
 {
@@ -2136,7 +2141,8 @@ static void dm_ctstoself(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static	void	dm_check_pbc_gpio(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
@@ -2165,7 +2171,8 @@ static	void	dm_check_pbc_gpio(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void dm_rf_pathcheck_workitemcallback(struct work_struct *work)
 {
 	struct delayed_work *dwork = to_delayed_work(work);
@@ -2406,7 +2413,8 @@ static void dm_rxpath_sel_byrssi(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_check_rx_path_selection(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
-- 
2.34.1

