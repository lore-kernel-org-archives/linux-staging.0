Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882C4A24;
	Tue, 18 Oct 2022 12:01:57 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id i21so14768651ljh.12;
        Tue, 18 Oct 2022 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvxU4ugiDB9i9W3RROc9iPCBryTiL0PvkD1UBcy4cHI=;
        b=iPn87NIhldfLkfiaF6SVQJAWDZTTh1bIweq0mv6fPPctMfPkKYDf4aX/g3NRSj3y5p
         MjCHUkeZun1xUI1L87J+qSiuiKR21im4D850OkgMboXJBHVB9Zr4qwYqGngKK9CkRe+W
         jicTpMgaIOjXxNngXj3B4aBfNit05i65sCt6E0BWrMmybzgDZAfaCWKTDESlKWxYt+QA
         VuVKd1qaqhYz/ey75LSVp60emL/kivRkxumMR/lqWKrB+5anzxwEyIPC0KpNwwCRF/cQ
         XKRIiCM8+cJx9DbEBCGOZQcQUgkOF2pP7M+iWrNQdDEtlIsi1QLzYrJKcrp9p/EnKApJ
         uZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvxU4ugiDB9i9W3RROc9iPCBryTiL0PvkD1UBcy4cHI=;
        b=eWuq10Cd+H9mciiNgOhngvm4G/ZamJJpBjRt5ffknQ57c512h8SxLu/LwxvuhxdpeY
         JlEb/JTqzscrOiDxVfUlLTwUGL+aZLfwF3E/HuDzN8hGQUlAsW11Srw4nKGXSvaOI+2q
         Hl4K/ZYhhr+D093F0/bwOwMSLimn2641L4Lv3W0m1wMd6ZWjanNSNW/IgEOwea16rceb
         Y1Az4kVJvaJpH4xsWWL9jvCX/jyv+Vl+kJNSv7Yrz1eF4e/xh/cl+pE6uLWYc0BC/2rA
         O8oCzh6U3+jvD7MA6pYTjCiwGzQJq35P3NTbHBMZSXR5KXz9pQFjDXhyJBStxtckFRlc
         Sz2g==
X-Gm-Message-State: ACrzQf0deA9wM+/skIAy2KCi8TSXoGGdfiKAbuqT0mMhM5jMckmXsCnX
	poz0ZnRRy0+wHiNa1cbHuc5fePKUHF9u4Dz3
X-Google-Smtp-Source: AMsMyM5kdffvyHlBhzC6ymjj4wVkAhTHiczvVJ8cIYJVaGiRP5i36+37riToyxj9Hs5wpq9rv+b3TA==
X-Received: by 2002:a2e:a7ce:0:b0:26f:dd59:7762 with SMTP id x14-20020a2ea7ce000000b0026fdd597762mr960516ljp.476.1666094515168;
        Tue, 18 Oct 2022 05:01:55 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id j14-20020a2e6e0e000000b0026dee5476d5sm1929851ljc.113.2022.10.18.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 05:01:54 -0700 (PDT)
Date: Tue, 18 Oct 2022 12:01:54 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rts5208: split long line of code
Message-ID: <Y06Vsr7JVvpPem5T@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
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

v2: Reorganized the line of code by splitting it where it does not break
the parenthesis as recommended by Julia Lawall

 drivers/staging/rts5208/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index 4643127a87ca..74c4f476b3a4 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -4505,7 +4505,8 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 				if (CHK_SD(sd_card)) {
 					retval = reset_sd(chip);
 					if (retval != STATUS_SUCCESS) {
-						sd_card->sd_lock_status &= ~(SD_UNLOCK_POW_ON | SD_SDR_RST);
+						sd_card->sd_lock_status &=
+							~(SD_UNLOCK_POW_ON | SD_SDR_RST);
 						goto sd_execute_write_cmd_failed;
 					}
 				}
-- 
2.34.1

