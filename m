Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B87494;
	Mon, 27 Mar 2023 19:49:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id u1so5656276wmn.5;
        Mon, 27 Mar 2023 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679946560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPniY3ABE/sruZLdMSgZ+HEbx7EmfDzf62Z17Bwx1Ak=;
        b=Jp2YU7qCgvZ7R2rCUAPUlzoUKdssJSvgdDuyFZiYh5qO3Pqmlgf67CTx2mOiO6qKxV
         57yH8QmWmS2+4JsdYaRZiZw6xIPsxo4kqGS13ib2JcJnVVbQTTJophKQSoPaNRygJeG5
         5B5abgaYu8jvhIrRbnDC1YjLGople/D1y6GXh+NlxMlrWHZMLD5r7la78Vle9DvnHR25
         jeQPp6UFV8ZbM/1XqoHfWI+sGB8Zp5Sk5uSIiLyB7RESiVTPRi/KetI2HdNxUCNfl8xf
         EJD/jSy81pL96HqSLY6qeGJmFtYORXmciz4ybAEe/W/4MAsuzE8Sp1ctDCVM6OwnRQI5
         yOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679946560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPniY3ABE/sruZLdMSgZ+HEbx7EmfDzf62Z17Bwx1Ak=;
        b=5fJGITqZkVTwm9x5G6b3C9xRZbrSkQtSyKRDMFTVyxTjgDfaxs/HdlyI6slbNVEAS3
         gfadw+5EcBUxo75v9ndebFIEU9qV3bmAgZTomfjwS5nzpUVtFJKWHtDlSQKv9srRYY+c
         8ond66T7Bz3PR94o5Jozwpvl9VGYrXWlgXCoHNwRqsYlo2s7i7qeaY4BursVl32egUEW
         fmSiLHHezmRAscoyOVDFrwxbZegIdgtT1UheFzDg/R+QLyVJpvJ2bdvzKj1WToztL81f
         STp9ZS90F673K6sD4Qr0lboHXQohagO+MiouHYMVLdbzcD1f/2WBahgqXqTZfmK8eRki
         6BgQ==
X-Gm-Message-State: AO0yUKWEdv8GKd2tv9suNvVS54Z8To+/Q5B/bOf2Npo1DCr07zdy8xPt
	SJ7VwEyx5pZVJRtaYjKIMXtBhv49hAUMk//c
X-Google-Smtp-Source: AK7set9bVcb5J4EZwsO3Gh0znIBxvte0wIssM94wD+oYiUrT0TbMIdu5FDWi9o2K9dhUIM8nd+/djg==
X-Received: by 2002:a05:600c:28c:b0:3ef:561d:255d with SMTP id 12-20020a05600c028c00b003ef561d255dmr9392630wmk.41.1679946559770;
        Mon, 27 Mar 2023 12:49:19 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id c13-20020a05600c0acd00b003ee42696acesm14661366wmr.16.2023.03.27.12.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 12:49:19 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] staging: rtl8192u: add '*/' on separate line in block comments
Date: Tue, 28 Mar 2023 00:49:09 +0500
Message-Id: <140e0928531e61dc7396271a5b16a6be17514c76.1679945728.git.kamrankhadijadj@gmail.com>
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

Linux kernel coding style uses '*/' on a separate line at the end of
multi line comments.

Fix block comments by moving '*/' at the end of block comments on a
separate line as reported by checkpatch.pl script.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index dd9903719c20..cbae852478ea 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -244,7 +244,8 @@ void init_rate_adaptive(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_check_rate_adaptive(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
@@ -1525,7 +1526,8 @@ static void dm_bb_initialgain_backup(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_dig_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
@@ -1565,7 +1567,8 @@ static void dm_dig_init(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_ctrl_initgain_byrssi(struct net_device *dev)
 {
 	if (!dm_digtable.dig_enable_flag)
@@ -1751,7 +1754,8 @@ static void dm_ctrl_initgain_byrssi_by_fwfalse_alarm(
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_ctrl_initgain_byrssi_highpwr(
 	struct net_device *dev)
 {
@@ -2137,7 +2141,8 @@ static void dm_ctstoself(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static	void	dm_check_pbc_gpio(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
@@ -2166,7 +2171,8 @@ static	void	dm_check_pbc_gpio(struct net_device *dev)
  * Output:		NONE
  *
  * Return:		NONE
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void dm_rf_pathcheck_workitemcallback(struct work_struct *work)
 {
 	struct delayed_work *dwork = to_delayed_work(work);
@@ -2407,7 +2413,8 @@ static void dm_rxpath_sel_byrssi(struct net_device *dev)
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

