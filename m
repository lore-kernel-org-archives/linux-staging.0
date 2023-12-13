Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C4C2FC21
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj8VbeJT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a1c6c8d2ecdso190885666b.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486343; x=1703091143; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcuM1B7Nqln2T8HsY+RDMt6vNuKyn/uBt6HB0cu06wE=;
        b=cj8VbeJTYye0kT0sVTqcArItfdQoWMIhNe0Pw6h3dWjcLkIjy+mkY6SkKEQ3UPWUex
         4fvb0bIImPygh5YF2XhC8DrpVK/CZKQ/4CUY3FhDV6SneBB4AvYllS02adQyNsVMT1oj
         l1tcSsoKszk1qkLSlaMPNFtEd8Wv64UTOgLW4mnAL6pwjVBVJhYbgHxaekZJ0yWPhcN9
         bDDAEyj5tbct6FsxxmW0DfWBzTCOX/sjJ3CafRH3nm2b7Y63D+eAJ+R8n0xjk1/y1i0O
         AAkytkGsxj8eMN3Vq8q8ZsNUtKqfCSXVZz+jS5mYeZbxHJtj0SB4Z3xZx491THk81z8N
         8nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486343; x=1703091143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcuM1B7Nqln2T8HsY+RDMt6vNuKyn/uBt6HB0cu06wE=;
        b=S506P6D3A1obUlLjEM0z18CoLn2zQFUA5D9SRXEkR0ohHYuZWeSJN3DIw/9dRc9C36
         02RL4TZPm3Pv26oIaT7hxjAccj9yxVimc834lmaWpnM80q8+1kndtJhLXjbRbEkdD/yy
         2JsDUommxc3a+HbrtzRwTmPkKAMesHhtIP7zQmJzk0F6y0W8tGJ68OcqDi/mO2hKN1IG
         a/MiY1J3KUch3YYR2YR6kY2xAza/6bYKGVnKJ3tO1PCexQPDgHog1str2ygDHfcKu3G0
         vqtlL9oJPQ6EgE7Xy5ixML9hcWlCaU+QOWbVKaTC4nwUOX22wFS9IUC89pa9Q9U+Mih7
         mKlQ==
X-Gm-Message-State: AOJu0YxGu8YQbXPgdNx8W/KiN2AvwWRXM/8Ix9qurgpyKmhoURaBSNeg
	s65WlXxGMPXJcwumepRqE0rMddC5D+4=
X-Google-Smtp-Source: AGHT+IHnnv5a7KagUWLWUtnXmhAJTELjZR68Rq07jNtKxvCUpjdfOeyNLnO8XgZA84eeMOocpuA34g==
X-Received: by 2002:a17:907:a70f:b0:a00:211c:9a9a with SMTP id vw15-20020a170907a70f00b00a00211c9a9amr9176973ejc.5.1702486343268;
        Wed, 13 Dec 2023 08:52:23 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id tb19-20020a1709078b9300b00a1cd30d06d1sm8245901ejc.14.2023.12.13.08.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:52:23 -0800 (PST)
Date: Wed, 13 Dec 2023 17:52:21 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Remove unused variable
 ht_info->amsdu_support
Message-ID: <b3ea8ddd16a753d9ee1ee8b99e31e990ce89133b.1702406712.git.philipp.g.hortmann@gmail.com>
References: <cover.1702406712.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702406712.git.philipp.g.hortmann@gmail.com>

Remove unused variable ht_info->amsdu_support.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index e6cd906dc0ac..c4af9968cd67 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -101,7 +101,6 @@ struct rt_hi_throughput {
 	struct ht_capab_ele SelfHTCap;
 	u8 PeerHTCapBuf[32];
 	u8 PeerHTInfoBuf[32];
-	u8 amsdu_support;
 	u8 ampdu_enable;
 	u8 current_ampdu_enable;
 	u8 ampdu_factor;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 578d9276035f..044bfe44d213 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -71,8 +71,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	ht_info->amsdu_support = 0;
-
 	ht_info->ampdu_enable = 1;
 	ht_info->ampdu_factor = 2;
 	ht_info->mpdu_density = 0;
-- 
2.43.0

