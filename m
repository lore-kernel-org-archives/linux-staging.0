Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97F01FB1;
	Wed, 22 Mar 2023 14:35:42 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id w11so10636756wmo.2;
        Wed, 22 Mar 2023 07:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679495741;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jbu2BN2MD8AK55tD9gpgYxyseZXeFWZjpylUucgmVfA=;
        b=RTxjz04u2joRaMa8uHBz15dktbHzstCpvU9PFywh/OWufVAARCdIRUNsZOqAfNF0Sp
         tP+FWIiyM+nMp3ifRvMx2FR1IT8ox6ec7hjs7YiU9FYldJ9vDrhXVJyX+d0d3oqiQ8yU
         2DH/5GrvlDAD/kkN0+f9rgXZ1njd3pyNvk4ZRVQ+wKf9s8j6uLvkGcJhkdm2TyZnvnhk
         uae28E3kIBC46CTQvzNKdCQxICgqy8I5Jar9lAtrAwdD/sd7tFq0KZNsBWnfwm/1ieLv
         Bp0CyJ8dmX52IHD2ald6Ne0wQBGs7h9bn1MwxMG/4jYoDYQb+Vu9LHiuM16Fn7ErrU+B
         IhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679495741;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jbu2BN2MD8AK55tD9gpgYxyseZXeFWZjpylUucgmVfA=;
        b=Ba2xcWPHRcrjBH+iMge6hpVWBZuCbaWpsDNT8o5ra9nGWpNyb2UXUm4YuTn1u3hkxx
         bxUIqDYst6+MmpAIH/bWxM9m+zXx9hA8WdcYkXMQi83JAN5X31riXcf0mHnyVpCBJeAr
         SvBDqFFCQ3Kc3Db6EEVnjB+PbkHcER0oAb2ouQSP0HTZMmuBT/kmQRWCwVEL4/gscjoN
         0fCXrpdjOXR3USNqbUsi/9LvLDbpfprEUOpahWZgzbVUVbdrBdzEwNfnmbxl6UeuN9Od
         Q5Pj1/BaWadNfUIlFHFjqkdS+kAU6UdGnH84lH6sbg5jwAarjsv/p4z+LqNgw29rU6lY
         aU8Q==
X-Gm-Message-State: AO0yUKUIzmsVvaIVcfqFZqHTqKEfsxmCg6gFyqFrBiPCMmef5Yyr4qah
	gLaxKMQv1fDa30CcO7tydTA=
X-Google-Smtp-Source: AK7set8yQ5eD7/ltB13mgpr1e1WKh4RWcGOKdlu7FReGb/WBxCtTBmnEEUc87II/zaXtfM1sIO6b7g==
X-Received: by 2002:a1c:cc1a:0:b0:3ed:711c:e8fe with SMTP id h26-20020a1ccc1a000000b003ed711ce8femr6167710wmb.2.1679495741101;
        Wed, 22 Mar 2023 07:35:41 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id q13-20020a05600c46cd00b003e1202744f2sm23535000wmo.31.2023.03.22.07.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:35:40 -0700 (PDT)
Date: Wed, 22 Mar 2023 19:35:38 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: most: fix line ending with '('
Message-ID: <ZBsSOlPbaGZcAaSY@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Splitting function header to multiple lines because of 80 characters per
line limit, results in ending the function call line with '('.
This leads to CHECK reported by checkpatch.pl

Move the first parameter right after the '(' in the function call line.
Align the rest of the parameters to the opening parenthesis.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/most/dim2/hal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index a5d40b5b138a..6abe3ab2b2cf 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -346,9 +346,8 @@ static void dim2_clear_ctram(void)
 		dim2_clear_ctr(ctr_addr);
 }

-static void dim2_configure_channel(
-	u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address, u16 hw_buffer_size,
-	u16 packet_length)
+static void dim2_configure_channel(u8 ch_addr, u8 type, u8 is_tx, u16 dbr_address,
+				   u16 hw_buffer_size, u16 packet_length)
 {
 	dim2_configure_cdt(ch_addr, dbr_address, hw_buffer_size, packet_length);
 	dim2_configure_cat(MLB_CAT, ch_addr, type, is_tx ? 1 : 0);
--
2.34.1

