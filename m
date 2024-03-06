Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B02126F3E;
	Thu,  7 Mar 2024 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818177; cv=none; b=Ju663dU0Ds6h+EhXJ0StO1awCvw6meKpJGjDhdwtbyorNWOQEh1wWlYRLgUhafU908oRuhXFOAJ5rpv7B9rwuQnytmvMQ7sQz0J5TN+JYiJa7J2oiML9FUaMBwDyXUQXkBOx3J8n1okZP9i/BF4Ud/7PVFZOic8sKCELqKhX+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818177; c=relaxed/simple;
	bh=dXf530hLG1mC+ShZXz6aqx367Lb6/M9mppu3TW03j/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bu/J1S73AhB8idq3giv1r3Np2FEERUFke0YVtKVWJyCttMX60m52CxSvVIFst6J8QXASSZCwYERMg9QBac9USnvyFz0p4ROx0v11qBBp9I+WCMb7DLilNJR9MvRRyBNC9EWDHcc1ruRErf68vpFwulZaWrrzgEROaxNnxsxchbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XepKOH/2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XepKOH/2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a4429c556efso132850066b.0;
        Thu, 07 Mar 2024 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818174; x=1710422974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6aP9XgNZ8/j+8+b4iLpDTcw3H/HRtlTI6QTXmPOn0lo=;
        b=XepKOH/2jQh/36zD28Glvv+cqjLvxOEEMqx1TTEut8h/rqfMwwIm6DGjaFnrImPkzr
         P9/I/kxlmzaRE07Jihm0wSmo2sAVtRBRythwZz1p4iD/Uwn3ZeqyGEHtElwxbFNY3/nT
         U0mPWsaIXec9xb9xRaRBeY3MY0UTYH16YLygYf6ARpoPvtmj5LG9CUiNUmHCq9lHIzwA
         2EuqkH36QDUk4JQx5qH8S4aOuixsaA/mdJg48mnlX9wpL2L+cQtdzhgfcDtCKga9m2HI
         97HBtj7it/NzWFJ9JJsd9JCenWSAMforGkyXUU/d/NVjIYoctlAxy7AeMHEcrAtaKI8I
         i2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818174; x=1710422974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aP9XgNZ8/j+8+b4iLpDTcw3H/HRtlTI6QTXmPOn0lo=;
        b=dYBZCSrpjd0+e83VjKvxaxa1NVjTIhH7fG3SGDs9gqtnGq3WAkHpyjoFUMgd0chSgf
         +cZNxlxSot3/r+TAwuQt0quRjJ5YvzWcNc1CRB8Gst1F+w5P1noSQeNxjEkyUfuZmiqE
         EHnlCr8PFM+IqitsE+UAhPzOQcdDFeQQQAP1tBSbukro1CfFUrndxGSDLTOCpaqq/coD
         QSsibeCBhznrB2MBpz0kP75hKlO6/H9XYtY4CmuY7Ni1Dwakhg8ZwSCk4Jvr7cDi70tc
         aNyK+xyujHmBMN+PCqx7esBCO6B5fZPSQUzGCzRmo2ta0K5GBtsLjEyl01Otd5osnxtG
         f/dA==
X-Forwarded-Encrypted: i=1; AJvYcCXFYlztj9xYuq5DyoV5YGpugnldQW0UWOC9K156TLZZqBTv2JjTn4yiTJzGrflUtu1UwZiuu9ev1MO61vX+SiGKLj1tjIlYaqVhAZ9Y//yIWufd2HezovQcmjcqQHW8cy6SfF6wmZ00AQ==
X-Gm-Message-State: AOJu0YwVqm19UyLvOlRccX8XWL5j8bjvmmeigJwRGNCLDr/5I1xx16y6
	h4hNEBPs8NrqiAkF74SshZoFQBeNbsE01jjL23tTS2xU+QtPSV8k
X-Google-Smtp-Source: AGHT+IFiAVjw7apod1GcTkYb6p7qYf99hiU2XKdF/F3Yd9Nk/Ot896vaHuk71w5RZmBXtW/iIm0whg==
X-Received: by 2002:a17:906:1846:b0:a45:d3c7:b462 with SMTP id w6-20020a170906184600b00a45d3c7b462mr1241155eje.41.1709818174399;
        Thu, 07 Mar 2024 05:29:34 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:33 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 0/8] Rename variables in sm750fb driver
Date: Wed,  6 Mar 2024 05:44:50 +0000
Message-Id: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This V2 series addresses the Avoid CamelCase checkpatch warning by renaming
the variables in sm750fb driver to use snake_case.

Patch 1 renames variable sii164GetDeviceID to sii164_get_device_id.

Patch 2 renames variable sii164ResetChip to sii164_reset_chip.

Patch 3 renames variable sii164GetChipString to sii164_get_chip_string.

Patch 4 renames variable sii164SetPower to sii164_set_power.

Patch 5 renames variable sii164EnableHotPlugDetection to
sii164_enable_hot_plug_detection.

Patch 6 renames variable sii164IsConnected to sii164_is_connected.

Patch 7 renames variable sii164CheckInterrupt to sii164_check_interrupt.

Patch 8 renames variable sii164ClearInterrupt to sii164_clear_interrupt.

Updates since V1:
Incorporated feedback from <gregkh@linuxfoundation.org> to fix the
warnings in the patches and create a patch series for the same.
I have also compiled the entire kernel and it compiled successfully.
(I understand this is not sufficient and would be happy to run further
tests. Should I run kselftests on the module?)

Updates since V2:
Incorporated feedback from <dan.carpenter@linaro.org> and reverted the
sii164GetDeviceID since it breaks the build.

Dorine Tipo (8):
  Staging: sm750fb: Rename sii164ResetChip
  Staging: sm750fb: Rename variable sii164GetChipString
  Staging: sm750fb: Rename variable sii164SetPower
  Staging: sm750fb: Rename variable sii164EnableHotPlugDetection
  Staging: sm750fb: Rename variable sii164IsConnected
  Staging: sm750fb: Rename variable sii164CheckInterrupt
  Staging: sm750fb: Rename Variable sii164ClearInterrupt
  Revert "Staging: sm750fb: Rename variable sii164GetDeviceID"

 drivers/staging/sm750fb/ddk750_dvi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--
2.25.1

