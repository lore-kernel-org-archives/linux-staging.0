Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4F82C9D
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:38 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id ka4so35974956ejc.11
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qxj0iB/eMUcfNUAgzK18y+5Dk7DeQji/c56lMFl6ONU=;
        b=K3Onn5NEayj+wNxch/QvAzA/AeIJcpp1mlFkdh+ruahgGHmX23B/v9cu5cqH9RKcX8
         RRQHgFViC48JwugRg9BENIUJpKgBCxxYBQlgXeUr7xZ7GqrzjXAkYSeu/1LNJfjkgepf
         rMgUrEwsQ94dMOosZIXc5rC92+iMtsmDGY6a6cuAcVYTi487sLccJKCihf+38V8rdyDu
         FAhuVL3HlK7Z3XQFfkhr0Q7SOcQEDzqir+nJjqFM2FQO/8zbq5UtnzeYF4bQRaaKuh6v
         SRByIQxfO3fX4QjZMnjZiwOgkYbK6nxd2R+1JLC8SWYpg6u0CXdG4ls1VvM8pfos+U9C
         DZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qxj0iB/eMUcfNUAgzK18y+5Dk7DeQji/c56lMFl6ONU=;
        b=UabV5ewl3fdmbhT5nHs94tGYD9urqq1p7piJwWtFV8VNXublJa3KuYu1sFGOuD69Lz
         BW16YGlcZ6c7uA8IqhtZe1Qp3nmBxrB1apBS5Helle3k5XjdnUoHEJ1IxHj9zPOu2vIN
         euc7UwqUorqpqB2B8kdhGLw6/N4bPXb9+yqMbNk9nvIB8pXRUImhBjm6vge8ZXuabBXS
         uc3n7FNGa4JTw1QEvTnXmfsRocd3oUKI2lZIHE227epkKXQrrD4mCjikKFHFKOR/GeCe
         P+2bjCUA1NgGMyzJVzONI4TKBrMSJEMmgAld+qnmT4Xql5WECHUjpNBoIF2F/8DFCp7n
         hmCA==
X-Gm-Message-State: AOAM530HVV2LDuLyyl9vAkN81cFCADVVQXHZ2gsT1ClK9Kqdwoz01N+Z
	5eLAaKtkDupfkgmUmS2tKVQ=
X-Google-Smtp-Source: ABdhPJyZW59ublDLOclsFrgWGOh4x3ST2X8l5hkUCNSELgdG58yJEeHDmgDKIyl5jFIH1H5noAUK5g==
X-Received: by 2002:a17:907:7da2:: with SMTP id oz34mr7580751ejc.400.1643569416541;
        Sun, 30 Jan 2022 11:03:36 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:36 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/12] staging: r8188eu: remove HW_VAR_CAM_INVALID_ALL
Date: Sun, 30 Jan 2022 20:03:12 +0100
Message-Id: <20220130190321.7172-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130190321.7172-1-straube.linux@gmail.com>
References: <20220130190321.7172-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove HW_VAR_CAM_INVALID_ALL from SetHwReg8188EU() and call
rtw_write32() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 4 ++--
 drivers/staging/r8188eu/hal/usb_halinit.c    | 3 ---
 drivers/staging/r8188eu/include/hal_intf.h   | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index d40669c21fc1..34d271b737e9 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -429,7 +429,7 @@ unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval)
 
 void invalidate_cam_all(struct adapter *padapter)
 {
-	SetHwReg8188EU(padapter, HW_VAR_CAM_INVALID_ALL, NULL);
+	rtw_write32(padapter, RWCAM, BIT(31) | BIT(30));
 }
 
 void write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
@@ -492,7 +492,7 @@ void flush_all_cam_entry(struct adapter *padapter)
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
-	SetHwReg8188EU(padapter, HW_VAR_CAM_INVALID_ALL, NULL);
+	rtw_write32(padapter, RWCAM, BIT(31) | BIT(30));
 
 	memset((u8 *)(pmlmeinfo->FW_sta_info), 0, sizeof(pmlmeinfo->FW_sta_info));
 }
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 1fa57354389a..bdadd9588c79 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1332,9 +1332,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_CAM_INVALID_ALL:
-		rtw_write32(Adapter, RWCAM, BIT(31) | BIT(30));
-		break;
 	case HW_VAR_CAM_WRITE:
 		{
 			u32 cmd;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 5fb0143c86fe..0a687fa4326d 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -29,7 +29,6 @@ enum hw_variables {
 	HW_VAR_DM_FUNC_SET,
 	HW_VAR_DM_FUNC_CLR,
 	HW_VAR_CAM_EMPTY_ENTRY,
-	HW_VAR_CAM_INVALID_ALL,
 	HW_VAR_CAM_WRITE,
 	HW_VAR_CAM_READ,
 	HW_VAR_AC_PARAM_VO,
-- 
2.34.1

