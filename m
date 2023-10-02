Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C93A1DA38
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:53:29 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9b2c5664cb4so190912366b.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269208; x=1696874008; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayat5KM/WUkPq1z1BDmKsHr3rXeO84/wlnct3+KjBfI=;
        b=ByKZLb+qiOLatGiquGn3FIS85uT54xbfUiVK1guZtQQfk/bY47Yb0Z99Su9iXtBMO3
         XBTKqNisOfc48lrTh8sSzja5MgJzkzjJsA50WUPzWZl65Q6AANenMY6yAXxcAttOEv6n
         x4a5H0pnhU0BxqWywAHgFIcTsJVrHqiP/nk9br4f4afSgAutOypDCfZv2D+ZhjWotkmA
         whQ4wKdsZEoq+MIhU/Z/BwdnYFyb+LEauedrPknIaK2i7x+778AC27lAbR3eGZxYCilW
         lj3/8qL1r6UNxwsmOkWxVlfH+MyRNVB5Sblzky+TWH4IO19GL+hByBY0ViZPMV4w+KgW
         yQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269208; x=1696874008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ayat5KM/WUkPq1z1BDmKsHr3rXeO84/wlnct3+KjBfI=;
        b=SGMWbOhLjHWsXlFF7U4HIn8DG+2Qwr0WsS5KZ79RtFAq/RrLw/lT86XyP2daAemfjB
         pW2cnRFvMdqNukbmkIY9OLcsG29/WeinFEWr4CnG1W+yM8l5T7nddHJ7/xJ9fQvqjeiY
         eM+rxfDltwBHpBiwlSbMfJet7l76PRFgcDk3H/HcUrEwehPuyyqbAif7HIEL8BaLznj6
         tVfwdPPaqqBAg4ZQ3xjCMCB0iRyDYkuwMz3usdHakbMnBTsW0tvETpDD29fmWsCy+XOl
         DY+nFIaDLjVnTrskS1a+QOu70xB+/uQf9VX38zjnNoZhKoJpT7wEfFod5Ov+rlwRwJ5e
         5Vnw==
X-Gm-Message-State: AOJu0YzYMDpr0Tijbf6CKsqvCufBrhD6P2DNxLp8kSrIggtJ/4e7D6yA
	xbC2XLcyqVcF7P3hDQfx7bE=
X-Google-Smtp-Source: AGHT+IHpvTp7tKTXmSCrAZb8YRarfK4mYBGN+W44cmYxXmWEVHLEPVh7MTKNbTs8Te2KMHTQmlpaIw==
X-Received: by 2002:a17:906:74d4:b0:9b2:b149:b816 with SMTP id z20-20020a17090674d400b009b2b149b816mr9417257ejl.7.1696269208425;
        Mon, 02 Oct 2023 10:53:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id qk8-20020a170906d9c800b009a1dbf55665sm17183634ejb.161.2023.10.02.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:28 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:26 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: rtl8192e: Remove unused variable last_ratr
Message-ID: <2b91a8f4ec6184c2f16b8f65bdf65c69a4d17458.1696266964.git.philipp.g.hortmann@gmail.com>
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

last_ratr is written but never evaluated. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 2 --
 drivers/staging/rtl8192e/rtllib.h          | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 8f5e4b932350..52b9393b55e7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -370,8 +370,6 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 			ratr_value &= ~(RATE_ALL_OFDM_2SS);
 			rtl92e_writel(dev, RATR0, ratr_value);
 			rtl92e_writeb(dev, UFWP, 1);
-
-			pra->last_ratr = target_ratr;
 		}
 
 	} else {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 004818520ea8..1e474691aa88 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1164,7 +1164,6 @@ struct rate_adaptive {
 	u8				ping_rssi_enable;
 	u32				ping_rssi_ratr;
 	u32				ping_rssi_thresh_for_ra;
-	u32				last_ratr;
 	u8				PreRATRState;
 
 };
-- 
2.42.0

