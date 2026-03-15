Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662E18DB26
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773606210; cv=none; b=ovpWJ6mGvkMu/AjcQHFqWkqbu/AKvSZccRrR7XeZ7/9GkaR8LoJ54ieFU6V60LLyaYLdMhTd+IahVJZkR+G1l7F1tUyHR/7EP/aOcqn2ApC+53fKbrW7NcjlS3YreWukoJovT+97gqzC58ykEfXcvzMxOU8nliNgLvXvJkCjZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773606210; c=relaxed/simple;
	bh=Gb+jmXUsSw5mPCjNKBBTGDA8G3RMISkYNyAxqxOojxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+0QtUI9bs2/dDybKZLv22lQs4E5WScNuEHregpeZpERMgzPw/b1capLp17Ud9qC5+GZ37UgrmeYvXrSKsfdbXYZtNb7cZv/ztKqjiovCwx7ddNUwyhtF9jyzKRHgm3PjnPKu05yc8jGOt4fRygB2gfT5JVBXkLRUtglczqj0fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5SkA85N; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5SkA85N"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fc4425b6bso36857477b3.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 13:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773606209; x=1774211009; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z77syvZTUlR1zuVD4q8AS5/oSXGOtR5ng2afhjmbllc=;
        b=f5SkA85NHf8vr2te+sOrO/ipxBjAuGDUjeRZYE4/t6rhTpNeZrG6yqxKOVH1gAZvB4
         0jVmD18mLl0UXe27SqvrbAtA0Hs9ccohWHirfsT8DzduBjC2M7Wj90kpP2KAW4rDLFw0
         UB670ZRvSREJ7jNv/Gw39t835tRZ+w0YFLGiUV7MtzvFIncXP8+XSg8M7aUvSLoEJTos
         6ddj3862dbepMj70B6pl8gbQmdaYpZQfO9C6JkAL633h4d66F05ONI8O5MYogwavE9XF
         wdKa7nPT1Ojgjsqj2ATI2O6MmlmXu5K91ZLqeRSzYj8o6+obRwDAOF2/FradjHcb5PaT
         1sPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773606209; x=1774211009;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z77syvZTUlR1zuVD4q8AS5/oSXGOtR5ng2afhjmbllc=;
        b=fsQQ3IQ1ZYOYLKDvCfYu919KgJJcc9c5md7AavJpl6drDTGQRiMnprHnJNuOc4Qqbd
         sfRfU3ReSkMX5Opuxm4t9oyjtSL+73eb3z6tn/M3+zGAXsJyOUk5/ZVjHhe4u6LSVMQC
         XL/FzZ8MpRDBrHsq+LFLwYAdYIwMWccfNJ9z9BOszOi5ykgHGRxcR+YBIVr+L5bEfXIF
         bStizyAcVNoZsk0PGsum/W0f72ko1ITu2wRUa9wx57Nfqs0QO121+Jl6p5AoCPW6l9Aa
         LzqyhIyTUSVR7mr85+SYELFRJyx2svdJgF0f8AviUF6SP9xfkPXcQSgsMSLYbNgOXuh7
         Mxjg==
X-Gm-Message-State: AOJu0Yy5QlxsJYKYzjWqzNKhUMXP8z0l4NM2HenXGrpRVhdOz0ADYjNJ
	BmxUMetwbJdcjPf/+VBSKvSuXVwj9lq7gofw6kWEJ7lLj/wK2L/TnhIKoLlNyw==
X-Gm-Gg: ATEYQzw2ClVDSEDqj0MbwQ4rIqRSfWOcq2wD6HbOU7mU5pCDhOiXsAlMcDu7/lEc1/o
	aUjV7LQS9dyaaQmV8uLT3Ub5tUvUhdxxHFP+5mfme+QpzXwC+yuRGyzUUuDBemAkquP+SPxyWvn
	d3QHMKaJ0gy6qN653VJbbf+BkwdIRL3vYlOc6eg3FGFcIVqBj7AVElGvxZwtR27Vi7VMzfC3G0d
	tZC+0naqyaEFxtG+pMRqwcjnllKLILMlT+Xu52F7pMIWe4/UTHvdnQ23UtSK0t8dDa6ClHwMT6I
	yMI6gzHNgKL3jBI1aW04y/dZiV+JgV2L2U4bjxioxlyRx5rbWosqC3GftT6cg8JYsACkReUQLAA
	dCdhkIyDYCUyety1P1+d73t/maCbH50il2xzp9xT01pGgZ6154vyHoKiTMFtLaalLsMEXwtAFHg
	+kHn5QJXm+uo1IOgELSCPUccGgTILQ/JIymCbHhX0eqN1xPKI00AGCCnc8I9nWrjhNFbpzkbzFQ
	g==
X-Received: by 2002:a05:690c:6e81:b0:79a:3a33:93a with SMTP id 00721157ae682-79a3a336086mr45392657b3.37.1773606208655;
        Sun, 15 Mar 2026 13:23:28 -0700 (PDT)
Received: from ubuntuarm64 (108-94-35-11.lightspeed.austtx.sbcglobal.net. [108.94.35.11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a2de73263sm29552297b3.43.2026.03.15.13.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:23:28 -0700 (PDT)
Date: Sun, 15 Mar 2026 20:23:26 +0000
From: Joshua Gu <joshuagu789@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unnecessary spaces in
 rtw_security.c
Message-ID: <abcVPgxQfTykOvlQ@ubuntuarm64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch.pl warnings about spaces after casts

Signed-off-by: Joshua Gu <joshuagu789@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 54e89f192b18..9c580729a9eb 100644
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
+	ctr_preload[14] =  (unsigned char)(c / 256); /* Ctr */
+	ctr_preload[15] =  (unsigned char)(c % 256);
 }
 
 static signed int aes_cipher(u8 *key, uint	hdrlen,
-- 
2.43.0

