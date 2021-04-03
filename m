Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F545F
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 18:09:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id b4so11740156lfi.6
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 11:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O3p5QBNJq6bpJriPcr9hUrPsu9ysLNiodRXiRx02CbM=;
        b=ZVCczNC1Ysv5H3DSWYKx5vFPj4JxgQ2wgTw5t35q2XPko5TERIcOEj58CJK2WOb17C
         JkeipxkRHbcPOS1nPcR6YaiGJa4fHsFpyi1QxarMFT6MkUDurwT8vhFQ1Iw5OuJiD8tq
         2DIiqaBlyJJUKiTXSV0FQ/0hTGV1m0IeHA6QFs4KrTeC9hvww2lMRE1nZBayIPFl2icQ
         uCpTcRkk2u0mgqXWOMdEr96zvRstfATAQaG0rT5lNwseSvAyrrua/ekXZibSJNG5zmGI
         qXhoIinaxyKcRJfLoe7WityyHbT95yqEmSH61nKNxpmFAZvlHV0KFmiSr29xnapM4CV/
         qrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O3p5QBNJq6bpJriPcr9hUrPsu9ysLNiodRXiRx02CbM=;
        b=qngA5OvDMH5RKmrMvvSO6Ms3jYTKrLYl70J0kIK0G8wCS38r/XuAHDpyZ7JP8L/6x9
         GRtJo3Ri3cjEbtU1YKiqB2a4wjrajZpSIHjfGCVQiMvMm2ipKjhfmjwXbi24EBf4oM9x
         40wqhl8o8a9HAK6ZDR+zq6OWeJTCbIs5wlezsIf0EmEWoNmlzYZF18r+yXNuAV8m3dRU
         Xe0kxBP9qU2EtlpT6JJM+LEakBwOKWCX63aQvG/P+LWCQywezlj4+J0ksC0DsNnXIUVY
         rzrPJZTfUtDzhapsC4oMy9ndfGwSntxJv7F3py9JE/iU9QaGlM9DJYWPEDJZrcXYrsL5
         jePQ==
X-Gm-Message-State: AOAM531OvxQG4WseRRNewwjEqFcvjn60Hz07PzlH9XYAXcYCA5KdsK8g
	H56yodsg0dU8ZHnPW2NU2Do=
X-Google-Smtp-Source: ABdhPJz6zYAb+LZhel7ZPyzNVMYKG/lTpN8Wq7BccQ3jp4Y7qNVdYIe4c39cpUAUEbzPGlEhslmoYQ==
X-Received: by 2002:ac2:5306:: with SMTP id c6mr12081779lfh.88.1617473345910;
        Sat, 03 Apr 2021 11:09:05 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id d8sm1207325lfa.49.2021.04.03.11.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:05 -0700 (PDT)
Date: Sun, 4 Apr 2021 00:09:02 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 4/7] staging: media: zoran: Rename 'VidWinWid' to
 'vid_win_wid'
Message-ID: <426cd7e38b03926aa8de9e4d3e630433e9c11f3d.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>

Rename variable 'VidWinWid' to 'vid_win_wid' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 8891f11f6276..f0344f4a4727 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -293,7 +293,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	const struct tvnorm *tvn;
 	unsigned int h_start, h_end, v_start, v_end;
 	unsigned int disp_mode;
-	unsigned int VidWinWid, VidWinHt;
+	unsigned int vid_win_wid, VidWinHt;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
 	unsigned int wa, We, ha, He;
 	unsigned int X, Y, hor_dcm, ver_dcm;
@@ -316,9 +316,9 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	/**** zr36057 ****/
 
 	/* horizontal */
-	VidWinWid = video_width;
-	X = DIV_ROUND_UP(VidWinWid * 64, tvn->wa);
-	We = (VidWinWid * 64) / X;
+	vid_win_wid = video_width;
+	X = DIV_ROUND_UP(vid_win_wid * 64, tvn->wa);
+	We = (vid_win_wid * 64) / X;
 	hor_dcm = 64 - X;
 	hcrop1 = 2 * ((tvn->wa - We) / 4);
 	hcrop2 = tvn->wa - We - hcrop1;
@@ -384,7 +384,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	/* display configuration */
 	reg = (16 << ZR36057_VDCR_MIN_PIX)
 	    | (VidWinHt << ZR36057_VDCR_VID_WIN_HT)
-	    | (VidWinWid << ZR36057_VDCR_VID_WIN_WID);
+	    | (vid_win_wid << ZR36057_VDCR_VID_WIN_WID);
 	if (pci_pci_problems & PCIPCI_TRITON)
 		// || zr->revision < 1) // Revision 1 has also Triton support
 		reg &= ~ZR36057_VDCR_TRITON;
-- 
2.25.1

