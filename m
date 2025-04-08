Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06425485B
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151827; cv=none; b=c2tbiFWT2ss0benZgMjho8mAomSyRl8O2Duz5x8lyidabCUHd3tEcxmM3d+G6p36hCP8TlHdIN1kOA0HJecRoHgVthX2vPy+0o5skWbTzeGRZQvy0b5K/S1q2X3CFUhJSGzpxyu2DGPDJEE6g+mcnG9ks7d6ZPYS44ZoEC9cgLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151827; c=relaxed/simple;
	bh=MtZ3pwfafxNRz2P+XhgMUZBfB7smsR8XiJQ1pvxPL/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RllhVXmc+k/vpGuQyo750OD33fPq+vNtTKJEQEqHPT6znsyR+Z65dWoyQEy++WQfhFuTLxZ3gF2CbZUPlsmC2zPcxbVXuzWAz4Bj5NSPaHTiMKtfRmLIZPxhq3Ad00rtcv3dCSFT7caTzYiBJX9X2X44Uw8EHNJ13Re2oZYbIU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=eCNEmZNL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="eCNEmZNL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22435603572so59764995ad.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151825; x=1744756625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5QgrCJAQQZVGHYnGyP5Rqa3k3tzQutVKd7yDOG3Sy0=;
        b=eCNEmZNLimlsFJUAKx37SOLhbVtSOL8/b7BMCZgWiuhfw+iSJp+zpuFIb+YVcLak+P
         fQ8Tz71dWyHfGGs847GJyqNIwt8aSJnGLf/dMxxmuyDwWiGiZahh549JTT8le2u80kFo
         GpiZG+wPt4TDsBfb8/kU/sJcKTZwW3VqV07DLvrVFvb1RsxGptVkAewBwZrysvYSblj9
         fuNQ3pbNgHYCKoWx4SfHddbj3zP0BdfPJU2uxpPYl0PMxqZ1BJJORNNgKwPWOEi+jiQj
         89LzWPcXyIlSiFOqFqfEQ+yx3AyuWkfd/myT0p3Ca5cxSrYWJhxjtWowQgva1BGFRAbC
         ClmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151825; x=1744756625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5QgrCJAQQZVGHYnGyP5Rqa3k3tzQutVKd7yDOG3Sy0=;
        b=rQgUMUtRA/KVOo6Apzx4ki26CSSuEmadqEqyWrk+0siY/TAgjWLDgXTac/ecWWBwCV
         fTCxGAU7fObevwszrG2yjuwSGB/qTs0dr3HWxkmvMdTtGA7XHMAMpS99Jzt4b6BDznSs
         Px556j5P3HM0awvTJuho2E/c5Qef46hrUvF4jNCLzjQ+DiBhPTYB+QDHOOx4xtdwE2fX
         f2CPKtN6RdEp9C2LWZeTbcLYPUALPvnMojFnJUWtxx0j5L7fw9hUJeHGkh+4wDs5/c79
         pUz1u7rC6QhhQWr/BEr6aJxliMgNH9SVHpSHryzfsGAB4kRjAPviRyCIfSnZDNf90DsL
         ENHg==
X-Forwarded-Encrypted: i=1; AJvYcCX0fiqHA+ytezfnj4F3uw7zA/xks0aMIR7MINxmXf7zZznNTAvGLb37wrVVFDfYnn6xtOjkE+MmEPxgpfd6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/M0ltuG0hUtwkqeLV0L2EFk1GWQcF05FnLmDycq2m2DMGzsRr
	Kv93+08fi5500hShFDWTM/vf024rY5ZXUlRtLRf7wGn9582rJ7U8EvVZLeGuFA==
X-Gm-Gg: ASbGncueKf6FVjw9JZUXpMYKcBTzTBId4hI8VunzjppdwiyQFHOXv1m2ASCBNY9ZwM+
	HP15Nc/3Ic2VH69xP0ADEjd8GCyFm7bfWtXjBit8eCzuW8X6d+bXWY5iwC7xQdVPBNCKXYO7DLh
	hchfPHC3LXk7ev8Bb14xn+lavw1txR64UlOwczBWsMBlPk+TEfljHRN9J1LMM/RGhaivqqXVMSc
	BjkMURN2EFo3U6dB1HlFmC3UZD5UpXVRH3WCiS8gJLYqmI/3cP5MWCKRKoMbWUlh0JZF12dJUPD
	FjoeHtlyot+oJmbdDcSCHfd8oEQlgjUY9OttbXq7isXkf/7TkKc2C5uM6j50k6Kpbr6VZdNoR+o
	S8OIDTNIc4vpKUVP51sF0
X-Google-Smtp-Source: AGHT+IGdJru4JHcvDVy0T5okzA05M3CIgR90mRA5qF5Fv4cVuCDOBKVQREsR8eV+lmu3XXvmeHzJNw==
X-Received: by 2002:a17:902:e550:b0:223:39ae:a98 with SMTP id d9443c01a7336-22ac299d473mr11858275ad.22.1744151825210;
        Tue, 08 Apr 2025 15:37:05 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865dffcsm106264455ad.127.2025.04.08.15.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:05 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 02/18] staging: gpib: agilent_82350b: gpib_board_config
Date: Tue,  8 Apr 2025 22:36:42 +0000
Message-ID: <20250408223659.187109-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 3880d4a23eea..901f7182502b 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -492,7 +492,7 @@ static void agilent_82350b_free_private(struct gpib_board *board)
 }
 
 static int init_82350a_hardware(struct gpib_board *board,
-				const gpib_board_config_t *config)
+				const struct gpib_board_config *config)
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	static const unsigned int firmware_length = 5302;
@@ -587,7 +587,7 @@ static int test_sram(struct gpib_board *board)
 }
 
 static int agilent_82350b_generic_attach(struct gpib_board *board,
-					 const gpib_board_config_t *config,
+					 const struct gpib_board_config *config,
 					 int use_fifos)
 
 {
@@ -730,13 +730,13 @@ static int agilent_82350b_generic_attach(struct gpib_board *board,
 }
 
 static int agilent_82350b_unaccel_attach(struct gpib_board *board,
-					 const gpib_board_config_t *config)
+					 const struct gpib_board_config *config)
 {
 	return agilent_82350b_generic_attach(board, config, 0);
 }
 
 static int agilent_82350b_accel_attach(struct gpib_board *board,
-				       const gpib_board_config_t *config)
+				       const struct gpib_board_config *config)
 {
 	return agilent_82350b_generic_attach(board, config, 1);
 }
-- 
2.43.0

