Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F2412EBE6
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302812; cv=none; b=F+rCECUs+PLJ80f7f+5O2ZN1YQuwd4DlMZ7cRrkTySuqPy2UjoJEBLOtAB/OWGbJnYGCkSfCLyllRzC9HlhpYtNY3LJaJ5mGlzlxJ4pmIh2Zppe6TkWWt2WkDZl1aaHtW8uZY/wiCUpPzfyXXbuZE/7eJp7LgauYF/ADmDleF48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302812; c=relaxed/simple;
	bh=MhqSyX6UHvibWFRk/FMAS4YhWCcFYzenPIT5fsaXvgM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E6n4QszpTlb2BkZhQlnHJi9LZ1DPpANq6kYR+Jyt6JQNDLkH7tldvPvemu9paMVCZ1mTgtWyJ8G7JadiGTVJmAM8p+Sd8DuD4dzdO1i80ryggVh+K5LqGTaunECDHphNgYvvedul8s9bwc1TOsg/pV8PEpN78vIFMP2bSdhwNHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knhZghhg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knhZghhg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3416a975840so1384060f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712302808; x=1712907608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+3LCp79E/Lh9YihvxuRprMNpc++Xix/ji1hpk1cR4c=;
        b=knhZghhg5cCjD8fibJd4o45b24bMhgCpsNzrfIPYtS7OuQvdJoJRZpdQ9rH1r8qai9
         wbA/1bIBDxdX+K9SRkgnzE/FN9p2gi2ZjjzT3nYrBx9N6I7GagPh/M5WCsqv0+eyM2dG
         qu1AcR1XH8OqDybUw3bW2bQhho+s1IDhYpDWI5PurhlqSruM9Bkz4hrbUTKjiiwNlE6z
         pg2+73YrxJvXmgN2tIztpB0KD4IV028imKxUb74CDkXuiZ73oYy+Evc4sWkJKDCcGNrR
         Fja7+vRc+CGQiA/qnSZLkw1NTWvUROtQFawCTiJ3owjBeci/NQu37Wbe/1X4GqQ+jwn7
         Yq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302808; x=1712907608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+3LCp79E/Lh9YihvxuRprMNpc++Xix/ji1hpk1cR4c=;
        b=XvLs38DRJfTSD3mnR5tdsPjrWxGvHhalBnCNkcWpAv8NcMIgVRNluIDhMBGutH72bl
         4ITycva59ARSimGWkWHEBIRrxCLh9vyUXdzKNr+iD5FC2V3yLINKps4mqLRlSHB8yLGI
         VbLjVgV6B/E/2KEaaUcgOXpomhgGZuxKk9uIJF11agLW8g20Wqg394hoxzEGLglKFg00
         I9TQFpuPOedcXVBZ0tVl8RxDwkqd9JFQS4AvDdlq7WFqGuyRPGxqiWcyJyATX2SaavUv
         7npUmxpczR+GqzA5u3BqofZNseO23connMt6trw1Q1JkEMQWEaSz8JqnZtg+p5kf5klK
         amBA==
X-Gm-Message-State: AOJu0YyHiW0RX2JdmWQOu2xcJZD0NjisUMT4+C3nVUPFJ8Sdj5RZTXM3
	b3Gq/hfR/YOd3AfHr0S/U3cAm22RsQByFHqBbZBRHIe3DQtZFBzE
X-Google-Smtp-Source: AGHT+IHgtniqebPWb8hYYuKuadt02pO2NBU70LozXXNGdnP0B2+WFpQn3wd0Zg2EkqCzROhrIyfocA==
X-Received: by 2002:adf:fe0a:0:b0:341:d6c3:5c4f with SMTP id n10-20020adffe0a000000b00341d6c35c4fmr647634wrr.21.1712302807997;
        Fri, 05 Apr 2024 00:40:07 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe58a000000b003434f526cb5sm1311643wrm.95.2024.04.05.00.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:40:07 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] staging: pi433: Cleanup & fix potential resource leak.
Date: Fri,  5 Apr 2024 10:39:53 +0300
Message-Id: <20240405074000.3481217-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset improves readability, maintainability & fixes 1 bug:
        - Rename device related vars.
        - Update pi433_receive param type.
        - Remove duplicated code in pi433_init.
        - Reorder pi433_exit calls.
        - Fix a potential debugfs resource leak.

v2->v1:
Followed by Dan Carpenter's <dan.carpenter@linaro.org> comments:
        - Remove empty "fail" goto tag.
        - Reorder pi433 init & exit calls so they have reverse order.
        - Add "unreg_spi_drv" goto tag.
        - Check "debugfs_create_dir" return value.
        - Update "if" statements for consistency.
        - Rename pi433_init return var to the more common used "ret".
v2->v3:
Followed by more of Dan Carpenter's <dan.carpenter@linaro.org> comments:
        - Undo pi433 init calls reordering.
        - Remove "unreg_spi_drv" tag.
        - Undo return value check for "debugfs_create_dir".
        - Undo "if" statements update.
        - Undo pi433_init return var renaming.
        - Split patch 5 into 3: duplicate code removal, bug fix, reorder
          exit calls.


Shahar Avidar (7):
  staging: pi433: Rename struct pi433_device buffer field to tx_buffer.
  staging: pi433: Rename struct pi433_device instances to pi433.
  staging: pi433: Replace pi433_receive param void type to struct
    pi433_device.
  staging: pi433: Rename "pi433_dev" of type "dev_t" to "pi433_devt"
  staging: pi433: Remove duplicated code using the "goto" error recovery
    scheme.
  staging: pi433: Add debugfs_remove in case of driver register fails.
  staging: pi433: Reorder pi433_exit cleanup calls.

 drivers/staging/pi433/pi433_if.c | 690 +++++++++++++++----------------
 1 file changed, 345 insertions(+), 345 deletions(-)


base-commit: a103e5ad21992384b0b4332df52e0467107eb113
prerequisite-patch-id: 91943193af2fea74182be67fb583235a3fbeb77b
prerequisite-patch-id: 2cad031ba6a0782a67ab1645ff034a8be65c2e76
prerequisite-patch-id: 1a852ed8f9d133aec7c651fd9007e59e39c55fb7
-- 
2.34.1

