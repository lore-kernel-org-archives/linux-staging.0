Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29610F9;
	Wed, 26 Oct 2022 10:56:22 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id i21so19718457edj.10;
        Wed, 26 Oct 2022 03:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8fw059w/DKGSzGISpKiD55jlFKGFxUmcqcrxLcKoWk=;
        b=CLEyjBFayA83BBqUPHPVD2k/po+HkWh80ebuuSYJmU6QuV0NfDstV9jg4d+d3EgyME
         WApB62DSAgaDijYteIBvDCaxHE8heH4IGMqAJiheySzR77fbZWNpBVeAWv04GbJUdnAV
         /RfIbn1PNj7MREkpjGK8I0wpN3Ymy+M0JIRrNPsnFEPqOAi+y8MIQaOy/+cbcrs7/d/0
         gdMzMiKZWy4llAsPQeQthS+0qlJhhYbR7S7r5eIMLYFwtVAItFWAfKU8PTwU7EvC/ouO
         ZJmGUlIxj9lV1LIKH3ZSp1nqWKEO2+pt/iuQlsGsIoz5YADu3ZplTV5uBJRuej9VJZLQ
         ue7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8fw059w/DKGSzGISpKiD55jlFKGFxUmcqcrxLcKoWk=;
        b=wkRD4R5ERVbrY+WcGmyJUKiSunJy5Y/T9gvs4UYqQTNG/bt3tx6OmhIIQo8/9UvYfA
         p6bw73w5ebihGurToDKP1ybnNrWXvnAncdRPWbJUTTbDZrpuiRqG7S2Vo1s3FDpjcI0S
         V1/Wn5U1iWkAMG2LbhcHpw3ARKPXo6UIEpm8Ij4DGlMajGL2z7a/6cKNnHevbUi9V5hU
         b2eU1qtryw18iL3usaYvOcfFWyF6ErrJc9kMflcRwieXVntx1Pr6WuyT+XTHwule4q2W
         +GGuc4tnwiz1ujd8lIfM5DK94M20Z99m8oHNb/Wv1grqF+nUqOsVg8nTB4WZOyoSqFIy
         v4+w==
X-Gm-Message-State: ACrzQf2ydKmfMXoiN9BehBaiZliKuY2MESncNuKfh6zzl6Xmx3czz1/L
	W34idk8PgF6PnveNj820JUA=
X-Google-Smtp-Source: AMsMyM6/tZmI5E8Yt3bmfs3zBrVnzh4DNNGgxvX1Cffob+Gfq9EdJtZbqag9MZprSWpOTwc0dIBVuA==
X-Received: by 2002:aa7:c14b:0:b0:461:c47d:48cf with SMTP id r11-20020aa7c14b000000b00461c47d48cfmr14101576edp.83.1666781781005;
        Wed, 26 Oct 2022 03:56:21 -0700 (PDT)
Received: from rdm ([41.75.188.39])
        by smtp.gmail.com with ESMTPSA id g8-20020aa7d1c8000000b004589da5e5cesm3265597edp.41.2022.10.26.03.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 03:56:20 -0700 (PDT)
Date: Wed, 26 Oct 2022 13:56:11 +0300
From: UMWARI JOVIAL <umwarijovial@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Outreachy Linux <outreachy@lists.linux.dev>
Subject: [PATCH] staging: most: dim2: hal: aligning function parameters
Message-ID: <20221026105611.GA37633@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

According to Linux Kernel Coding Style, lines should not end with a '('
Fix-issue reported by checkpatch.pl script.

Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
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
2.25.1

