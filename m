Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51968469
	for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 00:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724371759; cv=none; b=H+IINEEkrEVyljmdUFXqMkFWMFP83sAiL4CSCkoiu0oN2UYkeHzx41d+tTWqp9u0dlr3Eu0/8+TP4H6qkUikVygPPjkQ/AWRiWf6xdY8Thx3sxNyxYK3ua5u3ybtZ08L3l3CHE+7p8NwfxKu3Lye9TRrTAYi62wITk3qJcK+2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724371759; c=relaxed/simple;
	bh=m+c/5MW45/tyWu35EmD+BgkxwEXyCv8Vzt7r3uTYj60=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sX+g0bgDMm/Zl4aBHCbU/WKXtqNdAJEnQ8hIlDxGBZIdgMt4jX04QFXGO5S9BYz444lmeTCp9iWsKTLJ5JGlOYbfyj1D2BZCI+11jJ/+Nn02bPXvqIhfrKvaWaqiJbQ5seVDMK3DKuRAiTLCPzSHXlMg2n4qyjkZ+3DDepICXNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nf2Pptlb; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nf2Pptlb"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2020b730049so12190475ad.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 17:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724371758; x=1724976558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhCLT7fR2S11sGpguefXbB0hpgKF8eSfcW6dqtZgfug=;
        b=Nf2PptlbG9L8Vr7mpovX8hwsFX108wF1ttPeIi8c8e7VEBk814Zg3sq7e+/VOgpzwu
         XFUZ/mKFj1QtP4Dm0xaf76EulRiDvBUsBMuCL5rT429tY3mWxPA3ZsDJDSGtgsP8fCDD
         lZVDLzcbM0CDwLjXGvr4n5a+O4DlGtOul8zfijzROItir1g8u/FnK+Lb9zpwapgBnpYY
         ZM0L53mxlJ+D8Lvx7abnoF6zkBPbUGlDrcO6wGpM53C+pIPHjM1pL0Ej6/NuL5Z1WLk1
         kJbojU6DLs5fIkMQKpGf7S9Ms66WBYb7bx52mmM9te9Gxe8T5zLtWajnvTk/IjbuD9OP
         ue4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724371758; x=1724976558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhCLT7fR2S11sGpguefXbB0hpgKF8eSfcW6dqtZgfug=;
        b=NeaZmIsKJ8C3Lt3YGlkM6k7G+B2iSASRzIWhcvDjC+0hJXtq6HEV54Q2vEGX3FiAf6
         k3WTgSzB/kQLIClle6VfayOThjR4t5+7CUsobcpDrEm4yT5Uwijm8mYzeDsfpJtIC4Bg
         4N8Q2XYVmHVN8nPm0ZtIvGK1Dosq148uI1MwbP2ZCimR7O72kIIR92y8SRjszfVXSQgY
         CJwZRsTuFaNSKlJAApUMMDnP7voJhzIJkTqtAdyhzx1XYRpnYY9Eo9oRFTYfn4jKVPIE
         3TEknkmVFS67Jr3vgKaV45BPukZn5iP7N/xqICHX6TOhmcvRRU1v9oau1Y0nUEWqouzc
         lc6g==
X-Forwarded-Encrypted: i=1; AJvYcCX+TDocGA1wnmHohRfixocUvmjWaOkG3eURIaRtSKGNmL1soFMFJ6Ed86KTKDEyh7vT95meXrZI0/b4NrY+@lists.linux.dev
X-Gm-Message-State: AOJu0YxBBd2o6AUrP7Av77iKzBX7PzdxIOVmFMZ2fP4AEwp0EZ8K0NIH
	lu6zQpdPVW1rcqGIHn1Qp5EYs9gaF8WmJc00UczYZv/wiGFAOP9mKXkqlEYU
X-Google-Smtp-Source: AGHT+IFVKP0+IFKpmm+pPMDqZRto/w6+b1WOU/Y0tqn8LIBH+hSIT45cGMirmc6aapcaVFhJ1lEtZQ==
X-Received: by 2002:a17:902:e745:b0:201:f568:b8fd with SMTP id d9443c01a7336-2039e50c509mr5104785ad.42.1724371757550;
        Thu, 22 Aug 2024 17:09:17 -0700 (PDT)
Received: from localhost.localdomain (dhcp11819.ime.unicamp.br. [143.106.118.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385608eb5sm17929185ad.188.2024.08.22.17.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 17:09:17 -0700 (PDT)
From: Gabriel Maciel Raad <ffunctor@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2 0/2] Staging: rtl8192e: Fix some code style issues
Date: Thu, 22 Aug 2024 21:08:36 -0300
Message-ID: <20240823000838.8207-1-ffunctor@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some code style issues in rtl_ps.c

Gabriel Maciel Raad (2):
  Staging: rtl8192e: Fix parenthesis alignment
  Staging: rtl8192e: Remove unnecessary blank line

 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.46.0

