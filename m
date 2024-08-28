Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24F14A4D4
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837705; cv=none; b=LamGzbXlDYLWQNDySLF5NDZqcVG5ea6w2M01x4wEvYtmoZLDSRI6HfSb4v2eLM5xkUMG8UsDuCUbVH4xxGnrUiEAn1TBel/WZdAhWAWfOM61+QBnOGlqCbQ22itxNQNEBAs5+gLLMNLmMfbYeB5PIjLaOQ9hs9BjQogexwygDNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837705; c=relaxed/simple;
	bh=4YS4I0XQCIaNKYbjXiti5OZquZe0TdclS1625mfl7XI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AM0YAQ8O5AOIRZRhD6MzpGAdnbnromfks4/8Dbxl/9Avd/hyi4GL2jHbKb2AKgB+2wO/FzBoXhy2dAnyA6dQDWVCX7/eJT+vNY47W0z72TG/MJFzV3jUVDaOwK95bWTSdY4CnTHUUymD8lOkCniwso3rb7rG/s2zH4ge0LA4mtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nazYy5Fh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nazYy5Fh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-201fbd0d7c2so53990395ad.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724837702; x=1725442502; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZUXGBXAC8OMsfLHHG3FliGgquwdY3FycIOEhk4W18k=;
        b=nazYy5FhYu5G3HpvBcsbGJCpBoh6IoyO+XxqJW9shEnFPxXMUVkTxIUW+Qp0vfxapp
         sBJJFu+p8cc872JZ4Phl9lDuT/6YyBQBY+bCWaPXStS/Wdli13E3RfsnkQBbe4hklCBG
         drHvcdAed/p2aVMsmYIcWaOkKnL9OLZdlJCZEGj6qypid07fWPPMO42hJebnEfubGrlM
         XJAM9+Y2e6yqwYt2JmlNwcX3mqQrboshi5T3S5jorqzGU5hSpEVO88hgTH1N8Mee6smU
         NJmcCzoQoteMEBzd5PpEFxwVFYcAXfrdPH4UOlpGhTuqi9uroNQNh8jwnIOUNUUYOEBg
         S+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837702; x=1725442502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZUXGBXAC8OMsfLHHG3FliGgquwdY3FycIOEhk4W18k=;
        b=ZOODvpY6wSOZT9QGozNubtV2nVNjsurT2CBJfGqfiRB6T5kabMB1uFBihLJlI8oYhE
         GX4KmaEoVnlLRSbbFWKZ/dAlTli/suAybfAi3FuUoKASVW6NEh3jPkEOWIIcQJnWolJr
         xUZ6EFcq6yU69HbN8QuzEdgs0Uh9f/LNJqV2HgjTy58b6NGSvak+5LHH79sWzYhnW95P
         IFayNDiRRphs1OBkYBcYpP86/sWUmjYmv+36SmwyPHEYHdlCM39XQS5svKZKMJpH3vVW
         ctraNzaXUj5XqASMZZBevgUutRoexOlfMWDbst8366RQPGZmWA9UPLuTwkbELYc5GN4W
         ONFQ==
X-Gm-Message-State: AOJu0YwowWVtTS0GRJY+lZ8LhwxU/IwRYLdaZ8SKojDlaNB7rajSHEMX
	gf9mviwBsKfwpqkT6dD+AKbpBOgUsU/oNpvyM0zlsuApknWYx8vw
X-Google-Smtp-Source: AGHT+IF6pUDGNAwEjoRgky7yn/+9QZbXK/RaHJlmwJmE1NSEhhOVH8IeadJllwTsNLT7HQ9VlbZmnQ==
X-Received: by 2002:a17:90a:df0c:b0:2d3:c6a7:5c83 with SMTP id 98e67ed59e1d1-2d8441b1f5emr1514649a91.35.1724837702003;
        Wed, 28 Aug 2024 02:35:02 -0700 (PDT)
Received: from victor-IdeaPad-Gaming-3-16IAH7 ([116.68.77.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e8f72sm1243173a91.20.2024.08.28.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:35:01 -0700 (PDT)
Date: Wed, 28 Aug 2024 15:04:57 +0530
From: vivek t s <vivek6429.ts@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: rtl8723bs: Rename function SelectChannel()
Message-ID: <Zs7vQXhcYRCxCDaH@victor-IdeaPad-Gaming-3-16IAH7>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename SelectChannel() to select_channel() to avoid
CamelCase warning from checkpatch.

compile tested.

Signed-off-by: vivek t s <vivek6429.ts@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c          | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index e4063713fecc..9bb1c5d9d5c2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -277,7 +277,7 @@ void expire_timeout_chk(struct adapter *padapter)
 		/* switch to correct channel of current network  before issue keep-alive frames */
 		if (rtw_get_oper_ch(padapter) != pmlmeext->cur_channel) {
 			backup_oper_channel = rtw_get_oper_ch(padapter);
-			SelectChannel(padapter, pmlmeext->cur_channel);
+			select_channel(padapter, pmlmeext->cur_channel);
 		}
 
 		/* issue null data to check sta alive*/
@@ -315,7 +315,7 @@ void expire_timeout_chk(struct adapter *padapter)
 		}
 
 		if (backup_oper_channel > 0) /* back to the original operation channel */
-			SelectChannel(padapter, backup_oper_channel);
+			select_channel(padapter, backup_oper_channel);
 	}
 
 	associated_clients_update(padapter, updated);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9ebf25a0ef9b..a79bb2930170 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3831,10 +3831,10 @@ void site_survey(struct adapter *padapter)
 		} else {
 #ifdef DBG_FIXED_CHAN
 			if (pmlmeext->fixed_chan != 0xff)
-				SelectChannel(padapter, pmlmeext->fixed_chan);
+				select_channel(padapter, pmlmeext->fixed_chan);
 			else
 #endif
-				SelectChannel(padapter, survey_channel);
+				select_channel(padapter, survey_channel);
 		}
 
 		if (ScanType == SCAN_ACTIVE) { /* obey the channel plan setting... */
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 7fac9ca3e9a0..b45ac9156bc6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -333,7 +333,7 @@ inline unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter)
 		return 0;
 }
 
-void SelectChannel(struct adapter *padapter, unsigned char channel)
+void select_channel(struct adapter *padapter, unsigned char channel)
 {
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 720aeeb002b0..310352131e9a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -455,7 +455,7 @@ u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
 unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter);
 
 void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode);
-void SelectChannel(struct adapter *padapter, unsigned char channel);
+void select_channel(struct adapter *padapter, unsigned char channel);
 
 unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval);
 
-- 
2.43.0

