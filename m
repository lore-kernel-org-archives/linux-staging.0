Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD937DE93
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613978; cv=none; b=t4l3HiSF4DW9CxONKbGJw081R9QM5Posc8rWGiWrqogJIpjjIYFPyBFoV5p39DHfUarBLLOTARnQTDnAG5z49RI4jpaFouqkuRgkNfJU0hJBTEKW8NWuSRJl4VmPNe2ZhR5z8c4qU8AhoC6NFuluktQBoiAbhOIpem148zfN5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613978; c=relaxed/simple;
	bh=YBpifJqm/54bZf8fKNduKAhexgzSPQz3kLt7ReTQDcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jhrQn7djyWlBI/855FfbD7CcdXJdFOCnTgOTd57aByLKK8XCrpRrAFXyyY9LsoH/5M9cbz/5xnRYqquEbC20nk9PWjLN/6wXZ1roTvS6UK5KfHzP6eVYp3WWbErdOzCjZpMA0iV9rvGpQ0I+q5nBRMRMkXOyNyneZgtbJdBWZpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eyim7ugF; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eyim7ugF"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-3598c8165c6so424414a91.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613977; x=1773218777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMIriR80Bv2/px5vVUBdIIwvGCQt0tK9lk6zU9lA43M=;
        b=Eyim7ugFJLJeQVAyk6PzpobuAioSIi9uGi0FkfAes5IWNSq347naD8YV+pOfnO0LOt
         wrXsczKvxUikSmTMtF9Gw45QG7FEU/yxjGxVrreVD3m42JBG+3EIQ4GCRX5GBr9+Mr5j
         8lkKzv7plC6wueq6g5Qi6ytHRqhjFyRiRTWzb1YNbnhl4pcDAULgxrOKrzVisTP2J4CT
         Wxqu0qTTPrrOvoRZyeNXaGpDe4VGJ5RcQcu7Dt08neNweyWvQ3+aOpYNRwvXYi5q3hrS
         DkCkzM0YeLcGDfXbVicfqqhASol+ewcsBLP74zowU9dhxOdaQDeHdnVzukNuhQSp4cRZ
         S7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613977; x=1773218777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GMIriR80Bv2/px5vVUBdIIwvGCQt0tK9lk6zU9lA43M=;
        b=Y4w8G7k+cOU3Bz5nnEX5PYE+5qoI4NyyIQ3Mjt4ceuPPz3Qj5ErM5ESu5UICGx4/Ky
         80DyNHbv99dvzfQAEQ4LgpiWwVU1Jx5d/6ssw+Nkw1is8nzdiSFY4E59qLVXDIhE4X0q
         nRFB4sodE5NeYABP86/OJGHIpVqXM8SgNN5bVLFKhEjRKe061IowossWJY6AO+ZMOyDa
         A8BuJ/an4xG+Jfsgj1rtyF+rnH16ZqVEi+jAK0uCPRzs1ydxG9svf1DCxpD4EBIauwvC
         ZUB+1HOBkLtCmG6pzDtzmAKI3gm7QeMfjtm9aSJU+Bt1e6NSrHeePHmVUxirRJ8ZzGfF
         IeNg==
X-Forwarded-Encrypted: i=1; AJvYcCWSJ8CvikTrTNLvDogqKWvCHIErAsxJ0yXAzgigyh3ecyJK6IJDs+8ZysXsbpHfejzqkc9VgEmXsODtOr0q@lists.linux.dev
X-Gm-Message-State: AOJu0YznDhd5Hy+faPgkTE6YQTW9kD+i1k8V7OHPB1gHc8c2M4veEvkM
	FZnCt5xiCqAaiTVhl0OcdgQAXdEJY2N52rF0ULk1cDJZ6dnRcnNpev+y
X-Gm-Gg: ATEYQzz4l2RDXkjGmzeU/DYbLP14ZXMUZsd+3BtRRZZxBOaUXX90QcxzcQP7rEocdKJ
	ePLab8sRepGa+18+yF2ePmbz24WnNzW8vjkkqyw/PrU3B5hWhnRTpCSgZKcf8Df1ykWA/y8M8C0
	OFsr3Bg0465ZLo8z80PFTyKxCNn9uj2qOCZcIMclkD0oDJB3Bqfjw0XifKzvHNNOQqobwXsJKms
	g0soLzdZx3j8f/7ICWbGJGjtbGKmL8ftgH6E7eIOjpGiLyyH/SGYa64fSTL39M+8XJYqT3IorGW
	Dc0iZz92PJoxXSS0fuKzPO6c9vggVY579OUFxs1kx3Sk9CnWjiT8EsqwwGAlxLnCAVw5eOsejCu
	s1DGfBhjJd9+dwNNIucwlA266ksFbGvo/0/yLDtu5vcRXktwHVLeQ4AZVXVAJBNG+wqRXc6hjmM
	dbG/ypdvBNfPuqdX9DJxJejoZe/DvETAzw3caPjaINLc1lfiIJLHyEsQCgP2qIrky6nln0MCTpA
	1vLGfrOcvgVLTA=
X-Received: by 2002:a17:902:e851:b0:2ae:5038:6998 with SMTP id d9443c01a7336-2ae6ab75e62mr10505315ad.8.1772613976792;
        Wed, 04 Mar 2026 00:46:16 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:46:16 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 5/6] staging: sm750fb: sw_i2c_write_byte: return -ETIMEDOUT on timeout
Date: Wed,  4 Mar 2026 14:15:44 +0530
Message-Id: <20260304084545.156170-6-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304084545.156170-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return -ETIMEDOUT instead of -1 when the I2C byte write times out.
The callers check for non-zero return value and treat it as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..a17f758dda6c 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -294,7 +294,7 @@ static long sw_i2c_write_byte(unsigned char data)
 	if (i < 0xff)
 		return 0;
 	else
-		return -1;
+		return -ETIMEDOUT;
 }
 
 /*
-- 
2.34.1

