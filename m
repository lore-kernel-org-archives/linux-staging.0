Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C073B8BD1
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486918; cv=none; b=U50HRInWongjLrB1taSX3Gt4fC0ttDkBrn6iENvQTGAt4b0UMgDk1HLXhwPBIhFFFQ9XO+L/b6JrPJaluluaFSHcBi2eRscgBEojBAXDwxlJi0qFVJOJGHQP5BVtegMMFTCiAwhaWOXRMEoQzsZvf76lvkgmkYa4Ki9lZ0ehAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486918; c=relaxed/simple;
	bh=eQOoN0zx6Y81E/oUIb68bP6hBGsy3BKYjbycwBKpYpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BXAjbtL+EQQFhFnR9Cm2/TZ0UbDM/VyTzu6cs/Akk1pBvvhcgMyYH2GiB/dFyyvpiaFGuL1iTRgBVutqiyTIx0vezAOKUmEbeVRW3Khqwb13FUApjyH+kxCT1HSq/vAktlh+hacDI1edtdfeNWiYisnK+2V8bMD5AWyzh2Jy1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT8RbXyZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT8RbXyZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-838d0b7c950so2731819b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 01:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486907; x=1779091707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=acA44VVX+I9la88655Bt3m85QLctRy5mV81bRECaAfA=;
        b=jT8RbXyZ2WeeTaGG6Xb+ksMuPcy8WjJ3BB6gmP70USyw/mVNspnHw7rXILAZ89iHRB
         XUDpGPaosq/S+sIdxzV339I32QfWrc2oksJuOAJjk43EVIyJXwZJ/O81BkfvVGPHdtMF
         xhRqHZtFQsiVbu7RD3L2nIVKSK9dc5iVGFpwTr48+Ho98tLTkT6w+j/dYuHR99cegHg2
         1DEteNZkdn6jZPXHU0zBd0QlYtRgKDi6Fia16fCIMkoop93hUndGL0ifT9NagurYc+3d
         YYb6P+NxguN6kywy7TwgoLPo29Wnn+ltMQxF7uCZWSa1PWQQKXB1S7jUhoaCOnWXiowJ
         7Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486907; x=1779091707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acA44VVX+I9la88655Bt3m85QLctRy5mV81bRECaAfA=;
        b=ieZVSMj5SWYu7AFkfG7uK9yRvbBUmp9j0li33lpcIek7UwFExkzzgftHUjSQHQlWcl
         htDWPsipJKVIgkZ1wNdgA/uSQeBOl9eAlqkr8KEiieCfOa+00hQ7wOib/UJTKeeijCiE
         tlAzdDgDN96bTPZ/orUlHIHawkWf45Y7ZSGAk0SRHd1/5EG8843YdLCf5x9Uq2kNIDtS
         Wq94JKwRXnleT1a9sLYSkdWUcaFDTCL/FfY2BErg5USXobmA1mWYSCMn6qxEPA1ozjM8
         s8FG2Ni7ybj/dyNt+mNC8c+A57ILjCC+0AK/U9iIT+1v2gyYpL7/VBwC8P9/Co0rO+mL
         wooQ==
X-Forwarded-Encrypted: i=1; AFNElJ9F9p7e5+xIeNGW4hf6NHL28YXh8LKiXuB0nJ7AW3N0wrfJvuzcJTV9e5d80e/EeU79zLna0bm9uxbqNNvZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw3j+IR9qih5o9vwJ8Z1iFeef5mmCJq3ceQ/GuCtlniUAFjNgx
	en2djcemM50Z/LHgsI+ZpaEY9Gj3eCqaS/bBelux7spL2q3KTM4lgGFM
X-Gm-Gg: Acq92OFesv0k+lTL5UBwvCDQxQO48w0ICSVSZJm3DWoMDkj8w4+kmvrv7xsF55IVSmm
	tJkCv0NicqdOGOMnz0mz/O3sgh8R3poQw3Ea5hEJE2dl24JQ85SXlNK4GaVyeQS1XHc1AAcDW4V
	EVxzfiFwFUCGFxmS78vEKI6bQoNXHRAYkFcgAOSzHEz6uDAeXd4RoHI4QGipd/SSlWmvPpMitPB
	NhdZKGZdA6qQu6smDLd95I4uO0Ikz9nEBjBaMkq42dHAYZO7y40RmtdZzsFCmafP1c8Y3rsqtsu
	Ynr1HiW1KkC/z0V8EoMAANhZQHYu4NvNFID/76Af+OHCOnAHkwAMptLG8KAUVkM0uwIkWhiGPqz
	Hk1HSKVTDARYZ0srPAoMq3h8ujOc2DEKXijYNeKyvmW1XovKf++ZJNdK9epw8S6XpH21YT59/SX
	fW/kSK110R6C9PIa41kCGZCJ60rhfhrnaBpw6W0uExAeTfAdIZCUg=
X-Received: by 2002:a05:6a00:2181:b0:82f:6e9:d1ba with SMTP id d2e1a72fcca58-83a5df49678mr21145973b3a.37.1778486907274;
        Mon, 11 May 2026 01:08:27 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.211.132.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm19610972b3a.59.2026.05.11.01.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:08:26 -0700 (PDT)
From: Harshit Shaw <shawharshit116@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Harshit Shaw <shawharshit116@gmail.com>
Subject: [PATCH] staging: vme_user: fix line exceeding 80 characters in vme_user.c
Date: Mon, 11 May 2026 08:08:15 +0000
Message-ID: <20260511080815.3521-1-shawharshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap the vme_user_vm_mapped() function signature that
exceeded the 80 character line limit as reported by
checkpatch.pl.

No functional change.

Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
---
 drivers/staging/vme_user/vme_user.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 11e25c2f6b0a..f5e29933ba68 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -446,8 +446,9 @@ static void vme_user_vm_close(struct vm_area_struct *vma)
 	kfree(vma_priv);
 }
 
-static int vme_user_vm_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
-			      const struct file *file, void **vm_private_data)
+static int vme_user_vm_mapped(unsigned long start, unsigned long end,
+			      pgoff_t pgoff, const struct file *file,
+			      void **vm_private_data)
 {
 	const unsigned int minor = iminor(file_inode(file));
 	struct vme_user_vma_priv *vma_priv;
-- 
2.53.0

