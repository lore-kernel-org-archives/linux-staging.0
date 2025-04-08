Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B2B2561BB
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150852; cv=none; b=Yd2VMXGLCRycZEdUiIa/I5QGDwT/5BUTi4cy+q+TF5T7k9raeQUi+rVWykPsYz3oZndIhleb+aIZWXzqOSxIv8rdA8uZ5CKX3Ixf3M8A/yIBzRkF3b+e48YAWGirHoB5iFLnQw/6D85aI03rNr0Cpq5fClt7/TllOjPfgZSleyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150852; c=relaxed/simple;
	bh=fwesv3cg8o4VBv6/5yiHTFa+jI6dd8WfdG5igc4D3LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQKuBOfZmoATtJEuxuYflpsGb7mvVfR0JQxK0GBRe4Y334xS8WCKD28vPKUrz/tIIM2Dl4tWQNmVGiv8ArBRnA8jpFp+oP19Cp5qXWl42Cg7mBbDn4Hg/OesU6X1HF+w0vdlJZTvbTvMyEP2azDdhrMhlWBJClJIMAflek3pDH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=gUcSSwJt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="gUcSSwJt"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-730517040a9so7466387b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150850; x=1744755650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fciAdO40HhCnrgOyu6ZiFGIBLIfrfdARzc9S5Dg/Caw=;
        b=gUcSSwJtniTE+R0mVst091knG5JPze5azmxbVkiNtMywP+p5Fou5HsHvBUIQDZx80E
         OyPMBNGkxEFSISoiB6m2sprO/FCi2mtR1HC7bs4qWsmln0AGkPvr91lAKP2uKjTNVzWh
         ooBp97sQaIA3JdPJ6lA4wNdmLf2lMqZB2QQ9tNj4N4dRtMO/5UoR/Osq3Wd719/ZVlLY
         9YyKZ9ABg5ICW/vLeglUEi19LsyPEjozoF6oLXS1zFZdCYJAPi3359CRGAicnzUkCHk6
         H9I/qFDOCk9+axk5qWZrQiBy/fGCmP/QT7cWpMqw8z4Tehb7zd2LukczO8zQEDeMcQnR
         Dkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150850; x=1744755650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fciAdO40HhCnrgOyu6ZiFGIBLIfrfdARzc9S5Dg/Caw=;
        b=R1t8VRg1VLew7C5kMLc3qubxoFBHIgB+iF4K3mPZLYLVrtgBA6Fhj9ZYINpKz1Xxmj
         jSdLDilefw1gvYQaFG4wEejFguAYpDWbYO5qL0C+GoJxZT1eNV5UX2C1YZR9F77DtPgo
         CtG1u2aCmDfxOUEB8gvU4F+n+07dJLtt0BjDrhWlh/sWXCN2FXtAy+0e8jz/vJBAGszt
         wnf9OUB7Kscb6bI7ZdQsIsLB6HLZ3sayrsdWSRiDBg3yABegRJYGX0BzH343sp5VjoLt
         2FSXL/fCiUPavCaYAh4lNbWsFTR4ME1caE+RmR7ahR2JiAjGOuSrDSF1vYneOg0PfL3w
         KCNg==
X-Forwarded-Encrypted: i=1; AJvYcCVw705DD9JfMwgKMYxDaTbV7esHzUbWy9Z+unwAJGOFXSeyibF0wdsPqguR7NYFds8oSGcILBxxgdIjuLRj@lists.linux.dev
X-Gm-Message-State: AOJu0YyF4wmRvenhi5Yk/DKfLVgPuTQ13LYzEul0jtbu3pZv5Zte49wo
	PtdbX7Dmk1d3XpsPPjCGJVqUuNrD7/+OWA3IywYQacW5hteb1ZP6R8LQbKpNcQ==
X-Gm-Gg: ASbGncuFHlRVpl7+rm4R+KMYeOAO5e+X72/KeLQLOLzqOJfmHwpeBLeVaTaX/Z1JVMk
	tuBbYBG5mUn9yK2HHcem5lqWyZ73wwecme1INLtsqAWG7f9HCTcSSTTwczghSCTLIvhCuFrmEqc
	uzZtKr7QC5oLIHeDw2GnMR4jdpytBh3S2atZknmYjLJkjme3aKQuq3sIshXpE+dITEzmRr/J9oz
	bVN+gkMJPBXgzwiukXnObxz/Zvn7HUs+87gEBTBthPa7q6pPjmqGpYb+NBp6Vi+i+x9Zd6fFGTO
	H31QgqITYXzdu/BkQIWrjwtP0FeR0Ea1367MFtmUCaMGdS7YyIGWPBpfjWwRCFrSm1D/E9ezldj
	kXRKbj9yr2vBg3MR1nub0
X-Google-Smtp-Source: AGHT+IF9GoaVnRN88Tn4u4acoy/C26eOIHkUe1GhVr3aB4dlN3cLyYHgPHD+Fh0EkZIvMQV63Ma8LQ==
X-Received: by 2002:a05:6a20:d490:b0:1f0:e3df:fe1 with SMTP id adf61e73a8af0-2015ae8f37amr157619637.4.1744150850272;
        Tue, 08 Apr 2025 15:20:50 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cfa87sm9615769a12.6.2025.04.08.15.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:50 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/14] staging: gpib: nec: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:31 +0000
Message-ID: <20250408222040.186881-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/nec7210.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/staging/gpib/include/nec7210.h
index 069896456230..4b06ac0408df 100644
--- a/drivers/staging/gpib/include/nec7210.h
+++ b/drivers/staging/gpib/include/nec7210.h
@@ -101,7 +101,8 @@ int nec7210_primary_address(const struct gpib_board *board,
 int nec7210_secondary_address(const struct gpib_board *board, struct nec7210_priv *priv,
 			      unsigned int address, int enable);
 int nec7210_parallel_poll(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *result);
-void nec7210_serial_poll_response(struct gpib_board *board, struct nec7210_priv *priv, uint8_t status);
+void nec7210_serial_poll_response(struct gpib_board *board,
+				  struct nec7210_priv *priv, uint8_t status);
 void nec7210_parallel_poll_configure(struct gpib_board *board,
 				     struct nec7210_priv *priv, unsigned int configuration);
 void nec7210_parallel_poll_response(struct gpib_board *board,
-- 
2.43.0

