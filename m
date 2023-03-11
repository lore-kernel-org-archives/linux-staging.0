Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1D47B;
	Sat, 11 Mar 2023 12:23:52 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id n6so8288133plf.5;
        Sat, 11 Mar 2023 04:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678537431;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RHyWlNYOWTJpaRchXuBuoW9+Bl6vt/PZv6RitZv+maE=;
        b=VeTCeUnJguiKcfFaFYvN1RBFf7V7f2qcW7ytfy1bop6uCZfFI1HU9Lwc4rLPjrvWpv
         bszpcBpkv0AmPl8cSEDp/PrXMaal1u5jCOpIxvtKLORdPj8tskLAHWzLL4U18f+wUjkG
         crMtAqLOcGwzfOEtkTwdAxoBt/25CfiLGKwt1+t9+fjj3iyYzm9eyubGiErppTOWqX8C
         VqnqzLLa8ppdMf+XWJA0NGdD2OsSvcP6CP6xHTPLwwVFDptFkviCi5zLKQ385ecsSbnY
         upNfdanXpMnEHiEEX+rRGgYT99mP4IztlyewKLQIZRUmniPF70riAs/SJGprx4GF5/xh
         Pu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678537431;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHyWlNYOWTJpaRchXuBuoW9+Bl6vt/PZv6RitZv+maE=;
        b=XzV1biE8LUsHCiLZNGdbYHVs7bFrA8QoUwWObED75Wt+BWlrT4f0baJOpH5Js7ZEWU
         9d/UR1Sp6pylS69uMteWbEexipezKHJ1jQc8MKk4tJlwCV2znSir+BxwZtWsX69ykPX6
         HVxd6bgcZ8aXvafeBA9vuM0KVw4INCEbRe32MOFNd+LVtDGG5Fh+ypIRbCpjgHYrC/6w
         ngYQ4nRYuGYmweKg4S7vxv8GCHSElcKE6D6YzD+0X+37FHyavIIWPWTm2RuHS0skCSyl
         mwcsUO3zmSYPLbPeIFcCxoOVkZVwCvHAGBrPa7fFTdezRGvCFVv/3tesNYO6+w5W5F4n
         NqQA==
X-Gm-Message-State: AO0yUKVnkAWtIHMUB2e7N9we6hYf5tlVf/lrdLmLqC298acQXJU4yWB2
	wPi+U/De4xCvdTe5Onx/QMNwpt6AWxabrQ==
X-Google-Smtp-Source: AK7set/h/eNxdE1SsGotLvCSm2/foTZmvHZT9k8qP5rd04raMPv685hL2Itj7MMA/JruQH7o6CnSHg==
X-Received: by 2002:a05:6a20:8427:b0:cc:70df:ae20 with SMTP id c39-20020a056a20842700b000cc70dfae20mr5536607pzd.0.1678537431501;
        Sat, 11 Mar 2023 04:23:51 -0800 (PST)
Received: from ubuntu ([117.199.152.23])
        by smtp.gmail.com with ESMTPSA id c15-20020a62e80f000000b005abc0d426c4sm1391911pfi.54.2023.03.11.04.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 04:23:51 -0800 (PST)
Date: Sat, 11 Mar 2023 04:23:46 -0800
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] Staging: pi433: Change bit_rate type from u16 to u32
Message-ID: <20230311122346.GA21752@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change bit_rate type from u16 to u32 inside struct pi433_tx_cfg to
support bit rates up to 300kbps as per the spec.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/pi433/pi433_if.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
index 25ee0b77a32c..1f8ffaf02d99 100644
--- a/drivers/staging/pi433/pi433_if.h
+++ b/drivers/staging/pi433/pi433_if.h
@@ -51,7 +51,7 @@ enum option_on_off {
 #define PI433_TX_CFG_IOCTL_NR	0
 struct pi433_tx_cfg {
 	__u32			frequency;
-	__u16			bit_rate;
+	__u32			bit_rate;
 	__u32			dev_frequency;
 	enum modulation		modulation;
 	enum mod_shaping	mod_shaping;
-- 
2.25.1

