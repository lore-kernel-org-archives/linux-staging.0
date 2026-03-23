Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3F038656C
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258266; cv=none; b=ZLRC+65lcfe4Cu0YwKkBGLZuvoXG7lfJ42ejNApe8X8KYAFhZfUaJk7E6/plrHG/2CEfc1uQcDi2CXP4lg0XAPkWgxNG0nZOMSSrwrhvApROZL24bquVdoUHmHCAs/69ovc9Jd3aXKGfEBRvaN/rBSTf97WYGBCoGvS7NI2vKhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258266; c=relaxed/simple;
	bh=lRfKnvbz6HfyzfdpWmIU/4xImoHXJtkyjg6AMlsEER8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqKrVM+RGsdsHc4dys+ItGwWj3YsXKHhmyezqyAmwgiqNEF2LZaNKlZ4mBwfLXivhvX58Keht8NNBrG6xXP/01Ujt/KIgrxGrmMl+8wbkpPPGHjt1p3ctkeGmCzTzfF0FyzBeKO8AnYOzQ2WuKBjXmjtd+fN+nru0E4X8AFYlek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vv8cUJgT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vv8cUJgT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82748257f5fso3205248b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 02:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774258264; x=1774863064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yIpCenjjsVI7qTkDHK0m1zE/y2DR0ltK5SBk0aYTNq0=;
        b=Vv8cUJgT4/g8rWOgUFHrrHtGggO3WAF02/lPajZ8S4g+OA0z+ToSJr3OXpAmEgRlf6
         qxRKLOCnIwXRPTPU7u4BdcLbZZ2vbRwz7VCnxM/oXIKcRNQIIdCUPuSzLKEcN2FW47Qk
         wk99/n4ZIjvczJYCdHhdTtfHsZR+DRxoH1s2KVpC95EYZGM03z5OAw4Ha7hoYUNpK/yx
         rHIg3dQOJxWg4axIEnDLlREuEW9+kiqjPHnnKcd9ODD9Czmyuu9WfjfIwrmL8p0DzX+z
         rn+RzUr2djaSlB/RZTs9bno3ADjpTgn8dq2sstE/X+PQF3D0jKg/Y5AaBC/hFET9MyuT
         h++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258264; x=1774863064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIpCenjjsVI7qTkDHK0m1zE/y2DR0ltK5SBk0aYTNq0=;
        b=aXDQjSPuryNVqw8KkPtSY2jXKWh0MEszdnV4ht8+YaNb/olF8aNM7kmUsg+IV4EtQi
         suwRQ7gE3Mfx5rZwTBrbInffj/tynR340UreDCSslaoq+TW+s0D7K0Sc6jQoKICwJNza
         7f3iq1n0QUIGzkCx/4zHKsPvxVKziWRAs/jOmQaioJdgCFngC4yRxYxEY5ljtRPWh4gv
         oZURdqbf1CLCGHtVa5d4VKN/B/TcWkRDbfxRcZUl4ilbnuwQ+3t/a8C/4V0YYS7JMG4M
         C2Xj8kiOjKl42iLEOfRr3l8Y4T6FaJ0ZQAHYchc69jeJNUFBxeAygfYnTW7g1fEeJOVr
         gjfA==
X-Forwarded-Encrypted: i=1; AJvYcCUK69oGevOKWmeEQm5k4ofz4BA94q3xIWR3HOW0kI/84kBGCWTDCIt/sBM0PL5K2/Zhk6nN1v4E7vsTt3R7@lists.linux.dev
X-Gm-Message-State: AOJu0YzTjHlat/PQzDclkPfTNFLst6ULutSBxiiBrjImcXfCN7U8k7NU
	HM873v2rnNsWiNZKSAFzz5HZmFw1Egca8ZedAy/J7uL1Pku5tInmoFLR
X-Gm-Gg: ATEYQzyTyjjQyNW9jFJ60314zvFDcmZcvswPKvkzAbs6d75KiyhaCHcNvfvppp+UIuf
	uRrAoqJ1QMSIY6ydu5b7Ow/n7okKPk9NUCeAFqnVRceJuIfIn6l6Rd5CaUEuMZiFPJ6SmM38WlR
	T75jLsbvzFbpjuW14ScpT++u7FTW2Iv+LKVzPyna6828R4CF+7/EQPTqMWvaJ9bpfJ7uj8aA8Qz
	AbSO9m6xuGf2bLslzKpJq4AB5B+GP1mFFr/gGzGEzvikVob6yRNbxOkP6YVM8aSQUfVW/dG9qWS
	9iNksEC0EaGFHmGuYXW28OeBYtV+09nxUz9mHri0NLhQfEMTgqlHmbrClOXM6TKXJnUXC4ikVb1
	YWo9rN+njNnJYfLZ/dLbPnf30WuNzepkpKPhHotVH8Mzkr2y4VZq813nzcFY3Vn1bWEllGQuLSw
	l1oQ750MWhdHVouxnXRvGVZCl7uVGT
X-Received: by 2002:a05:6a00:2e9b:b0:824:3ef6:a815 with SMTP id d2e1a72fcca58-82a7a80b69dmr13719942b3a.8.1774258264535;
        Mon, 23 Mar 2026 02:31:04 -0700 (PDT)
Received: from localhost ([2402:3a80:45f8:9077:e390:2476:966e:8063])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa5a9bsm9031726b3a.8.2026.03.23.02.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:31:04 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] staging: atomisp: vf_1.0: fix open brace placement
Date: Mon, 23 Mar 2026 15:00:24 +0530
Message-ID: <20260323093024.38704-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix open brace placement on function definitions and control statements to comply with kernel coding style.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
 .../atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 3c675063c4a7..940b5767954c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -49,7 +49,8 @@ int
 sh_css_vf_downscale_log2(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
-    unsigned int *downscale_log2) {
+    unsigned int *downscale_log2)
+{
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
@@ -65,8 +66,7 @@ sh_css_vf_downscale_log2(
 	* test for the height since the vmem buffers only put restrictions on
 	* the width of a line, not on the number of lines in a frame.
 	*/
-	while (out_width >= vf_info->res.width)
-	{
+	while (out_width >= vf_info->res.width) {
 		ds_log2++;
 		out_width /= 2;
 	}
@@ -86,7 +86,8 @@ configure_kernel(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
     unsigned int *downscale_log2,
-    struct ia_css_vf_configuration *config) {
+    struct ia_css_vf_configuration *config)
+{
 	int err;
 	unsigned int vf_log_ds = 0;
 
-- 
2.43.0

