Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDBA3002A0
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 18:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778438048; cv=none; b=DfzAINSIDRiXKtf21CNsb3pPlvrTHhR/3o5odOdWEjRGoQypeAGYyYK+HUebidpSG3hiXXSerb60m1VKC3UfTxz4gVH2soXk2Rgz/e1D2xI+pDUQcnSU7BjG0QKNgHTx3OYt9wCK8bjzNqatffxqYFBBNczHTa8+Y8BTZYHwF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778438048; c=relaxed/simple;
	bh=Zg6SVDDKvcE7JCk8W7cr26zyhco5Zrp476V/CFpYGSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pP+5/Otuuc5QK+3y4CqW+6hM2imQVbq3559kR5HTkEKvkhi2Jfew0zIxFqSRcDxh/7fqCpI5Zg/dwR5CSQ8epAc5YrTH61MeyENHE4c0OM1a8EginWiQ/9ftA50OPR5JG70rXcAyAS6WmiopV6tvJO960pMUL4S0A+YdosFseIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiprdyMY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiprdyMY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so2011490a91.1
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778438046; x=1779042846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcZLN5tw+X8R85os6tRQwcfxcyD9HLWgR6Y/iIZle0w=;
        b=fiprdyMYjo4+lDNJgJoPxr+gG9ap6LN4pF/QDjO1MksVObnf/tkLj7mEm8CSd5Hm5R
         YjUEospvHL1zUU6rOVkd/IUMLhBVJnmbQhwUszNV0cgmx6jhpScZe76yVQTfZqCE6riM
         621vSe0OkFsguNG/G5wiUCQDc+4Hp9EWkVVx8maEvfXa0gMD+eHFgPQ/BIfA7XVLtfvr
         0mdTWKvSi7BLetSTwbfV6e1zsZJIX4xKk3lmEzQRz07FsnBuVFSKnd/TVA2YX3qErj6O
         Qrcwt7l5F7z5QR64+DX31hAiho/EuScCcPMdPbfB8DHRIhYQ/HIULHcmwAnTcaWBlxR2
         fduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778438046; x=1779042846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcZLN5tw+X8R85os6tRQwcfxcyD9HLWgR6Y/iIZle0w=;
        b=P39tVk7HrodsV9r/QSPxZjFNqUB113S6kj40X7/vlNWuGc7P0tSf5gJ0R6CrEAe+Qj
         46nxmGUtdQGBjB6czTTi9qGGtwNm7kxtUneZ0FlgIkrLpf9ZPHqtaxHAwnJp0xF+WJtb
         f/N3aO/pNLm/8BA0WcIxBaUrTZjutqh0Ujs8F8cK52QC2O0tWGsRjX97o62nax7sHw0J
         RUUXTWLeQi7BxNd8BAHIfIyvBzrWblOr3J66uCUUDrjl/U8KL8fY4w05eVr2O1qcPwAT
         JD3CQJ49fBaZQ3R1hag/+PojwTbcC1DEUVFfjFO2XWfKzwUVvxC3ORkHQkKyb6+4Uf7v
         sTBA==
X-Forwarded-Encrypted: i=1; AFNElJ9o9hSqwxJ4XAl32G4P1Ww9H2xZXEID2TP5uDD/50hkLkrIxWxWm0x9cUPKZYxnmVIyvoWbYCN8/C8/FJZV@lists.linux.dev
X-Gm-Message-State: AOJu0YxYSYgQpAqmSDpZaMelcyjszvJ6zh+6DW6iJwB7KChiLO7nm4uw
	9tzLBAGKB5M+T1qItQXtQLKU8lxKD0eAaMwF8qKg6LP+E1ZpddG9X547
X-Gm-Gg: Acq92OGg2Gfj2Dl0DyLPDyqx1DDmro9CsFSB0ZVxgnbDUK3SXTDCvKRhc7lcS0bTnyW
	n/nvwPvXQj3OrMO2YdEBss0yaQI99nd76mVwZpSX3bK4xRkD+JZL8QiqpDZH+C8YwGynSHdWl1Z
	RTDbjF2wG8l5khC90edKAxKnrndbVjNJXd1ojCkxu3Zia5uf2I1FsCkwnuyPjBYcY/yToMFCC+r
	lVe93tR5AJDwYm4W0elyk8XQ9FghIW5mqp2aMzr/POWUnwkf0BZK6C6Rmy9JeHz4y1SQ2OxIQaW
	erbs4j7fqQqQRPN+WxNPQLLDjrdAnEr8aYgX8OaB09fVDPMB6jqBXS6hvwx3+hZsokw5OVxYdPL
	3qAG2ik5uj4dSBnqQ1guVP3gjsxVvnZec+AmId6+xLbyD/wKksi5QzZt1bOmyFtE8oKVOFz/cve
	vUU4f0wNVyuvI4LDJyPYmLD6ZSPKvSSBDwsA==
X-Received: by 2002:a17:90b:48c9:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-367d487d1d6mr8101221a91.24.1778438046273;
        Sun, 10 May 2026 11:34:06 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.175.63.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fa7asm6252858a91.10.2026.05.10.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 11:34:05 -0700 (PDT)
From: Hanu-man12shaw <shawharshit116@gmail.com>
X-Google-Original-From: Hanu-man12shaw <harshit116@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hanu-man12shaw <harshit116@gmail.com>
Subject: [PATCH 2/2] staging: vme_user: fix line exceeding 80 characters in vme_user.c
Date: Sun, 10 May 2026 18:33:55 +0000
Message-ID: <20260510183355.2345-1-harshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Hanu-man12shaw <harshit116@gmail.com>
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

