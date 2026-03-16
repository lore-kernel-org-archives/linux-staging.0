Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D64E26CE1E
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625584; cv=none; b=QH9VPc5SZHf5S8Ff2RmMFOSR1Wj6wbWnoHI/LdFkhsydE9B8zhG5PtNrwKGzoviNdpDtW3dBIDsUh1sI86dRBfJabRIbCiB3tMnwE1oVGomOI/E+zgW5lhanMtGH70EAGcI7x1tpzfKJF1ERVsCVLVbWylYAHvn/lD+KsqrtRd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625584; c=relaxed/simple;
	bh=gPIEdc+RkpAu2m+WSLCbIjgC7FYQo3J/OiZq+WvyKMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbqkHfSpr5fZCwWXRvgk9qfggtBtukFVIQpMVy3HVoQqZ4VV8ldCCvdZJXo2kzTzMULrs4rCvUWdBq57jipUuRgzpDaWzQWh1GETqZb8+BWnngbLC1RpVN9RLJsbHxQ/yJcpoYW5vuPXveTngWkbsxLEC4whHabAM9ImqZyjh3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1vktp9X; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1vktp9X"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64aedd812baso3884116d50.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 18:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773625582; x=1774230382; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUiSKq+ntfdHodT5YJvebzmAEQ9tLoagvw88lQ5KMfk=;
        b=P1vktp9XiI6emIWuhsLO+J5mAPSeYOeLlCaTnwqryipliQkAXHR82C59q82uNMRKKU
         ZmDob1tyGwMLbvPBNPzvwD5LVTNHU2EbdraxrWXn1YlP7iRIRyZ4GTGOn3W3CgKW9B9T
         i4UjrWYUOvjwm96EJ7kumTWx20bqf2fVriFUTVB6pBzSBczbptoEHxmJRDdCNsU1G5xS
         /bSqx8knS145/+C+XBlKvusnys48toWRkHpnAk7ez27z6JRuRwPAsROYNuUfnYT9GnrU
         xuSmm+vqQzbqvIewJ07jvfT8ps+JskCZnSB4NLAxGNY/+tylBroiPHoIB9CY4vGV+bDo
         mWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773625582; x=1774230382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUiSKq+ntfdHodT5YJvebzmAEQ9tLoagvw88lQ5KMfk=;
        b=ihPMAiZFoHwUsyPad0ohBLWpIcfeahOMbLiT5df8sR0DgFGpNG5o+MzTrlPJAgsClA
         1VnEbZGeZHmaQOO4XMFJGvO/Vyz8Xk0abrmN5gk57MLOmkzglh+iLyxJmaM+Gqtng56L
         1iLA3N+gdfahuzKd/ptgqG/+PinAwDjFCpAMfT+nYRGtTms/aAxKttKCF+7KrP3GFfpe
         u/VJQVJYQRhc4tO9aprrA7g5qxZL6jZa/3Q6S719MdSwKwC1I+Id9YKyw9UvA3+vWLfj
         CR/s62Egc8mGrogNDlMrMbsG3HMz8a4/NxpuHd806zZTasqwHEgNwT2tkDihiN3doTnh
         JXfg==
X-Gm-Message-State: AOJu0Yx/zn34QP5UDTcsKnTu5GrIkdgm3UO1DHDoFEkct3L8IXV1R6hy
	M50VG62rmMknk+KeyqJZ7UObzySZFpSKBRMbU3rOyEdXF4hovdibFppK
X-Gm-Gg: ATEYQzytoG/oooi9XX0l65YiRbdtaKB9t7iLvypBBkn4RKnTcrstNGCF5Drjz5JgcAk
	spqITXN/Ze5Nuq/i5Gw+uInImLnkzfVNI3bNJRqALcM6eC60xumsRord9+pNYVekTYmKxIFhNGz
	jL1nU4W1/BrM17AoKREpg72vrXpFcfayS9KJFfOGqGdJNh49OTMwxtyKuzcEKgJV3X3B3sHd6hT
	SGSSHme3QupNCMAMM7vIfZJBiY9ai4OReACbmDQtNb4DcrZEzi5ajqaHswDKlV1zX/yYMwiTtS1
	XnVhs8QMgK9ygF1z5AQrjXbwHg09tYOtgelwTxuFVTFob8HX+9SBqJ71wNVZu9P8dCnalxriB+z
	S0zt573JNfW/36LSSvSkCsLSZtcq3wWh4BRnqhVrHUDYQe2OEWWwsVOtKMQPDu493IPSB8ooEXv
	86Qyyfpwvf68bKBi1JkDhylf3nJf+dX8fcPhZy+3yTv9IKZSatW6OtuTcQ0kmYB4PNmJRQbmfV5
	w==
X-Received: by 2002:a05:690c:6e86:b0:794:d887:726e with SMTP id 00721157ae682-79a1c20c30fmr111247147b3.57.1773625582523;
        Sun, 15 Mar 2026 18:46:22 -0700 (PDT)
Received: from ubuntuarm64 (108-94-35-11.lightspeed.austtx.sbcglobal.net. [108.94.35.11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a1688ca84sm54494447b3.48.2026.03.15.18.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:46:21 -0700 (PDT)
Date: Mon, 16 Mar 2026 01:46:19 +0000
From: Joshua Gu <joshuagu789@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary spaces in
 rtw_security.c
Message-ID: <abdg69QDD_fwv3Sv@ubuntuarm64>
References: <abcVPgxQfTykOvlQ@ubuntuarm64>
 <DH3OX3CFT586.2HUDPSK7M65AS@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="87SR9eXBAr9NZO5o"
Content-Disposition: inline
In-Reply-To: <DH3OX3CFT586.2HUDPSK7M65AS@gmail.com>


--87SR9eXBAr9NZO5o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


--87SR9eXBAr9NZO5o
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: inline;
	filename="0001-staging-rtl8723bs-remove-unnecessary-spaces-in-rtw_s.patch"

From 319ab64bc60820beedaabcd951cc9eb8f8c9bad4 Mon Sep 17 00:00:00 2001
From: Joshua Gu <joshuagu789@gmail.com>
Date: Sun, 15 Mar 2026 20:10:48 +0000
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary spaces in
 rtw_security.c

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


--87SR9eXBAr9NZO5o--
