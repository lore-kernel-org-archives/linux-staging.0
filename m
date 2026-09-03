Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659C171B1
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412761; cv=none; b=r0VnH7WUM/uanSd2KesO7nrdSzmYBRUpQxaWr5sansAJzqgzcgL0pN2NfD9z0FzbkytMo+NIWgjiBtO3vy4ZLhbWcgnVEGXD30Rd9xA/WptkvvMDgQJBqpTSt4Zi+aIzpVX+4wRplWQjuxFNgZKEdtIS+tAUlu2yS4KHWMbViYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412761; c=relaxed/simple;
	bh=VQXrH/5YvCkZkKz+MCTLofseBdofVsh7itTlSswqiIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ut0Lm9Mtep/dj7YYXtDaJrHd2xVcjkBG5FAYggEwy5PTtPj4AGRn93Ctd3HC+4C8EN2gvdMAwVgYSdk6HeGdJU4RTxgyQj7sRld2LHTggrZlzMjd0PUsmSdqTRzJk/MbDTprGlr60fl3iNDZ6HFE+azqWZA5ZNhk5B+1+Uu1wHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrmfJg1N; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrmfJg1N"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c7c57e637eso1156650e0c.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 22:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412759; x=1789017559; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fo61YL5u3T6uBKlZdk4Zu2YkV558WWJJYbN/I2BPkPk=;
        b=RrmfJg1NMqcP0KtnpMjuMiVYF740lC8f0kiqGSA9WCsNC3I43bwwNlrVsBbkJkyri+
         nY+osMMV5SAts480Jh5FKTvdx8cZYoaSo/M+4dqhMjaNyhDnZWP7lB5ELXAK9UNCjTgD
         grvwO4Oy2TREi7enVMS6YCa+fh9L7g4q3jTJ4uediWHG/QUPHsNu0BPb7PGFtIEhL5/r
         K/a1qrcgiTDVzCbSV+mJxkLtUVUjlFsKFnWvwm8SriKv0XlBRB0vPCWenlyQ4u6fXvrS
         ImDVSOlb5rcSsUR+GibG6UlFZSM/dRg6zEmkeLPLi8iNGZWfjmPqUU+eUQcxJ1Pfn4Mm
         E5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412759; x=1789017559;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fo61YL5u3T6uBKlZdk4Zu2YkV558WWJJYbN/I2BPkPk=;
        b=QfuuedT9f+xua9FtUj47UUXE/8MbSFnqygFxCg+IlE8K+9cAj88aeH7tEjeFuzlUUc
         RQU8Z0wQtGoouGkGx/zl3BP4TOz5ISf56YtlNekozCS67e/U5sjjWB9k532VRon4+S4Z
         JG2mpODo61uYH/jw60ccfbPPeT70DVskNzphPvmX2TmdxVee7sLj437WMDh39m/x7T6N
         hqj7EmgyJX5T0Cnhgv7qwt2xiMcpZroW5MEX0CGSwJEAmsLpl7dX/ISogC5BJwbKk+fn
         CJPkmabmEu/cuwWz4r7HIO5PW7AU580Sazlv6Dt14wN1Wrii2NVhgca0q6SD8x7Gy4ax
         ECSg==
X-Gm-Message-State: AFuF++ml6eee7/Lyq+1JnYExhxywQdt1YYBvd97t/ChLAI9+yiPxqD4K
	zzdoAcKiaxIv620UkinfT7ijSPBsnrIONmrnPg+zbR3IvfMsgnDSjbHS
X-Gm-Gg: AYBFou2V484X/ebFnvwDmK/y/a8UPir7NPYMTKkpxGdT8o1MgNM+WaFtqH/UWxIIhO0
	vV5gbHyWnon9CDyHYk5gZe2z3LAQsdyAc/zeXW4iYLHUWQmT2kRQmTFz4ivledO64ep6C4nLlxv
	BLuEmJKdxFgxDEhuHcubsmYQWp1Ekm3cqFNmBPrQ3OgQ2ki/GwAcXib/Op52ZsTjabBYRk1dYQy
	nB0fI8/06uASgq5Imj7+DjjCyvHO2ZnvQsaaAgScyPErTauQ2gfibKs2HkCA+EG+xX/J0UUAyEH
	m81nmHrNpqXCAjFIsk61lTFkZbHJLFPQb/I1j3pRUwTdrvXo6liCZBlSBMbyXZ67mwDkM3+kv6h
	dqZtrzOKnfFykFYhh/5wy/Bt/Vy25199K1SAlvSyspGjluOjJkfGW8yLk/OSsPfxLYmMZf60rEO
	WxWX84/8X5kRsPHIsfm4/+o95M1iPfjctmUOUJccjNwKlnnA5jMN6ZrbQG8vIEqrBY
X-Received: by 2002:a05:6122:4f91:b0:5c0:fb8d:9993 with SMTP id 71dfb90a1353d-5c7d2397666mr3866911e0c.0.1788412754395;
        Wed, 02 Sep 2026 22:19:14 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:13 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: refactor issue_probereq() into a
 single function
Date: Thu, 03 Sep 2026 02:18:06 -0300
Message-Id: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4DmWoC/x3MMQqAMAxA0atIZgs1iKJXERFbU83SaoIiiHe3O
 L7h/weUhEmhLx4Qulg5xYyqLMBvc1zJ8JINaLGxnUXDqidNuyRHQodxS/C+DojYWsjRLhT4/of
 D+L4fzbIA82AAAAA=
X-Change-ID: 20260902-issue_probereq-bdfcc4f22270
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=1089;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=VQXrH/5YvCkZkKz+MCTLofseBdofVsh7itTlSswqiIc=;
 b=V2c6kwDHjH7Hxk5ujwCl3ah3YxtOSfoViMEiIC+FfwJzZdLk/bM1CmM9NotyrDTD9DToA9aJu
 YGBV2kmFcDEBzAG90ZWsKZcSXitO5O41YNYXIbwrO+76P3eFnhZZB80
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

This series cleans up dead code and removes invariant function
parameters from the functions issue_probereq(), issue_probereq_ex() and
_issue_probereq() and then merges them into a single function, making it
easier to understand what the difference between function calls is.

Compile tested only.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Leonardo Martins Martins (4):
      staging: rtl8723bs: remove invariant parameters from issue_probereq_ex()
      staging: rtl8723bs: change issue_probereq return types to void
      staging: rtl8723bs: remove invariant parameters from _issue_probereq()
      staging: rtl8723bs: coalesce issue_probereq functions into a single one

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 98 +++++++-----------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 -
 2 files changed, 27 insertions(+), 73 deletions(-)
---
base-commit: 758be99c46265b74476d5e1173d781abe325533e
change-id: 20260902-issue_probereq-bdfcc4f22270

Best regards,
-- 
Leonardo Martins Martins <dev.lmmrtns@gmail.com>

