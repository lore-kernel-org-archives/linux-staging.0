Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9F32571D8
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150857; cv=none; b=BC5Qbas3CdafTi52awoOuZOiRfLKi3TKD0XKPFarKsrZLkAU37eISNzp3XuIBqylgmHbbMkjW2lqHOA3UpZcUhNDGrMmbLFU68O9eEj6sKJJhIibueace+XkAsfdu7dlC160trU8uz56+o+dJKgVpmz+8zbfTJVoN5PP4D2HvmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150857; c=relaxed/simple;
	bh=SiVbOWZe/96Umw9JJTP6IhACNDyTr4xaMMduXTYLSCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnmEDJUApq8AB8dtdmJA6hA0X5yAk+hafltnJnDGfY4MMKd9R06QxrLHz1ibgzY014DqjZC5nQBn10ZnLzSIs+0oaVpO6Oggr2+81ZtCYhFUB/BI4vF4uWTGAs4xq6g1SkzCUTXCex/k/MeZ4/l6+I8yPCqlxKJEEFikLxGOumQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=IXHHEfix; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="IXHHEfix"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22401f4d35aso69847875ad.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150855; x=1744755655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERsZ7LaPH9EF0px3KCn5mDa4zdfj5RpKAWp42LkC4Dk=;
        b=IXHHEfixKESrCMOszbnIWEPCApsEr/x09rcKJbJlVyIaevB/8s4Jod+vnSNdwFre1L
         CKhzAvxOQpEmJKtQim6qHkYflWAM7GUN9NAAA2vs+kLxzYiRJ5GuuWpAxmJGESY8FazL
         ORBx3UwcCK3A2ZPE2gN9Jg0O8+M6fsNMn+DGrGfs1qw/PmyqKIW9Gp7zsUKoCPWxH7Ez
         T40ege7GHjy5McMrTooJaBUqvZCpF6UXC4Csvkd3EvA10HMDy6QqcFeC6rF3PRJKc93z
         DqU9G7eVnmGpH49MTJFKoX8w4KUmN4TaUKMYVrWqBp9a9AcLaF5MgPOX8QC/bGE5uAkR
         xa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150855; x=1744755655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERsZ7LaPH9EF0px3KCn5mDa4zdfj5RpKAWp42LkC4Dk=;
        b=TbODRDtNYm8U9Icz3MPHJ+88lFSAsOd+vYuLa1+0HF8EvTVkt+YxWjNJ43VuJxBo3X
         RrGJIkUwr/9qlPZXwqxLoWha5pOxavvbYAhEpCIvlaAxsQt+pIfe2XeXGfGGS2EOzdzg
         OEOW/uH82hmQCuTLknwM0sVjJ3HCZzSJxSVZjJpsfCQaJMIr51nn2Oxu1wY6cngEY8Sr
         Oo5B0ocWclqTstLitlMuICLmaPmwAFN7jobwKGLw1b+Df4HfNapNXa7hQXkQAHwwhwDl
         c0aLj7qqabUeBUX9A1a/owk/GV/+lAsJ63Cn3U6jQ15a7WXvzFXGcuIJSDh2XXc1oyMS
         zumQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRSupNAoeFc5YMxjU0a0XhYyAsTcceN8Nxrj3zumegiDFb7lYfPkX4pCSA4h7AenCAb56z8Y/QTdz5C1sy@lists.linux.dev
X-Gm-Message-State: AOJu0YwYtYb0vOacyTDqzSESih++If5h/O/pKYLe8jIIq9nxS4pPVNqd
	/sJJKVueVlXCPZutHHIuGCU7ypyOnnp/mZKrAfpdKuAQ6olb81RVB8MaHxTBXsiLHzELYfBGuhk
	=
X-Gm-Gg: ASbGncv5bG48abzhkCeYC+d0VhmSI6Qr+LlCt5VmyPTLpOJ2kgr0BdBGpGJVFACuas/
	6rKJTj7ZK/Yjf7OsGHihNtbxsqB0MjSm9cPBN/12TBFX8DsViaFA3ntGWcueuvqXhIh5ddKpZCz
	+sUaSlUABN4AoBIf+0lpFxjPIJAuq+RyHcfAahStrKXvUZBTGe1pKMI/PGVV99Y8fmkci5KVRyT
	Ti1zt1lkM9nSHIwx4+7s2xqW2z/4clLVXZM8Delfew5hFwFGbk39tIFqZJXLQOtmOpcpdO7A2U7
	MHJVR+ZmaIvhYjcYZcl70uNU6IY4q0dgTdw1knQpkQhUCRrIaEMuT6PabnJZq9SNJjyywgAEO4x
	6ke2wmKqlS+s8fJHg9b1k
X-Google-Smtp-Source: AGHT+IENWxG8nUy5YKs94+WWP546/fjQ0DvxUsIJil5vbvQG4ajvr61NBzhqFV0rmLwmouYIT48Y9w==
X-Received: by 2002:a17:902:f644:b0:224:c46:d167 with SMTP id d9443c01a7336-22ac29a7d25mr12909955ad.16.1744150855114;
        Tue, 08 Apr 2025 15:20:55 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad7fcsm106309705ad.4.2025.04.08.15.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:54 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 09/14] staging: gpib: tnt4882: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:35 +0000
Message-ID: <20250408222040.186881-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index caf53f8ded2e..3b29f541fd49 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -539,8 +539,8 @@ static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return retval;
 }
 
-static int tnt4882_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
-			       size_t *bytes_written)
+static int tnt4882_accel_write(struct gpib_board *board, uint8_t *buffer,
+			       size_t length, int send_eoi, size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, send_eoi, 0, bytes_written);
 }
-- 
2.43.0

