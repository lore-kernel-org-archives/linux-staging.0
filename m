Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2577117B506
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028689; cv=none; b=Q+md8/IvixLVLz0Jc26/Yu4P0njFsq5fyZpVBgj44EVZtX7L0wfp1g9tgpEpR0C/7NhE4/WI3xhWCNNon+JiOa4tRyJbU2I+KtV/LwTNO5lA0050kkS/LIIJc/cF28LuS4xIQJ5Bag3AfcnNRTCFFAXYg6GoaWkfUdaDGI+swmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028689; c=relaxed/simple;
	bh=d41U0Knm0JA02Dsu9sgzHrWkNzyb5mRz2Y+g5omAHmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qhEtQtY8AAWOgpBjY357mKBLQ/boibYJIm6uEX3H/QzTs2Vg8aInYA03y1v8cjVZ2zQ4FGRuzHAgrznAKdjhQc8JbplAUiDcF5ZULZXYvXb5KBe3NfgWH8wo03mLbZTrU3sMDxDSb0v89jxwfItHmQY7RGMksx8DnzNGhkXzHm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htjmEuMi; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htjmEuMi"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c70c112cb61so1123729a12.0
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028687; x=1779633487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DKtLoFmEFtscZTJc7o4HWOd2/uMFzrwRD6BNQgKmBg=;
        b=htjmEuMiN+POGoUYDXKxUMJyZxMhtxwG1k4dZR9dF188E43DKjXc/j/9DQ6LNbkS3C
         gxXVREs4/2lHT3qwK5vajdaV1EG3Ff/yyRo1QSI2sYH5Ynyyr3j3e/wFYeyH/hcvEF9Q
         M2FCGRG9NOX1GoP52NiomkqzRJ87q9RmmxTSsWVuLTqYQE+IfAF9Pd1Mte3LDuohbF6f
         Y5Fh08Edz8dc+8jNBX0vdCQLNjwTOR2jM2Ykx8qHml8bfSNsEDBlgdFg2KMc7imHoMPd
         eRi+wdViCeY8KpBC2ENWG/0va0TVA5XnbCb96KJEo/CBmgtlHAA3P6xT+0lhdbSmueZq
         aI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028687; x=1779633487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DKtLoFmEFtscZTJc7o4HWOd2/uMFzrwRD6BNQgKmBg=;
        b=QoeV8aRfKO3EzFUlL63p5wZR+ITvmrvkNv9Kx6cYk9RFJvgaCEGWoXygUbUUCGGg3B
         Zzt1CnmzIPRzmXUGEHjH73bI3svImc0q4R+QCJzWbpBCA6ZYQtFELDvMjMWdGecbeyVi
         emX/1thWcBiHATkUtaa9tzOsopRL7W1POjjpjz9y/4QT2c8KvSwpBoQ9uqk+ygNzxwMF
         e9cTCsfAcHb5JjLJhhoWTHI0LrhyNRSnHVLH1qHNL8nzmNIB79iPwPLumdHeSCwAEFVB
         1fmeTE2YbxxC6qj3GFdGrw5XQwCROwxVXp1mAxo7iT41gqLjBovSel3lSUjtvnUs/gIe
         PQ6Q==
X-Gm-Message-State: AOJu0YxLp9PIKY9GRKWpmAM+LqtcxGzTlvP/K9wRY4NbyimNlJ39zVmO
	vygUMFxLKhg9nto9I8JqEK5fCfsAy58O51rsiW/eGfQVhHU4dSLQ+vI1wRO9UMdO
X-Gm-Gg: Acq92OGMi/v9IPdk7heId2AfRVIL/WfSULLghZW+gh5xL+3VMfiUxk49yYzcuizmzOI
	Am1Uui3cLCSskTNJycZh48bKkIrbvyN334RTPawtNTNP0mj37FQnOG9VsgKjOJsoLdMvRa04Eys
	+O6KPDkNYaup+1P5M97a8mQcoogc+AvYrMq+Rj8T0Cf/yljEvOsqbiyyCAVXNNKK+IW+ePhI3ei
	8jLmZrMhzX4tVBOStlFJ1HbOp4paVixN8PX+KGHL+ed4ZAWum88g/QUhPBaqER0piSbysfylBoO
	ick3F/S/gl+sXBTBDBvfF97t80Y5znakH1svFsEeFNHYyWNamFTqACwnB37+q89fSzsVLTixpfL
	yk7GHpZd+zKYAhY62OQ8XXWwFlFmkK7HbKnBv3d2KNE0jWvD8/O7k2mGBH0lRMY6bOqOD+TJl5h
	0A/IqpivkObpZP1HMcugemVpPBgXyDKrxG33vRJE0Us9ZkpNPqfBg6H6syRMqE1zfcF2xXPzxNP
	tjhHn5olnw3Gg==
X-Received: by 2002:a05:6a20:a602:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3b28685150cmr1245755637.7.1779028687462;
        Sun, 17 May 2026 07:38:07 -0700 (PDT)
Received: from localhost.localdomain ([115.242.226.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196647aasm11036887b3a.5.2026.05.17.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:38:06 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v4 0/4] staging: rtl8723bs: fix efuse formatting and brace handling 
Date: Sun, 17 May 2026 14:37:19 +0000
Message-Id: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes coding-style issues in
drivers/staging/rtl8723bs/core/rtw_efuse.c and adds a missing brace fix.

Patch 1 reformats rtw_efuse_read_1_byte() signature.
Patch 2 adds braces to the else clause in rtw_efuse.c.
Patch 3 reformats rtw_efuse_one_byte_read() signature.
Patch 4 fixes missing brace/comment formatting in rtw_efuse_read_1_byte().

v3 -> v4: added the missing brace fix as a separate patch and compile-tested the series. 

Moksh Panicker (4):
   staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
   staging: rtl8723bs: add braces to else clause in rtw_efuse.c
   staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
   staging: rtl8723bs: fix missing brace in rtw_efuse_read_1_byte

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 12 ++++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.34.1

