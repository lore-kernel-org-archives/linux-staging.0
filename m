Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4BE2DFA4A
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626695; cv=none; b=HPurlp2VghJvx/v+stc4JCQ4zD5PNHX0BDiWe1o754nvHx/sPpOfuHgesg1Ee8UnZxi3eYfrIUFLaqxmi+RGBoWlUcNVsSO7kqBeLN1jHprOqf8E55F4iO+TYa4cCVqOoV+0BWvH/68bKWBHOdjjjJqCGkdxc+2Wkj8/68dtPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626695; c=relaxed/simple;
	bh=qSVrrR4i3TdM948a8ypRtsKQh5Krbj1svBlQAx79u44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVrleutOv/jTmSWWpYMWBkhJAmv2+ErOckq60Eq786MMWt+qcbrR+sd/uVbmoBv9JAFyPiX4eh6q2TTM+4zJYL4pH7kuMnvu+qyOFCwslU3ckIwc2LbxXGcvyNPdvIlcIe+3e+cTdgDepCaYHUYaZCPZ2vkA2QHHMoB4PZMPG14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpFKEys1; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpFKEys1"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad9238d8fso4467713d50.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 19:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773626693; x=1774231493; darn=lists.linux.dev;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zXFgOKkCF7gDjN8w1N4EAJW3ZGYmTU+Y3HkpxXghYTA=;
        b=dpFKEys1sAZBFda3REp/SGvEym1Ic2pReGkcUaFVZzT4pfAZP1QYu/hLT7moKJYGrQ
         O5ggtRiBJ+npgFrymsGORBpMzr/qNjNag80gquHBFyqvmk8OqfNRDZWkNslaI37Q4JQ+
         /8IXcR+EiGsn0CL9apRtUZhQiFLRz2fyx3mRQJRpEK9CP9eBIfzxIckDuRDDNYPGKu8e
         W4f4DwWW5SjVX0U0ELEUfCuKP3H9XMxROog/E+UICfBTz2f7Zy5jqsA9B5P68BQkAv7z
         EuQrAtRxCPXO4yxUuLAl5elx/YhlPfWx0f3jpZwGRKgrE+xQ5T5fB+rd3NTAo3hQ4iKB
         Y+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773626693; x=1774231493;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXFgOKkCF7gDjN8w1N4EAJW3ZGYmTU+Y3HkpxXghYTA=;
        b=J/JNKlANTDsV0F+xURxuuQoFYmPb1sIV4mmyOV81rK3TejpFgzCC4qMmMbq0mVPGhw
         52dnc7EXlXCR3mnvVVSfgyLKyvLFCGMrZzNk+TCOg2JOeUE8ob0aaYnFnSbh76sDFL64
         hQ0SF+c02LtLD3x3AhD/vskdpOL5xwkPniCZE5E2uVlbgB0BdyGEgk+3RhiCdsIaNkda
         5qqN+XpWmIbaH7aWBza0mIak+DJruROjIgfGSHVJfJ6YFPSdc/LE/s6WRjbREyq0HECa
         oNf/DPyPI8FlpOlv3anjb9wwP4f+92DFJ2+yXr6xpbfSvS7k2cKy3rg7esvVQn2k6ZGc
         h4xQ==
X-Gm-Message-State: AOJu0Yy1G0Uy95jESWvT31P8n4Ft+Bw6xhRgmO2YnmPMv0BBKNgIx8o9
	DOUmT3wQNw8noY5NZE8Jhzv22f2oJEYBgzxb+R6M6GDKUk7sGh+KADjT
X-Gm-Gg: ATEYQzzeflvMMwdQWvIfxI0W/3qO6RpcIR4lkcdbtgGTxS8NjdvthAa/25CuKpknvqL
	Kmgsi7hXmAQGYau46aikqpbCUL2Ar3QAr/JDq0wBpnVQ7qKQMXKXPuNvhAOWHj7cEwGYVbpl00g
	jxuMpPOkiZxKwLGXbmn/nwe+RyiHCfEooTFJEPPu0oTszMo15IqLbUKrFj0qheBt30Wn4wdEGJy
	x0xz1dpGO6wC16xqsTw8HMz6O/a1VbuQOr55XOTh1R8MTqaoxI6N5o1lp6XuBVV/d99zy9nWnXH
	Q8qMPhH0+lPqquskILyKMt+xJlC2tCO2PNY4dAH29tyf2BHdIoDsqB8VpUV7X7wvVJXCgT3bwMZ
	HXLTmDwk9siqBLBGsnu+gYGtz6RMjJoykATcSBVcycKRpCeDBRC5Ww+mP7QzyxacG5BuNbtKlQw
	b/2FR9VWm5z2tu6lY4Xnr180rmTInshCElGt6bXLlq49YKckX0I052OUULstnEl3Domo2QD5zyL
	A==
X-Received: by 2002:a05:690c:ed3:b0:78f:a616:7b99 with SMTP id 00721157ae682-79a1c20200dmr118118937b3.49.1773626693196;
        Sun, 15 Mar 2026 19:04:53 -0700 (PDT)
Received: from ubuntuarm64 (108-94-35-11.lightspeed.austtx.sbcglobal.net. [108.94.35.11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee6f8csm80375257b3.27.2026.03.15.19.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:04:52 -0700 (PDT)
Date: Mon, 16 Mar 2026 02:04:51 +0000
From: Joshua Gu <joshuagu789@gmail.com>
To: ethantidmore06@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary spaces in
 rtw_security.c
Message-ID: <abdlQzChJylv8evY@ubuntuarm64>
Reply-To: DH3OX3CFT586.2HUDPSK7M65AS@gmail.com
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch.pl warnings about spaces after casts,
along with other double spaces.

Signed-off-by: Joshua Gu <joshuagu789@gmail.com>
---
Changes in v2:
  - Removed double spaces after assignment operator in rtw_security.c

 drivers/staging/rtl8723bs/core/rtw_security.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 54e89f192b18..b98bc1aa9cbe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -658,8 +658,8 @@ static void construct_mic_iv(u8 *mic_iv,
 		for (i = 8; i < 14; i++)
 			mic_iv[i] = pn_vector[13 - i];          /* mic_iv[8:13] = PN[5:0] */
 		#endif
-		mic_iv[14] = (unsigned char) (payload_length / 256);
-		mic_iv[15] = (unsigned char) (payload_length % 256);
+		mic_iv[14] = (unsigned char)(payload_length / 256);
+		mic_iv[15] = (unsigned char)(payload_length % 256);
 }
 
 /************************************************/
@@ -781,8 +781,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	for (i = 8; i < 14; i++)
 		ctr_preload[i] =    pn_vector[13 - i];          /* ctr_preload[8:13] = PN[5:0] */
 #endif
-	ctr_preload[14] =  (unsigned char) (c / 256); /* Ctr */
-	ctr_preload[15] =  (unsigned char) (c % 256);
+	ctr_preload[14] = (unsigned char)(c / 256); /* Ctr */
+	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
 static signed int aes_cipher(u8 *key, uint	hdrlen,
-- 
2.43.0


Sorry, I think my previous reply had the patch as an attachment instead of inline. v2 removes additional double spaces.

