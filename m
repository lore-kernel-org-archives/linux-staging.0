Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E8F3BED32
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 23:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962039; cv=none; b=nn2WyU2l3mv2xJaubyuJvdzkL12rCCqMtq0/1EnDsNxSI/0noM0k4RnQnfOEihTXyv8JRAeEul/jMDcAX30Z5Y1ZF/BmvEyb1DyztavZ1bOHTag5w2/8bJOR0cPhRWHWSXz5s62jhxNe0mEimdTRKdm/HjuQx7Yt9yJ/TFVSGhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962039; c=relaxed/simple;
	bh=5YXqXzLgImbExZ6CJGBwMMrNWUnXLf2P4WRBaQQCFAk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nFz86vhJf39frHw9ABmxpCYpCHtD+aWGs8Dd31IPwTwSrRXvvX5sWZB+lf1YQ8f38K+RhgsNQy/IidzezgI79dTu78yMJybXQCHDqdNDGImfXdR7vrABxJ5MRv1cYl5mY1YDQEkc8r/6/UO/nz6ddiEPUPP+K8VrWFZ1Ug9hlt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSaggQb7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSaggQb7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b45bb7548so954058f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 16:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773962035; x=1774566835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CuMvGSI+s81FiB33f5NkdXBXz2+oEsZHzp7Bf28zyqg=;
        b=jSaggQb7deUwGvdbKIdYBC21v0gFJlonu74CoPX0G37gObXtGDuN3D7zcZ53HlIh/f
         FhiEXvDY0sL4SfNEeKeCtM2pP8bpkfy/W3YCL6H9oJmYfDfnMEy7sZ8UuRPQXUoIfItP
         52Td+95XamycGIlrwi5WScvOEfehHzpCOJxgJe7LDHvwvIaFCq7Kgdw7kF9cZOwCUkzw
         jWD41pV+/e41/BxLszK7vFRrVlikUAlxKbjo4vWrCKSYaTq2w4wEY0+jHbiJGsh8teff
         DiQmZKH6tbwVJgvLISS/itssP+Jf9pPSHb/ZnSyr+A8f+cKZeFlSCo+/1xJ8ogP6BVCV
         CNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773962035; x=1774566835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuMvGSI+s81FiB33f5NkdXBXz2+oEsZHzp7Bf28zyqg=;
        b=D50kzzm6hCiYduetBoA5G9JXxwiI4qJTXRPfKKKhQ9X1uoZyyS5YitXhPVSAOW6JOm
         WtOv7h7GPNXwAmbQqvo1Zw6SV8FxlYCy7wwyX15dksz/3cRALvUH2HF/OhQR7NXSYkiK
         lk020Ys5OPUlqwDKwhZhTPaRtyEo1W0HvfKJmgzYEj6zvH2GGvzUcf8BBNxZVNqZCt9Z
         VIjLJ5xu2lIM0oHPfkh2TGr14/ErIa0qZxBuWubAH42P0b9RVaG91o4EngVEnz7hby6y
         mUZsuwtGBMdAAzXElvzqQAMn2qD/ZE5VLCbHFGk/iabgHcpc7+XyCGPuvo0wn0zDvPbC
         HGzg==
X-Gm-Message-State: AOJu0YwHN6z5aTbUYc04lYc2Yx5Qs8hFG3JhMtRGKBg/4PYPPqmoNLEC
	iViyAdwMQm44FO4Axx87ZgL7DmftRuf5C5luBzGxjL0ApLhtwaRajg3PmALI5Q==
X-Gm-Gg: ATEYQzwwitxzO6+DzLKIXcLc6CIGlx+S/ZNt8PCVojGzcDrbrKdEtLk5si4b2l7X30M
	B0wZqNglaylin192/lPHho5aYBLT37uL4d14gNyqlaVyXpDQs9/TfRu8+j27WoWWVz79yvpe3uG
	dBPOg1Lg+4ml3i8EnZdjAptRRxIwavFcuiVNNY2ujBANoWubFi3basB7UTROVFVjmDYm/UuQImy
	5QXGETz428bLYPz29ssW2tccyPYaEhRVSgRlthVnAm2TCuyKkUUU/vFC/LALW3XIXHwJz5owUXa
	xuuZ46V+Pio3ZP4vpsa3rhqIXk9ZlXy1aC6OW1bKo1Yqh/yx0Nu68ELftP1TKG2LtgsFGu27sDD
	lelwup1tCisKKmSSaoRiJTuwuVY+l/jfcVbscD1dDyJ+S1ZNkRHdoypBDqQNXM5mBIC/Aq8+zc7
	89KhxZUqxHX6HgHIa7JzxnM5DT3R9F8oHbJL36lB/KCS+ZKw==
X-Received: by 2002:a05:6000:310b:b0:432:8504:8d5b with SMTP id ffacd0b85a97d-43b6428ba20mr1869096f8f.50.1773962034653;
        Thu, 19 Mar 2026 16:13:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1c48:8ce3:7093:e9ff:fede:440c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c35sm1983888f8f.22.2026.03.19.16.13.53
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 16:13:54 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Subject: [PATCH v2 0/2] staging: rtl8723bs: clean up rtw_joinbss_event_prehandle
Date: Fri, 20 Mar 2026 00:13:33 +0100
Message-ID: <20260319231344.569418-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the rtw_joinbss_event_prehandle function in the
rtl8723bs staging driver.

The first patch removes dead code guarded by the REJOIN macro, which is
never defined in the kernel. This simplifies the function before the
subsequent refactor.

The second patch refactors the function using guard clauses and early
returns to reduce deep indentation, improving overall readability.

v2:
- Split the original patch into a two-patch series.
- Changed the subject line.
- Removed all REJOIN-related dead code.
- Fixed a typo in the ptarget_sta comment.
- Avoided unnecessary changes.

Jose A. Perez de Azpillaga (2):
  staging: rtl8723bs: remove dead REJOIN code
  staging: rtl8723bs: refactor rtw_joinbss_event_prehandle to reduce
    indentation

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 152 ++++++++++------------
 1 file changed, 67 insertions(+), 85 deletions(-)

--
2.53.0

