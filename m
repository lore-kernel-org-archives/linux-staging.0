Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600233A715
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703138; cv=none; b=lFTj1N1HPO/xlqjQeJ+7sV15X4ZgM1ydIy+YxEJzD0EkjvHGN449BHG7jWifgxAvS8SZHHAvkr83RePjCppA0vYjjG7TwlR3pph5vJeFktqmQstjU24f2hyQlgLV7JzJwUxH0nZ7XDOtxz/JpinSi0HXwnmyY7DJCNGgZ2A7uPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703138; c=relaxed/simple;
	bh=QH40RDUeKpt5r31k8MiwmTN5CwlPV8u/qUOIpL2Opbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gVu5yie2bX6AXxi81vhFzcy46y/ZsyrAlcb/Zh9q8RAmJXIiXvbrBSkGRHXZxhABxZ4QKjTXiKzjsFxiCuE6azSUxku9h/epsEdJwa/vjcMV6hFZTyds/k7T92MlfH8lfO6hq2Yhtm6btSpIkx2474r1A+oaw2rriA328/NawsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRzPqJAR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRzPqJAR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so9061585e9.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769703134; x=1770307934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T54lN/2f0AojvVlsbKqfRuQ4ek75UA0m33GBdVgd0ok=;
        b=eRzPqJARbq/h9IdQoaUC6FJ/NfMe9zmY1eb7aLMide9eoYnlesA8b0cMOL/pnZzJ1B
         IzuJipV2jckjWDdQM2e1JyOCoMSXU8f5+wQNyIMBUtD0oBdTZBL+iJEZt8aKSxYaxmnP
         ZPRZr0lj36rkmS/DjFDbDEI4u+JhKllg+KTZxuMp4rt1J15gz8mEL5gE2IqUrdWP73iA
         jvRtjEex2BT3Hg+FwjTbCR4Lg3Bi2mAMad11DGbkm3JXiLXkDji2HodlHonUp1Y26UTh
         v7TXsZvSFg9EwTakONqiDsUsM9Dum9lI4RjVr/J+Ag83P7Pgs0fNrA5523t3RcszUu0V
         EEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769703134; x=1770307934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T54lN/2f0AojvVlsbKqfRuQ4ek75UA0m33GBdVgd0ok=;
        b=cyuStDsjZrpGsAzJxJxMMMdHCY8X+01DwqrQOinLWFh0tVV/ZbcbGcVfzxXz62Rws1
         fVJd8SlA/ILO6awLz6rBp4TaFpVg5tcdaDMyffVHXS5IXN5ybELeZ6sAV89+udCMBLTE
         N0x3X6Eb3hCJ8XUqzeHVrjZIGtXep4N5RiENfxzK2gEtaLUKdZIUO92rwwnsobjl/J8o
         VkaaE1BJfBC2J1cIgGhj/s+a6ARm8dfuZt6hcCiYYBO221eUlJpFoD8cPNzBqjtN2M+X
         l68WUm787my4V5hB2SigfAJeA3VKuXBZPfa03opdh7oT09DVLoS7SDLcuf+EpAPnKJZu
         hK/A==
X-Forwarded-Encrypted: i=1; AJvYcCUTnLKyVf2mCNb1FS5P8zTNBlmxe6fPMPgeuqAdGQgRKxfNsiRwBMeTHzs8q+VzHQ3A2zLQhi5XSxPa77e4@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzq3uEUQLcFfkXrYRdRhk1gSyGOkJu8ksYytWK8i4pYcYo6f4u
	3/9YFGruVWlHVbTG1tTmkRvfWqdTQLCy/QXADn/9nlh0BgTaDc97D5qq
X-Gm-Gg: AZuq6aJmCwCaBU8ky/XnfhzL9ypjhiciqhEf94ngQJk+bmdx7kRh4EIAoxP8U9bhJew
	hsaZMTwNTUyH+j0sh+Hzq2808Nump9xDaH9a4qaFO9Fa/cuHMzOB8D16KbX+rT1NIBBxxlmK61p
	lrIwBs+WI73kUSQ0XIVxD74LI53aPnciCG6a1qzlhMx+5LD7WoIQP09QuQM9Y7YNiHUBnh508Rq
	OfDTU7OcAuJIFYmrestsZV4Kqaj9YLYdDgRmuFWyn86Uq0kB7ZHcksjxZQWhkLHLHhCgf8RT4qf
	QpwY9nJCKxw3ipsteKU5gL3lY7EvAmf0XJWMa0u8tbYBkgtU0U3mHwO0+lLAo9eX4LYquzx+E8X
	QHYVhQKeJ5PbrjaK9aZrjrZJ8bPx9uLTS6lfdBqWWHs1/ckMor3S5LKatPw0TQovCDVb8JVRxqk
	deOqtgKVuZXQ==
X-Received: by 2002:a05:600c:530c:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-48069ca23e3mr129097865e9.31.1769703133577;
        Thu, 29 Jan 2026 08:12:13 -0800 (PST)
Received: from localhost ([87.254.0.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5dc8d41sm11135e9.13.2026.01.29.08.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:12:13 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove redundant check on status
Date: Thu, 29 Jan 2026 16:10:58 +0000
Message-ID: <20260129161058.197372-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The check on status can be removed because all previous
assignments on status are followed by a goto statement that
bypasses the status check. This minor issue was detected with
Coverity Scan static analysis. Remove the redundant check and
some empty lines.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884fcce50d9c..606fc6726155 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1265,19 +1265,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	else
 		pstat->flags &= ~WLAN_STA_SHORT_PREAMBLE;
 
-
-
-	if (status != WLAN_STATUS_SUCCESS)
-		goto OnAssocReqFail;
-
 	/* TODO: identify_proprietary_vendor_ie(); */
 	/*  Realtek proprietary IE */
 	/*  identify if this is Broadcom sta */
 	/*  identify if this is ralink sta */
 	/*  Customer proprietary IE */
 
-
-
 	/* get a unique AID */
 	if (pstat->aid == 0) {
 		for (pstat->aid = 1; pstat->aid <= NUM_STA; pstat->aid++)
-- 
2.51.0

