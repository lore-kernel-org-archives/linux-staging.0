Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022F43EBF3A
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769251928; cv=none; b=rsb4CCtbVphBowUhEtex3AdEsZuRsPiEe/A65MgqCtwzpHVAgsg0jFk/h1XU/0PK90Y8XFL6EPdOsLSOeX1qqMcjCsbXvGRfqtOxSGj8Nong6LOMFRMR0BcIVmVZ0NhWKjJBzrx+pH+K0uWdHPgeDMLFl8l5mWXRYKuC+gUh6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769251928; c=relaxed/simple;
	bh=c8OXWhPoxykZSUYNVwCqaa0nQ06SZaP7SJFSeSjrHV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obmMcDYOaQgtfuFAs+yVL11zJuyw2kW/CRxyLHeLtQI9IIwO0GesYTiQgnwN0vch7GG5OV7dI3qOs1nCuMDRN6Nq/LZh9kLcyNuITyR1NY/y9LgMayrapVIQsT5OvPeRt7CE4Hf8WTODjSjXqZPygGNcB+bxbo3NP+CVqFJZBGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6PwjpWz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6PwjpWz"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso22017295ad.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 02:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769251926; x=1769856726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qusie4ZgkVeIPV3xhLckqmXKj+Z/hWmHOiE3F2hf37M=;
        b=M6PwjpWzQpE/zUMpEH6Tx2leOC6lqKWHDsHLrbX3U9pftlE+Th81uoXRbVqXDFSPOV
         oeIp9GxgmvEwMqAhY1nMN3VYATO6c9yidnpb8hd203DTsXHAMMLi/UNCoZRExU4vhdLc
         P8G93i6/BoGU996N9L0PKQ9ZMgWIm8MZFxKBE3e4XVXTBVRrM3eIWJFqIdm6/LywLvRh
         L+53a3P0OQsdNeeifmM7YTfrcH+mhLHUbGB/oQ9TamfeYAug1X48YFJ1NgQXD9RY1WJ4
         gDOoE2aKo0wO/QjBVKcIZgSEdN+wXdbWGAwD4hApJrbXCIo42sHfUW/TGopaqNqDWiHL
         WyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769251926; x=1769856726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qusie4ZgkVeIPV3xhLckqmXKj+Z/hWmHOiE3F2hf37M=;
        b=Ezd3c1NgqtrdJqVEgC55WMljTDWl/OOtgMzhLU94BTgkGQx2/ILryqiWVNono2V3IF
         4xeUUEJdk6kUq5zwcSSdeZC4XGG6ZqfUHEjz3U3X24WTZzh2gmdQdhUVmT8dPCI4lg3e
         q9GgLzdbDPI4srrhGHfVHBLeTWCKKrKB79ppO7TVQ+IWT386SF9jxRcrjkgMajExYHY3
         OLctkb2KgFL4gfjXuArVyd6CvfjSgHpAt94il3DrYckKpYLc9I9ahjzE5jdNl6zYO5H3
         RqdCNZc75fe87pF+eOcVCh33YMo/9QyHCyBxLVQDTwTcnTk4RkofQAk0QOwnIrrf/CWj
         4BiA==
X-Gm-Message-State: AOJu0YzcDunqcAgThNy5bdZ3SvBR+X9zis/LnUa9LztqXL92kAewRMkV
	CfxtJIKAJ3bE5IPwo0uBDirIvT6XDYeiiEZN4dvKzJ9MflwVqB2mwt+yU699Pg==
X-Gm-Gg: AZuq6aLE11dS9dCxYHY3A/DOOMnjSzGrCVheOB7v/tqq252M3Td2vEdvvmdZRvAQlgf
	9hmn47Er0blSkKL4EPUqNYD902P9zKA8GwUBbUrGQ8joKfKxHt07qCIWCbXQkDJslUX4Ulj52gl
	aJcSz6RjvfWbaIzI3LewGs7TF7bH/URQhBkIssifZsUmMdJ1jBUGHt/cRttrYcNv6EnUd0gkW6c
	QLlRCPkblaDMLcrw2tXUPkJ84VMxFNw/QoipAh6l8jQKc2wZQ1tvz5IY8+3TIzWRNsD3mY0PLzI
	W/ypxCL4ZGn5JLAHvnPSuJggJdaQ4MnAdOObb/aoyHvxTnYO6Qc6jgVK7ZkBBM2+57Dc3QJiPo+
	t5AipgKivRSFeaULAlfR9/Dv8MH1XuDXeSPSrZkYjZR8figyOmJzks+eTrKR+HzjuuR7WPUcuRO
	339RazGTbBlpnnUQtiu5dOHOP+27uJogOIBCscD/JIr7w=
X-Received: by 2002:a17:902:d48f:b0:2a0:c942:8adf with SMTP id d9443c01a7336-2a7fe442af4mr46672225ad.8.1769251926301;
        Sat, 24 Jan 2026 02:52:06 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cd4sm42468985ad.40.2026.01.24.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 02:52:05 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v4 0/2] staging: rtl8723bs: cleanup and indentation refactoring
Date: Sat, 24 Jan 2026 02:49:18 -0800
Message-ID: <20260124104920.5721-1-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123211904.64589-1-tehsiu.huang@gmail.com>
References: <20260123211904.64589-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves the code quality and readability of rtw_mlme_ext.c
in the rtl8723bs driver.

The first patch refactors several deeply nested loops and if-statements
by using guard clauses (continue statements). This flattens the logic
and makes the code easier to follow.

The second patch addresses various style issues reported by
checkpatch.pl, including line length exceeding 100 columns,
unnecessary parentheses, and unnecessary braces.

---
Changes in v4:
- Corrected the patch format by moving the changelog below the "---" line
  in individual patches as requested by the automated bot.
- This version (v4) serves as the initial clean public submission.

Changes in v3:
- Split changes into a logical two-patch series.
- Fixed commit message line wrapping (75 chars).
- Added missing Signed-off-by tags.
- Fixed line length and alignment issues in the code.

Michael Huang (2):
  staging: rtl8723bs: refactor nested loops to reduce indentation
  staging: rtl8723bs: fix line length and coding style issues

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 142 ++++++++++--------
 1 file changed, 80 insertions(+), 62 deletions(-)

--
2.43.0

