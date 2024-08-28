Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDE1175D2C
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847669; cv=none; b=j5GDxzPNmOj99S9eGrsFSHC7ftXgmnjqNBKBXkgDD+VIrhKZCOFdWERaBFxuxxSt44qlhWywkMuITKRPJNJvpySNZUQfRQQXj1GdLlmxqI6JJwiKvTH1Fnrv47ReGa1dP0Yk8SWAVzeCnBsvLSrLmhI4pVJRScZZpFuVBbU5r3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847669; c=relaxed/simple;
	bh=u/GGavIYEqX7mrGveiWklk5oJ5JVVxYHnZ/LQ8zYQfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4jykAtVeyLzh84rjvZ6H3Nl7ria8yIIw7JQQhNvcysEcNtEXqR78QNRupU7FUgw2kcOVlm/2REyOZyjYiiGiBbN8V2ozSGRnr7NR5U5bWt3jscKG5Id1OMpC/zXbd7IrrsDOzRVkvckGErAcBVDdnry944cICUyHtsXwlvOHlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/rn5Opm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/rn5Opm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-201ed196debso59887435ad.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724847667; x=1725452467; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGi93qralUPl1hkuQ7DwE7sDUcYkj0+qWkjztC3U/qM=;
        b=K/rn5OpmSCoXWB3kQoMu8/zBBWvugqef6eshQ7PM9pxFfuuag3ibOHTkazPHI7pzdL
         TszmR6YCgBhIQ2cfaXmHI55iqCE8DR9Y8HZahgkMIZB9TRhX+gPIZaFLDh4N3H1cII2E
         UVtgshBpQdWk/htPTdbzeJpTEoW2HPhB014dN+HI3c2s2vzhhjtXAvJjSQJIX3r0QMO2
         UKgpQil0HwXxgymxV1FDf0FgYkFNNzKXUM8ePVim/hNUz+RAXaovQ4gUB0z7Y8nBh4Cx
         eYO1xMjZ+rGf20zyvC1TzU6wRlNQ+8D31EUDKLc96DeuLUNawx8QeTH3SrUsAruXi4W2
         vLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724847667; x=1725452467;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fGi93qralUPl1hkuQ7DwE7sDUcYkj0+qWkjztC3U/qM=;
        b=n4cxo73TfYqGf+J2W1g57N5VN709gCY9o5OkoYCQwYhEGf8aRVi9/EtVhaOGh3cDUU
         ewblSsdpG7TwX0AJNvqpNHsoqXLi6ictgUXM9FnCteiuTxwhzxvCRaO85ng/glW3jVBY
         GgeLB/TRO5s52h7rzCIDjcRKK8ghhXGn8TfAjAq37X+EeFX248L7yZ0MA20PX4ilIRF9
         5FLn3GHfw3NVM/Uk/IKLyh2thP5tBnOvDteKtTohnRrtYGIsuQmmTtBlMrB9ds1ayWwF
         dxc/x6T0SL1vkdrc+WvRFrd8wm29tTScBJ/Jo/+z2GOwUZPwScoN001rPGjaH21mPLok
         ZObA==
X-Forwarded-Encrypted: i=1; AJvYcCVoJEkDFqgkxWXnriNe5eAFoPJqpCBhir8GM4kOT2OUtAP2SmmIs7pqDSmC8820mbkGo/rE2ZFypc0VapqB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0yQ7J9HgtjVj4xMXSWPTkk58LnW+NrWAGsJLFWHwmRtmzlXOM
	R3Znh+Ku1Gm99M5cLBpfxOzgm3inWuq0mCkv/KURKjkKVqXgrwhQ
X-Google-Smtp-Source: AGHT+IGzzCQT12/LB8yEvY34gIYfqYYDIzA0cF/Udk5kGAnad3O95MKPiZ7yjzOwKM3DINqiwyyRQg==
X-Received: by 2002:a17:902:e804:b0:202:3e32:5d3e with SMTP id d9443c01a7336-204f9bd27c9mr19838765ad.36.1724847667319;
        Wed, 28 Aug 2024 05:21:07 -0700 (PDT)
Received: from victor-IdeaPad-Gaming-3-16IAH7 ([116.68.77.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560975csm97405865ad.194.2024.08.28.05.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:21:07 -0700 (PDT)
Date: Wed, 28 Aug 2024 17:51:02 +0530
From: vivek t s <vivek6429.ts@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Staging: rtl8723bs: Rename function SelectChannel()
Message-ID: <Zs8WLkzoZe3Z0DYF@victor-IdeaPad-Gaming-3-16IAH7>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename SelectChannel() to r8723bs_select_channel() to avoid CamelCase
warning from checkpatch.

Signed-off-by: vivek t s <vivek6429.ts@gmail.com>
---
compile tested.

V2: Prefix added for function as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.
    Commit message corrections as suggested by Dan Carpenter
    <dan.carpenter@linaro.org>.

 drivers/staging/rtl8723bs/core/rtw_ap.c          | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index e4063713fecc..23268ec502a7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -277,7 +277,7 @@ void expire_timeout_chk(struct adapter *padapter)
 		/* switch to correct channel of current network  before issue keep-alive frames */
 		if (rtw_get_oper_ch(padapter) != pmlmeext->cur_channel) {
 			backup_oper_channel = rtw_get_oper_ch(padapter);
-			SelectChannel(padapter, pmlmeext->cur_channel);
+			r8723bs_select_channel(padapter, pmlmeext->cur_channel);
 		}
 
 		/* issue null data to check sta alive*/
@@ -315,7 +315,7 @@ void expire_timeout_chk(struct adapter *padapter)
 		}
 
 		if (backup_oper_channel > 0) /* back to the original operation channel */
-			SelectChannel(padapter, backup_oper_channel);
+			r8723bs_select_channel(padapter, backup_oper_channel);
 	}
 
 	associated_clients_update(padapter, updated);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9ebf25a0ef9b..60861a480b3b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3831,10 +3831,10 @@ void site_survey(struct adapter *padapter)
 		} else {
 #ifdef DBG_FIXED_CHAN
 			if (pmlmeext->fixed_chan != 0xff)
-				SelectChannel(padapter, pmlmeext->fixed_chan);
+				r8723bs_select_channel(padapter, pmlmeext->fixed_chan);
 			else
 #endif
-				SelectChannel(padapter, survey_channel);
+				r8723bs_select_channel(padapter, survey_channel);
 		}
 
 		if (ScanType == SCAN_ACTIVE) { /* obey the channel plan setting... */
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 7fac9ca3e9a0..87ce4a9b3aad 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -333,7 +333,7 @@ inline unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter)
 		return 0;
 }
 
-void SelectChannel(struct adapter *padapter, unsigned char channel)
+void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 {
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 720aeeb002b0..8315399b64fd 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -455,7 +455,7 @@ u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
 unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter);
 
 void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode);
-void SelectChannel(struct adapter *padapter, unsigned char channel);
+void r8723bs_select_channel(struct adapter *padapter, unsigned char channel);
 
 unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval);
 
-- 
2.43.0

