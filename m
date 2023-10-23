Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D76F6D18
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BF46LONn"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9bf0bee9f2fso100745666b.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043199; x=1698647999; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y5DjY0fyjQw4FmJ3KRfuE40fsBqLvsoancRvTj6d54=;
        b=BF46LONnr1d/54CP51abpDL39NA7wgPIXyraXbgVjXtZGt5cLe1R8InpgTItNOw9nu
         C7d226Hu6Ugwn5KnpChiahFD1rZlT/pCPwLC+7yG19gsqA8p1sfwQPldR45tU5RdNZO2
         3HDAoQNYb4sUc3NA+gNwY85vyeR97FLUSyRB8+7Ec3PGbDkrihtG1vEslcAOfz9Q7ttn
         /pbHSRg5zpsxD7UCL8Pa+Sr34gm5XeqgfEzI0wSxKvLHdnk1ifA7Uh12D+7lhKD9IhxT
         YQoqQerUpeUN0AQgju0iUXiKDld2lnvF2DD1maLCluqhB8ernz06yvO5ntlSV+uSr9AU
         CZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043199; x=1698647999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y5DjY0fyjQw4FmJ3KRfuE40fsBqLvsoancRvTj6d54=;
        b=qRRiF1djiH62k+u06Ayre0TmmzyiCgE38yWEtzWXa6G8PFkoJ66c5kpDFkQJOtZX/k
         AgMisxSPzYILOuLWNTrPthV72Iyx6TRHjLa0qOQ/W6CL+oH3SgkGJrpBwkiQ8hYmAUAU
         tTkIn9HpJW4mSLAUF4Iz3+KWykkafPJDqWEOL6rxrcb5wa/4IJoE2VNmnXrzkTFKC7hw
         6PHM5p126tTdN3qTLKu5Kz8pMyVh69bl9khRwbCgkDM5p1uR3qeGQzmAIXV4xD4rSgmi
         9HKEukNbzrnGN9cveqxJ/CYci3bde4S4QpsrFflQqy/7q+bEDl8yRey8/hrAzHIrsrOM
         KlEA==
X-Gm-Message-State: AOJu0YwjMyySzuDV8eDrm3ksz4UgB/iUd9ki22yT4iUbJ+9HnpL9WBd0
	v/tjBZtqxGV3YeHpDJy4mL9ZmNiTo/4=
X-Google-Smtp-Source: AGHT+IHYMKHz44gyX9I+1TKCNnnSYaKVJmXf/24AVyP3Hxk6Uyo5yKZYJGyqosDUiFxwmTm1Jh6xYQ==
X-Received: by 2002:a17:906:74d1:b0:9ad:e1e2:3595 with SMTP id z17-20020a17090674d100b009ade1e23595mr5263127ejl.7.1698043199372;
        Sun, 22 Oct 2023 23:39:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id a19-20020a170906469300b0099bd0b5a2bcsm6117011ejr.101.2023.10.22.23.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:39:59 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:39:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: rtl8192e: Remove written but unevaluated
 variable ucUP
Message-ID: <724cf398d27f74cb7e0f290e1a8e55ed67dffcc3.1698042685.git.philipp.g.hortmann@gmail.com>
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

Remove variable ucUP as its value is written but never evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_Qos.h    | 1 -
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index 5cdecec496e0..7f086b7a1b88 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -11,7 +11,6 @@ union qos_tsinfo {
 	struct {
 		u8		ucTSID:4;
 		u8		ucDirection:2;
-		u8		ucUP:3;
 	} field;
 };
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index af4d31a66853..879e169539c8 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -320,7 +320,6 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 			   UP, Dir, addr, *ppTS);
 		ts_info->field.ucTSID = UP;
 		ts_info->field.ucDirection = Dir;
-		ts_info->field.ucUP = UP;
 
 		MakeTSEntry(*ppTS, addr, &TSpec, NULL, 0, 0);
 		list_add_tail(&((*ppTS)->List), pAddmitList);
-- 
2.42.0

