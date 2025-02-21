Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471811D54F7
	for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155049; cv=none; b=W21lCvOOXCmqbsrowUC+ztZYVJII22SLh9E+PMdv8+VedHQkQYlH94p8Mpdyk3YZYwHvHl9tW3TotmrYBVT3JPAQUR1VfebKCvf5LrKdQLGS+xba3LAaaN/FCt5R20KATh9Za+iDEN6h4zA64v2KBD0minRf/Rnq7ry7W5yBE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155049; c=relaxed/simple;
	bh=S42VEDXVz9SDKKgFcIHAWaqDHqsQdQy6R4zhiBxiNiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1SdVm2OY7/hizpiaHiPqA86kfyxu6/YbQnylRmcUJ4nPAQywbRX6xBElw/xysLeiJ3c1pkq+ywuPevj+pXky14KgdYmZYnGGoqR5+ek1jTGmB6Z+QPV53dMBM6CSagQCy8KySUCQhcDtYizn7M4XREMcs6n+peehHNXELHaQ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUaKmBE2; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUaKmBE2"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-220ecbdb4c2so63156185ad.3
        for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 08:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740155047; x=1740759847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7niOwmDgSgvTHiVMtFqKUeR7FmrJKPDgfZyIEaZPhU=;
        b=aUaKmBE2Ccn+E0cstCCZvv8+6dCQy45cKBU4/q4xcGFkXOHOEhInV8MYUn7OQFjZBX
         ifpfDpvFp6a3YDyp5BstdwiJkBveFf0zZ5q7NgzLDZBtjGwKRbvLTKM0mc58ko3tANfV
         g2ILJFUe666D2IvdfpiAnraIMY4pvo76UWurGueSQpIvSgcWPEWdqk03nKbi9fOhQRyn
         pVwvRVjXpZhCPU0EntZ9HqpA3s+bb1EeYroNj//ab4Z0Gr+nZFLsCnzUNKLcnDo7YieQ
         lppAEPsKgaHVOdCbS7J7HtI74Jyn5iPXYJD6u/SAPgGaMuHwLC8lqi3mRQeHrSfvcXb2
         +I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155047; x=1740759847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7niOwmDgSgvTHiVMtFqKUeR7FmrJKPDgfZyIEaZPhU=;
        b=StTc6kEDgBIg63qnoKCKnQlzthK2duPnxCS6SKH51sfMP5IaFp5qPiSvvZeQm+nLJS
         hFrL/RRyx5/nEBIpiZtcETj1gs48hgxGgNbZvFKvE0AKrd1wwdl1ac/FVHP91MVFw7pl
         R7Fzf8F59dxaxyFNClCfRqwSLV6Shvas/W5oU/Rc+HLnoT2AE09ZQ3bnR/y3QtUysRG8
         MxycCrh50I1yibNZyFlOSnMvK50C2/UjDLnf/dXG/yVAQomPQNt0lzrZvw5UjX5Rfav+
         ahzWK/G7bM0e2vWcYGCn4X6vGjNUe7jyAtvVHMoVVJmKbn/UscUaiqnXIYqi5f/qveca
         9kUg==
X-Gm-Message-State: AOJu0YwYWbzHiier3wuELfnV/u+3ncWZbsw6pY8G4jcW6Y+lAWHI8AuP
	rrfO+aAg6Er4zTm+M1IW37uYdKyYkHQEyFCcOb3ln5rgUto2Qrz7
X-Gm-Gg: ASbGncsIibiJdM6VgSPuYgtq+Gf67q8FdNmrkSGnovrlCnZ32250NYsuzrSnLyS0YZl
	TmGz84pZyqjG6ZW2FInHYntN3PvyBWuShmIujBgnL8NmbeV6nnuhLiV0VfT5lr78FjXmUzrz2Al
	5Et/WbH8Qh70PXrzfsxBs0h2CHmpkpKy7vUNb7nmK0FocwR/nv5wn9owIjAss0HZH/+bchzSgqI
	C8sa0WHv1IxxDchIcyWo/3mXnf/S4VJ5x6dXs/TKHX0gycl2HZNaqQRBvsvitxPLv1RkXS5qNBT
	fPeaOEJcBzpaZD7UYgLMaVGhfN0gRj4ygYwO
X-Google-Smtp-Source: AGHT+IFa6u35srflL9gb016qqxixWBZsztkue+dJYqy8+vJfV5rQKbhF2ojkYXB6/MN4EMaGHC1lvQ==
X-Received: by 2002:a05:6a00:1813:b0:732:6221:7180 with SMTP id d2e1a72fcca58-73426c943c4mr6434262b3a.5.1740155047355;
        Fri, 21 Feb 2025 08:24:07 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7324254618dsm15948797b3a.26.2025.02.21.08.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:24:06 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH] staging: vc04_services: Fix function call formatting
Date: Fri, 21 Feb 2025 21:53:47 +0530
Message-ID: <20250221162358.53913-1-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

Adjust function calls to avoid placing an opening parenthesis at
the end of a line, improving readability and maintaining proper
kernel coding style.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 .../vc04_services/bcm2835-camera/controls.c        | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 6bce45925b..d00d910989 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -533,17 +533,15 @@ static int ctrl_set_image_effect(struct bcm2835_mmal_dev *dev,
 
 		control = &dev->component[COMP_CAMERA]->control;
 
-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
-				&imagefx, sizeof(imagefx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance,
+						    control, MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
+						    &imagefx, sizeof(imagefx));
 		if (ret)
 			goto exit;
 
-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_COLOUR_EFFECT,
-				&dev->colourfx, sizeof(dev->colourfx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance,
+						    control, MMAL_PARAMETER_COLOUR_EFFECT,
+						    &dev->colourfx, sizeof(dev->colourfx));
 	}
 
 exit:
-- 
2.48.1

