Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD4B1FB9
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="MgayIqA5"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6d9344f30caso178544b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520568; x=1705125368; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSvqtSGtk9WdQSNqyQ2NSRhqTzoQ4bXXOJlfyBaKWwM=;
        b=MgayIqA5I+P9eEFvx/0P46KPfxEsg3QOpdVqY8Tx3BKhVhUYOS90rE/4Zh2N5+6pYj
         fs9cnWRTHnUmdFZ4AdXOfzqhm8hW7iI/cYXxgRof5DJt2SyatBB6CFMpKTeObNAqbsBO
         t7uic+uLkGGLHTPXFpLrLProyJQ8UMN5dS63TdJoXaRMRfVtTwXBsOIulNXedTXm64tH
         zTPpZ2l3I8lTDW691gSRlrUht5Rk4OK6maxvT20MyRB+tjafwTvY6tzk87NlxMyqn130
         mgVpz2mmPY6L9NG7EXUKHjqZ+D61RB/vb/Ug6GuHa3DS4iJzYPZOOwSQ0u9uz+HdfuK8
         M0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520568; x=1705125368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSvqtSGtk9WdQSNqyQ2NSRhqTzoQ4bXXOJlfyBaKWwM=;
        b=k2YsXS2bT5l0wyCy2dpmSvqBmm+RwZTd2H60dl/FugHLb3qdQheTJJ85Eq3BVIjgbC
         ZXAqeqKBPiWk5uATvb2G4mMXjlZofc+VREpRVoGnwR8Rx9/VClyOnkiUI+qBu2J1b9LM
         X8eJGqfi+4eXrpuUl0Rmcb+WCaj+8Frr9Wl8q7r1NfYPiul865x6HIICf/Ku/hgMWpBQ
         E3sxejKxfyD3pa9lchv9UBSm1WuGBXm6phxwfk/1XlzN3VIjITsceWuO5Xac6VCbzaw7
         FyJNw5v5YZHAETefTy14hBcWduBiNgXEnqbyNiqKqKuW7OPMa1ra4bXyQJJ2XYIrfxGr
         PHhw==
X-Gm-Message-State: AOJu0YwoUFFmBWXhKYRprBXt4ZeIPOlH2/boSpWCrLGp/6/VmhwkDwa+
	1ParzfaTa06V0f7EY0osyeuv2Zs53/G2wQ==
X-Google-Smtp-Source: AGHT+IE7L2RksTdo4PykhNrWnyoUvj6w2h007DkFTFN715N7b6Hrc4tJLYxYdIFTQ+swGaa0FLqQ4w==
X-Received: by 2002:a05:6a00:23ce:b0:6d9:b296:510e with SMTP id g14-20020a056a0023ce00b006d9b296510emr3879064pfc.24.1704520567923;
        Fri, 05 Jan 2024 21:56:07 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:07 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 01/21] Staging: rtl8192e: Remove unnecessary parenthesis in rtllib_softmac_new_net()
Date: Fri,  5 Jan 2024 21:55:36 -0800
Message-Id: <20240106055556.430948-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove parentheses to fix checkpatch Warning:
Unnecessary parentheses around ieee->current_network

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b9278b26accd..520b90abcde7 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1220,7 +1220,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				if ((ieee->current_network.qos_data.supported == 1) &&
 				    ieee->current_network.bssht.bd_support_ht)
 					ht_reset_self_and_save_peer_setting(ieee,
-						 &(ieee->current_network));
+						 &ieee->current_network);
 				else
 					ieee->ht_info->current_ht_support = false;
 
-- 
2.39.2

