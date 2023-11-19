Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3C10A2B
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Imc0vmG+"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c6eac9c053so11184671fa.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432155; x=1701036955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NIhoH4W09MvJbrN21uw6rO/SQD23kOyfhhx8/4dLsXo=;
        b=Imc0vmG+K0qVOrmhZJ2FZexCbEIp4erXteRcxUvO8TmeS59Dhglz7A6pRIzJ19tNVg
         pJFbxfKgvAunkA3emCbSVP3SNgKNOdlH0H82qXxNfsHnZU120hLILY2tt2faiYUHsPhK
         M9ZXLcCux3TblUiQU70uP+GPcg5Y2ib7UhgsStECqn5FXuzvjUwyLnFTlOIqmDie77OQ
         q0H/OPD+yjt8U3kZ+U7RQoX0f8v45VLtnRAKIDiWK8vcyFaVLW6xiNasPmSKpOoXqR4W
         JAYm6la6TAOUyoRP3FUw27n+iL7Lr2FXB2R2+kuxWxzQjBPv6I4AFMgDvmaRp56MM3jz
         Td/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432155; x=1701036955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIhoH4W09MvJbrN21uw6rO/SQD23kOyfhhx8/4dLsXo=;
        b=Jy1rUXTzKjdasJnEcx7DJmD0QQJEpnvEAlFoogdekp5HpJklJYAplYK+N9dneopbb3
         vZvbTmBSEeowmysYnlJfH+qugapscrwKsDNecLLOfvIGdVPd6deQbVQ9KgGYoxw6F2L0
         2cgsXFzOaX0oOSgvt1tszaXU44fqf6qczPSnby1Iqr46kWGaqcp/djoYu0/xR7WpIM3C
         PrRHe915h2AU2XVW/XlGXdajSV8Smh6yivUwUSyTpAlDzKLhtPObgUf/c3z1yP9zdlOK
         QSk89HTHQMovGeswiYJS/qoAKS1zYOMK/QBhLoL3XC+DLz3tptH5CAonbQTo0wCBxkBF
         ffoQ==
X-Gm-Message-State: AOJu0YxrYyhDK06ZuP9cFF8ssSZqTibqnsiBPciq++rKzr9BnW/zhlPa
	vaglCY3lEl8pJ6ENnrRwNwg=
X-Google-Smtp-Source: AGHT+IFEqSIYbd5LhJkPEaVk90/utKB6EDyBw9gZV9IursshLp6hunJu83ZjfWk6QPfde9haCmWxOA==
X-Received: by 2002:a05:6512:124d:b0:508:1a9d:d768 with SMTP id fb13-20020a056512124d00b005081a9dd768mr3999014lfb.4.1700432155353;
        Sun, 19 Nov 2023 14:15:55 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090657c200b009fd77d78f7fsm805507ejr.116.2023.11.19.14.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:55 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:53 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] staging: rtl8192e: Remove unused struct
 chnl_txpow_triple
Message-ID: <f66c7cd95ae460ccb376e9edce11b2b955c908cc.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Remove unused struct chnl_txpow_triple.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 767bbbc8b01d..5c02e51c39cd 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -10,12 +10,6 @@
 
 #include "rtllib.h"
 
-struct chnl_txpow_triple {
-	u8 first_channel;
-	u8  num_channels;
-	u8  max_tx_power;
-};
-
 /**
  * struct rt_dot11d_info
  * @channel_map: holds channel values
-- 
2.42.0

