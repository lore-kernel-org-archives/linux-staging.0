Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584322D4EB
	for <linux-staging@lists.linux.dev>; Sat, 10 May 2025 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746891490; cv=none; b=TjRUDTZPrNdt8ZzhomJZudo0813kfaidL74zQZmDgS6E7HhkYHBfJmeFWoiAtuSxDwdCpptWNf1fIVS6xd48YVQE5ElbpNXHBWecSWz2J+1iwK+LY4okUft+HOtsi4RlvttOS+NlPcctQaQpsoig/qXN7TdUTlvryOcl59OLL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746891490; c=relaxed/simple;
	bh=cyKzN5n74ZRPzOjivCuJ+2rpIjBBQdYG1gV1au2lrSg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pvRQj1uyiBJbHRL9ITDbqfmmwWNUk76UrGL9p5UyEDwqi5rwRCWoWkkDMLaniZBRGoSyErvW/vccXYJ7nejSNIiOOCxjUMkG3QPIJ+1fOBYEk91zhr3Y5ifQHLz/950XDu7pgzcEnZr+y9rrYfvNFYRMtWuNvDieTQRyFnEvAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJGZ0rnZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJGZ0rnZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fbda5a8561so4415465a12.2
        for <linux-staging@lists.linux.dev>; Sat, 10 May 2025 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746891487; x=1747496287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WisVRIR4CgyfzhdNxpezMbCgvO4XZsl1Wpaq0T63y3k=;
        b=RJGZ0rnZdbyE1EL1RaHmnh4yr/53Hegp3o2EcjdYcgDUi306OFlgTq3gxaY7Ckv4TF
         Hg60WzGF9z7tS/jx7+Mf8vLWgrUVxXoroX2GSgT5ftsBRvcMbsjUXrndxeaoOuHcaF1R
         SIr/mKwPM+dALtRt5d24z9l/N9LG0rFQbJhEl9dIUmaMHS/m0VQQkgVTL8VcASdCRKEk
         BB/7Bv4GhVVEpIH7swB2mE+qBrMn+rlzq+F/29z+wVGDbhZIYxh16G7Pi0+XbC96vHEa
         uNMHD2k13qK3Q7uOvAaE8i8Aa/O9hhHt+NcrImNt7Y+4VMdN/jD90g5qMYBlhjgYy2w0
         difw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746891487; x=1747496287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WisVRIR4CgyfzhdNxpezMbCgvO4XZsl1Wpaq0T63y3k=;
        b=gG77NJ4/0Rx05dxgsg2YgYcpi4/7U1jaTDcctmMdFenEsfVOq8Y/8Nvfr+xxRJGhu8
         7hr/1WtHvfGwsXGHKixJtkDiW8j38QNWyp2ylIjhT2ukda1ZtRSFUtoRw4DhJIfA5NOz
         bSTO8SPPWKwByRIQLcbTSBSj08ytcSpMs8EQ09SpQE2gjJ2e3ynetNgQWMKjpWr4CWB1
         mvZBkZ53JLyXI52UEvqfiay+Dwun/DWM08kInflN8zEhexMuDLvEKkJooDvxT/6bQg5P
         ktmwvWH6edKs46YbEGCXtgowjdCUsTes6l8EZHrSYU6UtLSQ3k3i2TpyNbpQdje9S+IQ
         Hm5A==
X-Forwarded-Encrypted: i=1; AJvYcCXDXidU1vnPajZRhWtHXu8juHnnBOk2ls0CSi7iapU+DsTjlhfxT3/iLrK5EPtKQiijQwoCRPoW2O23UfRt@lists.linux.dev
X-Gm-Message-State: AOJu0YyeQOncB7QZ+kT85baZvOQY4OjAmpVVy1KganSr+gZ2EtrTEVnN
	A2SH7OTfk6vkBK/sF6hdxhfz5IVNGZnpbQRAjhctFNrAV+bfg5YY
X-Gm-Gg: ASbGncuV4wfDpB9vxDzffdRroGa9/fSknywkp/48qRqD02k7Vz9p3trYxOoP7qxlUpT
	+5CveUaHrVQnEbDYbEwC39ZTjdAgKtAbA1qvMYI4NYO3KqJS1Lb+MducT1x4vVnagzUi532GMKE
	kDz9GCndEjQ4UxS27DJeiPj0GINpznO2vi/vE5Qc1Td2pmxKA4BB5isMwYnWSn4ulkV7kt7gnpk
	ZU9UUPbAJjFckOMkqoX8QWhg6h4Cd8GAnVkG+ChGUM+oE2jECioKBuGRrVq5IPsVB2aabcTgaJb
	oxPpjfqZuF30RklyOEOcpwFwt02FbUnDumNK3cw8VWNTjTpI7N/PNdquVLHnE/OQPXWx+Cow+ak
	gjWLtbuCymz6pNnHxrYOfAnsQYgbcSkWWYAvjD5q60Rp2EFS6rzijkdtuXm/+MppzaiMP650cTb
	jocHJatMdBVPg=
X-Google-Smtp-Source: AGHT+IGJ7K1oC+40LDkqzQMhD25A5UkOKfSfr8SDBJL1orB3LhZckJHKiEfLWOxv6y/kE9lR9h4LtA==
X-Received: by 2002:a05:6402:26c1:b0:5f3:f8d5:4a5e with SMTP id 4fb4d7f45d1cf-5fca0730971mr5419551a12.2.1746891487036;
        Sat, 10 May 2025 08:38:07 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-79cf-0e0d-6e5d-219d.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:79cf:e0d:6e5d:219d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70e296sm2986376a12.75.2025.05.10.08.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:38:06 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 2/2] Staging: common: gpib_os: `request_system_control_ioctl` return value
Date: Sat, 10 May 2025 17:38:00 +0200
Message-Id: <20250510153800.130974-2-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
References: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`request_system_control_ioctl` now returns the value returned from the
function `ibrsc`, now int.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 8456b97290b8..dddf7a70084d 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1970,9 +1970,9 @@ static int request_system_control_ioctl(struct gpib_board *board, unsigned long
 	if (retval)
 		return -EFAULT;
 
-	ibrsc(board, request_control);
+	retval = ibrsc(board, request_control);
 
-	return 0;
+	return retval;
 }
 
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg)
-- 
2.34.1

