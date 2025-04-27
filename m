Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BEF1EFF88
	for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745028; cv=none; b=nSFB+3w/zbFQ5t5OfBi/n8jMo16+olm/4zFWkstBeL2SsJQdOveACmtX80ywNK1locgwjZukS86i/nNYxnJcLYf8r3z9ZBC4QtwCuzYWjzXUqUbVCLhoFRWZfQSNBbpoeXd23xir3+/yplZvGaNszwaUwJ3GW4y0sQGPIy0+izk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745028; c=relaxed/simple;
	bh=16zZuOREEO8zAE2MxwctmD9m23Nr1GKeG/cqgGw+jTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLfi4vUuPdtEDRx08YLELtQw6MT0QjKwh05yAO+PwMB7l2b6N8FK3qmkUcZbSEseMqm6FillEz9h4ox/VuSSqe4xCXWoW/CKBn1TLBZAoYE1bClcR6GMU2ze7w9l6ZU98+pNw7lqBPw3NtlA5qhmjnhLUlIH1luqu4wIOqxHHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2UeR8P3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2UeR8P3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2403408f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 27 Apr 2025 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745025; x=1746349825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oL2ac8cldkD062CLsNYaAT3sZgR6JRshDXAxBdXOpPE=;
        b=U2UeR8P3a71IlBae3clx/xjd63hhq+AZTWuyIK2+76/MU1VCJy959JrH1Y9mh1neDI
         H7xxDMRdPB6QU5EbGGTjUqm32uIKij5Lvouo0MT1nhT5mnreS2OdMy4louNvGOflIkER
         zrTAKUGsabU+HH+0bEKVXekui86Pbqz3gl6ijFz2PIp2RiBCuKAUXQ84ltikEPsuxork
         S3H54i6NCtxtBXuDaEi6aD2Y+tLhaICxrKCWmx1MyfEpUTPvi2qbh5Bi15PWTFrdnvBI
         /nvqdCNEBbezIGltvPFMuaan0TmKVZy5/+uQ7UZG/pzV67kEHOLeyIapOiFsP9ky2r46
         B4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745025; x=1746349825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oL2ac8cldkD062CLsNYaAT3sZgR6JRshDXAxBdXOpPE=;
        b=npYUp68bpiLbm0JR5+LQj5yWVG6ub0bHx6ASuG9S5RfWXvWFdobtBb7jKcPjK9OQ/e
         XvjrMaLZ0O2RiT5H8ZuJAJTou4+Ucaxt5SzJmTvLlg0eqFk9rwkBRfhBQG1DkVDX87mx
         HBRkmS8upzNedXi/D7xyp/Ezn/lmpfFQtn2pPB8YjDCrvA/1hDeO0bYU8nmiJYbILKOm
         0ZUGd+YSB1puk7RAB/Qn5WT4fvZ7GV3vaUf/4nL1iaxFWF5X6zU+AY8QNtcRnmi9d+Np
         KFtjCthvQwOPwhd+3petis8YuLpeFj8mUOmjVFlrcmdB9W8zF4fkHIBB0POBMcE0ZYZV
         DK/w==
X-Forwarded-Encrypted: i=1; AJvYcCUD6zNQ3b0HHGULuNDiMOMc1f5iBPsuOt4D6DpKn6WAiJ136oqkcElSXtkHPn8X+W71iHqxgxrd5ytklvF0@lists.linux.dev
X-Gm-Message-State: AOJu0YxvYPq0ZN/RYZNrZi9zHn3ybypraRX70nlrvJjYAXlDG8pLZ2/F
	4YkS0gTrYCLX4nSniu7eKbiDpzQ7fzy+uRaBX/ipV5X0Jq1iPzUi
X-Gm-Gg: ASbGncsPPaLS9svrzlMQecRM8pWCmDwptV69HOnmoRRKVTQmWIzN6iwLuJmustGtkb1
	/3pENvE4aDjT0QAKzXGdIcFatpiMgjLwqtWX+tv7JumjmDJ3eDGqUPVauAjz0fUC/TnI2QPHoFk
	vdaFFOSRnxQ+mcam/78wLvVd2w80DkdJZSL5gUFPaZOH0da6U10OqkXRGfM0zYMhNENhhP38tz3
	iRcfd+8wxl+tEkeDljjswLSyuqyIp06Bt9SZAWd/YWa5PXUG0RHR0t3xhiSn6n6Xw7uljP2rsbW
	CZq9t3sD7bsjd/o92RsJtNsggTNw7B/3AQkwPLW4TKZM4ZKSzpOkcoBYNowOS4HIFUm/eGaN8wv
	R
X-Google-Smtp-Source: AGHT+IESUfX2ptsrB4Xo1jgoKXtNRa8X7AzqQMeu/32SKwXQvoFBEuUJYdSVstlL0DtoFdj/QzEvfQ==
X-Received: by 2002:a5d:5885:0:b0:39c:266b:feec with SMTP id ffacd0b85a97d-3a074cf147cmr6668943f8f.7.1745745024830;
        Sun, 27 Apr 2025 02:10:24 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca557bsm7925805f8f.35.2025.04.27.02.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:10:23 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/3] staging: gpib: ines driver fix and cleanup
Date: Sun, 27 Apr 2025 11:10:15 +0200
Message-ID: <20250427091018.13705-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address some outstanding issues with the ines driver.

The issue addressed by patch 1 was exposed after the entry points
were declared static  (patch 2).

Patch 1: Fixes an invalid ifdef config identifier
Patch 2: Changes the driver entry points as static
Patch 3: Corrects an unused variable warning

Dave Penkler (3):
  staging: gpib: Fix PCMCIA config identifier
  staging: gpib: Declare driver entry points static
  staging: gpib: Avoid unused variable warning

 drivers/staging/gpib/ines/ines.h      | 44 -------------
 drivers/staging/gpib/ines/ines_gpib.c | 95 ++++++++++++++-------------
 2 files changed, 48 insertions(+), 91 deletions(-)

-- 
2.49.0

