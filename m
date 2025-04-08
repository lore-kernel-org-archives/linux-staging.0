Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89E2566FF
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151117; cv=none; b=XEzmdRQCBwTe3gSsL+/nyPN/skJvCAMzPv6ge8sSP3063yJInJV1pwd+9oIBe7HuRJhen7h0S+B0ir6+KXOlwAO71ciFRDZHrosTAK+nO9n09B1b1YBT+d24XWCdqPIHeE32hnxbPV/XSdicmE3VgbxSWAnL9godlyh8e1gpjgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151117; c=relaxed/simple;
	bh=fjSwQt/2PS0/uHpddp/9VfHp8MHyRBleAOyBrzxHfS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/uT3iNbxOTYfvNPd14nhMSPfDCbCrm1HX5w3R2n64tX/nSAByWYYr9SnqUYWJg4ohh8dUbGN3/2EBXFB2ggfdPviJZivVDLj7HRp6qDs/VM6OXnFX0VO7xiNOpSRauqOzKCs/i897oxteE/fgwt3S4C0ptyIIBcsd1oSxHNplg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=EkjaPXfH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="EkjaPXfH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739be717eddso4812133b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151115; x=1744755915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89A+ZPD0F+3yWuCAaFy/tofDasEkWjCiUmF02vN16R4=;
        b=EkjaPXfH9QPKh7GhsRAbsRpeOaqdasZdLe9S+w9VdWBcaEVCM4MGA/baR39TQ8x072
         nMriOEHECOh69LJHw3lMS00XzC5QfMfjTfkOX0xLSqoHnclO+uGv54WY/M2p+nt/Cded
         P7WgA9pXRlm2uPUF7tQ6DUVKpCouZpigcHcVrgDUN9OknDtNquqj5ZoqPi5AbQt7Hyub
         cgOfkV3zLEKdQm+yqFx7SkzFRLQSAAeGVltJ2d9AEecg3QiVQnygu/FiQwwr0f1jGqMQ
         uI8ObqGXsBUiyzGcEzVHo0oZCoNZHvLfAZpuiBKwFfXFCCqf0qBl2eMXLJw3yDZwYgec
         9LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151115; x=1744755915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89A+ZPD0F+3yWuCAaFy/tofDasEkWjCiUmF02vN16R4=;
        b=mz3RHF+yGbJAPX1LyYTWerppM2O/UfcPjyYuyDmsAwfqU7PoMkHaQCkmansRUYUSKe
         W0f+P3JBHaGQXLM+JRjFfzM3qAWWSr9J7sJ/Be+ppx8V0UeKlIsCuFh144rRHq+VQ5od
         3gvg9awQR54nBhzoRB6lWSBFbpfHIZWkkGu6cVi2W1lOYessVLLzopAeQfTO7h5a7MUX
         Pbm4ZUhFe4xgpTEaxby4yr7vq+gDZ0ErOTC4o/RJzsiv9T5wPmfQxug/fXdUG9C+pAYI
         sULBK6P6orsH0Mr7Oe7EKNRa0Fc4/kNHZeNVc3pBlgbSG2R8zZqV+4+95dKdxznjuI7U
         WExg==
X-Forwarded-Encrypted: i=1; AJvYcCUJeTwd90oIHHYS36rHB3pfeKfeUeD1EgQp6eBnlecnVcsLTr49N+9mS8Z10hyWKD+w+SJY/lMyAC3sue2u@lists.linux.dev
X-Gm-Message-State: AOJu0YzqX39dTJCA32uoy5U/8ImaZ7g6zhYXNuyJXdptAQYLtLSCJV5W
	HP5QTr/jkkz+p7xPvCjj+k9CmFuDbVvJDB3Kjma9kxuTidYfJefTKWakNJaU0Q==
X-Gm-Gg: ASbGncuyD/ONaiadwwzG7fms2KnrDMJzvJgH66sAE71iEZ1bgAOTtADN67YE+LUWEV5
	9waVIWCWlE9rwys8eHZPvDjWAtOEgCx/dD8adzJodm8kfAurqWMQRod1pTIeyn+lbGOd5HEixg7
	/rOmxbcapMpeLs2urcqUp/r7tPHWU7bc57C9b4UqlAjPWjTmv+PHO7ZITfMj+tW4ZqPsqWneRKV
	BC9Psn7WI7NO1cBsyncxhs+dYIxDZZsjTvc4PnS5BF9LdQwiLO44HFZIhakuk6hAaiZlxzU2V6a
	WvDlkpO4hlcLXsGvXNri1r6xintYBmmHx2mcuY8Av7pL1vULcspzCxP2TYuhav7ymU4KilT3weT
	jBpGwBwH0iA==
X-Google-Smtp-Source: AGHT+IG5juhMHsu1LskHss9Nad7vpK7FAPNQDk6C1pXafcAf9b9xsbrt4eBAxXA/2nIyF2WtAbUalA==
X-Received: by 2002:a05:6a20:e306:b0:1f5:8678:1832 with SMTP id adf61e73a8af0-20159195629mr923643637.11.1744151115097;
        Tue, 08 Apr 2025 15:25:15 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b9608sm11165505b3a.154.2025.04.08.15.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/18] staging: gpib: cec: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:51 +0000
Message-ID: <20250408222504.186992-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/cec/cec_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index a822fa428cd0..dfc718de1532 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -188,7 +188,7 @@ static void cec_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t cec_pci_interface = {
+static struct gpib_interface cec_pci_interface = {
 	.name = "cec_pci",
 	.attach = cec_pci_attach,
 	.detach = cec_pci_detach,
-- 
2.43.0

