Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450F1CD35
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113862; cv=none; b=SQAJhVmIeuKxc4FDTpWxX0BGgf9WJeCWoF8X3QjAMY9ttJfObCQZ6bclnduGPk5DeRtjjTWiuLV8ACKvFi2D8tJWA/jElIz7sSpben9msrpWzFTehvmCcuXezFART0MHGgBB1N4wgcHNskUD/khy5ELpXNmJdLof+WcwC9iW0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113862; c=relaxed/simple;
	bh=rvgwcp/eTAA5z5+ij//l668f8coWk03WO1JklLR9bBo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MeRtl6FEau1avY09d9DvwxaAs5ROGTy+YzK4ppolQdkoAFyYohX2wz3b6CSBe2DaCgKwDg+BTUUbsYmwIqZqJyU1VL0pkrc1nyv0nBGKM1cJMYJ74HPrk45YM/wP0j3XCko64jQxls7PrF3DPgKMz+EnSB5aEU0kEN9VzXOEhbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxrCVvGw; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxrCVvGw"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7db233cef22so245855a12.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113860; x=1726718660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cHqETZ5NjFfQQNWosTHBXQ+NEN6DfS799USGbbThKo=;
        b=TxrCVvGw9EFx9vQ1hbi/L7m7c0kPTtnezbHEURsZevpYAOYqEx5O8fj0bCQlkxThMS
         nAWrsZ5qE3nf6iIJcrYe5l+nHhHgxYBfcJVD4sTnnrBzfA4iELEq7CNU3qS4TfBCKo00
         1MVR+8/FKUQnUg/7QhHgRuqBYjkjJfeMFsDFOuMHHH+muBrbo2luaUCMJvaB6GiUaFza
         ijFlSkhmwWaHXOMBJW3L+YieohQ/j14uPqTSC6/TGzGfhhAlgGORVrPxAOE3NTx5a3D8
         eqaeB4pdogNhERrjDoX+hrgYt4d/ebHUG9D8U5KsZh8QnbfkZv08kHvPOlvcO7CjTMme
         CM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113860; x=1726718660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cHqETZ5NjFfQQNWosTHBXQ+NEN6DfS799USGbbThKo=;
        b=H78TtDqBERpx17qeLsbIOyMNR9bdWFfoYJpax5knEeLlYvKfkKmp/+YS6rnO6tbvIr
         Oasoi0fmKFYOX2euWuuHGxTMrdSFaI/ett3Q4hjhROmZBv5Gx2AKd8KiheSqDnlsyX7j
         HeRquiTq67L8Oj++B1D45jEF7qXJNDFOY8nDXnKC5QAH4b94x1izy1j1zJi31S+YqSP6
         bSo35u/ghkJUwoHojAFAFB+4FTh3ji3SCmza7vu9PEMOXhNNUmymB0HLIzLb/TA70IEt
         dUoipbjhsJXTgM65Wx1A1jJK26M5KaFWyGRRQxgy7cCdOTCIYNsl8RISfti/Oq2HoHZN
         0DNQ==
X-Gm-Message-State: AOJu0Yy1FCoYmWqkUgYjI74EVDSuoB8USQ/ySDDsdE0d04nun38m7RDY
	43rYx/cVdaBREUCh6bGuTMBID4Dq+BoKcZEvevruUKYU3qVvh+C3aCHw+iCjuXQ=
X-Google-Smtp-Source: AGHT+IHYz9pQioarPC8/WmpETgcV4hy8gxi3dHvJMmwQmHcsnHP9LgehLn1GBtEe+0YXwyqbOM9/Yg==
X-Received: by 2002:a05:6a21:b8b:b0:1c8:92ed:7c5c with SMTP id adf61e73a8af0-1cf7620cc0cmr2196808637.35.1726113859881;
        Wed, 11 Sep 2024 21:04:19 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:19 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 0/8] staging: rtl8723bs: Fix coding style incosistencies in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:01 +0530
Message-Id: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series improves code readability by addressing coding style
issues in `rtw_security.h`. These changes aim to enhance the
maintainability and clarity of the codebase by ensuring compliance with
the Linux kernel's coding standards.

The coding style violations were identified using
`scripts/checkpatch.pl` on `rtw_security.h`.

### Changes in v2:
- Split the original patch into a series of 8 smaller patches, each
  addressing a distinct coding style issue as suggested by Greg's bot.
- Fixed indentation issues, placement of braces, and removal of spaces
  before tabs.
- Improved commit messages with detailed explanations for each change.

For reference, here is the `v1` submission:
https://lore.kernel.org/all/20240911133549.2664372-1-sayyad.abid16@gmail.com/


Sayyad Abid (8):
  staging: rtl8723bs: include: Fix open brace position in rtw_security.h
  staging: rtl8723bs: include: Fix indent for switch case in
    rtw_security.h
  staging: rtl8723bs: include: Fix indent for switch block in
    rtw_security.h
  staging: rtl8723bs: include: Fix use of tabs for indent in
    rtw_security.h
  staging: rtl8723bs: include: Fix indent for struct _byte_ in
    rtw_security.h
  staging: rtl8723bs: include: Fix indent for else block struct in
    rtw_security.h
  staging: rtl8723bs: include: Fix trailing */ position in
    rtw_security.h
  staging: rtl8723bs: include: Remove spaces before tabs in
    rtw_security.h

 .../staging/rtl8723bs/include/rtw_security.h  | 124 +++++++++---------
 1 file changed, 62 insertions(+), 62 deletions(-)

--
2.39.2

