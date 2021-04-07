Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BDA6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:37:07 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q5so12164687pfh.10
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5wteGrNjTPUFB2ScDRoKVavC5gzuo9SnMMiAPfPlNCw=;
        b=IEn9J76Lrugc/nUlPH9NZtZ75aywRi+kX3Z/6TeK3ZWmibspXs2M1eoU+9sqvzHuNk
         qWN1keMnWiY2Fm47qlCozmZvdxu+uDJ2bAm2JiiWl6JAiOi4Qi7QzeiHrqucDiWKr9N8
         CXhtRgNZXTv+RzqAV4mrzFi1qf0xLZF08e9l+v2X3zW/ZGQyMeHyx6jxxDEssosnMGdh
         HB8EGRQf2sYxPlgTTR85hYX1K/U/OjMyWWk76OF/C5uGrV/OWE9pvEJIMHqyO30Dq0Y6
         S16zyrPXvCmrp002Co2RleisWdkIdkq3wmq5nR4kLsKIeTMeLWtGMSdu1oDgXDMj4Ong
         RwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5wteGrNjTPUFB2ScDRoKVavC5gzuo9SnMMiAPfPlNCw=;
        b=d9CsdtP0Bfi2mbDuFh2wjbcBqsZglJZbwyGfVfbQUTLbO3ESV+MoxMMp+wopdSbpRG
         whiveKY2Ga0bSxhPx/GY9PfuSTW5bh1WkQjsstI+3AU5dYxJCE9yrCyNNiA6dG3qMb3p
         Ocim0S4BhDV4ll/sKzr1YzPHtN4NzA8fi+L4MbZ2MaVEzgr5TvhrhtfSoYTrz4nLB8ge
         TiPgyz8KQihljz6+cZeO81XawQKSqboi4oBUi3m7nVgfdWqwCP+5QHHE4ZEjgDolo/Lz
         ga4tRi24UIFoqPOPLTTUGRyqsR0BQ7qRddDdka4kYaRLwmL+EJHnDoHmb/1Gi6lw2lbq
         3qXg==
X-Gm-Message-State: AOAM533Gei+20p0UOwb0S0nEzr/s4dzZlBYGC+hyMuRUs3eHbcqKa+Lv
	QFffkt/Oyt5iBFhkoCBURAI=
X-Google-Smtp-Source: ABdhPJxnL2AlOFOVq2buT/wYmiXorBFb4z+UVn2KSZphdDcp2PVtoou+pHQjsExZXemZ91dpLqPvYw==
X-Received: by 2002:a62:1c93:0:b029:1fd:2216:fb45 with SMTP id c141-20020a621c930000b02901fd2216fb45mr1476120pfc.13.1617777427417;
        Tue, 06 Apr 2021 23:37:07 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id b84sm20998653pfb.162.2021.04.06.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:37:07 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:37:05 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/49] staging: sm750fb: Rename vendorID local variable to
 snake case
Message-ID: <c48ef3dbe6d2bc6b9b059b6178f73b07b8239ac4.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for the local
variable vendorID in the function sii164_get_vendor_id.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index af14273b99eb..14d7083775b4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -37,14 +37,14 @@ static char *gDviCtrlChipName = "Silicon Image SiI 164";
  */
 unsigned short sii164_get_vendor_id(void)
 {
-	unsigned short vendorID;
+	unsigned short vendor_id;
 
-	vendorID = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
+	vendor_id = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					       SII164_VENDOR_ID_HIGH) << 8) |
 		   (unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					      SII164_VENDOR_ID_LOW);
 
-	return vendorID;
+	return vendor_id;
 }
 
 /*
-- 
2.30.2

