Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C817B50E
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947881; cv=none; b=MGl5zWYC7jKRJ1dJX1u4fuSVf3ptbB5G6k01B7MCn+diqbwOoSh3j0ZsgwCv3EFJqVVLi6bFoY+e/HS8l2zP7+yNvqTS4ry4oYXKeUagMMym1gHTkEi9yKlIxzn8muZpV8SRhy6u4AE1Mvh/Bw23vdgxX9cOsg2E+I8VMFznfgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947881; c=relaxed/simple;
	bh=GjUGopGW/wE1aOAPUuMneNgzgbYxqvxGw0OD/j/5yFc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATDY/3uDRm5NUT1M8kUGFf8LVczsJGSKj13naAAIj5N/sBQ0Ro459Gne0xrYSdAXB7GO+iIIrL+y2ja+5XD5I8zGzSJfcDLBvsMk1AKBAtA1iiIFoHJx+trQmlfgPQ7Z9rXLnvzpmnRtqKF++q9TGuL2tKCr2LOAVWUTqJzUcxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXpXxSUS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXpXxSUS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so6557055a12.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947878; x=1726552678; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2cx3ykix+TuB8uuNKcx/1J8Hn0bQfcisX/xQMqnMFlU=;
        b=CXpXxSUSY1zVZpskgqeYUdzoQsOguGlvaNytJLR/9fN/IccJFnUjxCyN4h6ohOe+Be
         70U101wFqzfALrhp+E1QoAsLxuRYCaBs6Vxxgv9tPVND+gfmfJvLyCYptmVfifNOus0i
         JqwdPpgnFzeOHP1riJngL5JfwugjuA+zN7Rer/cuh5tzjvIdRR9QMYzhCp4SurY4J2Mx
         AKkMyx2Vqk9H/uOqsxdTY0h/UZUCFDmJa6rB98KXfVWUcUCHQ7iCGVQVrM6QIwmroNb8
         HarvO0akjYygAK7mSD36tx6eBpERkxm2dTmNJbmgk+Cmc3jTEppd7b6bgZcvb7PLSyT0
         lr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947878; x=1726552678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cx3ykix+TuB8uuNKcx/1J8Hn0bQfcisX/xQMqnMFlU=;
        b=qVVBC+gjLEM4l7rjq6UJMRyuHArDLJ3ppxqSzWJFy2KamhbIGgAQL7iDNX2Z9fknIT
         Rq3MGYnYukRIeZGMZKqTEyduOm06KBWdr8JOG+1md9rUQjVh7PwB2h6C86LymboJJntW
         le8bt9eOp0oRsC9KgzPdIm/vcLMSN1EjtL104e3MCceUyz4AHlQH54Lfcf6RsLyXbVc5
         b+1Da2rYpQB0vIeiY5Q7HPfYn4ui/yDTulNwW/AiEWYWIxieCGyRdelWJXByrMMmoSVR
         L2Ph38ZY9ORFVxxap0yDvYK1L+QTSMQi9sqg1GXIhNvYZbZvATVf/uceLiDw/slYO6xW
         Y+eg==
X-Forwarded-Encrypted: i=1; AJvYcCXXKSgryH1OszJ1OfdYTA2iqujy4Q4FRbRnsTE97Aw0BuYEEU6X55WFzZCjF6vI6VkPga54uJvLgRvWA6NY@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn9toestL/A0wWVIrZZLbPwyyAIQQaE1voIrOm+54ia5qt6bfN
	mFo9T0kzxSxydhb3twDhhZkvDgCPLBi/+U0gYjuwvRQf8tgCFHVB
X-Google-Smtp-Source: AGHT+IEwxBhh5fLi6FkPQok12Ucj1eFyyJ4CcVOGrJhWFjQI93n4H+TEVIWzrwRzxYcZO7lzaW7few==
X-Received: by 2002:a05:6402:5203:b0:5c2:6e51:9d22 with SMTP id 4fb4d7f45d1cf-5c3dc7bd575mr8923006a12.25.1725947877907;
        Mon, 09 Sep 2024 22:57:57 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd41ba7sm3832400a12.4.2024.09.09.22.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:57:57 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:57:56 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] staging: rtl8723bs: Remove unused function rtw_ch2freq
Message-ID: <53a8ee320803ae3efe22b648f2a4555482efaf46.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused function rtw_ch2freq with array ch_freq_map and comments.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c   |  3 ---
 drivers/staging/rtl8723bs/core/rtw_rf.c    | 25 ----------------------
 drivers/staging/rtl8723bs/include/rtw_rf.h |  2 --
 3 files changed, 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 6c49bfa00578..84ce7307d8f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1883,9 +1883,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		/*  copy pdev_network information to	pmlmepriv->cur_network */
 		memcpy(&tgt_network->network, pnetwork, (get_wlan_bssid_ex_sz(pnetwork)));
 
-		/*  reset ds_config */
-		/* tgt_network->network.configuration.ds_config = (u32)rtw_ch2freq(pnetwork->configuration.ds_config); */
-
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_rf.c b/drivers/staging/rtl8723bs/core/rtw_rf.c
index 4f120c894998..2aca45de298e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_rf.c
+++ b/drivers/staging/rtl8723bs/core/rtw_rf.c
@@ -7,28 +7,3 @@
 
 #include <drv_types.h>
 #include <linux/kernel.h>
-
-static const u32 ch_freq_map[] = {
-	2412,
-	2417,
-	2422,
-	2427,
-	2432,
-	2437,
-	2442,
-	2447,
-	2452,
-	2457,
-	2462,
-	2467,
-	2472,
-	2484
-};
-
-u32 rtw_ch2freq(u32 channel)
-{
-	if (channel == 0 || channel > ARRAY_SIZE(ch_freq_map))
-		return 2412;
-
-	return ch_freq_map[channel - 1];
-}
diff --git a/drivers/staging/rtl8723bs/include/rtw_rf.h b/drivers/staging/rtl8723bs/include/rtw_rf.h
index 718275ee4500..9f98b3f5a2e3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_rf.h
+++ b/drivers/staging/rtl8723bs/include/rtw_rf.h
@@ -97,6 +97,4 @@ enum {
 	HT_DATA_SC_20_LOWER_OF_40MHZ = 2,
 };
 
-u32 rtw_ch2freq(u32 ch);
-
 #endif /* _RTL8711_RF_H_ */
-- 
2.46.0

