Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE10770
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:10:02 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b9so4868757wrt.8
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BWAw6/ltIWDh7kRKJmEogYzueRT49PB3eW+AcRp/xKk=;
        b=Mv9ipFmw1YBuNfEmWuEGYPTuA+N1r/CKGCbJ+LfsVTzJ9NIeBWJ/ExANrB/ucRFMN2
         NFGWbcGDqyf9i6ziuUwkXzpBz3ryqxho8b3ijQYkrgA+FwSnSsysmJ//2nVy+rH8/CG2
         r1LtIsQ2ko5TDqbTT5mNnpnOsVU2myXgZbFWASjqLZpiYp2y1WGccw1Npt62tSLbjI/o
         TVVXFxj1LhnlLLp2gplJGMxv17iwf6/g5jc/rLtWjohnpsArH47FF3eS1ScWLnhGpMfB
         c3GtD3y+GeXncM5LR5x+EIVkbIop6bANysymq/4lTZQBwHQGGGhiG5FNV+dFE7Ha32Pq
         jVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BWAw6/ltIWDh7kRKJmEogYzueRT49PB3eW+AcRp/xKk=;
        b=arVz/LOlcImXcM24baZxJbyfTH9QOuba17EM4mfLHEe1HSZ8fB8gmnnhIxFYwtF7kB
         8hEmdqrahvYUfB3FHEY/eBpaPyoo25DaKVfPpKT6/v2ADEFwLPYg1+ucQxu1EYPGgTx9
         uD48w7x3GS33SkAqqg9S4Ty4rKYYnMIL9dFCM1L8qX7Vggbz2Kmm6fNUTjKmoHgZjpS3
         OKSNGnUuyPBQlJux8z88PHobBWOJ2dHVyxtERNEVIx+UYhm2uTfzNeC18F0qMIXTsHRk
         c0DbV2dsghduLenXoqojDc26Hvjvy8d6FOJorrG+FtUIgB44zflTkkhmxkNtPFx8PEnc
         IpTA==
X-Gm-Message-State: AOAM533tJxYjcsd1A4aN7d624z3bAxt4uhbyXOUMfmM+2kYsQIAYxcw7
	OwxOr2VXzbK5Fxxca+O6btM=
X-Google-Smtp-Source: ABdhPJzxI5PTyiGDq7c5WyKOTQrxI9KeTkiu4NBBEtfqMOy+SiUAJ7riuklJTlxVTKZz77onAqLJ7Q==
X-Received: by 2002:adf:ea82:: with SMTP id s2mr13528121wrm.1.1616749801280;
        Fri, 26 Mar 2021 02:10:01 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id c2sm1714270wrt.47.2021.03.26.02.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:10:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 13/15] staging: rtl8723bs: add spaces around operator in include/rtw_pwrctrl.h
Date: Fri, 26 Mar 2021 10:09:20 +0100
Message-Id: <b32111b9ca57f21296c1a33dd7136951800ec401.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch warning:

add a space around that '*'

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 688436cf3610..88e66211e0e3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -89,7 +89,7 @@ struct reportpwrstate_parm {
 	unsigned short rsvd;
 };
 
-#define LPS_DELAY_TIME	(1*HZ) /*  1 sec */
+#define LPS_DELAY_TIME	(1 * HZ) /*  1 sec */
 
 #define EXE_PWR_NONE	0x01
 #define EXE_PWR_IPS		0x02
-- 
2.20.1

