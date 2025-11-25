Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D13164CE
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069675; cv=none; b=eDmLZVo+xHj+NWYPPPaeVGxHix6tXURVEU8bN3TY6zfOiNrXi0jCE6mFHQPL8yt+0ErjFI9cF4Z0NY61Rtv9Rf4g9ojBQoFtqe82aF2pixl6FfKMBpBZahWyawfBA3sCwVJqpfchl6RL9B30+YFShnhsUBS3hpsg8EijFXjvYXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069675; c=relaxed/simple;
	bh=ovkN/QtqiTh6IBjF4Ai13OqOr346zlINWglhpIlW60o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spPAilGZeRrepnnTklityHGuJx7HbBC/MEbpi/WAT7txI1Km7Ix24xD5b94bw7jOSwd4Q6lNfF0ifWqyh09+4w0wrDUZEkzKgFssqNat1vW7Ps9liSItROanWMLSrzqLM0xqpWB8qaisNkb2Wieqybm1I+LTQay5gz9ikBI3+Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op5VvNC/; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op5VvNC/"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34101107cc8so4929048a91.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 03:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069673; x=1764674473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC66Ck7qicXDGH3O+D4ASvf7yKcAVNQleViJcYPhp7E=;
        b=Op5VvNC/VVXLdGrO1JS2EJop60MkFW5zIs0DYbXFqdVLYEtad0DPFq2LIaEip2sjXE
         yVT35Dn8wKAu23Fltft/PAp3vadZkeS2H9Se+O6NYGzWLMiWVPsFrwsdaqmhpxzMQ+El
         TNepXcWwSB1Q9wcl/6OP1nnL5KiJzeBRXBSEjEZUAYb4km5gFeoDekEBiq52BytcVwWN
         HQHscsfiuECv8qU5Gkwh+OILly9xGFKrLkqqBBDM8UVRYJ7ZC3pMy2c69dTEgRl0/O28
         B1DMAdplsf5SmBT7uY8W6PX+m1r8BaQe/qdZAE9G1i9f/AxarfWv8GoTv1W3d+b4XRby
         cBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069673; x=1764674473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eC66Ck7qicXDGH3O+D4ASvf7yKcAVNQleViJcYPhp7E=;
        b=VDW3d6SqnqYMyjmmpF7OU4phpMQ/9MqoDGJxOvPtJ1ryejbQ00szTtZrkyzs9Nu96y
         OXrY8YMjNtsbefDd76evCsaif252wPAduWces0FtgxIJUizKxr+G+UWNuXyZZ4ecZoWt
         0gozrYNuXw5qrEFFLSHUp74OHYbOBe46AyBMYXCQETG3qHUggUrg7iyVTbAYtgb7Crl2
         jcaOTRVzy2BkwjiDD+9t2GoU/ie5KM93MIphvFa15jOtSb91dPljB7Ht4zLZ5NjR5rfb
         roG8LdUOBGSXS/OsJD9GmSkcSqiNzIs4XBs3TWSatN/jQnPd9Sh083vyDHPtOT1TdQZ3
         DFmA==
X-Gm-Message-State: AOJu0YzjrEJ4CJL8d8a4PKxbPKmJ/jNsB9mSF+MEdODH3wWNg4N8rI8s
	s7Ro8W/JZHziYGrI7tz9iqtfWPK7x1q2+MQVJCOLokpM7CVXkaOoNATJ
X-Gm-Gg: ASbGncsY1bzcWvyWcDG/6NN/RCK5VhFVtfqtdi1lkLTk5gzO2BKAnYT4zFE6WfCOygR
	pH3M3j7VJyudLjKgajZfxUoNZUVAQC7tv1OqgwQLob0Gk21a2kLRfvc55azVETMtHl31c/r1Yj1
	+EuAlQQln2SQTJZ6XqQ34vzDt3DFP6xRFb+KiPZo2NyJcM67NzeTkKEwxtPROylY3abhhaMeHIe
	OQWrR45u2oLRDmj+KaKYz6RDdCgycny1P5S0xcanutj7WvzNpJmkrlOjTeWpCl8av9211Wh76Jh
	XZm3lCou7SB7vkLjs/iWtId0eXWMWbcSzpgEis+0NcvGqgTFtFxvfoxJ5D9h2qFEKq9eMJnFWk+
	cVisqf/6Y1hPGj/MeVQEQOYFHNHCPbaInrcsPkfCY6VS8LqkujjeoM38DXsUhUG1d6EBoSLaFYr
	DUs1z7gVPX/RT72msIS5ZcIv5iKqfHFadsBYYEUvMM1Jh5TPKLcSb4v8hUowcc3ah6Y1Xkb55cR
	6cu+V3EyqzOAnezNlJY4Ws6hA0I4kWFMVM8ESjS6jHXJzbMfQyy/Suhxt4TEaMzNe1nHK8GZKos
	1WWJSOrJ+JLDWIzjGJNtOWOE3Lj9Tj7jaA==
X-Google-Smtp-Source: AGHT+IEIbYqDNK2u9wkDTzUkrjISce7uRIaTbwYioXyCxP5QC2SyCRcZstR7F+Ns6yReS0XL9hz0IQ==
X-Received: by 2002:a17:90b:4f84:b0:32b:c9c0:2a11 with SMTP id 98e67ed59e1d1-3475ebd2f0fmr2526178a91.4.1764069673199;
        Tue, 25 Nov 2025 03:21:13 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727bcaf13sm16296250a91.1.2025.11.25.03.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:21:12 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	david.laight@runbox.com,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 1/5] staging: rtl8723bs: remove unused registry and BSSID offset macros
Date: Tue, 25 Nov 2025 11:20:55 +0000
Message-ID: <20251125112059.16913-2-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125112059.16913-1-knavaneeth786@gmail.com>
References: <20251125112059.16913-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RGTRY_OFT, RGTRY_SZ, BSSID_OFT, and BSSID_SZ macros are defined but
never used anywhere in the driver. Remove these dead macro definitions
to clean up the code.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index dd9018aa4ee5..f86180dc350c 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -171,13 +171,6 @@ struct registry_priv {
 	u8 hiq_filter;
 };
 
-
-/* For registry parameters */
-#define RGTRY_OFT(field) ((u32)FIELD_OFFSET(struct registry_priv, field))
-#define RGTRY_SZ(field)   sizeof(((struct registry_priv *)0)->field)
-#define BSSID_OFT(field) ((u32)FIELD_OFFSET(struct wlan_bssid_ex, field))
-#define BSSID_SZ(field)   sizeof(((struct wlan_bssid_ex *) 0)->field)
-
 #include <drv_types_sdio.h>
 
 #define GET_PRIMARY_ADAPTER(padapter) (((struct adapter *)padapter)->dvobj->if1)
-- 
2.43.0

