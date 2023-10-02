Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4C1E523
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:53:36 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b2d64c9307so133404166b.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269214; x=1696874014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8XgAodUCp0kY+1km3TbFUFkWPyDPdSc7jRGFUGZ6tY=;
        b=mFbK1pX81rB34XbTveJISA5LwlHiczwFyP4sViT/75BteRQ836MAjhwlOewB3NZ/h1
         Y62rxfv62HrxlHNLlgukdFACds9mWjDGqHCGCXk9Thg9DMPgOTPfIaa9TDlAYarLbuwV
         9JcpwNT3zGHD0DwbP8S7XlvsbjbXYNTVr86PSDDu+mqmL1cm0oU329x1bTCfe7KHcQEu
         AIjAmrwYF2okNEM2qbT/5Xyvtg8ix6IV9MWOn+RFHI2iN8Hli6VkrgfqyPUBGA0yERne
         9adpd2aZBJKm2YS1TxIf08/DVCrkG5a30/1cuVBOpTu6Jo1/bfNYDBEQ97vmatACf4X4
         nuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269214; x=1696874014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8XgAodUCp0kY+1km3TbFUFkWPyDPdSc7jRGFUGZ6tY=;
        b=rOPuRLO4SNB48QUNBIhKnGRun0YRtNcb0dDr58hVuIDeda91rtFCsr/2AD1gYpSEIj
         3GhsUKx9dQ1u5dUBgN8JeALms0ntRFFWcJZ8Gl32Yhd0uACfgy+z4Xq/vyL3hkAO4ZXt
         l6DDDl2xcbEEFSiKrwt0YiwXdkFyBLtILVjurrQJQRuakhXRin9M6l9hLryBeDA0fWYa
         dQvHK1ituIwQa3twa6uV+FVOLWS4WWucHHnddW2G/fWvssklRl5jS5ZZdf2CB2ZzM/uL
         yKy7vgo79JiuP1IUT00PZSok7QJbQpzYY30zWesl/S1idvnrjnEZM2IgHa/vzBa1h4VX
         s3Ew==
X-Gm-Message-State: AOJu0YyH1TI9Au5wSF+Tf8OiVsQttlnmlggNP3S80eeN4zTsqq/bZKt4
	+4oUWtCthyMaiCzCqT14LEd6gB1fdNI=
X-Google-Smtp-Source: AGHT+IHxoVyWegDAD4XwJ303ZcTwEtX/l/Xbey9YjC2IN7R8/Q0amJdtjx2O+QvFQl7248scBmVivg==
X-Received: by 2002:a17:906:7389:b0:9b2:71f2:bd11 with SMTP id f9-20020a170906738900b009b271f2bd11mr9471541ejl.4.1696269214420;
        Mon, 02 Oct 2023 10:53:34 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906681400b009adca8ada31sm17651321ejr.12.2023.10.02.10.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:34 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:32 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] staging: rtl8192e: Remove unused variable
 rate_adaptive_disabled
Message-ID: <31ba05bce9966dfac15cac15aa0e79cf36fad27f.1696266964.git.philipp.g.hortmann@gmail.com>
References: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696266964.git.philipp.g.hortmann@gmail.com>

rate_adaptive_disabled is initialized to 0 and unchanged. The equation
results accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 3 ---
 drivers/staging/rtl8192e/rtllib.h          | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 52b9393b55e7..01abe1e48468 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -284,9 +284,6 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	if (!priv->up)
 		return;
 
-	if (pra->rate_adaptive_disabled)
-		return;
-
 	if (priv->rtllib->mode != WIRELESS_MODE_N_24G)
 		return;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 1e474691aa88..bf4ec38efa35 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1146,7 +1146,6 @@ struct sw_cam_table {
 
 #define   TOTAL_CAM_ENTRY				32
 struct rate_adaptive {
-	u8				rate_adaptive_disabled;
 	u8				ratr_state;
 	u16				reserve;
 
-- 
2.42.0

