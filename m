Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB972574;
	Sat, 25 Mar 2023 12:13:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id l27so4206429wrb.2;
        Sat, 25 Mar 2023 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679746405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ul/BAwjN6kVOclIZnvLzH9MCidPTY/so8Fz3YYqE9pQ=;
        b=LP70QvdBjKIgCHf8mf9AJhUFPz8EuASPOyfqA6khc6kBDPK55XnDiMML6YTZbLPQot
         s10TJJ3KJ876QP2WUnUPEZIU2PSOYk9NVrN/c72yqhsrk4L9E9lLF5DjHG3Wmu6HezUt
         FEk5yY5w9to13YVmw70BEB1fSzynlALNIxhi9hI6Q7Z2AOcV1B1wxZF2619FlEufLHpV
         sGIrt3GMxZ83JbI8fxGqXPm+dbtVQREH6MVmWyJYsfxcrZ1d1iNx1L9HxlvviTWzDA9l
         DsWw7pYK9VkD1YSTfD7LHra2yTitmLfn52YhX75mTCG4pPcUAfFRtq5jUnU9OQgbEGFX
         uFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679746405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ul/BAwjN6kVOclIZnvLzH9MCidPTY/so8Fz3YYqE9pQ=;
        b=jYB+T7yVuNgcA7E07fN8dnXK2ckvCKnPJADPlOOfBySLDAPkVpcl/QN6Y0WOxBED8p
         LGeLoonyAzQwupHkjixEG7htG6h0fHRcrh9z3UFfamVcrNnHcN3yo8fH/Lc4wPkkEikQ
         W51Nu6A3OUElI17c2jUt016t6BtO3KO94xrxjpdQunUvJcoupbJQ9xN2fkQwy847hoSm
         F40773X/fhxmh9Uxd6dEjdPQMDBAMo8VLCvqrf57VGCBM9LO6/Q6c1nDs8olooiw6s8w
         USq2STckvGClDMa0wQjQr9b3yLw16t3DR56y1Zb8TK0Lon1cGewuuCgGKBWUHg9uGmDK
         Ldsw==
X-Gm-Message-State: AAQBX9eYqzqHRESQ7vsa7JGzS9ZwASNhi9PUwSGBpfU4xpkhSAjfBI7J
	LjTlD5fU+w9B1fEMGoVMqWItvfA8v1RXJA==
X-Google-Smtp-Source: AKy350ZGeEMPsmcr9t1MWGI2OgG/QSumMvuWwD4IfF/URVCUTSbodvMXt6aAJK/xwgthfbPR/6VylQ==
X-Received: by 2002:adf:e345:0:b0:2cf:e436:f722 with SMTP id n5-20020adfe345000000b002cfe436f722mr4160832wrj.64.1679746405299;
        Sat, 25 Mar 2023 05:13:25 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id c10-20020adffb0a000000b002c70c99db74sm20504791wrr.86.2023.03.25.05.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:13:25 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: rtl8192u: remove change history from comments
Date: Sat, 25 Mar 2023 17:13:17 +0500
Message-Id: <c4ec9246e2d103c15e451fe3d6ed42692c93d39f.1679744684.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679744684.git.kamrankhadijadj@gmail.com>
References: <cover.1679744684.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Developers use git to browse the file history so revision history is not
required in the comments.
Remove the change history information from the comments.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 36 ----------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index a88686be3523..885c5966342f 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -8,11 +8,6 @@
  * Abstract:
  *	HW dynamic mechanism.
  *
- * Major Change History:
- *	When		Who				What
- *	----------	--------------- -------------------------------
- *	2008-05-14	amy                     create version 0 porting from windows code.
- *
  *--
  */
 #include "r8192U.h"
@@ -276,10 +271,6 @@ void init_rate_adaptive(struct net_device *dev)
  *
  * Return:		NONE
  *
- * Revised History:
- *	When		Who		Remark
- *	05/26/08	amy	Create version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------
  */
 static void dm_check_rate_adaptive(struct net_device *dev)
@@ -1594,10 +1585,6 @@ static void dm_bb_initialgain_backup(struct net_device *dev)
  *
  * Return:		NONE
  *
- * Revised History:
- *	When		Who		Remark
- *	05/15/2008	amy		Create Version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------
  */
 static void dm_dig_init(struct net_device *dev)
@@ -1640,9 +1627,6 @@ static void dm_dig_init(struct net_device *dev)
  *
  * Return:		NONE
  *
- * Revised History:
- *	When		Who		Remark
- *	05/27/2008	amy		Create Version 0 porting from windows code.
  *---------------------------------------------------------------------------
  */
 static void dm_ctrl_initgain_byrssi(struct net_device *dev)
@@ -1857,10 +1841,6 @@ static void dm_ctrl_initgain_byrssi_by_fwfalse_alarm(
  *
  * Return:		NONE
  *
- * Revised History:
- *	When		Who		Remark
- *	05/28/2008	amy		Create Version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------
  */
 static void dm_ctrl_initgain_byrssi_highpwr(
@@ -2277,10 +2257,6 @@ static void dm_ctstoself(struct net_device *dev)
  *
  * Return:		NONE
  *
- * Revised History:
- *	When		Who		Remark
- *	05/28/2008	amy	Create Version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------
  */
 static	void	dm_check_pbc_gpio(struct net_device *dev)
@@ -2312,10 +2288,6 @@ static	void	dm_check_pbc_gpio(struct net_device *dev)
  *
  * Return:		NONE
  *
- * Revised History:
- *	When		Who		Remark
- *	01/30/2008	MHC		Create Version 0.
- *
  *---------------------------------------------------------------------------
  */
 void dm_rf_pathcheck_workitemcallback(struct work_struct *work)
@@ -2562,10 +2534,6 @@ static void dm_rxpath_sel_byrssi(struct net_device *dev)
  *
  * Return:		NONE
  *
- * Revised History:
- *	When		Who		Remark
- *	05/28/2008	amy		Create Version 0 porting from windows code.
- *
  *---------------------------------------------------------------------------
  */
 static void dm_check_rx_path_selection(struct net_device *dev)
@@ -2882,10 +2850,6 @@ void dm_check_fsync(struct net_device *dev)
  *
  * Return:		NONE
  *
- * Revised History:
- *	When		Who		Remark
- *	03/06/2008	Jacken	Create Version 0.
- *
  *---------------------------------------------------------------------------
  */
 static void dm_init_dynamic_txpower(struct net_device *dev)
-- 
2.34.1

