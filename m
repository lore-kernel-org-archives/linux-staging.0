Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3001288CA8
	for <linux-staging@lists.linux.dev>; Tue,  3 Jun 2025 18:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976228; cv=none; b=CiaeYwe+7/MctzlA/13XV4q0AjuYdgkrK9MrQsvajHpKCe6XoBH4ep16k4aACZc4AhfH905HdIV2SYSvmN6NGJQ/dhwNAntMMDSTIihSFhlIexeqmfQ0WoTprQgZm9I2YsFZGOm9im8AoQACWu+dQ07z9P0QvV3nCDcuYxvWGco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976228; c=relaxed/simple;
	bh=7Na7b9d84asEMVy9YmX0919RZAM/FGgd63S0RP/e3ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F2tmcdY7gCBRoKE4osFECwDZR6nz7+XN2WAyO+L3VvvAAK5rtGZ9WAGBOC18rizVDo+lixVN37l9PvHQlayjEv8ohIamknmsRP8SWdV0blsSG9LxPbzV8eq1/GdIF5WtwutYzLB9Qu7pwPbRwEySlSndVEfC1SHv+wHaMLQDlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsD0kWWQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsD0kWWQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so52651245e9.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Jun 2025 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748976224; x=1749581024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HAejrhDDtmgE851HnjVtZktSKnnol5evwViP/UzrPXE=;
        b=QsD0kWWQI7HeCOd3+6TV8sKtPg3RCCsz4M46MEEWeGoPDbxoZZOdMo63/MqHzCjJ00
         VBq3oftWsdENxNB7+O46L3WcJNex18YHRKXExY7PI1UDPK2GPuF4R41ggk6u/bGegF0t
         7NOWnZDbPJm/ZT6W8tmJDn00/jB7XI+MIKr3qQzn9ZSPi0mRdEzXi0pQrPzhsUs5D06p
         LFop5ZFq8VyY7w0BLxXjaJsEJVM51ytRs39NwfstluqgjWFihmJkBVLUMbwnntK/WT4d
         sH/GYeWq9lwYBVrZKsWDdChoH98KdOVNExO7ZtGk86Ag14WbKfjNNx+0bTo+aoKf9unm
         V8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976224; x=1749581024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAejrhDDtmgE851HnjVtZktSKnnol5evwViP/UzrPXE=;
        b=S0Q4X1jOCnelHTUt1JRs6N0gWjZAIRTj7GAfUH7OkcGDLtNGLE1lD0aCwid6RC8v01
         8AZcnqNMcw8GW8gZofz1MwuY2+HBFW7KiGdbTFq/DROkWMAiImtHcAXtqGVKS/3ySE1w
         1n9Etfqmyuo28DAk81ZJdSoZ9o45DTsSSJOQKzVKxHkM77Cp7Q40QyDBqsCko4+H6Cg7
         cLIIh9FjS0edTlPFLui9p4fA29VrWdVHJBwNA/rvJfQGeBx5UkDHjE+C+0ptygGsd7il
         +2tb31CvfWly2aBhEI7qWv9DImCMkOKba7oWdouIfFXQhNggsCqMQevQIBPSavZmWgBT
         qzow==
X-Forwarded-Encrypted: i=1; AJvYcCU1xx/WnIh5xbz6hhw0FVfZlgy4s36oL7OekRevQjDkSGFUBayhGowXgxtNziXatkKEBMtsfnSMuPzTjdmk@lists.linux.dev
X-Gm-Message-State: AOJu0YxwXPnb0f1+QBDzJLRlz/drYPj22NreT/I0z02UyZZKrCWMF01S
	bHFDntb0HhB+9slbLTEKRY0Hwz3FXIuLnM4ujV+ZCn37RnOyhUNwERhq
X-Gm-Gg: ASbGncsLEyzDOx4oBu+O3RdM7X+VNuMq8ryHMj82y5aPaGZY0h/s9820gZFrwELzRJV
	FzUAvT7gm4qG31fiSMNbsQYd2JtMf9qnxPNJo/cE6aFHPuLnlBnmI5m6SyiVDsx5Mwo0J9DMk7A
	GCOG+VToSVrWEIuDIvZZRCECucv2SEemwtRVWZezB4gnPr7Zg+2Nh1gm2t5PuXIyB8+si+fEDR1
	4Cy2vxfBqAut7VOBRS01e5nXL/7EhoUy5TTrqya9I2d9tVQIoXDqrp8LPXdRVobzJXaOuB9yk/i
	LClgaiWv66ebC9CfP9sNNrW0FiJPgL+l9vZEAGvU9kdyv+EylP9thoHso8Dsjamw0IvglO4HNvs
	9at2QJ3Xf2uxupTQ6D9pBjw==
X-Google-Smtp-Source: AGHT+IGhUxsMTNkPK/YNFAkbTdGasswJqXFYgHcYXwpWeWUAPQYObmMMIw6jLjlW8DdYPzjSdA7bcQ==
X-Received: by 2002:a05:600c:1c8f:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-4511ecb8920mr131690865e9.4.1748976223839;
        Tue, 03 Jun 2025 11:43:43 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm18449959f8f.49.2025.06.03.11.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:43:43 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/4] staging: gpib: Clean up uapi include files
Date: Tue,  3 Jun 2025 20:43:16 +0200
Message-ID: <20250603184320.30594-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set addresses a number of issues identified in the
uapi include files.

Patch 1 - Remove enums and functions that are not needed to be
          exported to user space.

Patch 2 - Add removed enums and functions dealing with GPIB
          command bytes needed only by the kernel drivers in
	  a new local include file gpib_cmd.h

Patch 3 - Convert generic types to fixed size types in the
          gpib_ioctl.h include file.

Patch 4 - Pad bit and byte holes in the ioctl structs.

Dave Penkler (4):
  staging: gpib: Remove unneeded enums and functions
  staging: gpib: Add local include file for commands
  staging: gpib: Use standard size basic uapi types
  staging: gpib: Add bit and byte padding to ioctl structs

 drivers/staging/gpib/include/gpibP.h    |   1 +
 drivers/staging/gpib/include/gpib_cmd.h | 112 ++++++++++++++
 drivers/staging/gpib/uapi/gpib.h        | 198 ------------------------
 drivers/staging/gpib/uapi/gpib_ioctl.h  | 112 +++++++-------
 4 files changed, 171 insertions(+), 252 deletions(-)
 create mode 100644 drivers/staging/gpib/include/gpib_cmd.h

-- 
2.49.0

