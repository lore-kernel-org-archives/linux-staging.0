Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A9B1FA0;
	Sat,  5 Aug 2023 08:59:15 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-348d6bc349eso10788405ab.0;
        Sat, 05 Aug 2023 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691225954; x=1691830754;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DfvEEeKIgA69ovhmfGQ9VWugUSsdWnJ329BDpMe7j+E=;
        b=f1Q3wHnX/qCtsMOy4DMBXm8Ujfxuz6oglXZdiwbkhn4zwPmGelfXzCIvBYIKy35iOt
         WjmxqTXVngbVFwjhK7oDuSObP587i7hA65RPU3AFY78Sx1oaoB1Q3n+9s/ADx7/0yuYp
         antix6m//lJU9q42Yiy+lh3rFDhwdJBDSHPV7W5/UHaRRASRlsvWAAu8lEKZ4iLapYOw
         6vP4UVJOdv8YMX0b5WlMU5kR5JwANdUHSI1I18fRBgE53BSrJr7oIHZr2zv8vxCqKWVa
         pWM6EBCUMnn9b9bfOTDpiw/cp8/93vn0ERt8Wp1ztm87Y+0ZoFkCK8hYFsceybs2Vx7t
         yxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691225954; x=1691830754;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfvEEeKIgA69ovhmfGQ9VWugUSsdWnJ329BDpMe7j+E=;
        b=EWQyHDbCu4tT0GSoqfyjmDYh7wq0W+bVVyYcYPp2WGpFG0CXGYPpAIJ6KVXTgroNas
         f8nH2wHKb2XYdLoIzfACdcQnWxdEbzNvTkF4xYlhWm08vvWhbOs9GjVNPKtkmODuOypA
         /ZzM5rTuy3cUt2VJfe5uAP5Gj771tEqN25p7ODBezW5JqB5NDmaLFQ2io7Xww7VVlF84
         NmsSvPJE0zEXnhSEvUF8HC7ar0qUEV0j23C8aCCArC/B/ODhH/2v3q8v86lQ5nsOiA4C
         Z8ChWDL6Hc4p5DpT05AkWkBN1UFxvs2irnoRhNQsyt2+v2B2LugQEYWV/KYYJ/SOaGeF
         2i+Q==
X-Gm-Message-State: AOJu0YzzA4z6s96wKZg4pAaJx7XcSrBvftAUwB2VAbCuAjVDDE4ktDwH
	cxkcdGloOqzMqpQtoKaIA3Y=
X-Google-Smtp-Source: AGHT+IFP6KXDRVRGva01CtKkrcrpDq5SMvTG6aWShTTIqJnVe1nF0HrSUO1zYsoABezdfXLboQ43pQ==
X-Received: by 2002:a05:6e02:1a6d:b0:345:d583:5c64 with SMTP id w13-20020a056e021a6d00b00345d5835c64mr6790311ilv.24.1691225954629;
        Sat, 05 Aug 2023 01:59:14 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.171.52.122])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78008000000b00686f0b15b06sm2728784pfi.188.2023.08.05.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 01:59:14 -0700 (PDT)
Date: Sat, 5 Aug 2023 14:29:04 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: vt6655: replace camel case by snake case
Message-ID: <ZM4PWL55pMQiYIX6@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace array name of camel case by snake case. Issue found
by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 v1 -> v2: 1.character '_' added in the array name "byvt3253b0_rfmde"
           2. typo in the subject line "small case" corrected with the
	      proper word "snake case"

 drivers/staging/vt6655/baseband.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 0e135af8316b..8b913c64845c 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -499,7 +499,7 @@ static const unsigned char by_vt3253_init_tab_rfmd[CB_VT3253_INIT_FOR_RFMD][2] =
 };
 
 #define CB_VT3253B0_INIT_FOR_RFMD 256
-static const unsigned char byVT3253B0_RFMD[CB_VT3253B0_INIT_FOR_RFMD][2] = {
+static const unsigned char byvt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
 	{0x00, 0x31},
 	{0x01, 0x00},
 	{0x02, 0x00},
@@ -2005,8 +2005,8 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		} else {
 			for (ii = 0; ii < CB_VT3253B0_INIT_FOR_RFMD; ii++)
 				result &= bb_write_embedded(priv,
-					byVT3253B0_RFMD[ii][0],
-					byVT3253B0_RFMD[ii][1]);
+					byvt3253b0_rfmd[ii][0],
+					byvt3253b0_rfmd[ii][1]);
 
 			for (ii = 0; ii < CB_VT3253B0_AGC_FOR_RFMD2959; ii++)
 				result &= bb_write_embedded(priv,
-- 
2.34.1

