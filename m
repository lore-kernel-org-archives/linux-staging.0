Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581993E9C2F
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 10:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926519; cv=none; b=I9slPwaH8Ja/TGP9Ycp48xjgvnDDQtdXumEbWWwjfSA/t9mafV0GxbikhEfy6hguOd0aciUfWnzZBJVIe6y4/mmqCTgJDcqQ1GU/BlBGTuWeix+mafjpmvTp4L1lpbxO+LZb3YIaA9VP0cxYjr4yxQ5ZCuGEDLFyCvnZk4qFE0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926519; c=relaxed/simple;
	bh=NcvMeq8r2tEXY1Cl5oLv0fEfY0jr7U7QofOmnpgRwmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e0X3BkX9yBa8MgrnTsbwX4ZRNOyNql6LTb/+0l56LT2b8Z3MMJkx2eCobKRuLAyJxqu0J3U3WBJIi4jQuP9gdlzlWt5ahCewCjILKOXz7bu/ilrzJVBXiMOpmO1r1NCQi27Jnxtyksy0zLP3c6I3sDx9CTF2AzGZ34gfCCssKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMOxUvzM; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMOxUvzM"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so6901401fa.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785926516; x=1786531316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5Z/vNpb/mqpr+RrPyT3Hq4F1Nr59z8xlGoFh+aM+wg=;
        b=hMOxUvzMEBKFyWQZ7Bc0gg/wQXJofEaZ379daiJV8sVh51D7vIABeP0Cqn3dk1CPQF
         LE7gc9eX/EwhmIz6siK7hFsYvdJLFnUB+bw0E3wnMaplCRSOpr+rZKecgvymyfjyi3Bd
         1uOTaq02GLjsQyVKFsfnGlspw2isSbi6/GG23YtPbZvZQhSOZcjvsg3woSfJ8tZtqLgH
         Ig7M7Ee6C6NOfkvk/r82b5CLcTjiCX5A6OCGTZIkJdggvuJLe1PkN40oBoXFanfpNiSy
         1Fp4o1li6An08mXqE8Mb8T/mP7nY/H+8lijN39sqniXGI8BVj2ZVwX/6aIy8J3cLEoYM
         5JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926516; x=1786531316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5Z/vNpb/mqpr+RrPyT3Hq4F1Nr59z8xlGoFh+aM+wg=;
        b=YeX1Ol8/eIAe1irSgMONsIqajke5XayqwkDEaObI8my+BfLaRiH26b2etz1QPFJbVI
         XqVWH6Bd65xx7ku6NobFSc7UHA0Qj9QT/PdppBBs5Bk5biz9Nnovn/1fTd0FLN55Qysp
         ioHtTeZgf1gNeNpS/DQLe9nu3/OSGhL5wSnMHbvSyAdboSpy2Y97DStMRmCUGhsKKEb8
         kR/vyd+JChozVbz7i3DxKyJpBECRUiwhX38OU9yXw8sZLEpneHxqoRhYS2+AFNogajr5
         JMX87IS39d8wF4jhtXEoENxc12KtIJMneecpDPqhd403NQ2LRAliA8HPVsrXXeqnojGm
         wzMw==
X-Gm-Message-State: AOJu0YwGilJP9yczPHypYxByuK7l3IkWh5YAfWcoePvqaCwQ9cLdVEWl
	10rd/1+TeqJ+LvbxikvIMhsZMSawpUJe8SCxu2KB2Cy9iR+L0AcRFAtk
X-Gm-Gg: AR+sD13BwjCpHbSNjw1jydaesnZmySPWBOp4+kBXKZ8sZ8HdmOE7+KTxVmrGd7Vlgv/
	3gMqYYzbUpdATpdwUg9eoOC3fqGPNzsdqXvppoNRi4lkCpQxQj0k7Qmz8Mw5Ic05JTiMs1eyIjN
	9x2s3BvHqA3FhVfHeYp7w5nK+II98Q5+29LHNgilsbxgMe7CT6T3jril+hGmkhNTSOVChQWx6gb
	jptZVNSu2SZg5AvTgZK8M1Z0CpReMNYwngJpcBJWV4pEiDI3BuXU2M4nxz4bBIqDN+Fh5EYJ4oV
	BI36Pp7boLLySgVQgciqRpLlmGf3mRPDPcdiFCZWTvS15ykVHu+EXCNyLjqle3ncfWRs26yFtFK
	PToKmX1VHVdpeLgDnX1nwLFuz/B5PP5mPHW93/Oz9mQ5wERZdGilyjLUqIR2p3wnrf1jr4dYzhT
	v3eIXspLpD5QEsrFZjWzQRarOviQGzQL5bQNk+N/k+3iwbbkA+nUg2IzsUREe4QjcXB/Hs4V1ve
	kjN
X-Received: by 2002:a05:651c:1586:b0:39e:ea4f:4202 with SMTP id 38308e7fff4ca-39fbb262b33mr7082061fa.31.1785926516126;
        Wed, 05 Aug 2026 03:41:56 -0700 (PDT)
Received: from debian ([45.131.118.28])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a35227sm8508141fa.35.2026.08.05.03.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:41:55 -0700 (PDT)
From: Andrej Dusanic <dusanic.andrej857@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrej Dusanic <dusanic.andrej857@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove duplicate blank line in sdio_ops.h
Date: Wed,  5 Aug 2026 12:41:11 +0200
Message-ID: <20260805104111.115369-1-dusanic.andrej857@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl check:
"CHECK: Please don't use multiple blank lines"
in sdio_ops.h

Remove the consecutive blank line to comply with the Linux kernel
coding style.

Signed-off-by: Andrej Dusanic <dusanic.andrej857@gmail.com>
---
 drivers/staging/rtl8723bs/include/sdio_ops.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index 252b0e1646e5..71a45b989fa5 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -7,7 +7,6 @@
 #ifndef __SDIO_OPS_H__
 #define __SDIO_OPS_H__
 
-
 #include <sdio_ops_linux.h>
 
 extern void sdio_set_intf_ops(struct adapter *padapter, struct _io_ops *pops);
-- 
2.47.3

