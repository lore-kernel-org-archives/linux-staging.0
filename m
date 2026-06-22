Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB53446A7
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153670; cv=none; b=tD3dR79zlW3Qz1sY9duqBefjnlrIPvT46nyOqVLrClikk3wOjKt49ZLmSLGgpoObMvCJTnKQ8HV1ZS9zYxg9yKOtfSc+SbnOtsyJ7kjCoGtU1x21mu2gnWKaEJxm8XBd5G6OxOMVjczrQrIyl039whDH5bgIsYzJx5Zx032ofHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153670; c=relaxed/simple;
	bh=QeEq5i4Tu4Wan8t2fXqRKe8h0/XaRyVMXGFLscEryHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4Q7INfB7AcumNglD1DYjvvm/Lv75bS3bN1se/n03cpWhAVNz+SZcH/Xg1V5zBNSB01Xo1s3EkYhKBdZfS7dA2IWfy0aqrXnW1aU/ZlyOkOX5RMOj56YBA7FhJ23EWCsNznxf5pNYj55bDlbL20qgk/1JsSh7zDR2f5p+AwAs7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gK2OntJK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gK2OntJK"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c379e8ffso40472905ad.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 11:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782153667; x=1782758467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RcUIRySx3K6VFSNCzqOOyoprOtBlK+mP3pHOAXeTPA8=;
        b=gK2OntJKYicDMw1O1FRiaM1AaLGY5syspEp4SC6oOoawAF+kzQvJzYhL+XlIVmxQJe
         92PpQ+La+8BryiTpThUqUI4VQC5gMi64mPlCMEXOa5UxfGBbX4OCrHXcj1+Ok3ib2997
         BvJ1tm0kRIHZ4jAGsDF9xxwRhX/eOD7Sca0mLkYqvRiMpqxK81PMeGRbBWhmM1Kqy0l4
         VJUPTjQ9lbOey7N1Ha8YnPqtv1A3QZuWWcmmYFIhP7Io7BS7n1dRRar+J9nNEg14oMgf
         EpGfopNlWbAua6sSE5D2KDdGjjXSI7rG6WcOURrXN62AKMivpFzD5esEdLC6Y/1ea2bK
         INrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782153667; x=1782758467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcUIRySx3K6VFSNCzqOOyoprOtBlK+mP3pHOAXeTPA8=;
        b=sMfCO7Pi8ZvTmDLrvg5wv+sY0Ql2IETvM6BZ4r8XPZ4q8K2P6a8J0SCnmjQ9UIlhmb
         rxLIbarn7k/dQLMf9b613hDbGa6VQ5Gf/mPqjZrsKNfEg7ewFzhk5ZiaPn9Xi4Prtrt6
         27EO+oZnuim8MaSP9H7ISl2vx6sysvxHeBL7TciKPqDTCq7QF9bVHnDH8Y+Jpq6gfXn7
         fcw2arLgY0FwWPi0KQPq1KmiBknNRhtZD/DPg32eZM0mfqRH+HMFFmYar7N2zsmNw2UL
         Th6AMt60KaYHeSZ6yKFTDAhRLsBD7VeXM2Nh34kFoYYApfotf/IZx+X2SAF/2Sr+VWaa
         lP/A==
X-Forwarded-Encrypted: i=1; AHgh+Ro+8rby4dOKFa+PRj0RACXrRK5KzKfgLDOSKwo/M7v4ZXSFq3GcuGjv60iEEoGpCO/mZkUrQQIOdF27+rAK@lists.linux.dev
X-Gm-Message-State: AOJu0YxNT8IAZv3zJojLfUwG8351u8PpZ2j40Ro6TgSWJMCzv7JTskRI
	a6fgjPpP/vOWoQ4TvghS3V3jdbAC/uo6Bxf32FrRD3nDIk11kfW6e3QO
X-Gm-Gg: AfdE7cl2LZub1LuHhWh209MnCx+Fs/rblGQFaV740utpJXBHdp85yt3XXlliOyvaJGd
	sO4Uunbznt51ig3SIminS4X0woeBXiiZ4hwHHEX87wtoan9fg0meHtLlAGj0e79BMpMFA4wGn6+
	D+prLKEFEiGYh2miRoABgeXQCBYP797FKQvzPuIspqupADCWzIqTRJgp+zGJ+0AvoBHbXMBu150
	3KxNZM0kqvV+Sy1OUlTlX1YMe6zBrFPodVrODBRHPWrY+0wFP7GBlsBc8HTjUr42ByKmHeexSY7
	Bl13awTIq+ZfieBjstV87sWimssn+58V1YsDgJwnMqoIi+C2fTpXQxPDVKtvd6lRLdXX62IuFiR
	IvcqmkLwsSv6MH0qKkKgr/x4+UzMrQ/MTfAnm445f8j6z4fKrnKIsnSDfkDtrpOmY/u/KNfb7U3
	pCjmNXDLwVCBzglm28P4HUJ6vZz4GIAMAuYWR1meR1EMiGQYzbgAxjbmsFdV5Dnqzl0bDY6wQ5h
	X9wfRwf
X-Received: by 2002:a17:903:1a45:b0:2bf:3309:ecce with SMTP id d9443c01a7336-2c71901c61fmr165658945ad.28.1782153667110;
        Mon, 22 Jun 2026 11:41:07 -0700 (PDT)
Received: from localhost.localdomain ([115.99.236.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f901bsm82452205ad.44.2026.06.22.11.41.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:41:06 -0700 (PDT)
From: Mani Bharadwaj <manibharadwajcr@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mani Bharadwaj <manibharadwajcr@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: anr: move trailing statement to its own line
Date: Tue, 23 Jun 2026 00:11:00 +0530
Message-ID: <20260622184100.33490-1-manibharadwajcr@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the return statement in ia_css_anr_dump() to its own line
to fix the following checkpatch error:

  ERROR: trailing statements should be on next line

No functional change.

Changes in v3:
- Fix subject prefix: add missing 'media:' subsystem tag
  per Media CI bot feedback.

Signed-off-by: Mani Bharadwaj <manibharadwajcr@gmail.com>
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d56623..fd50a20ac 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -36,7 +36,8 @@ ia_css_anr_dump(
     const struct sh_css_isp_anr_params *anr,
     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.54.0

