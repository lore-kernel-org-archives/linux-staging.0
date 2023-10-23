Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5906ABA
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIyxUd5g"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5221bd8f62eso992121a12.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043189; x=1698647989; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1oSx7TAqwvt3r72vk49KB6i5+36XUD3K4VbaVXfPF7M=;
        b=QIyxUd5gxmo53OMIrC/Djc9SJb6hd2lBEleUIMdYfVQrffqKgGyirMna31+fdWSj8l
         ++s8GzFqr5TAOLU2x+uqmk2Hi27JuvBrcYov2eKRdEY8d9sU5LRT//hzD8Lx2nnK/Yre
         9OoxzJG5YckOnqFWLhOlHxdX5lmAX9bIXHsQn0MeMTyv2kx1miqHmRviH0tzxzmIs4GZ
         ztynu2ienigI2lW4y6cISxY26Mn9cVx5ADAC3VO4Ad0A+NY7iXe4WuLI+hIJ/vZcffD3
         lxl4PbiF8PlCSqPG+sHkOXZogongh+d6XWPX9WjPWOGg+7S3y+Dl0wbkuY5XM+y7HerT
         HhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043189; x=1698647989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oSx7TAqwvt3r72vk49KB6i5+36XUD3K4VbaVXfPF7M=;
        b=NBGz79kkTr5obb2TXrSM6SEWeuZGRAveg/XTGm75+OWisIvk1GN57XWcGZKLIzjlNw
         BUrjQ1CluSLInw8q2zrjC7Xc7SR+7iagdKiV3OZAmEYJvng+o8TqEaA+EcWwPRBhkazy
         sx8Z5GV0w5qJ0ORp+BnyRgYrCSKqTQjBk3xenjT24TKo1XhpgQZG7snrceJ5ZpznjHJT
         Qez5wMe9prWphF65zb8sNov9AQ56iPRMMezoM2P6WR+v/gmXP5zov8S1lKAMyJsZUQm0
         ImA4Z+cuZpY9sF/nuzyYLaXqd9/dBOo7m4zRz2a+ge1KZaloVYn4CTygLDI46RZfNA1w
         I4kw==
X-Gm-Message-State: AOJu0YyjA1pPFq32GgBsHR4rnRZrdwHo8gQto/TVLicStrd8Pnu5R/r2
	4PnDPbd6GFjQk31l2GCaZwI=
X-Google-Smtp-Source: AGHT+IFULxBeVVAI3uq6wV5dI2ulhwRLeUvmuKu2fAbDhXTWrxV+Ae2PumPeHyaJVMA6HZF2Rup4lQ==
X-Received: by 2002:a17:906:cb:b0:9b2:bf2d:6b66 with SMTP id 11-20020a17090600cb00b009b2bf2d6b66mr5151513eji.7.1698043189387;
        Sun, 22 Oct 2023 23:39:49 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id v26-20020a17090610da00b00993a37aebc5sm6047066ejv.50.2023.10.22.23.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:39:49 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:39:47 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: rtl8192e: Remove unused variables ucReserved
 and friends
Message-ID: <4edfbe350e05649d1f6028777dcadb15af25238c.1698042685.git.philipp.g.hortmann@gmail.com>
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

Remove unused variables ucReserved, ucSchedule, ucTSInfoAckPolicy, ucPSB,
ucAggregation, ucAccessPolicy, ucTrafficType and charData.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_Qos.h    | 8 --------
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 ------
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index a43a5142e96f..5cdecec496e0 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -8,18 +8,10 @@
 #define __INC_QOS_TYPE_H
 
 union qos_tsinfo {
-	u8		charData[3];
 	struct {
-		u8		ucTrafficType:1;
 		u8		ucTSID:4;
 		u8		ucDirection:2;
-		u8		ucAccessPolicy:2;
-		u8		ucAggregation:1;
-		u8		ucPSB:1;
 		u8		ucUP:3;
-		u8		ucTSInfoAckPolicy:2;
-		u8		ucSchedule:1;
-		u8		ucReserved:7;
 	} field;
 };
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 95e735c078e4..af4d31a66853 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -318,15 +318,9 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		netdev_dbg(ieee->dev,
 			   "to init current TS, UP:%d, Dir:%d, addr: %pM ppTs=%p\n",
 			   UP, Dir, addr, *ppTS);
-		ts_info->field.ucTrafficType = 0;
 		ts_info->field.ucTSID = UP;
 		ts_info->field.ucDirection = Dir;
-		ts_info->field.ucAccessPolicy = 1;
-		ts_info->field.ucAggregation = 0;
-		ts_info->field.ucPSB = 0;
 		ts_info->field.ucUP = UP;
-		ts_info->field.ucTSInfoAckPolicy = 0;
-		ts_info->field.ucSchedule = 0;
 
 		MakeTSEntry(*ppTS, addr, &TSpec, NULL, 0, 0);
 		list_add_tail(&((*ppTS)->List), pAddmitList);
-- 
2.42.0

