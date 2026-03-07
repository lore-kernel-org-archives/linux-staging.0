Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7783C156661
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772885012; cv=none; b=WSDtYe0de330vk+y0PMqilhwn2VcJtWmfdNlcYRby57uu4Y+9vfhTZtFeL3fOl+FBhhCsI6Jf3dQhgty/+72hwK0wkk8erN1fp9bFvehucNEWi6ItU+pvF6olMt6ZZJp1vdlEFYW8YRRlrDVs1eycd85Ulln+O84K6+bFIIVPNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772885012; c=relaxed/simple;
	bh=RNdK0ZyrZtFqJ7hh4jvWSWb3beAHAxISDqLSvrBo3fk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWNuZCQ7SZs/TERvJzWHrF7icYWy95G6N204IbTS3Dd7ayI3pUfk9Ge7xovXfV3MPScr2WlpuI77gndoPIkbVkhB93ZUHHNBfmdKfHe35rS0ZxybGQnOzU28TEHSJwKCCgzh74uee7nXkmTK2ZT++SatL3rmMC5eLf9bWNsIyBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSbWq271; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSbWq271"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439bad13a9bso519598f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 04:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772885010; x=1773489810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSuRGLYYaFUsWEbwGzFcM7xr+VvXP3Ivd8eb36aNnQs=;
        b=WSbWq271yJGaOIR18oN+iS7HFpsP2Ag8SMGvwf/JSxGyJdxkrc2bTsYh/GZtLagy6t
         05hLtIpkcedC7c/FtC6yw7JXxcQgOBdRJXXIyhaVH2t8bQstXw05iW4yf9yP7+lAbFge
         gHyEH7jdaPeNRo1xXVgaoHAUGeBuPNQwY/W4Mn54+oukwVOq9wnQUhE4OERz3yvW0eq3
         h+SoIRSO1osKcmPUPBcn3xuD5YbK09c1lfvlKY9QJ3oyg5EoCaH5Mlf7YAddtzB+5Doc
         qnoV/SKiiib+epW4foOahSJojHgUjXqtQ7E4+Yvhy5HtI0OBoWar2yOifZtRged7lMYu
         zeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772885010; x=1773489810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSuRGLYYaFUsWEbwGzFcM7xr+VvXP3Ivd8eb36aNnQs=;
        b=lO9SqztFKLj8SDmFILPlrao6QUa3HQUMmodISMlNIS6aP/pc787U5akaJljuoChKiw
         pyoaycI7YN+AGEIjkBcpfohdxx+wwiE3JrqK7x0nbwECaI6fZ2vYxXDhHtvHK1ZwokZF
         3hpcgPSDH7SpEylPIPcuN+wPnGPINO7O2BeObI70+3Km7I+BPS0P+8zmjYl1dlgjb6zI
         nl2p6NqAkxVeKUGlX9sAe5Rc4Jyh4S6EX0YXRWRveAxTcQlRidNP1+sSnlSK0+zARRCC
         Y9alTLKJvPkGz8KkeEds3T+2GajMVuKFEY1IffA7u1Z5gm0MbFLgX5vt+P+8LExqXBgp
         mURg==
X-Gm-Message-State: AOJu0YzIDC6KxCDBkeudJW9N374A7q96IcENSY/X2eBx8mGNlbuZhI0/
	f5Y4nfqeFl3SvV5wqnOBu6i9edmZAJ9Ft4N/AtBNVdnW6Dux/02MlGHH
X-Gm-Gg: ATEYQzwvatYNkytGMrFRuY51Kg4yw4ZsDhz4yThlSlboczbeZ/yS0aUjrkvaBhNX3lJ
	Dt6ui0urxkhpKJI2jExmZGUIYHJIQWLKkALlXs3z7eNTJFXBd//eNulLJ9LnMBsrsGlgeWeIhel
	cEJqqYo04FX543Gh2VpTlHHplUc8t9DMJLbZ+KlDYBMYcuFW2PpoKhWYRwbiyJLtUHGJv1N3Kei
	dcVpCNDzi4oYDpiW4mCdqUQNusz3YJx9VjpYkmWFGwnWgwlXujCmKv+QjsS7CR8W8C2x8eucOh/
	pCrbuPIZkpD6grsohL+/fdp3XjAXzUJLSYAcE5sPiGmjJhxmT09mpWXQJJArFZzWnaDShErNfv+
	HlSOPzGzuMWriEf6o1X+1Ct9RJBkaI/0bnsgMcAjmTnUwXejEr12hFIgeWFTKUu/x24CbwLYlEp
	afk3bXHWCcoRklJHYDl5aPUfMK5hJfYL/9fKmMIWOo0mpEUbZJEO6Ez3E2jePI7RDYu7KCnJx6F
	0mInZLnRiSEPvyawnd/Eq7bWSZfotSK3ZnrMaQXFApFtvPoiayeQ9f26Z6CxYI=
X-Received: by 2002:a05:600c:6208:b0:485:2fe9:33a7 with SMTP id 5b1f17b1804b1-4852fe93683mr11291115e9.3.1772885009580;
        Sat, 07 Mar 2026 04:03:29 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852ad0ce60sm132687525e9.12.2026.03.07.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 04:03:29 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: pipe_stagedesc: Fix leading space indentation
Date: Sat,  7 Mar 2026 16:02:34 +0400
Message-ID: <20260307120232.74846-3-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix lines starting with spaces instead of tabs to comply with the
kernel coding style.

No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../pci/camera/pipe/src/pipe_stagedesc.c      | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
index a9f736398f50..8e31981f31b4 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.c
@@ -9,11 +9,11 @@
 #include "ia_css_debug.h"
 
 void ia_css_pipe_get_generic_stage_desc(
-    struct ia_css_pipeline_stage_desc *stage_desc,
-    struct ia_css_binary *binary,
-    struct ia_css_frame *out_frame[],
-    struct ia_css_frame *in_frame,
-    struct ia_css_frame *vf_frame)
+	struct ia_css_pipeline_stage_desc *stage_desc,
+	struct ia_css_binary *binary,
+	struct ia_css_frame *out_frame[],
+	struct ia_css_frame *in_frame,
+	struct ia_css_frame *vf_frame)
 {
 	unsigned int i;
 
@@ -41,13 +41,13 @@ void ia_css_pipe_get_generic_stage_desc(
 }
 
 void ia_css_pipe_get_firmwares_stage_desc(
-    struct ia_css_pipeline_stage_desc *stage_desc,
-    struct ia_css_binary *binary,
-    struct ia_css_frame *out_frame[],
-    struct ia_css_frame *in_frame,
-    struct ia_css_frame *vf_frame,
-    const struct ia_css_fw_info *fw,
-    unsigned int mode)
+	struct ia_css_pipeline_stage_desc *stage_desc,
+	struct ia_css_binary *binary,
+	struct ia_css_frame *out_frame[],
+	struct ia_css_frame *in_frame,
+	struct ia_css_frame *vf_frame,
+	const struct ia_css_fw_info *fw,
+	unsigned int mode)
 {
 	unsigned int i;
 
@@ -66,10 +66,10 @@ void ia_css_pipe_get_firmwares_stage_desc(
 }
 
 void ia_css_pipe_get_sp_func_stage_desc(
-    struct ia_css_pipeline_stage_desc *stage_desc,
-    struct ia_css_frame *out_frame,
-    enum ia_css_pipeline_stage_sp_func sp_func,
-    unsigned int max_input_width)
+	struct ia_css_pipeline_stage_desc *stage_desc,
+	struct ia_css_frame *out_frame,
+	enum ia_css_pipeline_stage_sp_func sp_func,
+	unsigned int max_input_width)
 {
 	unsigned int i;
 
-- 
2.52.0

