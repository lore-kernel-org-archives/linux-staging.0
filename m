Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A353D1E5B9A
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759283; cv=none; b=uWUwvj1wiOrsGJox64kIbOLTCdbtHhzoFOQATayQwUulSUrxwDqYQU/zphv3vgNpSXynYRMiuFvLuZOT/IAW16oH3xET+h5vwKxNuxaztCuLZC0N114KwnJf0cIiFWxNwkUYcdVYrUICoRJh7f8BblC5qgdIDU178I2uAEYqUYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759283; c=relaxed/simple;
	bh=a8zvMK83zMx5qDXyTLjbIcsP6ZbA7xPihWSqxGQ4s4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UR8QBmiHlsvm0EQbblhfsXunhEq3sIe64zsDYfzy2q/2VMJJy3wD5IsA0F+4sMpE3GG1amFRLj1EiVtfBOVOXwHqvqwM+OQE5PwsmksKmTLzcsNT1vz9cCtfKBGX/cXZeJBEMZt94LVqkUF62s6Et1LmabT9cwFsyeTp6SGyiWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drx1f8zz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drx1f8zz"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a85b30cd4aso1311815e87.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759280; x=1778364080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hFcdUs1VqMVJkEtinKJ6GkDwBav+4PzrkH4tLQR4Ek=;
        b=drx1f8zzaDgHQ5bxicDdN+j5SS/wF9GtgjbSYjUmxwT8vQ7DplJL9DTtwpYG2ttjUU
         OToGhYFbJdJ5e7nEqWwdVge51euxrgx4mgegGp1XHw78waLXKZVI8suvwLLv1TNK3P19
         tqVCgRpWwppC+H5agV/HPrj0nb6P0PUK1zwtuozClamri2DdBXIEizGgwpVPOKg0xgrU
         pZ4hrhp/eru8LhGv1eMp3JS9MRCl9XRdfX7crE9tmOdHMGKc27cBx37rLY4kpqV+n2rQ
         /ylltYkIx8tYEIe0QMQ90+wEd20STRUGemhy+tHnUyFeP22D42wqIykbPl4RVuWmzXrI
         8VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759280; x=1778364080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hFcdUs1VqMVJkEtinKJ6GkDwBav+4PzrkH4tLQR4Ek=;
        b=qwK5weG2zu3BTi2zqyFv1To5LTKVHo9jI5XJzOJ7HWTZHI/mRmP7BRV2XHH1lTyjnL
         4UPlX2WnuVHhMIU03SYxA2ZAmqmrZKd1dbfhaP9CUmj5e/qPLT9QX40knKSjU/SxyhWf
         7/5JnU+jDxFB7/7JkmI028T9BMNxFCmFC/p74G4SydQ54THQd6ElL/QOZ24b8Z+AxhIo
         g9ZipmY+QM6NA9eD4lASAShH09ApORMP5YcHCHGXisf0+Rl+eBCZU0FGBBxjV0ZO+GgR
         fvqKZZU/Hrn+L3kg7rtJl2VyR5KcQcf+V7l+MBCxwqTitRZxeaOMs33ukCEQimup7kak
         9WKw==
X-Gm-Message-State: AOJu0YzP18DhtJSop+FqsHeUXEVOTOkH/yasSWHVjq0jx+Kn6vKKHgD6
	TZSy2NteDU9wFj5SQFf4HUqe1dNgCC7emnlbaYJbVGfeDIGzsj/D6zY1
X-Gm-Gg: AeBDieuVTSySmntfzk4/UtsIb3YH5RhvE5bU4Rsixr8edBt+OMetAVaYhlKAV0GCf3z
	3+qokdaaKXe1GpD6xaAW5kU/sH2I8Q1Hq8ufozuADhE6LV2lKywsBH/l7cgn69nOWuLGEi8y0nM
	RrBPE65I7hUlbbxNb1b3NQbJZB7aEmNY2eQ4HvIQCNM7cGBDIbd/xW1n/1Wi2PgE8ahPuN0pY68
	Mrt6MLYyqkjGpQ36LZDq/Vh0pjIddjj4ghxlHOM2zhz/WfmfmatahqUk0DGm0gc1AqG1AD9sYsn
	RwwJTqa6UBhVR09rq8z4tYj+7tZzdZigbyO1l8dZWjQD7KWyVE06/DSprgvdO0EMRSx6CVEtzH2
	jcXGNXJzs4alZ5kEdcJNfUcaYFrJfTP0z5zSktbVJLSte+H9y3IRidEPuWdsBJzXFWbpMytrl2n
	ynbrDiMJHdX4hv68yKNj3+tJ3vC4UDP818qHI=
X-Received: by 2002:a05:6512:230d:b0:5a4:1900:92b1 with SMTP id 2adb3069b0e04-5a8631bdffbmr1374441e87.32.1777759279513;
        Sat, 02 May 2026 15:01:19 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:18 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 00/10] staging: rtl8723bs: remove struct hal_version
Date: Sun,  3 May 2026 00:55:39 +0300
Message-ID: <20260502220056.59815-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series completely removes the hal_version structure, since its
contents are almost never (with the exception of ChipType) used in
driver code.

Nikolay Kulikov (10):
  staging: rtl8723bs: rename ChipType of struct hal_version to
    snake_case
  staging: rtl8723bs: replace type and rename the chip_type field
  staging: rtl8723bs: remove unused macros from include/HalVerDef.h
  staging: rtl8723bs: remove unused ICType from struct hal_version
  staging: rtl8723bs: remove unused VendorType from struct hal_version
  staging: rtl8723bs: remove unused CUTVersion from struct hal_version
  staging: rtl8723bs: remove unused ROMVer from struct hal_version
  staging: rtl8723bs: move normal_chip field to struct hal_com_data
  staging: rtl8723bs: remove struct hal_version from include/HalVerDef.h
  staging: rtl8723bs: remove include/HalVerDef.h file

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 17 +---
 drivers/staging/rtl8723bs/include/HalVerDef.h | 85 -------------------
 drivers/staging/rtl8723bs/include/hal_com.h   |  1 -
 drivers/staging/rtl8723bs/include/hal_data.h  |  4 +-
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  1 -
 5 files changed, 6 insertions(+), 102 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/HalVerDef.h

-- 
2.54.0

