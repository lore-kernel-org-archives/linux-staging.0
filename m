Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9033E51E6
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 17:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559537; cv=none; b=Ak1SsfGh75H9EnXG3BlGeGn4dBEVZihxRNj3z4ythjrZyp1q2uTFa/Cl1xs/aZBNPlg2Qx5iKz2LxAAd/o33iFQ9pLWuK9f/+R+qP6fdH7jqT1jdATSweMW8ZJD3L8H86bIKo06R4e5c+4gSz60Oz++C5V6GU+5ZX2HO/hxTPTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559537; c=relaxed/simple;
	bh=sFofD/e1wMYGZwh9nXM4Zw0RXlyLk3R39yyzk2MeFOU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HhFOh1GAAdiCJmLeaKGACSlARe71NxstJBWqq3uRq9XJNEKJ2Uxv+8K943Ysz8tjZjObKfezxqyPnbxqY0LijkZzEhLiyDIdeeoYSCL2n3cF54SvqiYjHhuaeCv8pSxsfxLnLyxC3nwnfIcRbnb4y+nkM37pKx1wKTA/iMLvOO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuywW/DI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuywW/DI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4484659f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772559534; x=1773164334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+BLVTwKFEUCNopcBU406njtQ3/ivO3t8UJV0ZlgaUQ=;
        b=JuywW/DIcpftYgNPodTuUyUnSiuDxT5puepclUb29YeBDKxmgFO1FMk01FOviR/jN9
         KOp2/6LY82FWbb2VrDxplT6nCTUzXv4lt1sASRepsUrDnaIlilzlA7BRgd3k7Bh6GsR+
         uIX9gREsJ6KjWUvU/CNPazpvjYO3RAvSQA+q6HgjOuLpKm/eje45+8tIOLMLDq2Lqc9+
         d8vJK4SrMtZnnGvjiPOah6WQ+r7pXr87ZY9GB4ti53tfImz8909VGTx6nDIl756vRaXn
         AF0N5vM+CB+MZnXSv8lNT/Abxiypf4uhMdP81jytv8erPKxVsM7sLVKLWujYqAR8i747
         VxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559534; x=1773164334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+BLVTwKFEUCNopcBU406njtQ3/ivO3t8UJV0ZlgaUQ=;
        b=nB3qAC1fM5JbPtmZocceY/EddlvYdqgAJ/PmhBDLaTUdVqaKEUdxw/ePHvUU3H5X0m
         b0CT95Adf3I4PqE4lBD+pRGul2TAupBIiIHmpv8S4IlpgZeiroOl/5zozufAYvooqTVy
         dAdHNsZpyskvg/XcMeJrflMOB2YPKGQGNlR7Sp0sIXZVhwU/JRnP1vNYgk2RppnkVe6C
         VeFLlnJ//eXVeyRmyMJnsZ5taoUA54Dd462PQjbskJ3JpDwel+J9np5xYBsuZYDg6m6b
         rHwDNKmu6pYpwjFjMn8LIIOmkY06W2msoanAr95YlgBhvRvo9KJMbGfvuDwId3Vopzle
         0N/A==
X-Gm-Message-State: AOJu0Yx70REc7RlTBwsK4oSUrcCmvfNoTyTkbdcr9OqEZLqmhIjPUfca
	rtC6SSayWPAdNcZOMZd1a12FoLSW3+sWxQzns6RqS89y/mH4HAIo12h4bl4m1nvxxqs7PheB
X-Gm-Gg: ATEYQzwx20JaXG70LeaTYC6gifXbsgQgLg7FZyjoUNPddwwdmC+wVITo+HAYBVv3+1F
	V+BElV2Cvg0Z7G1caGsQgnV+zlE7w0k3xq8ttYzNgfOJs0Uf42TnN7v+ZXpodcpwldQZ6y4Th2Q
	KvOhTZAbeSwGptcOu0A8ujG4PW6+p/1CHBJwtM1VxRvDKSayELXUhjJXKRYQZVmbw6LRStLyDPn
	GBCEfd4Dgw7ivNwilo2r/ytlCNzv1ojflPH8hPqSCjI74O0caoQhTFLPa0awHGl9gskXwaArtG3
	66Ti2CaViF5xdeicO5NWIo7L71sPJyCTuyvLgezvbcEn6kvtg+rzfragipXacd92uZyGxbMJwYj
	ig+pdGfnqlJl7FBSHEC9Js+qD08BL++cXnWA10c/mhAxj0bCjrM2bXSrrM7azTb0UUJFm94f6a0
	wppBc+WDWCQdBfkLyN4xqDe64O1oqNap04mtwNbCQ=
X-Received: by 2002:a05:6000:2510:b0:439:8bee:b986 with SMTP id ffacd0b85a97d-4399de283cbmr30293680f8f.32.1772559534009;
        Tue, 03 Mar 2026 09:38:54 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm16701884f8f.17.2026.03.03.09.38.53
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:38:53 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Subject: [PATCH 0/4] staging: rtl8723bs: coding style cleanups
Date: Tue,  3 Mar 2026 18:38:26 +0100
Message-ID: <20260303173844.47975-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up various checkpatch.pl issues in rtw_pwrctrl.c

Jose A. Perez de Azpillaga (4):
  staging: rtl8723bs: remove redundant blank lines
  staging: rtl8723bs: format operators and logical continuations
  staging: rtl8723bs: curly brace consistency
  staging: rtl8723bs: fix indentation, line length and declarations

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 90 +++++++++-----------
 1 file changed, 42 insertions(+), 48 deletions(-)

--
2.53.0

