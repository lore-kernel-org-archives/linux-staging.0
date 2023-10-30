Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D10EEDB;
	Mon, 30 Oct 2023 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzCV6d17"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40838915cecso34701825e9.2;
        Mon, 30 Oct 2023 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698667207; x=1699272007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aybSsE5M6yYzp+XWhdtnqDXvKHs19lnGyTCpqKxYFzM=;
        b=mzCV6d17nYL5CtTjfOsFSBLI9QS2BjSxnRj5aL7QFzfY4cBChIi+8pN+RBH518l1As
         Jp1f/Xh/NKr4NAXZpW1NIQ4CXVgNATRPNuAyBREOHO0SJyJvY7qDNC1Vd8GZ1v9dZzOy
         mB2x8RpzWq81lQ9Kb7q5vQRaBNe3vuq7b/OFBSNrPOLzeieBV+feNXlSQY1sY30IyTmr
         I2LUDYNb+U1G+ahxskfs22Myn+hudAeVyJ+9naWxz3IUSH5LfAdA7apWivYczir3KD55
         HxZHppO7ujM5W/iGguNKIplf0PFoGJxqm498b4u4r8z0QhciPzGhiLprQJhTYRUoLRfa
         MS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698667207; x=1699272007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aybSsE5M6yYzp+XWhdtnqDXvKHs19lnGyTCpqKxYFzM=;
        b=aKJSsoEyZAGxTCeGI3fP4w/TO/dl4Icg2c/uSmClRe0iRlFlmwr35DtcAAsaWAkYFo
         OGSKIIUlavjal1cNiB8q5Q/k3q6O2OqzAIQZXIY5ojlYI3JcGXmX8B7rz/prwUK9EzW9
         WRmEaRHedENk/7XCj+zdXq0Dd2/kVwm5rYpnX5C/9udU28ABYZ4y7oulCJaL21+DV+VS
         ihMdVQs84hfSVIprp0QQ3rJe47XiuD0sMyHRZZKzdRQ5fUqzjTScx2c5RLHsU7n/Jlkl
         Z5P7e9oE02cNUbFt7tXwEKSYpjoptGe9bpmpKjZU8wGAwMypzHBh0TcSVOchkydU7SO2
         VYTg==
X-Gm-Message-State: AOJu0YwL/VhBpEWY2sLCp844pKgSCAQ/H4droDlfh9iCKHIH9r60r0X+
	BWCI9iX25al8EoCL9ALqXvI=
X-Google-Smtp-Source: AGHT+IEzrqtVLIOkEcuNzpug5Nxyx+/pmvVtkUHYEvcEDOg+sIqSMBOa3ZVG9wsBVSQVwrfL+xFIsw==
X-Received: by 2002:a05:600c:4f55:b0:408:3707:b199 with SMTP id m21-20020a05600c4f5500b004083707b199mr7803003wmq.3.1698667206988;
        Mon, 30 Oct 2023 05:00:06 -0700 (PDT)
Received: from nancy-1-2.. ([105.163.156.232])
        by smtp.googlemail.com with ESMTPSA id s10-20020a05600c45ca00b0040772138bb7sm12572236wmo.2.2023.10.30.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 05:00:06 -0700 (PDT)
From: Nancy Nyambura <nicymimz@gmail.com>
To: 
Cc: nicydaniels@gmail.com,
	outreachy@lists.linux.dev,
	Nancy Nyambura <nicymimz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] Staging: rts5208: Replace strncpy() with strscpy()
Date: Mon, 30 Oct 2023 14:59:34 +0300
Message-Id: <20231030115939.48985-1-nicymimz@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

warning found by checkpatch.pl script.I replaced the usage of strncpy()
with strscpy() in the code(line 524) for the buf buffer to improve
string copying.This is appropriate since strscpy() is used when you want
to copy a NUL-terminated string and the destination buffer requires
trailing NUL-padding.

Signed-off-by: Nancy Nyambura <nicymimz@gmail.com>
---
Changes in v2:
  - Make the commit message more clearer.
 
drivers/staging/rts5208/rtsx_scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
index 08bd768ad34d..52324b8ebbc7 100644
--- a/drivers/staging/rts5208/rtsx_scsi.c
+++ b/drivers/staging/rts5208/rtsx_scsi.c
@@ -523,7 +523,7 @@ static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 	if (sendbytes > 8) {
 		memcpy(buf, inquiry_buf, 8);
-		strncpy(buf + 8, inquiry_string, sendbytes - 8);
+		strscpy(buf + 8, inquiry_string, sendbytes - 8);
 		if (pro_formatter_flag) {
 			/* Additional Length */
 			buf[4] = 0x33;
-- 
2.40.1

