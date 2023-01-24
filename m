Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACBF8F70
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 22:03:22 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id e3so15254486wru.13
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bF+Lp+JDPbwdrmjIfQ0g/QFY3xJvOU79Nk3DY5MrQzU=;
        b=OF3bvE9BGHU4pLMINeGZ7j1sGTNaHyVnwnjqw71YdNbdZFDA9COuaWvpF0baR6bZWH
         MSinkl6soRMGeltRq/QiUkB1p6CgoVjP/eYhZP+JxR6xjX5in9XcNHDjM8ktAw7dkP3S
         sYNJfZ6dYTsAGWh745r4IirbHC/q3NzLRqESUzhkGyw7HGr0p5Tk1heHE2h8fSv/+J9B
         eD5DERpuYKTkj772BhDdt2TOQU0u4dTFkmg8LXMO1DN5P+yVJ1mQdkGoviAvFkZta9Eh
         +WLzkBQilCZDAD1CgjsME/FU1+Lq6o4VYa+Rzqp0B/tIcaa5zsVgjzHDY/HORQB+LpVv
         EquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF+Lp+JDPbwdrmjIfQ0g/QFY3xJvOU79Nk3DY5MrQzU=;
        b=j/hSYqRFA1Q+jYxQkqFIJ6fooVGKhqpsXvIEw34sgB0O6erWnWYoCidkPVOySAGX0Z
         lc7TssdMQkZguFDLIq+Vac3AnOuj8QbLansUQQqHQrklefy2yBntBcf2tsfhgg8JtD4l
         W6bBinKaqYLBF2icTvb7vu5GXlvW+8/CdD16f4RH4Gzz9Pz7TtUF9/v9rGR4LsUcEevW
         5aP32i6B5uzz2bGGJGuUi/5KIg51SVcfDD0yx+960TO6x+Pb163SEfAiJpC978TPMh3s
         K/M1Eel3PkAMCq79kDo7IwVMDA5PpwhlRlVzA6/nBFxiGlf9UKbSbMdKh3QxPK/7LMLh
         /6cg==
X-Gm-Message-State: AFqh2kq2GTqqFo/4hS8FviOqTARtyLapR3ziGIUi0SYi2Y1mkFxeR600
	GVqJFWlwiDvOHwNGrHVmyRgtifUqYgg=
X-Google-Smtp-Source: AMrXdXvyQMfkCITZC9ll6B+bJaFmOem9Tg1mquONTYUiukQ4s/Dzx/epQ/Robh8oVbamWhlZNmHRfA==
X-Received: by 2002:adf:a446:0:b0:2be:55ed:c065 with SMTP id e6-20020adfa446000000b002be55edc065mr2848791wra.7.1674597800811;
        Tue, 24 Jan 2023 14:03:20 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d4c4f000000b002bfad438811sm2167871wrt.74.2023.01.24.14.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 14:03:20 -0800 (PST)
Date: Tue, 24 Jan 2023 23:03:18 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] staging: rtl8192e: Remove unused variables
 rxdatacrcerr and rxmgmtcrcerr
Message-ID: <32c9183fa2f4edd24ae6f93d56b808eb1821832b.1674596722.git.philipp.g.hortmann@gmail.com>
References: <cover.1674596722.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674596722.git.philipp.g.hortmann@gmail.com>

rxdatacrcerr and rxmgmtcrcerr are initialized and increased but never
read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 7 -------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 605146c840c7..e0d0f4faeca7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1926,13 +1926,6 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 				priv->rtllib->LedControlHandler(dev,
 							LED_CTL_RX);
 
-		if (stats.bCRC) {
-			if (type != RTLLIB_FTYPE_MGMT)
-				priv->stats.rxdatacrcerr++;
-			else
-				priv->stats.rxmgmtcrcerr++;
-		}
-
 		skb_len = skb->len;
 
 		if (!rtllib_rx(priv->rtllib, skb, &stats)) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 82cbc7f5536a..f91a6f7a4e0a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -183,8 +183,6 @@ enum reset_type {
 };
 
 struct rt_stats {
-	unsigned long rxdatacrcerr;
-	unsigned long rxmgmtcrcerr;
 	unsigned long rxcrcerrmin;
 	unsigned long rxcrcerrmid;
 	unsigned long rxcrcerrmax;
-- 
2.39.1

