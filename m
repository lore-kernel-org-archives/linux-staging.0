Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DAB3314AE
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776969989; cv=none; b=SlPVehL1mVDrKpXgFQzTABdM0oINVSDXwgfq6eKdxBsKB0efbyZ2p7jtqK8lJy1fgjj8pnXiT9x5yU830dBbR35LDPtteBc8Gxn38lA4ZTi695/c3PgIMpfc8xOEaHS254rgDHyK8Y/duKrdF1uHVA0LuOz9NWviYPJoaOUerSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776969989; c=relaxed/simple;
	bh=9IR4+4EDnDetYQMuyX9RSNoUjCQYzsHRBqQ8suJAq6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqNZtRDwPv6F8zsCWc2tNKq3cT0AwZNlrpOUY4qT/oxgTtonSTlan5DzHTO5NCQUWivD9uj1wqOx4C0DT0c9VRJbNZtyE481WycWDBd1ARdHXTEF8YGB5wJLzydRs3MGMILxoipnkfJi9hLEpiH45UDC/G7JDqukVFmHkUTcdfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVmFUOEZ; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVmFUOEZ"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c15849aa2cso9563504eec.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 11:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776969987; x=1777574787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gPwpAzGh6rmB6p9OxlKkTq6YhtQvVULhJFEbExzc0g=;
        b=JVmFUOEZkJ9/HA7XSSqnJqYlH4EaTAEJCp4Fz+I0WpjJKGMJEuAz2ERL5izj3TrGbF
         4OMqh2G39M5OWlHEXEE3D7t+dWji9sMhpMCXzgaUunoaLbpLi6Vp3gFfMbyKA5Q9r1Mj
         RPNh60E4bDHuRn1bvwW0C0cHqPHV2BLl+Du3wv5KftXQ6w29xMkEGPNkT4ZGSCZ4ELpZ
         0anLmDLM8tsJKR9DJcnGP+QKFR3z1UEp05XxEM13vQhiJ1+0xpez3lq/R215srgZe6+r
         o2hZxlhG32odANosvZhB6yrlZU0f/lOg8Vod8knRQ737XgYhDsoqxHttn/KJSqF0CXaE
         oMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969987; x=1777574787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gPwpAzGh6rmB6p9OxlKkTq6YhtQvVULhJFEbExzc0g=;
        b=lEl4+F/B9GoIal4eY9E+pA9cwVK0hz84gU10qFnAo8s8czUwQVTk5EGgdjTLZ8HwLm
         HM23MRdlhqTBLx9EOHtRB5xOQnDQPazRvi4F1SnSSB7REmSqg2ZnOUG1UrBtgICRiL0j
         ZvzuwbxKulUfYqnnKqu8nSHX0IIGSjpuc6ptsLcfw5UdJk9GjTpRLs2TIQzhnOXwlchL
         I+zFeIhR3itjw5IfgNJpxjQJczsfzEo5T5hD8O65DVepTq6VS0CzyXkY4PZQBBJP/iNt
         qhnJRLVkmkwiziBTCyErXUpM4WuThubMpjfl7/pf2wcACUiVA/K5rBuValw+flHKajqI
         T5lQ==
X-Gm-Message-State: AOJu0Yw6biRIikssQJr9W8swA+OZPLocEdFiG3HgMQAA06J4xA0CCC8i
	dw9+Gwb4+wBOFVoWP3/pHYFbCRgW9nU3KxnnEh/2ztmiaQBRbSN6/fnVJ9vLnUXt
X-Gm-Gg: AeBDieuDajbCipgp1vUwMiX2YmIbYiso1hApDs7dfHmcrkTIlbabg/F5TRFwbwouqeu
	iHA+pVZoYudKjeEj/zdJ7LEbizbMQFyjcXX2bO5D5mnihvmIY4G1iFGwGlFptepouPT3KXxr5S8
	saNOrvDBQhPPZSzEI8kKXU7NeN4jetG3QdcKmez8DXcZ3pFuIoSdus2MQ52AuULXR+EoeofmnYE
	UUzrC80907bptuxvGykpJwt5MMqbnOuvn1F98v6QQk362272iSkeHzxtYt+2u7gittES8ZNsvVy
	jjdWE+iE+dZnpa8Qsp1QzzojVRY53+pD+G/4PeGqIkthKSXRBucVswnYuV1oHdx9M3z5fTTbfjX
	kwpKx0JFqYBhW4fKFBD5pVDgmY8BAlE6ClDwt5SUdgXLNDY1qlfohToy7rGH4uU5wx6gQcFivp6
	Oi2Qhpm8R+n5a+vvii9/7UDW/bIwJ31qt9EEcnDk1PeHeM8Tiu
X-Received: by 2002:a05:7022:4388:b0:12d:b7de:3e12 with SMTP id a92af1059eb24-12db7de4106mr6077122c88.18.1776969986766;
        Thu, 23 Apr 2026 11:46:26 -0700 (PDT)
Received: from PCJohatan.unicamp.br ([143.106.58.255])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c831d5b29sm30369097c88.8.2026.04.23.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:46:26 -0700 (PDT)
From: Johts <johatanrlima@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	regkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Johts <johatanrlima@gmail.com>
Subject: [PATCH] staging: media: atomisp: pci: runtime: debug: src: remove curly braces for single line if
Date: Thu, 23 Apr 2026 15:45:40 -0300
Message-ID: <20260423184543.109954-1-johatanrlima@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpath error "WARNING: braces {} are not necessary for single statement blocks" in sh_css_params.c:1931

Signed-off-by: Johts <johatanrlima@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11daf..31426001864e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1928,10 +1928,8 @@ sh_css_set_per_frame_isp_config_on_pipe(
 	params = stream->per_frame_isp_params_configs;
 
 	/* update new ISP params object with the new config */
-	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe)) {
-		err1 = -EINVAL;
-	}
-
+	if (!sh_css_init_isp_params_from_global(stream, params, false, pipe))	err1 = -EINVAL;
+	
 	err2 = sh_css_init_isp_params_from_config(stream->pipes[0], params, config, pipe);
 
 	if (per_frame_config_created) {
-- 
2.43.0

