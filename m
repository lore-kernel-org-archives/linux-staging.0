Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584486FAA
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwHGBhXe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52f1ece3a76so759238a12.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043225; x=1698648025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O32Xy7uTc0KBQdpx2+7nBOVID0EODs+Xiq0NbRF0/Gw=;
        b=XwHGBhXePLgh9zhty9iC8qooCbLp7wIEkMYZh+coK3y406Ewnx4bSZjqvjUXncRL7y
         JmyiKh3wngbeVOHdrcYqse+kpvbC+jRYLQIcMlQ25fOLAmgdZK7RAN7Xjj4JyVi4jrxG
         UFMhYHCQFpOicacJIwAU9vCgdFUvrE0yQ+JoI2Etos3Z286hDPKdQiCCFUrRiBx5bbj8
         rpF1h6E3Kb9lXt1C6xsQ5udckzNyilyURupcRavGd2Z9MNODPKuWmukvvbAP3shjNqbR
         nlOPaDRwYHJNhq2w04b66O+11YWcAi479TrvuRWII5SNvVBZ+HALk4vNPhD7PngmbdMc
         BBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043225; x=1698648025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O32Xy7uTc0KBQdpx2+7nBOVID0EODs+Xiq0NbRF0/Gw=;
        b=TyxtUNR2pGqBGtZXEVOypVzWEhCIIvXBROGumaaB+z/knT52nCQy2Dy9ZsNOeZMu5C
         Pt+z5hlfRCJbzDSjf9XXEF2Kl/ZQL2vLNPR0t1NkbTO/5G7r/KqDazTLsmhppdEz/WMg
         ejc02bMtCjqGWPonodk7SsWE9/lAfa2OjxMelqdb78zWfYDuhnOkZ7OkB0eKY7lOPGkz
         +3XQm3vCVYppwKhaEFYYBr7dnPEbnBB0bArV3TZ8hRrDyAvKH8L5CW2y4EPZJ4zqqw+p
         cF2rZCMwYux/StdE22i/Mh+bcM36t4WSWScRpyHvq3BlsUlbkympWFAbLfduA3o4VvZV
         ih3g==
X-Gm-Message-State: AOJu0YxWmrWtjuo2nJU20NNhvitk4JvOYyjJC2s1Hbg4Q5557W9h7g0J
	bYklNmsHY1i8LD2n5ZA9fSA=
X-Google-Smtp-Source: AGHT+IFp6WEqRkJmwd+UcsT/0c445+Pv7mExviTP11F0KCVzyJ9Xpn7PTnhgb8r5XTSrcRUuPIlbqg==
X-Received: by 2002:a17:906:10cd:b0:9be:4cf4:d62e with SMTP id v13-20020a17090610cd00b009be4cf4d62emr6588314ejv.5.1698043225572;
        Sun, 22 Oct 2023 23:40:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090668c600b009c7608eb499sm6123817ejr.94.2023.10.22.23.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:40:25 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:40:23 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] staging: rtl8192e: Remove unused struct acm
Message-ID: <5cc31651cbf63e11c4172b4e42274dd862a7c310.1698042685.git.philipp.g.hortmann@gmail.com>
References: <cover.1698042685.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698042685.git.philipp.g.hortmann@gmail.com>

Remove unused struct acm to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_Qos.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index 64a1e6aa501b..9a9ef5fef6e0 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -30,12 +30,6 @@ enum direction_value {
 	DIR_BI_DIR		= 3,
 };
 
-struct acm {
-	u64		UsedTime;
-	u64		MediumTime;
-	u8		HwAcmCtl;
-};
-
 union qos_tclas {
 	struct _TYPE_GENERAL {
 		u8		Priority;
-- 
2.42.0

