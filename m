Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DE7377EDF
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777829952; cv=none; b=R3X7T7flHPdVt2leL3YAJSB74Hov4FXzzQRRj/A8ytD9wWkRkrK6HI8GqFG3t/URKpmejGX3gpZKyasIne0GayLyTPpixI0EuPN1beji0tcnJ8zT/5+AN2WZXSdX3krptONl+14WB7VKDuvCEJ/ku1kvIG1v5Q8CJGBD6j8W0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777829952; c=relaxed/simple;
	bh=oq9nC8rlo8au9effKbVLinffYFiNKFEx0Wp0QeVfd7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=md7CNHo6qyBjYjZSHN+t55HyecY46ZotdmkLwC1OuXsv9kt7K6F2U+qGBwvvdPsYdP3xyNjXhgUzjiuEfvJpOBxnufIjjjH3WOTF1zG64WI4xxvgCvL75GhwaItjEaIn681+VtUaF2VhP8vUzLn90vPkwzhO6v2+Ku+N1qIEfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShhoMgHo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShhoMgHo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36528851d7dso272407a91.1
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777829951; x=1778434751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l25cDFU8ziRTFzjYeX3kdOd1cydZ/PwViKSQL2gBKlI=;
        b=ShhoMgHor3oCw12VdY8SicN+m/coHCaKMcHUsTSgxR2gGjy2ReCX6m7OPUxg48rWgc
         X7eMwwdXSYAg0ry0lx9cV66s9rky9RlfmmPpmi/ylzENQ0zPbA0gEYmmK81Wybrz61GS
         u0n1BkdYBpEF11bRMkawZdhnUnh64JRslHC9Rd1bVmwSSwSL9JeFH/IJX78u8ksLrlkn
         Jag8jPZlQH9xPjjCNgX92wb6ECwz+3HN5c8sPZheJZY4ocSmytEES8tvSzTKQSHKxyF5
         iDB8BC+Kv0AjgamgDZWSLjp8/6jNcVpL/VwAoJjCOsfZtjEVxoXt9yNvBhbXhr623HzS
         LOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777829951; x=1778434751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l25cDFU8ziRTFzjYeX3kdOd1cydZ/PwViKSQL2gBKlI=;
        b=ezrRNtkeG/5yV3jr4O7/W+rVmlGJ1GIS3KNcztQL4ic8IT7gb7da5RjcTapKMkJm8I
         sQKB02wtN2SOvuEcf7ERphWgtMh+a6/5LFb6BfmgNQWGSg+V2K+1ABT4hYX3VOSeZlKu
         4RJsfODfjwgjSHPEh7P1NOhNI7RSAeS7qA/8wiKZgFhMHy3Vrnlc9p99D5AOmh/93Q6l
         7BtPH90b+/uQMGkYqGtL7YxZkxOZYt52/Qb5k0tiMes5KaXLDAO6YgwSj9yEtQH6jV5a
         XFtk0oT/NsXIj30O28ycZAFUWBX5nCyDvF5ak3Utki1prZhuJj6Z3a6zKjFWd5NCfT1J
         J3OA==
X-Forwarded-Encrypted: i=1; AFNElJ/xWOfZwR+zkFkKin1/NvscVSjacw/X0x/bdVYQzMZ8UhquuhLLUX1glBtaU0VPRaogW7Lpm8nV7Fk7gEfD@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa7bf49fl2XxE3U5k0g48cDTS0MUIYkjcMsJBCrfB+qhwTbRVi
	QBRioresUX0fwitcKUpBV2alZzAU+iz/5HdEju0vXFoGtSWpgXpBqPP/
X-Gm-Gg: AeBDietlbbeUFdjqH9FgPwZjoIG7Mgs5SjHckwcBfVWXC4JlJHA6E4URodDTI2pi7jq
	6GHPK9C4fIybx+uvtcFqt7IT2B2xVmwDmGIpMgiOIPKXw5uoUbVwIS1b5a6PrtUfj307EYGq+vi
	Zojn+0MrySiJziArrsqj4sQ5wLSHRf5iRvx+vBku4J2uaAl/3qk0cLpSme8zAxjzuLXWwHFFufJ
	Vj+qixJyLt5sJUJR2kKP4t8Q2dSJK00DJYGe15cqk2pVxxjfpdpHOTtG96EANdhdlPNjmT1yvII
	Hsi+h/+TLHmMawYsWp9Leuun1Gxuzztit1wQyAULd5GLbOCOjQn8433h3izkDGJ0noccKAtgzkT
	b62/fl8FMYuvHiB5dhY4FWE7kw2S0mT+8kH8q9wonRLdolPTAR7JSdoeA8UofO499wvc4GWUzrn
	wKHdettckamm2rIvsmplD5fB5RoTo43lOSJvJRXn4VK0Yu7DuL2DmYeWv/F4899fOCMHM7VDiRv
	+FdhCaDJasxkqeTapurs0TH6UYOwMIXYg==
X-Received: by 2002:a05:6a20:e292:b0:39c:12c5:c6f5 with SMTP id adf61e73a8af0-3a7f1a9a7e1mr6823524637.18.1777829950745;
        Sun, 03 May 2026 10:39:10 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c80203b451asm2849785a12.8.2026.05.03.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:39:10 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: atomisp: consolidate function declarations
Date: Sun,  3 May 2026 23:08:46 +0530
Message-ID: <20260503173846.108790-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate split function declarations into a single
lines to fix checkpatch.pl warnings and improve code
readability.This change aligns with the kernel coding
style.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 57f608f9db56..93f8937699ce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -17,11 +17,9 @@ struct atomisp_video_pipe;
 
 extern const struct atomisp_format_bridge atomisp_output_fmts[];
 
-const struct
-atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
+const struct atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
 
-const struct
-atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);
+const struct atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);
 
 int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool streaming_ok);
 
-- 
2.43.0

