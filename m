Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806346D18
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 08:45:30 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id g8so21419007lfv.12
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eG9N6vd8YdDNhKc5wiTz2FLA+NZ0laeofe06nyKfMT4=;
        b=P1ZUq+7rme2Dwp/A+Ir77qzfzAFu6XaEThogNqcuRwmo4v29fGtj2qeWUd77BSSncO
         6QMLaOcuw71L2VmIpzIG7JM9TcNQYHNZ6wdvR7KYWpOs4LEBsSyRDnr+4dqsUdc3FVpH
         9sSZsBUzRl0y3HVvpZFaWei/ubPo2d6Y4R8+CmeAYBXu8ZPY6Jdk4UbrbvgpAgIXByZ4
         exFDLwHaTsQhNT8fFcyE7ZZ5FFrmA+Z7Pdak+6BOX7PCAs0boKFFUGeQP7RUYvZLXCy8
         TCrqV/zaobEwEAbuGBRIjfGAYiwuWhafb8zu10mr+kDiT8hPxejTy+BlhETQvCXDyW3R
         pszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eG9N6vd8YdDNhKc5wiTz2FLA+NZ0laeofe06nyKfMT4=;
        b=VESUMVKVP9QoHcCzmvBwQEz3/Dfpp83RCmtfr8VYqGuYpoUWqSU+yJAQ3R+BgdHwaj
         nRVH2c5u4eqISBhE0JJx4w2ue9uLzM+sl57w39m2gWaVv4BYfhVQ4mcHbJ35KLQNhVLc
         Q+PuDNQ5i4MSvsTvOTRCTQJQ/TJOmCH4ugIJsO+Iv+oEc8m8btTJYdpv3LbaFXO09FX4
         LnBWZN0lxWvYTPjXmdenDyFeWH62eGpiiOdmTPXzseG8Q5SVSGU/YwoHSapYhgUxQDSm
         Q7JnX1InIKJBgSF7y7M24Wv2m0HlVTZOzhpJwJv5EdkFeWKa2nrfpEg7KSMc9QWojxMs
         nYGg==
X-Gm-Message-State: AOAM532BshvwWw2hCLSchp7Z+M3VYzsXsYCODGlpa26uTOrMaoQoArsy
	dXjww4YiBjHziVGbEsg1dsk=
X-Google-Smtp-Source: ABdhPJz7zUiBmLNg1xgUhC/FHiwLXiSQ0OE/giPOx6cvPbNqWnCDWFJzgSae+oG//39CIvwiOKyIeQ==
X-Received: by 2002:a19:ae07:: with SMTP id f7mr20754373lfc.551.1617698728861;
        Tue, 06 Apr 2021 01:45:28 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id p25sm2081605ljn.61.2021.04.06.01.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 01:45:28 -0700 (PDT)
Date: Tue, 6 Apr 2021 14:45:27 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 4/4] staging: rtl8712: Remove spaces after a cast
Message-ID: <f8932bfa35eb7480b69a9c8296bb10fac5a28540.1617697237.git.zhansayabagdaulet@gmail.com>
References: <cover.1617697237.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617697237.git.zhansayabagdaulet@gmail.com>

Remove extra spaces after a cast to conform with Linux kernel coding
style. 
Reported by checkpatch.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_security.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_security.c b/drivers/staging/rtl8712/rtl871x_security.c
index 5000c87752d3..b0cc3c922842 100644
--- a/drivers/staging/rtl8712/rtl871x_security.c
+++ b/drivers/staging/rtl8712/rtl871x_security.c
@@ -259,7 +259,7 @@ static void secmicputuint32(u8 *p, u32 val)
 	long i;
 
 	for (i = 0; i < 4; i++) {
-		*p++ = (u8) (val & 0xff);
+		*p++ = (u8)(val & 0xff);
 		val >>= 8;
 	}
 }
@@ -907,8 +907,8 @@ static void construct_mic_iv(u8 *mic_iv, sint qc_exists, sint a4_exists,
 		mic_iv[i] = mpdu[i + 8];
 	for (i = 8; i < 14; i++)
 		mic_iv[i] = pn_vector[13 - i]; /* mic_iv[8:13] = PN[5:0] */
-	mic_iv[14] = (unsigned char) (payload_length / 256);
-	mic_iv[15] = (unsigned char) (payload_length % 256);
+	mic_iv[14] = (unsigned char)(payload_length / 256);
+	mic_iv[15] = (unsigned char)(payload_length % 256);
 }
 
 /************************************************/
@@ -995,8 +995,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 		ctr_preload[i] = mpdu[i + 8];
 	for (i = 8; i < 14; i++)
 		ctr_preload[i] = pn_vector[13 - i];
-	ctr_preload[14] = (unsigned char) (c / 256); /* Ctr */
-	ctr_preload[15] = (unsigned char) (c % 256);
+	ctr_preload[14] = (unsigned char)(c / 256); /* Ctr */
+	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
 /************************************/
-- 
2.25.1

