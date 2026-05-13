Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E6379C3B
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 21:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708253; cv=none; b=XIocgABnEFvcVLWx60kEH2CMun1wg/UcSFOWz7ZS/nnOlqMPaO5P3mAT2GhMx2iN55lfh7jNaqEaXIc8BwlWyCB5jXi4nnI/IFWk7dncULfmcA1xor60gAlIUJNdGnTr3SSReIHEtL5/vliLN/r+McGIQJAHoLJl1loEedm6xzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708253; c=relaxed/simple;
	bh=Gva0dW0irEQ3Mstyu8dG3k4pu01rO2oytyuG7pOORdg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B20OINj4nV12PWiFzsrHFVeSI8gbA+PxPv7jn9fWztMmUvGJP7QbpqktLCzL8YUE0mK9r4gA/UJvLr87KN340T5Uia0xcSLqT03d5L4FdS+YjCJo4FBBeWEjcQOjIZ5MnMlJRdgA5KFCILYum7CuCmIlxwVwAIYXL7Q+l3eWg2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMAvFTkm; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMAvFTkm"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2f68f3b075fso10296828eec.0
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778708252; x=1779313052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZw3FUsMo1VsiZYfbmopRCv0gpePoifdx2CirCGGWbc=;
        b=nMAvFTkmEsjm0nDzjZ67bCxrS/wjraXgLqxRTffCLQwY3Ug79grNeHLIOGajlzJMwR
         88a7YD2+hDeEut+332qIHk9SQ3kKrbHNsx6LZkq8ExnFj0t7Lw29Xl1BBNwwmHz0E0/3
         92k94R148BnqMXr1WMdhLBfxY5txbYPbptM1VcqHmM0uTF1nPh24UkxkfImKWx/K4WUV
         0AAV6XcXmbWMBZcOlRkUIgo3deTml9tW4DX5tvy4o1LtNgBSuWK/RDvyRuUJ+duyqUcf
         srsCnijFluYuGsHFGTKSBtYJOlJm1vo3GHbMn7jhhzFVS9Wop6+TR96omkEXX8wFZ+gp
         3vaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778708252; x=1779313052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZw3FUsMo1VsiZYfbmopRCv0gpePoifdx2CirCGGWbc=;
        b=Kas2N7KlyZYJ+gzG4OZvvncB4A5cDSELSbAqW36cJgFj37jcfAiY9KU8wK5qLFRoWi
         IzhHOEEZMK/xdodMqT+Myk4392mSmfUUBqiudz5apazf34TZXogwqGYGyS5gtEhcNiGd
         YTcbidh11nSMqmCyGHSXkqb03rkxzWjWLwMrQK4vABvrJHeIaPwGDyMO4ISQ6NdTXUls
         rQq7ONQWvjAL5+aHYSGfTlvG9BFA7v3XpBpBWZPMB8moazD5bE+pg91kszqAfiyJ4qxn
         zy8DOry0NfVL128lbyQWyKTVRwfiGZCcgAkRpJFGFyg33dULKhjO321A2qHuAqskJG3m
         gsDw==
X-Forwarded-Encrypted: i=1; AFNElJ+oLS6tv/kePnfG/U+qo1uO6E7H1iBZWNckqiR15m8JeJWpVstf+zwkX6MfaeSoLAyBXqzn6cyIzNbT7Hv4@lists.linux.dev
X-Gm-Message-State: AOJu0YyuvoAS3Y9VwIkHG17ug4WIwrWql9UzEijFtvT4DIm9LKJmAl+8
	I2mjAVywFZV9TkgdYZk5K/me1eH6YkVJNdMCJt2nHwpcOP1FaUwkB4+HY4068uYRfI4=
X-Gm-Gg: Acq92OGNf+f/Zhmmz2e+X2suSxBWqFMgW6vhLfMiEt/P/9oId+JkY7EhLfXI1oYHD3e
	8oDfIS87wED4dmLY8QUQP5IE8DTPW9oTrcuNUrV1eZN62Zv9qcYpGkoSCSRpGJihvF5NLf1VmGV
	Cn8Xk/8H1EWu7UOO2R7Ga7pqBAlDsoqmcLEKmsq6oEVWjfwfd61aoMucrKREYV7fKYTLd4/YIQi
	InwEd0B8Jk5TPANUGhNRmkAIfIoSpDwiNvjtSWyS/U9srkE477wmUfGkGvMt889DZLqpFNCwH/N
	4Dg0U0YjnjdaXOvhzaqX7spMCezS7SXV/IKNA2LaqADTP1kRfUV/bUlOO68bFwDVCEub+krsppw
	4us7UBzYPiSlM/LWoYitjSl80lf31OkrJn0cZJUMhImQYUqnyryXo+aj5DhGCUPDoN7DTerq0/Z
	7JjB2ggwWajhFxjcdrrDNvrxz76BsGy4avmgGFscD+Hy6FtLUcr1gPjUJY05MN6AULSg==
X-Received: by 2002:a05:7300:a2ca:b0:2d8:97d6:6ac8 with SMTP id 5a478bee46e88-30118e9ffa9mr3329514eec.21.1778708251557;
        Wed, 13 May 2026 14:37:31 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e69esm732316eec.1.2026.05.13.14.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:37:30 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: cleanup rtw_enqueue_cmd flow
Date: Wed, 13 May 2026 21:37:15 +0000
Message-Id: <20260513213719.12246-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the command enqueue path in rtw_cmd.c.

Patch 1 simplifies the control flow of _rtw_enqueue_cmd() by
removing the goto exit pattern and using direct returns.

Patch 2 limits the scope of _rtw_enqueue_cmd() by making it static
and removing its declaration from the header.

Patch 3 simplifies the control flow of rtw_enqueue_cmd() by removing
the goto exit pattern.

Patch 4 converts the private helper _rtw_enqueue_cmd() to return 0 on
success, while keeping rtw_enqueue_cmd() translating the result to
the existing legacy return convention.

No functional changes intended.

Hungyu Lin (4):
  staging: rtl8723bs: simplify _rtw_enqueue_cmd control flow
  staging: rtl8723bs: make _rtw_enqueue_cmd static
  staging: rtl8723bs: simplify rtw_enqueue_cmd control flow
  staging: rtl8723bs: make _rtw_enqueue_cmd return 0 on success

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 20 +++++++++----------
 drivers/staging/rtl8723bs/include/cmd_osdep.h |  1 -
 2 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.34.1

