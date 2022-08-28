Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024217E5
	for <linux-staging@lists.linux.dev>; Sun, 28 Aug 2022 06:53:19 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id t5so6649893edc.11
        for <linux-staging@lists.linux.dev>; Sat, 27 Aug 2022 23:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=DNSBN9C7p+LGvSIvWgi8/5Zijc/8PAs8ggosrfqDjUI=;
        b=aWK0Irld/y/fDeTSTGI78+p/axompnlqxOs2ShRwsPp9Q8mhklsuzv6AtYU1DFBUKP
         Gw6RzyrzFnIKn7QHhyz0/YZVM4iSFVHWMDXw5G1R/yNgKDD1RpBjKiVoz83jFi1U60ze
         vOqTZCYIr4YtQFEprR+jKRFI2j8xWT3WjD8l1wqaxX3lTQ9QY7udXDgNstBJl2+809Nu
         KChrW7MPFa0MV3kEGAwa/HRr916eYDUZ7YFGIflYSqc+znNLzd71K/LsbPygYWnDFaXb
         /ACK3QeYDOc7irH4UpFZT+Bz2MSlTVVgQIKE2riJjMEV9GWUCaDqj0gGzT0ysFYyrRSx
         tDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=DNSBN9C7p+LGvSIvWgi8/5Zijc/8PAs8ggosrfqDjUI=;
        b=VoBBNbg1Aqh0Qf1TL/1nm9hx5YsZwzpMqEKLvKEguGhSpjUTeWB0m33BhPo9IQ/+rF
         NwdLcBPe2or/CTOo1XXhzCBE9HdaHHLLIWyYecurraTy4elxksIxkzXMSkVyH4nVC+Af
         zbD99lKEHL9nsqBNkuhXYIWU7AgPF1qOWD8LqKitUFO/J3/ejDd1ITy0gK/QOn+BxUad
         QejlNh4JvEKyITihEYBvfW5v/P9Bacm/P/JhGG0iYlcL+IO9HJgQUfFtIsqTi+gM7l64
         Hpy0YdcOVr7SR92PePNmPY1juhf+Ls2FWDulex+cduyyRwxvWNkFkptRZ7peHISsEJjK
         pvgw==
X-Gm-Message-State: ACgBeo2PtkUjOBs0luvDF2CUrDrF7vuCHa9Ooe23oZQ9X87Ym+4aEWo5
	p2BPRGlLnaIKTZ77l3/ikO4=
X-Google-Smtp-Source: AA6agR6FcSC44u+dcjInryTuDRj65F3MMcMmZS/u/gUOZMzvpOY8ipFjusS2uWVw9fFnphpl1Jenhg==
X-Received: by 2002:a05:6402:5242:b0:448:6849:7e1e with SMTP id t2-20020a056402524200b0044868497e1emr559284edd.137.1661669597447;
        Sat, 27 Aug 2022 23:53:17 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id h3-20020a056402094300b00445e037345csm3870077edz.14.2022.08.27.23.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 23:53:17 -0700 (PDT)
Date: Sun, 28 Aug 2022 08:53:15 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] staging: vt6655: Remove declaration of
 s_vCalculateOFDMRParameter
Message-ID: <d2d6cd4a8888e4606255276b4f86e2c11487a3a2.1661666677.git.philipp.g.hortmann@gmail.com>
References: <cover.1661666677.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1661666677.git.philipp.g.hortmann@gmail.com>

Remove declaration of s_vCalculateOFDMRParameter as definition
follows just behind.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 846469cc06bb..bbe05d9538a1 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -55,10 +55,6 @@ static const unsigned short cwRXBCNTSFOff[MAX_RATE] = {
 
 /*---------------------  Static Functions  --------------------------*/
 
-static void s_vCalculateOFDMRParameter(unsigned char rate, u8 bb_type,
-				       unsigned char *pbyTxRate,
-				       unsigned char *pbyRsvTime);
-
 /*---------------------  Export Functions  --------------------------*/
 
 /*
-- 
2.37.2

