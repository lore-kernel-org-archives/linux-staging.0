Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B18B1C1F23
	for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737532579; cv=none; b=sPSUvuXzZboXQnSOtE0rI2kj8J8TMJ0an1w7gA8eH5uP6jx/GIm7YdNSnaeIMBu4l8yg4eyjdwR85ayFRQF9sCb7xJoxCCHTvmO2u4DOESXTpyyKFHIfblLNZmQzuM+Da+X7i6TahOMU7fSqWSt2w/iRnQWTRst5sKsq+gCvnoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737532579; c=relaxed/simple;
	bh=/Fxv2JtExRqbompYD7DxopdeoYMAmFs208nqIqyZr2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUW+k1uTyeHHutYdGoVe8xAebBf8COH1cO0TlFEsMlBTRG8DUdd/DFbp2FaIo/SBnGIuPZkT/pbTu97qj3oAeNtrlRo3dqt7xlgXbpvQ2UEI/b1Grb3VozcwXqrV7wKmvoH47LOyrXKAhe4wBhBTo0UOW4zG+rU6x0b0SA0z+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/haZQES; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/haZQES"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so8868423a91.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jan 2025 23:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737532577; x=1738137377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f8RKyK8Rw5AmWg4/nWoSnA+iuCNtoKxRRgaqotVjYXA=;
        b=J/haZQES/IgMFLZurFyopPK4zBkuWwleRUV+/L8a9g7rNqx81mDQcLov9sgq1IT3+G
         Ap8IYu55j81hfCdrNt1p/4NNptACZ1IxiUwcjF9lAUtsxGgSYXxWHZDoRIYxkxgJYhAj
         82C2rPC7Hc36S2ALdELtdnXNwe4PrJG1Mc5KWDaRV6QOqQBxA59TfKsOr5ChuidMixD3
         vYRjIGgIC1QVtIlyuf+5Js+LUbzIO9ibf65tf4nArJ1WYfTu+xRxTldVU3R2SR+qREz7
         NznIG/DL5pSKF20sC70U68Vjmp9qe25qPttVbVrX/e6jBN8yTkaW42fio61fvYFCBu1E
         cVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737532577; x=1738137377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8RKyK8Rw5AmWg4/nWoSnA+iuCNtoKxRRgaqotVjYXA=;
        b=gBCJrRwzQz9cO2J1p251cCQTAVTkcJq0PvmVXHbLGAEB2Oo3RLqlTeAHHQkp6GwOzJ
         mNFH1Kj+oipUxq11vX21kGgx/tWy1c4prM4AFEe0l2gz1WrcIAhGcjrjKmauGMZ4FHcB
         BxuvWCXp1SSI0npbsOXjVPDGjuCBZYWF4QhNo5sFOTx8bVdLaEqnAWsuFmYTS8JPkHdM
         PsE4U9vQKckbEHLrRFsawGk2HhnbHgXhULNT2O3rLEysjuK1Lh3m6IEIGYX0j6EQBwl3
         ywOWdvvXEM3kJXk2jtvCo28uzFq6eSt5tzhdzL/M9L/c9mSk3Ocl1BntJUfM4ylsXowd
         r9Xw==
X-Gm-Message-State: AOJu0YxTteQ83tjyUftayJhzOekNTr5JugdRhx72vfz2TS5X7NcjrObU
	Z4Rh+ev0nnvna28DHiSGKtYXgGgdCNkOA88k9OEZGw6JYe9Px37U
X-Gm-Gg: ASbGncv9gEd+wQb9lbwBZsCNOJpstATHXj4vID/HfgkNCb6HJslYKi31DGFQYKd1hCO
	n1CQXn+QYbf0/WIPRE8Ky8iJr0VJe7GEKgwD79JXk/UqmkwG9cQCtr1iI+V/tiHWL3OfLUqHO1v
	Tr+gdiV+pOZ9PXZwwSV0o8ZE+AjNP0KQp3vzXDMPJOx9B425nu6Q6IW0LlVtObZX6aQJ03l7Alg
	zkX99jwK3lADOchK4fAiWUOQB4fQ961y3WmyE4AhZtbG7LH/8OdICQpOlpPR+witjkcMBWlSdo=
X-Google-Smtp-Source: AGHT+IFGKN7uDM/wQ0lPbZ6gVLar/SttsWQVpGPZ8e35diEBxYqc5+MoOGAEfR2yJlahQ+elCRqRZQ==
X-Received: by 2002:a17:90b:534c:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-2f782b01f69mr36715608a91.0.1737532576885;
        Tue, 21 Jan 2025 23:56:16 -0800 (PST)
Received: from virtualbox.. ([103.16.71.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a79a9bsm918156a91.17.2025.01.21.23.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:56:16 -0800 (PST)
From: Ajith P V <ajithpv.linux@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: gpib: fix prefixing 0x with decimal output
Date: Wed, 22 Jan 2025 13:25:44 +0530
Message-ID: <20250122075545.33146-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- pr_err() of pc2a_common_attach() in pc2_gpib uses 0x%d.
- The config->ibbase is of u32 and correct prefix is 0x%x.
- This error reported by checkpatch with below message:
  ERROR: Prefixing 0x with decimal output is defective

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index c0b07cb63d9a..6a1c0cb1d0ed 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -505,7 +505,7 @@ static int pc2a_common_attach(gpib_board_t *board, const gpib_board_config_t *co
 	case 0x62e1:
 		break;
 	default:
-		pr_err("PCIIa base range invalid, must be one of 0x[0246]2e1, but is 0x%d\n",
+		pr_err("PCIIa base range invalid, must be one of 0x[0246]2e1, but is 0x%x\n",
 		       config->ibbase);
 		return -1;
 	}
-- 
2.43.0

