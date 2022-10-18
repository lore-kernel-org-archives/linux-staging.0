Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4B1857;
	Tue, 18 Oct 2022 10:55:04 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id c22so16063269lja.6;
        Tue, 18 Oct 2022 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcrTC51miLJfxjyuOmcj7nFOefmSQq5Qp2IKennwdVc=;
        b=hud7zyP1/Xt6WIxZpgWGLH8B2vzPBYq9IsvYwFETmD5ReM91rGx5nlWmdto+bPN42A
         hcHRIMWI2qAKLBduQvQnRK285PQ2sqJiivs5/Ol/1ybNno/N455/aCG6W5v7T1pFrhdT
         u838tXCy4D2wWxgbcxDQ5XcYO+MhdKYUXsl4wdx8Ha+tqcrYcoJVUNG9+EwbuuHquQvd
         w3uBrX+fdw1pf8g1Cgsqf/hpXiqyQs3STBvIyojLIfVDFFH2hzJ2GC1JCuG9YX+HmWGl
         /4DlqJqjVyBd7LC2pB4OpeUXoOEJi6k+whbT/EAOrq5/LszoDBS6n9uAJiQmAUCqrSw6
         jn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcrTC51miLJfxjyuOmcj7nFOefmSQq5Qp2IKennwdVc=;
        b=jN4VpVpnQhKEzDG1cg7CnVTP93lfB/5+jjCeJMf59Lc14RNCuh0yw9o4y0xjOZizvQ
         qoVgXnfnMbfkN3tABOct9kqqL2CV08E/IpDwQeeoTDlSStsG/FHOpRAYywFZcKl9XxLX
         L2YmymBky9GKpccGgjCSrJe8xkXbD4VkuroSCKqOxbykLhJAOC18XesycM9N+eHv9Oxw
         bmZrLgWfGSc02PwL6tcMYALVIkJFs6o5FbDEdjtTMmw3vLdRSw3DYW2RsWC8Qk6fHDLd
         62Rh8ExbaEkzYCGEc7/Vg8HyeLDJDt/ubiJVyNqq16Pg0O38VCG1YeRP56rIc1xjOPKK
         iOag==
X-Gm-Message-State: ACrzQf0rdxzeJEX3t9Nr5+8W9Ja9ysGUY+f1ckfotTyVr6GAEtXLXvqr
	kK++gS/voZ8bX42VCrlgFAFm23xY3dmpu8kZ
X-Google-Smtp-Source: AMsMyM7SbCSao4X651caaK6HVsg/TPp8v2MEtAULswXBUUBWoobtZE87tsE6m98bWIID4X2BzhrNhQ==
X-Received: by 2002:a05:651c:1107:b0:26f:dfab:92d5 with SMTP id e7-20020a05651c110700b0026fdfab92d5mr799304ljo.461.1666090502086;
        Tue, 18 Oct 2022 03:55:02 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id d20-20020a194f14000000b00498ee99a749sm1794270lfb.304.2022.10.18.03.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 03:55:01 -0700 (PDT)
Date: Tue, 18 Oct 2022 10:55:01 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: rts5208: split long line of code
Message-ID: <Y06GBWZe+zF+ddD3@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch warning by splitting up a long line of code, improving
code readability

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/rts5208/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index 4643127a87ca..6503db5bb874 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -4505,7 +4505,8 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 				if (CHK_SD(sd_card)) {
 					retval = reset_sd(chip);
 					if (retval != STATUS_SUCCESS) {
-						sd_card->sd_lock_status &= ~(SD_UNLOCK_POW_ON | SD_SDR_RST);
+						sd_card->sd_lock_status &= ~(SD_UNLOCK_POW_ON |
+								SD_SDR_RST);
 						goto sd_execute_write_cmd_failed;
 					}
 				}
-- 
2.34.1

