Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99735289806;
	Sat, 12 Jul 2025 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347634; cv=none; b=oU5DOZDzrAH9rayS/wjXuJrqXc89lu7/x0aWbTmbQSpAO2fa907trq3M+8rAZxo3kLIesBh1o1RXavqCOY2bUem1OS8HalbCnW/O28OhyWtYbk68vCE34E9LN1Xs2Z+kxl/JM88Qz/MLMQhYrWcP2vANrDjg4uws/NIzJsnInx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347634; c=relaxed/simple;
	bh=gVkFMLfDZNAcblb5dwn0J3mL9GjMWVi400R+BI3nj1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IOZK8WRej5dcb6xF2h0lQt2O6nFcE+VDEfvmf1XkJkYPsl3KgL51qnxWfmtRzTQfTnz+dEoTLu9DXZPQofUH+1fOF2c6gJLOjKwhLHhMA1Y3nVpRzL+lwJ2GhFmUDMHrVuwlrY5OpsOqmpVoQB33wBuXk+tYvDmpL0+S3e8Q/fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHYy/c13; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHYy/c13"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so309256f8f.3;
        Sat, 12 Jul 2025 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752347631; x=1752952431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WgcUUdQRBquLpdf5eq5AqmAdjxeq8xvK3pQY9lcVSM=;
        b=XHYy/c13ujocwVMp3VhxJxlyq/HVPkzl/egTZKFmh9MYNwtvISOFpwxYLVtfZyzwxJ
         gskJpSmzAFaV3NokjpizVrMZNFD0G6PFMrIPyhycokKTczsgdKrZVXX9Hq4Xi7iM9JRw
         2ICbeUQjtoe6S8IUdAVvY+qI/sD8eqkYHcduDKOlfN+Q3A3MZJ5HvBMCij19+uZy/qeD
         OW/cBkUNYvhCG8EbikwlNySrpOCN9Cc0EBWih+2x5HoDuDFncbXn6w2b4EP0cwvJTYkG
         CglGWzm9Cs1x0ADnoKmjAsy7n3QFGc6wvCReGER9nGele8x0aKFTIl/9VK/It+S1lnEc
         lOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752347631; x=1752952431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WgcUUdQRBquLpdf5eq5AqmAdjxeq8xvK3pQY9lcVSM=;
        b=BKv13OOx5avkR/wVdBEEs8+YTStdNaWEusIUZmm/81jry3Y4rauHslerMlgfPrXI+s
         Qe1MDho1IcBLU1OJGDLbQsp2YNBcSSnKwzU9+sA1UAb+aF0CcTCjtZ6GLmIDQfwhM5H1
         m0fe+vwIQJb3MSt5dRZV6sSerpT8XWSyAaAprm3aozPJ9FVq/KfqCJ18vqwE5DQFjsVQ
         rzzmtYjg4iLPWRSb6qpo2a1Recjc8GqmgSI98GjzYKByL2OnjC35PLd2vXQz00dgzzRO
         QUl/n4SdsZtMIFEYmh5skFteohQYAKEpHUwuGl5Qf6VdW75tkt+WpGJNvJ1OsrRTs5ax
         m/RA==
X-Forwarded-Encrypted: i=1; AJvYcCV9+xOnNu/o2TGGss5EIfhkbUzjzc+STtTdidG5FiveWLI/aGBabEI+Obqax5k56RMd+wQJ+oxe9WUGSzjZut1HlsScKQ==@lists.linux.dev, AJvYcCXfLJNzBFuh5zSCWBvsIBMU/VRIyusg5mOkxflsdsxxhk6jZsz+PsLkIJisHwFtQKyseBRXydPOcK3SbNTyjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSQMB+xSaG5Rklwag3pGWvOb6IzyxKb6EusSy+aoI36DlHPmfm
	4D8oxw27tEKnrUwHluGZhmu5hYvQH2xiyp/AXXKqfQ4EA04MWGitJxKT
X-Gm-Gg: ASbGncv9QA9e80AMKa02AHSVh/E/ma6UH8GfNM9hsxtvrdJPo1jnrpoyo3uj28LjTm8
	n9IpM1TeLXveR+u79G/TEmE7I5O58sCaB/jyP6hpV4rBlg8u2mwQBtiHU20g19t7MV99bSG79Zs
	CvqbTEsHqXW+2qA2Uai2/0F0LB+HM880a8Mg+lGcCiZM65J6M1ldFAuLcojuTXUIe7bJyeopLui
	S7aTcGj6aoywd5DLumjhhCsa1QUvWHvSroTH05paZG66c6+zDDQcPlpLYvMprjLvfSETV+8Nt9d
	C23LvcA8Q1QaTS4yUhIF4yKXK9HrwQTFAjyDMZvRPcDiMki3DlbzCTUtgXmljqfva1U9XzOGp9N
	zIME2a/qJD24kf1cVJX+S7hRg1eOB9EsVt48uOE0EEYX1B3tK6Vt72J/99A==
X-Google-Smtp-Source: AGHT+IEiXGKJd934lZQw1ynm98/xMBFQxAUGyeTUudLL41WEikCMOr9VQ1P1QDGRYsdZvXZZHfjwkg==
X-Received: by 2002:a05:6000:2502:b0:3a4:dd00:9ac3 with SMTP id ffacd0b85a97d-3b5f2e3e6a3mr2219628f8f.12.1752347630394;
        Sat, 12 Jul 2025 12:13:50 -0700 (PDT)
Received: from localhost.localdomain ([102.42.96.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm7947939f8f.93.2025.07.12.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:13:50 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 1/3] staging: media: atomisp: return early on hmm_bo_device_init() failure
Date: Sat, 12 Jul 2025 22:13:23 +0300
Message-Id: <20250712191325.132666-2-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hmm_init() would continue execution even if hmm_bo_device_init() failed,
potentially leading to bad behaviour when calling hmm_alloc().

- returns the error immediately if hmm_bo_device_init() fails.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..97c7ce970aef 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -34,8 +34,10 @@ int hmm_init(void)
 
 	ret = hmm_bo_device_init(&bo_device, &sh_mmu_mrfld,
 				 ISP_VM_START, ISP_VM_SIZE);
-	if (ret)
+	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
+		return ret;
+	}
 
 	hmm_initialized = true;
 
@@ -48,7 +50,7 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);
 
-	return ret;
+	return 0;
 }
 
 void hmm_cleanup(void)
-- 
2.25.1

