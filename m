Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8619479;
	Fri,  4 Aug 2023 12:22:36 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b8b2886364so14337255ad.0;
        Fri, 04 Aug 2023 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691151755; x=1691756555;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3PEClLdiiliH1dtsL2h+XTbEz6roLIfQbCqPY68CHc=;
        b=OFwVFmRsJuV6UUqxTdx++WeXscIG9wz3qJqRrDuAXHg7p82x3VGU2mwIUaxTx6orxM
         dUqfrQE64FTMZxaB4Fm9qEk8aswDQ8xR11o1GRizBmyTaX78xDUuy9UFrqFUankR3mlv
         SkA/DRSfyuydkQ9bpZDlXgcFxTrsR1ZstGwieEGBIZej4WUgYPT4xRuFrXfDa5IeO3So
         wA+0+7pj+nIkGdNlhlchKSVBKl07QYHhSUN0zeZ8WQxZRaR3SsMOsVftI6Q98/4LemJS
         GmHRP5ZpS9el+YQ7EjTn8vcnFc5DX4CgPJVTPs14zmKsoGTMq/6yt44ltY+yxqD57Sku
         iXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691151755; x=1691756555;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3PEClLdiiliH1dtsL2h+XTbEz6roLIfQbCqPY68CHc=;
        b=YOjr23NOtkTpUiotG9Yqxb7CSVOOFsW3TQX9XyBchXxMvSxqt1RfjjlgZW265LvbxS
         dO1F7Sy30eOUx4XxjTfn+yx1OpGy1STtul/pXkXwQlR8qjJLeW8+0inzUorAV3IYd8IW
         t92/yMR6Xb7O4/FIrUwxmPRR+TVEoroi6PMZ3fVVpC7OeYHx9bfpk3tZOqrEUXkVXwMP
         /SpWvcSfgm+9DwwNojcTvxLiNlVvko+dRlNhyPJ9AxX9q5Se4/q9/ISI4RTqIVr1sXbh
         UxoWxIDGUMx4bXDv+PH7Bah+U0E7ioPjnyEdWvRhS5hyhPCYdME/TUlrFLxVe+dieb6y
         /2Kg==
X-Gm-Message-State: AOJu0YwH77w6JRa2ez2aVdJNYrYWhdTvhRqXTkIttrVwPJz5iQqasxcC
	qMcN7sEZ/Eb/3c9cUo1YyMs=
X-Google-Smtp-Source: AGHT+IHpYA7orGRpAw8gM8JsOK9s+I3bvjORcwLq4xVjARLrP7QPuxGl5Oo/M4efK1MNCgDs7GIjRg==
X-Received: by 2002:a17:903:32d0:b0:1bb:14e7:4fd0 with SMTP id i16-20020a17090332d000b001bb14e74fd0mr1598438plr.7.1691151755615;
        Fri, 04 Aug 2023 05:22:35 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.173.209.14])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a6c9600b00267b7c5d232sm4364965pjj.48.2023.08.04.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 05:22:35 -0700 (PDT)
Date: Fri, 4 Aug 2023 17:52:25 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: replace camel case by snake case
Message-ID: <ZMztgcr3GYqSF9sW@ubuntu.myguest.virtualbox.org>
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

