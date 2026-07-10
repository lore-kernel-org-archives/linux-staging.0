Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017E34CFC2
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693850; cv=none; b=rjPqoJVtgfyY24aNjWwOJ9xFfRb9SNjdnCB73FmZzlJEv2XSaSszmzhtYDmJ9AGYMRX0kxSaIFaxaKxXOnU+nSD/Bm28Y57CvU/s7JNtbr+tbNX6ltggbibfIXM37eSYo7GaGAqmyQmxEZ8wDgTMlOrFnbbLUCrf3/X4gJVSY7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693850; c=relaxed/simple;
	bh=mycOEkrYsqJ/+24FVibWnfq1mxv5Dbmr+U491uwoVo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5+9rFuPmbTocaO5ocT2zBZ+veID+RUjfruD/SHCWD48ILYsYRJT77oaiRr3Bu61LWhLq9lmL2lKp1LpafES9oMhxV1yU7jvfAaOJ89KculQNahT/zjqcECyi+DnlaOOb2oU8GLdO/LvG3HwgfjyxixxUYL153WBRl9wSjqUJ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tx866N8l; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tx866N8l"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so1756705a12.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783693848; x=1784298648; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E43ZApMzQPduzWRYKYfP2/zkl5dwaxdhK+Cz9H0wbrc=;
        b=Tx866N8lw8RS4yoS6e4YQGD1bA3hAB5k84yTY30ZJjTj0pL3rzpeZzH9IBtAy/ua9N
         YZbS6KjLM3DfrdZvYN5U8Wo+SsY/9CH5oPb6+a+Cg6dIDzdsVIFGPKUrRhIoOvtpLGSW
         j8v5nSx6K5RqqHKSb8l9Kd2WC4+bk5SlhGcAGluAATBMa7Xcs4bdNs3qaT+e0Tvwnul8
         O7G0P6HMFAigsy6GgbU0nGcO7DI43Qp6h13XAI2uJcugFKyTkODTDGqNNd2VzLeLaNEJ
         WysgVec3KoBmovtaADTmAQiRUcXRnFtKtLW0I5UcmXwbx7fbfuYaxMom4+Za4jQjy1z0
         dWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693848; x=1784298648;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E43ZApMzQPduzWRYKYfP2/zkl5dwaxdhK+Cz9H0wbrc=;
        b=rvhcRU7n/xSnhriVES68RYU8dFIfCE8HxrQ01WP83geyLOQu7d7ZtS+pr6pokoAgAs
         grmbuQEyRswezKYIK/1HBiGjUR/XUF4uXfab2eCiDyM03mCDMe6GvichFkwbrUyzR7LO
         eWdMwHvFaBhqSRx0RqpHrt9U2TNXCJJGhodfxlMfvQzPjwkTLl6Li5Ar2p5yaUcpuShP
         bcnv8DqwvJH/nukGyRKWBErOGc//W7GK9UsSOtUc98bmhH+6/aA4t36l6LH2GeLWY5zD
         Bu7hiV66s6FDGKO6DxtIJUGkuz4RCJqvSp6xY/7qt9NV6Jal1REvbrnZqX/GmU90DfO7
         xUIA==
X-Gm-Message-State: AOJu0YyTJ8KeHWDfTTxNdvZtAkEmw6F5cfjZgEmPdihfFTEN4iQFic8A
	FtaP8ZwIAx77++fC/dTvOBeWLhvFtoPBsLZgxKqddp9ZJCRqbBehf3pRORoE8w==
X-Gm-Gg: AfdE7cmfaI0K4Je5O8tuo8T/YgHUHwAoewe+lz6IJX83NpwRetjdXKwdA2JqiQYLZ00
	/lCBt5vr3dem4v7NAi10usLHYAUwWcXSE1sGRULph1F1oEjiPNk7RADZnRXCECXmQfYOOadxkBB
	enmO+Szmws827Gp0mW6ZlaYn1fEpPGJ5qUi17MktwZ97xmiYlyJxtVOqUhxTvow8j6RYUIrZj9x
	aGQZoLEpDmeLsSTrzTpRoTLQEP1/CMeC7NMQz94bKmVeSAaFWaWE/I1cESiOr3bnoe/GPX8FgdR
	dSQNG0xvX1ToJRYh2+xu2Yg5kg23f3eQJbjPLjxt5Z7VbmfdCdEiX4U0R+Nf6LpyfjgrYUNqQrc
	msx70Fx3+IvMEbQih0GT2lPRMEDmSVqio319d7wfVr7YaRI/xRkCJIgF6yd/VPdYA/AYfsLprpS
	a6hGjiAgUEOgycvCH284qr59CNlCA2j89MDgVe
X-Received: by 2002:a17:907:9347:b0:c12:8c41:3beb with SMTP id a640c23a62f3a-c15ce0d25b8mr491870066b.50.1783693847668;
        Fri, 10 Jul 2026 07:30:47 -0700 (PDT)
Received: from ubuntu.localdomain ([130.37.164.185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa805105bsm5159654a12.21.2026.07.10.07.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:30:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 14:30:45 +0000
From: Joachim Bose <joachimbose48@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: line exceeds 100 columns
Message-ID: <alECFWsPncNki0If@ubuntu.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

rtw_cmd.c:762: CHECK: line length of 122 exceeds 100 columns

Signed-off-by: Joachim Bose <joachimbose48@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5d63..08a88f4608b8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -759,7 +759,9 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	}
 
 	phtpriv->ht_option = false;
-	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length - 12);
+	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len,
+			pnetwork->network.ie_length - 12);
+
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
-- 
2.53.0

