Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DCD2165E3
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788268; cv=none; b=YG1JU43k68AZ7KyE2RF+uV/ZX7cBcLb8GabZGe8I2DxW2pi/4y/kz988uhTJ+0afRQ/YiFX7zdO6WB14sI6gjdB4tEdq8H1w8Pd+yFUfGpaNgniNnNp6nCGtVQNnU4HUtXYhUVbachZB5caLTaLqqN/QC9f5TfzGO9+nkSan+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788268; c=relaxed/simple;
	bh=Gazg7ITlPyeapShlUJWzCmzJ5JDneJIfQIfGTf7Y54c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaOBDWb/JazSD+kX59i+WMTnWpsmmH2EN0Jhrks8Y2LEuvHMx0VLj6HNKyX8ZMFRd229GrM8n9qHqxvUfW83psddkAbQXnCcDKCluh50TgNJwcsqR9uybaEQ9pMbJ8vBo31SjaI1s/AxPbPYvJdfUBGTFRstvH1El9cI7hscigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7/lHLnP; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7/lHLnP"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2fc737aeeb1so1134706a91.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739788266; x=1740393066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydQlzBFDch5dE0pXTfWbgAH++noP+kxMcP8vl7mV8uY=;
        b=D7/lHLnPj5H8iDRzabkbvDVBNfh8stz+WXFzxXcpfjWjK7jpQ2L2llbGXlQzSRCfFS
         iLIJlY0T7R2+0N8UX3Jm47zOyXHSuwBA8PH/wOLfVNy/tKk+TWXEFRNrHk0hSq+ySOji
         JgcfmFGyErqsUo/JxPgR0ylumcpI6sYqLxbWB+72uQyu8BzfVS+YOpX3OqdMN9xrurYX
         sBPDvgRoRBoCnu4rebSh2SQLynucS/AuIvSn+eTQNZLW6iqy4rop5FE3UVNrZ4S2r+8T
         pumWpy5rR7fZ2ONpP9wIXDin3NGoYGCzqAulObDJC/x78wMZkX1aZ83ngMyO90aUiF+d
         RoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788266; x=1740393066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydQlzBFDch5dE0pXTfWbgAH++noP+kxMcP8vl7mV8uY=;
        b=EZ2qVA5r6mmmwNBMMZsRqbKjMCmsnadBprd9eT4MjUnPkol1XV/aPiC/MkzRxsf7ym
         ue/10iqvOjQTWV87SKGKK95PLH+8fJuaLlaA/mPDusy8Wt8yvxdCeqC7x3Lwnn6FkVPx
         A+5OUD0BH5C45bpDbS2CxKCfT6KDQjVYSUjtYibtskOuSEyDjTllbCGcneUK8Rt5/E6f
         cdqQkV9S/hAMUBn7u/YbjM740xlyXEXh37jljYbwgJQFuN1w78pAY29P2lFNkHWTtEjo
         R6OpCJXHOV7Za31LmjpHjGizIf9pOU+6cRbrUKemJOHsS7GY/agpnsbdRzavpQfuIqYz
         hG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIxduOMKeLbjmyKcssKOwNk+NoSMySTXwAVh4jbUcEjYhlo73ixQCVNWYkKSkU0/dHlT1Eu/6ZQ/X/H5cV@lists.linux.dev
X-Gm-Message-State: AOJu0Ywuwh4uu6W83pFemkyaF+dESC2OQxg9cLM78n1Kw7P7K/iYrfFl
	c5b/nz4RqJ4CSWX0+vPna53oOhq+NqVVHvU4QbJWRMN32sxRsjDi
X-Gm-Gg: ASbGncvrf5K4TztgF3EhA2OyiMWD/CQAKwC4vJ8LhiKk1Lq6QmgA2xApMmfPdlD35Dr
	mccuOpUn76jNrCWp1cXlql08cASmpIi+RCcb/tlrki/Ud2CFl6WxCpx+XYvQS1Gss/XRTrv7Q/I
	Xa1sCaZbArnsoPq4QR04RPxZgxJ8tXTdwYswuilibAkTtb9alTuHgmtI9PST8LJ5Wpai9BnxT8R
	HBOUnLOV1AunnAwis/7JO6p0XbciX9ajefGzrihBQZGdEvQHXSJw265TwnCsFJIdHp0+ug7+1th
	CQQtk4XHkaPwuqx+JmFR
X-Google-Smtp-Source: AGHT+IGriBuKKjdznmnIm3vXi8JBeA0sHMkbwBHu5PAMvpDBCNnAb8WFgeAwduFt/lnR9MKJSCHrig==
X-Received: by 2002:a17:90b:4f46:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fc40d1318cmr14500264a91.2.1739788266326;
        Mon, 17 Feb 2025 02:31:06 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fc3281939asm3807378a91.0.2025.02.17.02.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:31:06 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH v3 1/4] [PATCH V2 1/4] staging:gpib:agilent_82350b: Fixed spelling error
Date: Mon, 17 Feb 2025 16:00:35 +0530
Message-ID: <20250217103046.54294-2-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217103046.54294-1-kumarkairiravi@gmail.com>
References: <20250217103046.54294-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

fixed havn't -> haven't

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 5c62ec24fc..5a74a22015 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -121,7 +121,7 @@ static int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_
 	writeb(DIRECTION_GPIB_TO_HOST, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 	if (retval < 0)
 		return retval;
-	// read last bytes if we havn't received an END yet
+	// read last bytes if we haven't received an END yet
 	if (*end == 0) {
 		size_t num_bytes;
 		// try to make sure we holdoff after last byte read
-- 
2.48.1

