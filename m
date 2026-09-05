Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18056392837
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611701; cv=none; b=r7Sx9A4+hVdkxx71QXoHLNM39A/7y5t+oCHmdI/q+E2M1U3/zt6HJw/65xB7ci5AcSpFlLgxSaBo9RuogfxNBdFtJ5P0FvXsSAnXPHUwykCZ/VgloIYv5y7UV5PspR81XVC1BsOsxahCwPYqbAnaXTSNWZiFX/hIHrwCBd1Cd2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611701; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=noOtzqAGgEneCWVssvigoY+1kaRs1kla/iqX51C/pv1wi240pgEltXcrsQCaDTQjMvcs3Zjjjfn/WHKpkYi+30IQQ/+RDIj3Vx5hcTjo2mjuCKxjSb9leJlgNW78vJHjUMvQuNTtXRWb7R6fxNazCRr7RPyRfabcsOLyos0pCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhFS4LnS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhFS4LnS"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1781360a12.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611696; x=1789216496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=WhFS4LnSEY08oJHgZRTE0JAIsFuiBZh0EnWqZruw467BiA2pCn+MKCsnRMW2ZD97V/
         vz7MCvALtxqBwZpL/1U0dmaME3Y+XrHXHVfIRzAwiD5HC6zTfTJDwPBA2GRgnaNVlsVA
         OihUuSZqcogMDx9Jk69PyUu1iSTUoQ3Jx0O3OViQUWm1KF3Eoji4hmRgtdF3TKbVgPbb
         X3eLcrz5O94DZx22nGOyt3IN2k33jstqe0e92o6BtoUSzLO2jaO4dmQE6aJukWMzz5LD
         mWBV/b4ELXmHer1Zc6S/sGofMMa0k1yZHkI8lew/hoXIk6fOqtmKDHi7ywZ/ljIq4L15
         baLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611696; x=1789216496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=GbmwvruRIRilX2YkK90zF+b9BVUcgHagNGmwsNUCibFi0WVShTTB8z4u1WtysEw9eN
         Et4hY6b/pcr0ZYb9qHeJ41rdCVsyCFTIsqfHg6Tko1UxZ4jhCb1VUJMNMBrou3MSD+1E
         7QDrRtJ2v4OIwda5QJtyHfbuRSzE1QYA2oiqh/YWTLLDBQ1+n8hgclHx6hnZrc2Tjfwm
         HT01yl3E2w+MiypbllpVM4SiS/sthaWVWGYrCMlutA841O1qc5+HJhHjzwbh/uExeQJx
         IPW8SDXI/S7hJCUQ9uTxH66oy//RPkza/WmjThaNdCgEAAiWXUMbYdm1MiQ8eUQ/YG5o
         sevw==
X-Forwarded-Encrypted: i=1; AKwUvBxkmWv+0LOyJWJDQJ5Z18+RzakhFtkc0dSca2C5AFojRg8yNFFDUQQICXDSxJAB+9GPPeIDFEjqZ8fRRjB1@lists.linux.dev
X-Gm-Message-State: AFuF++lpX5HCuaqVUAat1PD26zA/kpU299JsJPlBnk1McUUuempVTP+I
	5LLNV+G7evkRsU3Dmd7V3wvfYqm0kVvUIIuyp2ogcqG3la73wDcal6sr
X-Gm-Gg: AYBFou30qn3y+T3rtL63yu73VOgladcX80gaGzhWf80n5tZLy8xQWFFLyvoTaXcruTH
	mq6MRYSHI3eicrHJ2S0hbgnNdr5vyJ5wi7JAkidURT/XEKC7BsFHab1LAwH2kGsePEcCG3C1dU9
	s1NUPyleE12G1ZljTtYgfzBE+EEqGkbNVCDJqbBJIRydPaVl8Gzr1qg0jsGNS9aXxg/A+qwQqbd
	ndQ+zr264g2QyCI9Bc3JRjGdjpdQc+BVJXsw/xMdFGHStRguWuuGmNU129iRo8oMnXavfRvV6y5
	mnZ2eqiGleBlqyecW1rtZyMc1lUuiHeukP/1I1A50y3SasnjP0UQpd6wswPfmfRx5daAwlC5HRB
	nRWuHOebhlLUD1GXVk5Fu5Kw+Se2CE1Q/5j8LrYlX40hQDxLBuRBoKqoXq/VbJeyKUl2pBORUaG
	AhQPYrRz4oCk7pNu2K5QWCyyuirKSIxVs8YTHobPt3PAJ/ZDpgeNzt9uRxXm5ROyOt+QHSIL4ys
	Qp9A2eUyMm23UUG2Aio+66KD9UaNPsd
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr17366120a91.18.1788611696373;
        Sat, 05 Sep 2026 05:34:56 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:34:55 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v6 1/4] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:34:47 -0300
Message-ID: <20260905123450.5620-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

