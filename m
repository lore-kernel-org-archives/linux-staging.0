Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144EB170A23
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947838; cv=none; b=PEQSxbAvMq4/sseH8L2u5q+kc9tPE46km+4MNmOhG6u/xmHM8HOQwlq+yulza4iXqmiQw5vVb5GKSKDNEqV39Bq8M+VyePVfniNkh/N8ns5sRC6OlC1o3YK+YslQO0iOTnFGeU+SbGx5L59L0fAMtL3IA1AAbPu17f0gCuu1/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947838; c=relaxed/simple;
	bh=GjD1+cqrYDDCv9oW4pmBoO7f61jaeoVA19IC4+k5neg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWK+WkUOXif2+aB6QGXLMREtrR+01gqWXc/w6fTS9I/brIsVheH/NuxFjCavc3rbFcDehs4zKoQW4B2VjrHtPJqU9AIFbRw7lV8aT7TlOLg3K3dUjgNBDf3pV9VTzfijtuEhpuvInwKg7raivS0DjJzvEgfSrf65mhwMiPu9uR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jixwfcr4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jixwfcr4"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d56155f51so33910066b.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947835; x=1726552635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tePldyBpNEa31DXvu0Aldal89bpR30+3gXC9Cqz0/Pg=;
        b=jixwfcr4FY1g4/7MjMWgGcbXRMbLlWID22iI04fvelSmBHba5naPqNSeTOCa/aJJEH
         U9FvkV2stilSNYiDK8REs4Ah+LIOeLJpE/edYmt05dcChhQ3VrZdRAbo/kq9nUGsUfak
         jng0yX993VUh8b/sBDXfFZeGLYoczTZoUf+KVFiqqcQySe5y8IahCVdeEAHVDVEWNzP6
         0+uZ4XJV3zdUP8kE8MTPZ52zpSPDmzRogtvpBEdhrqb5+Tcr/ikN4Vs04VJoVz0WqQDC
         9lMV5GzKHdpxGwI90bL3uePRs8T4Q43DK4jy0dV/MpI7GNzAngX5aO1qWL2TiJ5bbKbW
         RMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947835; x=1726552635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tePldyBpNEa31DXvu0Aldal89bpR30+3gXC9Cqz0/Pg=;
        b=g3zIY0Nma0sSmwM/RXWGqZhItI9nX9N1CpgGC7yAIa7ZFk3uf6AlK6ydyzU0TWnoEc
         ghNvYeEG6+CTuc7SwenDtIJzc8DrZ3UloqLV73oPxMcSB7GF3/ojOWuvp/FnNx+NkK0K
         LVa7i8X+d0UFe+lAMy03x+tZThB18pcFPDAQD2Z3bKejq0osrnYSfma30mVlQqvGwX4l
         4vYHzVkxqN8yBID1/gsFJXjxupexaeVGWkrGftpU3iESozu/jlzCRURKquoxPu05nnGw
         ZD4HU9D+9W4bvmWQmcndAoPaDaQCkF6JCd00zaG4i/pNosjRVMrsdrKz/XvxNNOIm1nr
         uGmw==
X-Forwarded-Encrypted: i=1; AJvYcCXFRq2oF87l3HS0uIObZc5rfaRRhsPGQs9ppfqSRNMbk2Azrzyy40ej9GB5gWWUa5OCKBQJCJohk4oZO8uW@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt5CMfrgcDKjNcPaP2p+e/KEUDI1Pq5GOnJ56ZqDANGkcGQ3av
	Qgt3sfn/c0x7y25sBR6iAIaoIzgNNwwJBeHHDHsBb9B6UJsbnheO
X-Google-Smtp-Source: AGHT+IHV4mjA4sC8rik5Mjnzo6idwKMvwTYeBLZTq5jHvy7NLw1Dt9UcveafTnEQ+1cqw1/YByl+Ug==
X-Received: by 2002:a17:907:9346:b0:a8a:809b:14ed with SMTP id a640c23a62f3a-a8a88856872mr967993366b.44.1725947835332;
        Mon, 09 Sep 2024 22:57:15 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d65742sm430765066b.216.2024.09.09.22.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:57:15 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:57:13 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] staging: rtl8723bs: Remove unused function
 dump_4_rf_regs
Message-ID: <b660342da763d1e03c44f2b3fdac0378b077e6b9.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused function dump_4_rf_regs.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 33d27680a276..0edd7b6e4f21 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -42,16 +42,3 @@ void bb_reg_dump(struct adapter *adapter)
 	for (i = 0x800; i < 0x1000 ; i += 4)
 		dump_4_regs(adapter, i);
 }
-
-static void dump_4_rf_regs(struct adapter *adapter, int path, int offset)
-{
-	u8 reg[4];
-	int i;
-
-	for (i = 0; i < 4; i++)
-		reg[i] = rtw_hal_read_rfreg(adapter, path, offset + i,
-					    0xffffffff);
-
-	netdev_dbg(adapter->pnetdev, "0x%02x 0x%08x 0x%08x 0x%08x 0x%08x\n",
-		   i, reg[0], reg[1], reg[2], reg[3]);
-}
-- 
2.46.0

