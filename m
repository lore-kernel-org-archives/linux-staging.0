Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B548A923
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 02:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752807140; cv=none; b=fPzv+yoTAMpDzpLVlgMF2V3EADYL9mxRHM4ycvPh0Tz2oy8FE4myUF2owlpAOu9dAp1w3+7+ltAJskVxbcZUY42iEi1vQSUr7IR+fgcFeqhysm4Ehg1CZrepvxipwWdo9izy1i3THynq9eOs1tzGEDR9gx9r0MHQGZBiQSwJ4b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752807140; c=relaxed/simple;
	bh=uO/aLk34PxK6RuOp80mrh8FbIyan0m1N7A2QsZ13ks0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XvCJN2dCzWnvMYqhQE6X60j2vnL9T+MbhuXA/yvgbh+S9Gc8effNoJWX7izzMb5287ecbUmgfMK1NZp7P1K00xVqAEQtsTdWY9Mwx2KesHy0qws5T/0PY/mhFsJDiTkZ9bg9klYnc40mEf1z/ctaBusaOOxKzRZwRoYnlZOjyxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1SQSs/D; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1SQSs/D"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-704c5464aecso15563906d6.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 19:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752807138; x=1753411938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pGG0XVFo2FBP426ZvN01QcnEm/j5L0pLYY1EkcsyU/w=;
        b=L1SQSs/D8A6wyN6zR1wL/gWYc+qKKKHY84oBhpfecxsFRAwEGPTmS4BpSHU4ybPpQE
         zxZWl/LrIvVw2Qdv3DGXL7/60zqQw1zjILNa4GXODOm/0R9/ienF0x8O8SLSU49tXHQr
         DvfHHBUYJBCd23oexd/nK0HugNymosozsLLzwg9JFaEqc1+EpkmTIYW/kecFAn59pdvP
         ShOq05k2HRDC77gAAlQ1J9OfZEE9ismFwnzzZlVoiwYWxGNuTwohkIyCATMHu1hGsGXF
         /fpHUrLFD8pYYt9jvuri8Ca/CPCEmB14WsKoNmXEL3wtrANrx9VTwKZrwwugbzLmguRJ
         PFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752807138; x=1753411938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGG0XVFo2FBP426ZvN01QcnEm/j5L0pLYY1EkcsyU/w=;
        b=RuFAnBcINFml63wvC9CNJbk13g1aWDKl4jm7TbHAprnW9tzxwrR40s7KYUPdIYVrv8
         FMqhAVPvyEmuLqLTD1kFVarx6a3ZhH3Zu4XtfX9QpjoOmK8EOUYhEYkOPVSxfk6Xf3zw
         w8JnJQHdVtLuNvLDK6l3hcLefmFw+pURlM7SrEDq4t6tgbPYfSXZEt8+xt6Sk7ENQGRz
         15iWf3PMhQN1AJ4In02u2nmkWbGQncn2z92GgBfaUiWa9sXYoRHxC5USjWbmmjEdE/iI
         KG6S25h4E9Vh3VqQ5pcuGHmbww9Ju5q1AdTkI6gzI4o2aKX++nMEzWHeGn9ufZPQt4ti
         7GVw==
X-Gm-Message-State: AOJu0YwBlzLCoKK9c5gueoxWt2ETdri2zyIjhMpn7rd0dv+m1hSd/Efi
	HmswbA3YevpEgHx3CsLAmosJuwLQFnPpBaumTRtoz89T5RFN3w11s6QivALaTg==
X-Gm-Gg: ASbGncseO0FZaZqctdEwJwcC8kw5VASoiAf/MFcPWleZDxsfkEHQjd0bkI6L+Bau1b3
	fAhY+pRrCHqbfnZP1SylOqb0+USNsysPkCC/fi+Z3iRrBW19BEKLepAK7l7ojuViBPj+vZBi4jV
	GwCc/G6DXT8bvtTacEcB7hGdIHxsBF0h5DbATQdE+SUno5LbcVRp5wLon8vHHbUtdejky0OvVYc
	KJBFGG3rSDLvyW91y1TbVT2uwH4wo5CvJ1pjTCU5vOVTVGKLhH2CRhdtgecgKekV4vkweNPwnwr
	BotTNzTBGVfDlaS8XQYlWvWJXW48Wa5IuEWgTiNigXV6gikMv6qDY2DWHHiMogJY8FMKAXrozKe
	39ct4HFMTlo1tz/7Dduy0cUv6IsaaikjUk8DCCFxdoE2KRkjvYvQ=
X-Google-Smtp-Source: AGHT+IGGEdFMjsd5e7qbjSVwxJTb2UjsHp4FrYMeWQlkHqMQHmF2eQ2SMeO6q6aDdnjwpskl4Cod9A==
X-Received: by 2002:a05:6214:5f0e:b0:704:93e8:5e5a with SMTP id 6a1803df08f44-704f6ac6425mr143547526d6.28.1752807137919;
        Thu, 17 Jul 2025 19:52:17 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba9d63asm2710226d6.89.2025.07.17.19.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:52:17 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v5 0/1] staging: rtl8192u: Rename ChannelPlan to channel_plan and fix shadowed index
Date: Fri, 18 Jul 2025 02:52:05 +0000
Message-Id: <20250718025206.171361-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is my first contribution to Linux Kernel. 
This patch addresses a naming inconsistency in the rtl8192u driver.

- The global array `ChannelPlan` has been renamed to `channel_plan` to follow Linux kernel naming conventions.
- The local variable used as an index into this array was also named `channel_plan`, which caused shadowing. It has been renamed to `chan` for clarity and to avoid confusion.

Changes since v4:
- Renamed `chan_plan_idx` to `chan` per Dan Carpenter’s suggestion.
- Removed unrelated and accidental changes to `Makefile` and `init/main.c`.

This change improves code readability and compliance with kernel coding style.

---

Vivek BalachandharTN (1):
  staging: rtl8192u: Rename ChannelPlan to channel_plan and fix index
    name

 drivers/staging/rtl8192u/r8192U_core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.39.5
