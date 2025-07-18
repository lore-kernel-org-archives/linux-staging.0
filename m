Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2D1CA84
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752871708; cv=none; b=W7WL9Urcv/GYat2DbCPbFz0EoqLU7/UgPGsp0Z/91fkGNMp6KSXHn2f5WIWpcRMg2s8By5NTX0ZGiaNsKBd9ixNhSzYuIjmDZ9Ft7v4mqL7+cMg8cPDIAdCQQxwuyU6xKJKGFD7cwMU3wcO77W8BWclHJSjRXeuZnnrdBzc3ujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752871708; c=relaxed/simple;
	bh=E938gfSru+guvf0sXkbNi6ybcJ95VMcvY+J4V1M/20Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohfTkhp80fVJF1A5hzIhbmneZ2ITMaII+a2WlCgRUEAz6hYI79EC1B5JofJljwECzXvJyuDMg15mBMH17Rf7G44urxrbUHsaYd8gx9J1pj1y3hxac5vS1foYdzkIC46WSa6FWTrvuEAhEvMKkfFdkrCzL/SW4f+zQWq6R4bnysI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFkBbQuK; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFkBbQuK"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6159430bdb2so653804eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 13:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752871706; x=1753476506; darn=lists.linux.dev;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9oIVrVDDd270NCSeXL22MIJ9Y/QmfkZjZzqk8mfVCgM=;
        b=fFkBbQuKEZK93D5g2ba/JCr2QzXzSHZBXkSR2RHjHdvvmx1wUHQJeCGR4WUytezYPt
         ZS4eg7QS4svsYu3VYsS3wjcBO4eyZ6H0PlAJW3qADHeEIOiKwfP1KYM5SIgcZOG4K1mE
         227IZpwYwqHmh1MVJswkAgwMcEjwVGfKqTFFixNkwnEESTJKpb98H2cJUzPDY6Py2OQa
         Wbr3n7dKV5sfnkZ+84CBip4rXCTLaiSwPTWjaS8SpbOWc3mhdw9UBfIz4FdvuCBQEWSl
         sSSHa1kFDu/h/q9RLan1gEGPSssFQamJ52uKmc6vjQcj0qokF1VH8bdGmgdbgfbKCkbi
         KB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752871706; x=1753476506;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oIVrVDDd270NCSeXL22MIJ9Y/QmfkZjZzqk8mfVCgM=;
        b=o+TM/tkP87+0vpUOVP5+Fbpia7XA1qb4npWeIZ14NiyzCOhFskaIYHHvkmWVJLKvIB
         dx8/KL2ZtlmmryVXsfFEpxgtpcI/E6Z0lGiwq7hUwJRDqRUk3qwJMp7X7aB385EvX0Di
         15kwEzl31XPGCytKLgWOa0Wzk4KD8MIQhnBK92ylGo5NoKHhTr0k/IJ9/yFXKHV3Yqwg
         XByI1GvwscspE4qLNM1AN33AztO7nkvLIlPEObjj4F1kU/x0SgrChpCvK6UJ3J9+XaFy
         uXxqJqNr1jwg5xC6tV0D6pthzYxuF0UT/WVViN1xzPH5XgVSKaSlZoNBSDI10yoFBfBN
         X61g==
X-Gm-Message-State: AOJu0Yz7gFEOKPmG3CnMVgRY4DAGzK8ZwckB7tCPvCV/wd3jWyuPaUJW
	Nrf6yxh5EXvBv+t2hSUB6zn+6gDr7qY94rNLIneQi6Hhs7TohG64FZ9r
X-Gm-Gg: ASbGnctoB4Oc/IfTIRxQJHLJS7jEU2NKPJgRrS4GfjQ9KC6Y82hBYBq0JiCLvdK14fl
	JdlN/YKppkLIczsO1J7uY8isXtB47kD0IBhaHkr+ClZP/ZoiXH3k4f4u4K95xf8qo86fA3OOC07
	S77vo4/QeTtyZF/uwOqR50BGC71DLsmUHpHbHd1V6+IMyN1GZm8S+AgX2ce4sn5i25n0yec88kx
	wSP3MbS6OdDw9KHC2h0VloOJ2FvRK2IoBPgdoXdSS6V6WD0EClC4vp+AUK/Z0KP0B86+Vrrfqo4
	8klylb6wen6EbF8oheD5wR7KqV4bEoo+rkBaOFGnaadDjvfPbXVCjwdzhmSPFPf7w5Kl3i6r5gX
	UpVS9Euy+FZ5SdijEPYl7SlXSx+XG1Apz7JRq1q+LMSU27WP0TTIz8XH1N6aIqQ==
X-Google-Smtp-Source: AGHT+IGdmIPKvJ3cwCYg1hwJE7y2soAfHO512/2kvqH54mi4z8iHRVaBPxk26jyH7Nwi/zKBe6S2zw==
X-Received: by 2002:a05:6820:2010:b0:615:ae24:916c with SMTP id 006d021491bc7-615bbc0563dmr2656824eaf.4.1752871705970;
        Fri, 18 Jul 2025 13:48:25 -0700 (PDT)
Received: from MacBook-Pro-de-Ignacio.local ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c2dbsm528180eaf.20.2025.07.18.13.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 13:48:25 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:48:22 -0400
From: Ignacio =?utf-8?B?UGXDsWE=?= <ignacio.pena87@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3] staging: sm750fb: make fixId array static const char *
 const
Message-ID: <aHqzFn6CfgWLNa0A@MacBook-Pro-de-Ignacio.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.x.x (Linux)

Fix checkpatch warning for the fixId array only:
"WARNING: static const char * array should probably be
 static const char * const"

The g_fbmode array cannot be made const as it is modified at runtime
in lynxfb_setup() and lynx_alloc().

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
v3: Apologies for the confusion. v2 accidentally included changes to 
    g_fbmode which breaks the build. This version ONLY changes fixId
    which is never modified.

v2: Only change fixId array. The g_fbmode array is modified at
    runtime (lines 786, 788, 949, 953) and cannot be const.

 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 039e6875c894..c237a8f8eb59 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -730,7 +730,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char * const fixId[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.39.5 (Apple Git-154)
