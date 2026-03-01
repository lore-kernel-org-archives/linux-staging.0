Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825C275AEB
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772358729; cv=none; b=SWzgzhrtf1kL6MAcWue2Fb4VS1pn6NiZKM95yksw8lpeetFYGtYX4T4rnG4ToAdXNTwRQnu12oQELUixG6/Z0ygpD+ltLI+V6xIhzsoFL2sDfLWfA6CkiB3dhmMqDJdDynpRMVKoypXR/PObZbuPbQhK0FB+GwQlVfmaDqUbqTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772358729; c=relaxed/simple;
	bh=juz67gx5zOWzw3OEZIWKIX7wkz03s82+au6h57l1e/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LU2GlL0/h0dfexFf8wMr/wzhmwI+r5RbUPF1aj8XT2Lt0qUKjEsI4yZE4f7TAfoTelZNYRbFKqfAKFNdRvSor7UeLmlVDa33tIFYsOMAAyrCeM4aWY+zq8+B671kkFtKAzMtmHADfJXey1S60bIMnTIP5CAkZK6uwIEAf5ry0EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcWsIeuH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcWsIeuH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-824b32875e7so1658057b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 01:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772358728; x=1772963528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm5Am12037HbAYWTJo8eItPltWuuhhyfYxRI/gBF+1w=;
        b=UcWsIeuH0MSUItuzDiCZQubKlKvuaDD5lhzp9kvONvsvql9L7EBjfRF5oKdl//zuHa
         jGe+tzLeFeeCZbnEOfmS0BmMtdmKT6ycu+WHrGfwNffZUQWkkSfCVnSWtY6MZxMXYurx
         UkqluCXM46d4UGK05LB/5zvv2nK8SyYwIQ/U8wY6ArItAjmzCeuxghyfhtxDpsDEKQMj
         e01vXJp8NkwEhk+p/gfXAxqjA3SPt8LI8TE0mKMV9WVMqs08Zi0kvwXoWgHxshBai+vo
         knGvyC9ivmyhkNRLbiu5xKeztxuixQgmK3wBccrvVOH4cg1IXtAeCjtTj1cSH2xn78s1
         whVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772358728; x=1772963528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm5Am12037HbAYWTJo8eItPltWuuhhyfYxRI/gBF+1w=;
        b=JSu+AVHu3Fm0rEfNtqJ4mQlIbPFzn9n7xueTCP+KWKcvt+4ifkH+kT56H5GumUvn4G
         WD/RIh2AsR95gArrtp3iq8nCY+4MzFzCdobmz/SuAo8x963qBjr2AzmIuTVrmpRZN4g7
         GCaH90zkKret/bFnKkUqyzHj+38ESX0JlP4L6g83oVVgTYcoTru9WsFVs28wIbPqgPMw
         OQlMF9kzdUqxyMX4Jcr06vXj5DS84PlDm0TLiEjNnFjD2yfiTjJNJrjOiW/mXieaimM4
         0fQy7VFRQfNY1OXoQ+IoTBXD16/CgCMZBZvqxitTugRo+hugRJYGgoYoI1FJ7AyVmVUS
         UO4w==
X-Forwarded-Encrypted: i=1; AJvYcCXxJq5W9o31MrwOpo6bl1TV2vxYi1uF9hJHr8yRr13BQ17nTBCRa4Vm+ojGIB7Tuyerqw7CGCPKxUR5a0Ch@lists.linux.dev
X-Gm-Message-State: AOJu0YwRf7WAmJItac+2ffhqJ/d42cgsSL1Hq2pOCO0UHsa9aMXLc51q
	xUSNO1VUSkQDejOjFi0QXSAxVBcamE9F+OEDYiXHaYNYE6ijQ1qocEPI
X-Gm-Gg: ATEYQzxPEq31VLHqRtHOWSYZLZKT0QW3fAzN3rlbXOWdu+oISRWHbCwevKGSLGENYSG
	ccFtAqwEXWP14pJoDJ1SchF9WHAc0D/wNlzLBD+QeyN5Ui0urawdYxfqiHva8Y2dMHPUR8s9QP6
	BJ0ZL9IzzZ+Ezv2e7e6gBakUgXonQl8BPyur1pBPWmel2xcoEk0GawnUeJCjfKXJVhqbv80S3ke
	1nk0AuaSqhvZQFBU8re+iv181ldUdgSzokVfmNFV8L85L50OXBoHUfqbR1neiDPmhqp9rxahoWK
	+hHqhnGeXxGLa712r79vjYkmAvXIPQzjkxbKZUAtl2y+SFMSM/U3qLL6JVntyVTZtLsCtUXRlTg
	3QgLfUgeZLd3uN38D6cFBFH1zjuONiU3Nz1HvAt9a1/w9h93W8HRvDv1kt5IedT7u/3rm5Kywr2
	x2JTjtAu5T/KO4+5ZG/QRPSz0DWinQjxggV2jsujeW
X-Received: by 2002:a05:6a21:6da2:b0:38b:ecae:671b with SMTP id adf61e73a8af0-395c373cacemr8691204637.0.1772358728247;
        Sun, 01 Mar 2026 01:52:08 -0800 (PST)
Received: from localhost.localdomain ([111.125.231.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa801963sm8971216a12.21.2026.03.01.01.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 01:52:07 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH] staging: greybus: standardize data type and fix alignment to parentheses
Date: Sun,  1 Mar 2026 15:21:54 +0530
Message-Id: <20260301095154.144809-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize code in the file:
drivers/staging/greybus/Documentation/firmware/authenticate.c
by making the following changes:

1. Remove redundant 'int' from 'unsigned long long int' as suggested by
   checkpatch when printing the obtained device UID:
   printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));

2. Fix alignment of multi-line printf statement to match opening
   parentheses:
   printf("Authenticated, result (%02x), sig-size (%02x)\n",
          authenticate.result_code, authenticate.signature_size);

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..ba4b16b04557 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	}
 
 	printf("Authenticated, result (%02x), sig-size (%02x)\n",
-		authenticate.result_code, authenticate.signature_size);
+	       authenticate.result_code, authenticate.signature_size);
 
 close_fd:
 	close(fd);

base-commit: eb71ab2bf72260054677e348498ba995a057c463
-- 
2.34.1

