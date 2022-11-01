Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AAD1EA07
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 19:15:05 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id d26so39481737eje.10
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/oBXqxDLFWq3xQv029eFhBNmCMw5i5DAryxQ4apvwg=;
        b=OZv+ITK/ZUL27cndkP0A26xz4Q7jyC4NJwrQeMhoFL3e9xZ5ctFxL520vVXl2y+hS3
         jSQ6By4kG2U7FjQczlJmpsLLv7CsHs3bbqiJfmBQ4PCY7VLDCEMx7FFFm43UVGpG/49W
         3WMd48nfmsSB09LTfSabYekkuyr3LwVlyn5Z7Qqzest2+o0T4pzXeyVs5YacocWckmT3
         p/NYCy1ZhxAggbwp/qHj+ZK/97YXkBpp6gHU3gpeApNmor6B6/kaHJUtyueOUvYM4lQ2
         TwqrTo8zrMz289HvYWmaC65eI6fauNUSJcsb7cTykQVz6lFeCfsTuDx41lfyVqezPbj0
         s+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/oBXqxDLFWq3xQv029eFhBNmCMw5i5DAryxQ4apvwg=;
        b=h3x4lE8uErK/GdjugxxAEl4pR9AzmtcNabvQjfUJahzWp0zzpK1+gAWS7fIO0dMFtY
         gQl4SzHK4dku1tpQgxVkP6pUmZ08+Csf+y+XZ0EYTNtsciYCqThok7A6poHizpTiYMaz
         dd1GodFrcm6MTKSj+ZlthA6ZhvMZHNSGGOPD2oOaOXJfsTJXKGURWRNSelmMVWKpMxRq
         8+bfDRH53z2dT1DY+5WdPs/ylpTrEDAtqEtMGMOuuUyQF4hq54CnB7c4EmR/TDxZ2cn/
         tIG/2Xgi2UcUkuaDcgAgh3wqGkG2YU+DBCkFdx0GgASJl3+KLbpQj2O+8Ls5WoKDlnPe
         FKcg==
X-Gm-Message-State: ACrzQf3fp4XJgy3697rNnxHW6CKcvcuzUTWKRSN19okrMQ3hV+KbCfQD
	yEn+R7Ok1UwbeuP69q0xfh0=
X-Google-Smtp-Source: AMsMyM4GO/oQ6X+UJVquAq+E2CgDpiAEIZAGsQH3VAdG+7fTqvJq9zzGBB7QDRashLoOud2lpcqHYg==
X-Received: by 2002:a17:906:5dda:b0:78d:ed96:2127 with SMTP id p26-20020a1709065dda00b0078ded962127mr19010501ejv.373.1667330104094;
        Tue, 01 Nov 2022 12:15:04 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb7a.dynamic.kabel-deutschland.de. [95.90.187.122])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b007ade5cc6e7asm1643853ejc.39.2022.11.01.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 12:15:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove extern from function prototypes
Date: Tue,  1 Nov 2022 20:14:57 +0100
Message-Id: <20221101191458.8619-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221101191458.8619-1-straube.linux@gmail.com>
References: <20221101191458.8619-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declaring function prototypes extern is redundant and triggers
checkpatch warnings. Remove all extern from function prototypes.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/osdep_service.h    |  2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  4 ++--
 drivers/staging/r8188eu/include/sta_info.h     | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index ec2631455f08..f8ed04f32cae 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -66,7 +66,7 @@ static inline int rtw_netif_queue_stopped(struct net_device *pnetdev)
 		netif_tx_queue_stopped(netdev_get_tx_queue(pnetdev, 3));
 }
 
-extern int RTW_STATUS_CODE(int error_code);
+int RTW_STATUS_CODE(int error_code);
 
 void *rtw_malloc2d(int h, int w, int size);
 
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index ce5b57e23e53..e234a3b9af6f 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -388,7 +388,7 @@ struct mlme_ext_priv {
 void init_mlme_ext_priv(struct adapter *adapter);
 int init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv (struct mlme_ext_priv *pmlmeext);
-extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
+struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 unsigned char networktype_to_raid(unsigned char network_type);
 u8 judge_network_type(struct adapter *padapter, unsigned char *rate, int len);
@@ -483,7 +483,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *addr,
 			  int cam_idx);
 
 void beacon_timing_control(struct adapter *padapter);
-extern u8 set_tx_beacon_cmd(struct adapter *padapter);
+u8 set_tx_beacon_cmd(struct adapter *padapter);
 unsigned int setup_beacon_frame(struct adapter *padapter,
 				unsigned char *beacon_frame);
 void update_mgnt_tx_rate(struct adapter *padapter, u8 rate);
diff --git a/drivers/staging/r8188eu/include/sta_info.h b/drivers/staging/r8188eu/include/sta_info.h
index f76e086b5701..55ea5edc2914 100644
--- a/drivers/staging/r8188eu/include/sta_info.h
+++ b/drivers/staging/r8188eu/include/sta_info.h
@@ -295,19 +295,19 @@ static inline u32 wifi_mac_hash(u8 *mac)
 	return x;
 }
 
-extern int _rtw_init_sta_priv(struct sta_priv *pstapriv);
-extern void _rtw_free_sta_priv(struct sta_priv *pstapriv);
+int _rtw_init_sta_priv(struct sta_priv *pstapriv);
+void _rtw_free_sta_priv(struct sta_priv *pstapriv);
 
 #define stainfo_offset_valid(offset) (offset < NUM_STA && offset >= 0)
 int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta);
 struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int off);
 
-extern struct sta_info *rtw_alloc_stainfo(struct sta_priv *stapriv, u8 *hwaddr);
-extern u32	rtw_free_stainfo(struct adapter *adapt, struct sta_info *psta);
-extern void rtw_free_all_stainfo(struct adapter *adapt);
-extern struct sta_info *rtw_get_stainfo(struct sta_priv *stapriv, u8 *hwaddr);
-extern u32 rtw_init_bcmc_stainfo(struct adapter *adapt);
-extern struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter);
-extern u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr);
+struct sta_info *rtw_alloc_stainfo(struct sta_priv *stapriv, u8 *hwaddr);
+u32	rtw_free_stainfo(struct adapter *adapt, struct sta_info *psta);
+void rtw_free_all_stainfo(struct adapter *adapt);
+struct sta_info *rtw_get_stainfo(struct sta_priv *stapriv, u8 *hwaddr);
+u32 rtw_init_bcmc_stainfo(struct adapter *adapt);
+struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter);
+u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr);
 
 #endif /* _STA_INFO_H_ */
-- 
2.38.0

