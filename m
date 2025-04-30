Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEF37FBA2
	for <linux-staging@lists.linux.dev>; Wed, 30 Apr 2025 05:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992626; cv=none; b=MctsLD/z18MuhnT3I0GHV0spVEtKQjDE2iigdv0gDNZtoqMD5UPOCLMOkgeWzr7xhih4MXlyO63PpJKHeuQOXEVZei+Xyk2jQ/WM6T3zIHNZYTeF+S1ZGDsBfJnDr1NqdkTgszzSKGUDeEDXi3p+xKUgzFIc2GtFyMYYo1MSZnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992626; c=relaxed/simple;
	bh=xQWuZMTq0hh7aj71PuWsI8OaIedNtEW7vEhDBtQsPLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u6BtMv3JeIYOuHSiSyd5+us569kjwF6K13kgf7kekkenYnEGbeCxKVa1LH/fIb9nV4ntVO2JZ8iFFwhjNS+JWzIDJ88FHCYxT0OpnclbdwPX79Rs3jfL1k3SWZOjU/S1p3Ud9CryVIzXP8hJH/x5Qj3wFmSeIze0/WQUnbSMqRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njI1lNak; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njI1lNak"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-227e29b6c55so12690355ad.1
        for <linux-staging@lists.linux.dev>; Tue, 29 Apr 2025 22:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745992624; x=1746597424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seto0EvwO9CguWWdu55KVw6IwEcNBbzxE9pkjuWZDxk=;
        b=njI1lNakcOBEvzV03WDOPx8FRScQs0uFtKEoMpbIeI3gN19nh8WHmHLuKp3/p4F0VL
         fC/MSDLPZPg5BNajajTFP8c7lacI3ugvkqQHvG1pubLJ8twWZrjbBRyxauynprXcLSgh
         rKiVBYMqK1FH/ucr/zsDe+XUFjWTEh6raD7m9I+U9txuAbRXHYp350+XkMWXvlPg7pau
         ApM2UzpFYwrcGohdm/ciFhBR/asSlb8sKQs5+9JsiM/Er8YR5CCNxVmaVVRCtKu0sHnx
         NXWJ804oX33JxYTJzJ1UoGiFd2SbnFHFxE2wVNlnFI+iRom26ssa0FZq87ENFIwwb6Km
         N4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992624; x=1746597424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seto0EvwO9CguWWdu55KVw6IwEcNBbzxE9pkjuWZDxk=;
        b=r82y0IGlZua5E5RhojQt10jZzsR2ZDdQqtsjV5ySsajguvKg4SVw0drOm6yzSTzChr
         nhwewAMD2DUSw/iPwiysAdX8G6QL++tRLSyThE5+x1+ALqLCECqymdyUHAnxv+xazm2V
         ksZYY4vRSIP35/Uhzwc4fK0uBAPfpW5J62V5h957iNUybFFCdgfEPeP9qL+D/1675ZLW
         3zuYeUBuQNmf8Jt3Jq6ZZVPbDnEuQML+mF30q6ZM23ij2z5xoHdR8R+FcMukUi2uxp+O
         Mxu73ALhDwBFVT6fLws1/Td+XpXDAVriV+Fpci3LI0Aay3ZIqu8Qhn7yvbVM5U9aYCyT
         v4wg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8vraUNlVa99znWNidu2pr09gMEsE+Mixf4q1R2M7SV/VbrNKsLM0Yknqn5YJs66jh7HvOgKUMG31w6Um@lists.linux.dev
X-Gm-Message-State: AOJu0YwgJUcEMhlyePgUZ8O2S2d5cTBW4JB9U7/i59tNtp0y/00HWusG
	r9SnmltpBkUT/GJHTCQNxm0mUo5lYjTz2i+2Db3p7DNfL3IJ4yWY6PlCZvaj+Tk=
X-Gm-Gg: ASbGncuCZZxGYWtlo/IEeERjgjWLJilT14eHB80wvkdU1kcFU41WW9TndciH59LEG8a
	NoWQeVFZg//ZvWF9qty9YUXRVsywf8etU4gz+JD/YwSmQFBDLUbdwzrGd52mD0DPuhCIu70lq0M
	/Z0TpmSYubL1CLpuBsbQ0ELZkF9W9rdwtRu23isoWnylDXbfRvQqfsAnfadkqjsfVoV4GjvXMdn
	HJkCCzTfFDCZ1jFUMsTxTZuVPh3qS4Exvs/guAGuWdxBpthhpDTiG4nuKZPotRsv9gtgYfuFmwh
	MqD+P+E/de0yQ8OMKUMczyVdP2kfAT+Z7RmYqaasY38lQqUz6nQBSfXHPrYbbizAGC9dd4uU9p2
	pEGuZg58qMIjPZwI5T1yP6R1xZQiBjgurHH3inTwNpdV6mdc+TIeYB+RoDwtXEhLYLA==
X-Google-Smtp-Source: AGHT+IEXnD9wHiSCGCMkKbOlp7xQ9e5zytOGDgtWJgQa2i3lIm9DdLbVfnfIdtD5AsZa5jZveAeOMg==
X-Received: by 2002:a17:903:2cf:b0:224:8bf:6d83 with SMTP id d9443c01a7336-22df57b3ae9mr7884765ad.8.1745992623808;
        Tue, 29 Apr 2025 22:57:03 -0700 (PDT)
Received: from kerneldev.localdomain (162-225-124-171.lightspeed.sntcca.sbcglobal.net. [162.225.124.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221a82sm113383895ad.257.2025.04.29.22.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:57:03 -0700 (PDT)
From: Eric Florin <ericflorin.kernel@gmail.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Florin <ericflorin.kernel@gmail.com>
Subject: [PATCH 1/5] staging: sm750fb: rename sm750_hw_cursor_setSize
Date: Tue, 29 Apr 2025 22:55:35 -0700
Message-Id: <c465a42743c4fef0853ffa7f7c304dc569592d3e.1745982772.git.ericflorin.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745982772.git.ericflorin.kernel@gmail.com>
References: <cover.1745982772.git.ericflorin.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename sm750_hw_cursor_setSize to sm750_hw_cursor_set_size to conform to
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <sm750_hw_cursor_setSize>

Signed-off-by: Eric Florin <ericflorin.kernel@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 2 +-
 drivers/staging/sm750fb/sm750_cursor.c | 2 +-
 drivers/staging/sm750fb/sm750_cursor.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 04c1b32a22c5..47c84331e3d9 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -120,7 +120,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
-		sm750_hw_cursor_setSize(cursor,
+		sm750_hw_cursor_set_size(cursor,
 					fbcursor->image.width,
 					fbcursor->image.height);
 
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index eea4d1bd36ce..3128ff3f4b70 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -57,7 +57,7 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
 	poke32(HWC_ADDRESS, 0);
 }
 
-void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
+void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
 {
 	cursor->w = w;
 	cursor->h = h;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index b59643dd61ed..edeed2ea4b04 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -5,7 +5,7 @@
 /* hw_cursor_xxx works for voyager,718 and 750 */
 void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
-void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h);
+void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
 void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
-- 
2.39.5

