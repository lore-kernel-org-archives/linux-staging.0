Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F7270EB0
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968687; cv=none; b=bepWaoR59LA+dkC9krYG/QJ5hKEnnJKHUwQ0LhSfq0qGk4MKRd7f+sG85XGGhBOuMDzXp9AqYrO2JiRYozSds7+UzBEMWSAFs0kRdZPMx8LrxxacYjHpdCwjivcSce0II0/0wVuqOR2fpGcYZm/t7f9tG9PPN5nbcyczKrSv1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968687; c=relaxed/simple;
	bh=bf1QPLQ982jUYGjff53G/vojBk6fxXpw9Om2goquwfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B49PbNpyQpgGgQser+tJv7MJfsgnhP9C+1waUsSoQsgC51iXMFlVgLKS+UMfBRf7wG4tPyIjsJLRaFVOoDA7ejqGbNln49P3RZ/+eNKhHp38KsAzCxDEfL6W5Bo9X+9v1nhN89PqPp35Fzz8hRMJeDHpoNX+A2Nh1rwbf61FUPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZkAAkM0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZkAAkM0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so1522426f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744968684; x=1745573484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziEWnqr68bl6EYzUSY5rbxDyqDTwrndaf3K3nBdL2T8=;
        b=MZkAAkM07+FRmPUk2/rFelDpf6S3OxuKYD4GZY381yuQW7brnKGlqv7Z0vpGqiA2Kk
         BlQjS5AqFDhZIdMzRgWrMW8MyieI+6YXbZE7A1mjfBFjGGPDoizRD8AwzDyeBDh7plpF
         V9PgL6r0G1oUqi9yWuGaUHkICVrO88Xa9iHoYXYFOVb9aYo2ujtlbuo3GHAeVAMulmu6
         9xyIdha/jUUQfIAdPMiI+1vfdoD74w6q7jQ85x7nEHVy8Pz8GKMxeYKauii+7oEDQf8k
         EP6AsL7xIvl3Fpdey4I1hdJnBwLtSZq5aAnpbOSWV+Ko04o14bvXok85d0gxu6zzq+ok
         il0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744968684; x=1745573484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziEWnqr68bl6EYzUSY5rbxDyqDTwrndaf3K3nBdL2T8=;
        b=PpEcX++H3RtQCymI8TANHNz5wn4oGsgR2Ve7rf/2Lt3ykqetwJOSg227eH2nIdgJaZ
         xo0YF2bvI/q11LG7Pz+57fGcs+YGUfh19gyjsGKG/i56i6l1TClzpfDuAoXorciK2hn/
         FaReT14Z3sTJ43fMyPEU35/uWlcds+oxytvGaGDNSVwgAmfuJwVEhMFIssamhYjI74Rx
         y6hB/d8692zP9fDO2esYLeluQBJf3GrhnEhm155Y+OaPcUJI23mZTQCXuaR6Hnr1qUEZ
         24k+W7odIhiIUhdmoNowtRtU9iHz75QKVRbFa2QwTNOn0l+p3DXoJRonCfKrTG0c0Y0y
         cD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEX5bDmrkdo+voWVJvRRKVXEKL3dVuhCOeKHGgEg/M/Gjojz0inhsD/djukqfbTqOOK8HH52Y6ggALfpoC@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa+VaPz0XvLCvAHmHf0qRq+etDFlXJH2k3dqHvKen9EQQraQg1
	7A1Fvdw7W7tI5nLcHs3a6IAS+8qWG/9LDARITsppJqFr7pixMO6T
X-Gm-Gg: ASbGncu5eUtfAlPB5cr2H0Vx/kSP/ryb9LnowUkuEH1VpKtNF62feH5CGWtXSONS/Tj
	XgH2I5s6D8wgygCE92de9DHKUckSC+2Y20mfnO/oNxcdjLR0fVBPti+BmUp0/i1Jjc9XUtX+L0c
	btY4b2/UPl5ZpYyQTjVYc9qY59CM2mMZ1dboDTAuCfpsQbZzsinI4ddPtVKmV37PdPnJBqWo/tB
	2CuVLAsetsF++/W0qlKQhE5QwUIAaHRNtJlp/ihXTmjDouTBPDHwwCZGGVwiphrHkixqX6Ui3rm
	BcEu/JY6X93dHvTKtM8Q0snqQu6cwmkyn6uFLVFnuIFFK4gwyNtGtZ71bQisLFOnVSg1OL6huX+
	m
X-Google-Smtp-Source: AGHT+IEkgWk/w496CaaXwuS7ubgZL54PSfX59h5yXTZtwL7fxskSCMm62/oqb2JCKljM/a15kDDOmQ==
X-Received: by 2002:a5d:588b:0:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-39efbaf6f36mr1633392f8f.53.1744968684326;
        Fri, 18 Apr 2025 02:31:24 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9df6sm15599595e9.1.2025.04.18.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:31:23 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/2] staging: gpib: Rename common include file
Date: Fri, 18 Apr 2025 11:31:11 +0200
Message-ID: <20250418093111.8820-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418093111.8820-1-dpenkler@gmail.com>
References: <20250418093111.8820-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

User code includes gpib_user.h. Since this include has diverged
from the original by
  - removing unused functions and defines
  - changing camel-case identifiers
  - removing typedefs
we need to change the name of the kernel include. This include
will be included in the userland gpib_user.h ensuring backward
compatibility for application programmes.

Rename the file and change the references to it.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/include/gpibP.h              | 2 +-
 drivers/staging/gpib/include/gpib_types.h         | 2 +-
 drivers/staging/gpib/uapi/{gpib_user.h => gpib.h} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/staging/gpib/uapi/{gpib_user.h => gpib.h} (100%)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 6461b330a3c3..0af72934ce24 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -11,7 +11,7 @@
 
 #include "gpib_types.h"
 #include "gpib_proto.h"
-#include "gpib_user.h"
+#include "gpib.h"
 #include "gpib_ioctl.h"
 
 #include <linux/fs.h>
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 9e0dfdb9904d..2af4574d400c 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-#include "gpib_user.h"
+#include "gpib.h"
 #include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib.h
similarity index 100%
rename from drivers/staging/gpib/uapi/gpib_user.h
rename to drivers/staging/gpib/uapi/gpib.h
-- 
2.49.0

