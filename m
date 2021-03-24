Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092686F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b9so24320718wrt.8
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RcJT69StK3zCxer+PUCrairhkv5NW4JYx4JIYLIVYZY=;
        b=c3WMBgKB2bFFbDV7uiTofMxVpLtzQV49OXKhPNzjxm6SbKIx8nUi5KebtOxgTCqC6P
         X1npEsrRJ2Oq6v8MgSEEyVePLmcjz0K5vDG0+L6nUFWOtKYJn/UGmQCmzB5ObmtFyNM/
         Ei8imuK8hIVthdfQQgwC40XwJnNryoKwg9Ru6W0tBUMUApb2iMdK2uoLJAEv+ynuH9Oy
         k0vxbwErojdAFXG+E4DFwy0O/PacBFP/0jAWW9CaShidrQoxCj1R/aUHyHU65xDE/SDI
         hRb+BeQOxsTys+R8iqiTw5bjBmTfmrIa/ecYxDJfqDAmhd5eth2EtSJ2P/N2CiH53Ym9
         ciRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RcJT69StK3zCxer+PUCrairhkv5NW4JYx4JIYLIVYZY=;
        b=f9lhrul3uYTvksxK3u/1n8zJafhzW+sDihhHeYIGtr9ow+1Yy3VNmXwomHnOmWZquQ
         ejSs3BP3aGPyl/nhy0lgzNOWpVFqadmvMhLBMLz9bQcpZzA1rOsEb+238ZdYYHMxdNDE
         0iH6pgXoafTdfZZkOl4ViOT76hheEI7bkV8g/POQxnSzeExLrdtFPk7Hr0cJpJht/vqc
         vGFb1OvB1BKu5NvOcrHvh5zYIZkPPbtENbN6vXelwq+mrJNvKgAhhK7dbwfl6CjCQ3+p
         btPDLaXzUrTJvz5fTwwY9ynQBLChl80VXt+rC8ziU2M+sNXznib454Rj1i6cDGE6BMaI
         LfVw==
X-Gm-Message-State: AOAM5311udFu+C9UwPYX1nQ4uNeHI2e7SVWIU/q3l27DMCqMFeAwTi+u
	GKNW7RoD/OtNrWo3Aw6e9WQ=
X-Google-Smtp-Source: ABdhPJwI3u1g19TW5TZsoVXiQLoGQyG/URqSeAziQvABXH7vVSV2kt4P9+BQi1cWPKmKuWGKVYe2Ug==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr2793379wrx.236.1616589913526;
        Wed, 24 Mar 2021 05:45:13 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:13 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 29/33] Staging: rtl8723bs: remove named enums in odm_types.h
Date: Wed, 24 Mar 2021 13:44:52 +0100
Message-Id: <20210324124456.25221-30-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
hal/odm_types.h:

	enum rt_spinlock_type

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_types.h | 41 -----------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_types.h b/drivers/staging/rtl8723bs/hal/odm_types.h
index 0b1b3e14d451..8168dc14e879 100644
--- a/drivers/staging/rtl8723bs/hal/odm_types.h
+++ b/drivers/staging/rtl8723bs/hal/odm_types.h
@@ -27,47 +27,6 @@ enum hal_status {
 };
 
 
-/*  */
-/*  Declare for ODM spin lock definition temporarily from compile pass. */
-/*  */
-enum rt_spinlock_type {
-	RT_TX_SPINLOCK = 1,
-	RT_RX_SPINLOCK = 2,
-	RT_RM_SPINLOCK = 3,
-	RT_CAM_SPINLOCK = 4,
-	RT_SCAN_SPINLOCK = 5,
-	RT_LOG_SPINLOCK = 7,
-	RT_BW_SPINLOCK = 8,
-	RT_CHNLOP_SPINLOCK = 9,
-	RT_RF_OPERATE_SPINLOCK = 10,
-	RT_INITIAL_SPINLOCK = 11,
-	RT_RF_STATE_SPINLOCK = 12, /*  For RF state. Added by Bruce, 2007-10-30. */
-	/* Shall we define Ndis 6.2 SpinLock Here ? */
-	RT_PORT_SPINLOCK = 16,
-	RT_H2C_SPINLOCK = 20, /*  For H2C cmd. Added by tynli. 2009.11.09. */
-
-	RT_BTData_SPINLOCK = 25,
-
-	RT_WAPI_OPTION_SPINLOCK = 26,
-	RT_WAPI_RX_SPINLOCK = 27,
-
-	/*  add for 92D CCK control issue */
-	RT_CCK_PAGEA_SPINLOCK = 28,
-	RT_BUFFER_SPINLOCK = 29,
-	RT_CHANNEL_AND_BANDWIDTH_SPINLOCK = 30,
-	RT_GEN_TEMP_BUF_SPINLOCK = 31,
-	RT_AWB_SPINLOCK = 32,
-	RT_FW_PS_SPINLOCK = 33,
-	RT_HW_TIMER_SPIN_LOCK = 34,
-	RT_MPT_WI_SPINLOCK = 35,
-	RT_P2P_SPIN_LOCK = 36,	/*  Protect P2P context */
-	RT_DBG_SPIN_LOCK = 37,
-	RT_IQK_SPINLOCK = 38,
-	RT_PENDED_OID_SPINLOCK = 39,
-	RT_CHNLLIST_SPINLOCK = 40,
-	RT_INDIC_SPINLOCK = 41,	/* protect indication */
-};
-
 	#if defined(__LITTLE_ENDIAN)
 		#define	ODM_ENDIAN_TYPE			ODM_ENDIAN_LITTLE
 	#else
-- 
2.30.2

