Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F841C87
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 18:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKK/JXuV"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a1c6dad2dd0so68317766b.1
        for <linux-staging@lists.linux.dev>; Fri, 08 Dec 2023 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702059599; x=1702664399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NL738sRXL2selidGyxVJuSE1dSJZ2wGMlE7qfmgnwJM=;
        b=eKK/JXuVtRpG/gyi2THyr/NohzteEPkGcm1eMymSYb8FzY3SSMkhbeeQj6i6u+WCCr
         Ocmq++eGe+CNjV8Z/z6BkA2urUQxChPccPT3Od8ZqiSkl+YhDL2gEIauFsieiDKXNWa9
         1aGY5QJccnmjI9ZgX+WY5WpyxMJfM3RkFcDvPtMQkNbN6+VlIvCp1pO1NB/eJkeUGFT7
         QtnZHnWVOLQQ9F6elxZioqE1NEP788OB0+59GTbrmJ48OzzNMf8vg6Znp/RzAtWgk58B
         5gT3AtpVxOCQQMJvSRmvTkZRE7scbMsvFrWGFFtDxNdEcbXnZNEUVibYKp7K9jGKJJv/
         PS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702059599; x=1702664399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL738sRXL2selidGyxVJuSE1dSJZ2wGMlE7qfmgnwJM=;
        b=KrqonlMbEvjYhkLAMXL2ShReRM95SPS9dUJgdPjZQBgf7U9dfyyo3fYnIoqKmstG56
         vPGPvZEqnuYRqK75smXKhoxAUjU8QCSz//dmMhXMm4LdDpifiSY8YkMR5X1iqzA+endp
         tCSMrNfQW3gwITTCJlLlaLPIPHE9hNlmFnR7dnttItRtQ4IBbEBbXr6+8qDEj0yR55cG
         bKieSNFx0wtbNbdx3i4CW5XUf+bi+OC5czQ5/xzNDJD3POfFiYQ37aBsv7dU1jXjoFiN
         ZCb+pEZ8QjvCLWT8YfOkfTUmND/uZkSS37dsmze8/tzb0WBWhNIU5VJn5U5Wo+4HLhGL
         rUbg==
X-Gm-Message-State: AOJu0YxAdFNNk9ZxOW2XMSa3ZNxi7UfPp/Kb3vZn/fBDoESRJqYsw35O
	+ZfHEt3vLfud55alc1dX25s=
X-Google-Smtp-Source: AGHT+IFdR2UufJ2zugN7gYUxeKAflRUNxo0/XvxIbFy4M2zayiHsvQ4A6Qw6kROU5OKa1Cs9rUdUJg==
X-Received: by 2002:a17:907:c207:b0:a18:96e3:ae2a with SMTP id ti7-20020a170907c20700b00a1896e3ae2amr446873ejc.5.1702059599455;
        Fri, 08 Dec 2023 10:19:59 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id vo16-20020a170907a81000b00a1d32dfacb9sm1276308ejc.38.2023.12.08.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:19:59 -0800 (PST)
Date: Fri, 8 Dec 2023 19:19:57 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] staging: rtl8192e: Remove function dot11d_channel_map()
Message-ID: <877c0efcf56977cbf0943b34beda4ff2ca514714.1701989555.git.philipp.g.hortmann@gmail.com>
References: <cover.1701989555.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701989555.git.philipp.g.hortmann@gmail.com>

Remove function dot11d_channel_map() as it is empty.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c            | 6 ------
 drivers/staging/rtl8192e/dot11d.h            | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index 8d89f962b3bf..ec71bae05c1f 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -6,9 +6,3 @@
  * wlanfae <wlanfae@realtek.com>
  ******************************************************************************/
 #include "dot11d.h"
-
-void dot11d_channel_map(struct rtllib_device *ieee)
-{
-
-}
-EXPORT_SYMBOL(dot11d_channel_map);
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 98aa28d0cf72..eeefbfa96938 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -18,6 +18,4 @@
  *		2 - valid (passive scan)
  */
 
-void dot11d_channel_map(struct rtllib_device *ieee);
-
 #endif
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 1f45b6b00d1b..72e89ccfb184 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -761,7 +761,6 @@ static short _rtl92e_get_channel_map(struct net_device *dev)
 
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	dot11d_channel_map(priv->rtllib);
 	for (i = 1; i <= 11; i++)
 		(priv->rtllib->active_channel_map)[i] = 1;
 	(priv->rtllib->active_channel_map)[12] = 2;
-- 
2.43.0

