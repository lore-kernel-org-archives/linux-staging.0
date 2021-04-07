Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC36D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:37:08 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id t22so5119258pgu.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZGMaTnhAGkt8KYVxrVKbfZTGzttqgPwSz58aY8xeIts=;
        b=DPhGn5VNya3y33vxf5Ki/zWMTNOzOY4P+JPBBl00ReAABTtKxV40hi/pVgmAetvOTt
         hkMy4xCmn89/m2by9NNV7BDHFZJGsoHsc47SLRkxyfDZQyUxoxhUeS45T6LgezSQIOCB
         0uhJKnbfwioBIBj7eJoROWEMljCJkj7xuiZ20Ve154ll4LTOe8m0TfPGm14GUti21cLu
         tQpgu0o7x9q28SB7JSGiRZpJbfyq4T6ox6GS7ivjcHipOhJzXubTqcttnD7fcLpsAC55
         P0JUPSzVlPnLmKgJUfixs/FL4PxNyASxhamX2KZfMCPOr1HBy5ZM8NEb4evCkaV68rfO
         gNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZGMaTnhAGkt8KYVxrVKbfZTGzttqgPwSz58aY8xeIts=;
        b=Scv/EFrkqOLSly6dSSBshmioUaFzFn9AHqQLj398FcSrGHhJDBUSuMDQHJhYeXXu1s
         UCL2fLC342tR863fitcueY8lXSqbBjQsNaHRS/jyKaF6Jl4KXNFNHAdyhOJ2r+Mpjlom
         M0ApNGuS9xjs7kFcMeaoZE7+wPlR6VA+HhUC9lHbnMCc8RVesXLeaXPVy63idmYX6uwm
         9pwECX1UkKWNUKX9Pe/8myKOH4xEazv2ksTei7Ir0HEWDeaGwJdda4hLnhD8q3L37A/M
         +jQJfxniTSY5tJuQRR5T7NCrz5souLKT2GgUcTrriurmXrk+q5J+VbmAZVgCgi1+U51a
         2JtA==
X-Gm-Message-State: AOAM532BpIzOGuetSdWHsKsUKNG0+bDxWd8OWtB3w6lN9gc6Oz/Z/ly1
	ouWw0SZwh5smsH+klyI5L9o=
X-Google-Smtp-Source: ABdhPJyT0UMLGJ9rpAI763JX6R6qPy2596YeMN0kG9OZZlfz5zu/2aTtVSennR8N+N796+LoKrcVwg==
X-Received: by 2002:a62:8485:0:b029:1fc:823d:2a70 with SMTP id k127-20020a6284850000b02901fc823d2a70mr1606951pfd.18.1617777428422;
        Tue, 06 Apr 2021 23:37:08 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id s76sm20722388pfc.110.2021.04.06.23.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:37:08 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:37:06 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/49] staging: sm750fb: Rename deviceID local variable to
 snake case
Message-ID: <d377e081c0a67c3ee838e1821aa6b35a46fcc92e.1617776878.git.pavle.rohalj@gmail.com>
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
variable deviceID in the function sii164_get_device_id.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 14d7083775b4..ceeb914f8441 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -56,14 +56,14 @@ unsigned short sii164_get_vendor_id(void)
  */
 unsigned short sii164_get_device_id(void)
 {
-	unsigned short deviceID;
+	unsigned short device_id;
 
-	deviceID = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
+	device_id = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					       SII164_DEVICE_ID_HIGH) << 8) |
 		   (unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					      SII164_DEVICE_ID_LOW);
 
-	return deviceID;
+	return device_id;
 }
 
 /*
-- 
2.30.2

