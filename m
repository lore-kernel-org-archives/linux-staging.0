Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFC77B;
	Tue, 22 Feb 2022 18:03:33 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id f17so10097143wrh.7;
        Tue, 22 Feb 2022 10:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZA1AEF6WYe53I9xc29Ywox25Ld05hhSuOKpOWRLCD0Q=;
        b=ga5HhF1kzBzWTvKfcvvy2G6pPpg6ZSlIrxkAJbJ6v+ZHmwIpqeVSDShxafKYqADvsD
         yq8c5Vm8FrreBj0AuOhaGzsvaQHpvpXH09xRLPmTecId0D7mR5b0Q5QfjE6jrErigbjv
         VVVTT5kSvy5xYfdJGr4uWS6OtpC7cbb5DXOXTCjiDAybnm4+pJTkZvZjCrRdNONlHgEa
         P+AQ7H9H0+OXErltcVA5VO9AQiJ8YsKgPkoPLwkvqXwMdvToUIr1Idi1wzfR6Yrs5P2N
         VTp+munJbWJ8b9j+H0C8zrdeOKVysbJVHxCtezfJWdAa9UuZS36msAUUHMT1jz2ov/XA
         G2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZA1AEF6WYe53I9xc29Ywox25Ld05hhSuOKpOWRLCD0Q=;
        b=F3YkQX6QWc60eA7FMBpABHyrBPYhsElKCwNHVEDtza14J63wa+ekx7ItgtOh47jySd
         rx0v+6mpZw752Cpakhgv9twUhpqAyVTKJGj/DksIHHKm1WigLGp+h3QC1D6swHxZhM8E
         J9rrsLSZfu2ulqeujZiie0hshgTkbCi+7+VIoFR1FNS4ru4r4AEIQ334DDKH8qf1d3Op
         HK9x7UszOW3MDRdnNjnsPl3YRPoUiuA25mWtf/JETDaeFsuXSv329Fi2LeDcgIbj9bi3
         VGS5OgWyOuHzSMlO7JgR4jmv7roAIU+6TQbdGuhewpVeH3SVoapBomBFzrN8Bj5dnMK6
         GUtg==
X-Gm-Message-State: AOAM531d0xeMWdyyspxOfxlZq7GRN5RW6+BYeau2wqZJFOt2VzudBPJC
	4PqzQ3PobKVJp9X5bYGKEik=
X-Google-Smtp-Source: ABdhPJzNFYx5oAjf3+Rk5ssr7+hioPDrHat9vTUipqzp/XT0YyvI9V4d7cbaImdepV5Gxc87H7QYTw==
X-Received: by 2002:adf:8122:0:b0:1e7:b111:3b92 with SMTP id 31-20020adf8122000000b001e7b1113b92mr21076844wrm.695.1645553011872;
        Tue, 22 Feb 2022 10:03:31 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id w8sm54251377wre.83.2022.02.22.10.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 10:03:31 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	wens@csie.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: hantro: sunxi: Fix VP9 steps
Date: Tue, 22 Feb 2022 19:03:28 +0100
Message-Id: <20220222180328.2097103-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that postproc on Allwinner H6 needs width and height to be
multiple of 32.

Fixes: 86790a4fdf4b ("media: hantro: Add support for Allwinner H6")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/sunxi_vpu_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/sunxi_vpu_hw.c b/drivers/staging/media/hantro/sunxi_vpu_hw.c
index 90633406c4eb..c0edd5856a0c 100644
--- a/drivers/staging/media/hantro/sunxi_vpu_hw.c
+++ b/drivers/staging/media/hantro/sunxi_vpu_hw.c
@@ -29,10 +29,10 @@ static const struct hantro_fmt sunxi_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = MB_DIM,
+			.step_width = 32,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = MB_DIM,
+			.step_height = 32,
 		},
 	},
 };
-- 
2.35.1

