Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9273EBF1E
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 23:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296571; cv=none; b=hSoc2voS5IKNvNWkkglQJwsmqurRCErXm9xyebOkQuYPr/22mKkKkq1jrVZcmtvsztT57iIF2Q7HwVPYdqpjs3IhszuosYnrE+WC8G9YqlGlKhV3HAWLtbMBJrzejnyeYYv2pltMRTp6UCj4bOAWvAfz0oxsF32vMMW3P5Ji3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296571; c=relaxed/simple;
	bh=VUMzjVSS8dP0GK855gmrvyI0Pgm0KUYLoP7vkV0GZ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rtNbNWsMxXgDFUN5aLujYVX9LMuYlwXYn6S66FRRIt9saxTNtXDylQUuJAO5i0Bum8S3ovZW7i1tQ5UEDx5FtzCjtp30jqPeTOxjvIQcf7ajviFjB6c6QpOak/nYHjAlu53xZkrLw6TWCg0gkF2I4F+nRGlnWZ4/IKFgkDD8cqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9Tf8gUl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9Tf8gUl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a77c1d5c3bso14668865ad.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296569; x=1769901369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqRHnF/Kmqh8JjtTS/h08Xf4/E1jwltyp2WHm6FwYbA=;
        b=k9Tf8gUlfuLuhJ20EvSd0jxze5mQd4CPHkMdv2ogCfIsfcO/HaOkMrGygkNCK2CtQq
         tfUhkUtiVzzypN1roEDDZEH3m0eb/QmvSEdP/2Z2cyBNTTtEefseuflZDbADUQuFvTVc
         BNdrBFbjN8pjKPmUlqKae4TOMYiNt/QyoJMoXbzg43Zb28BsGH6pnssZSIZfVE4j9HsG
         zqOipn2lZPrsxBOfiLC01Cwm5Hgx0PbH7OiTVFpyEm//NSEQ3jhgHdn6SSl10xY7jpeH
         r+e7uFNPFYEP29yrX8C6hHjoyQTqYrYBRXGtgUrfma4BNQPlH5iGvwiPYSBsiPGR17xZ
         N7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296569; x=1769901369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqRHnF/Kmqh8JjtTS/h08Xf4/E1jwltyp2WHm6FwYbA=;
        b=mXv9HoCNcKpvFaDEu6dH690Ij472xhsJhfezNjgl2W1vyExcmR02VTPPi02z8ajLYU
         +ndAI7OePA4I++y7LdcPn8RN3WEmymreYcsh/utQ7bVts3GGS3rDUoI4O+8JCJTsguHl
         iqWEOJekYRvwVZwZstjvj2lb04PViuEPuBbbrjDT26hoZN5n+U4/aLjgWAezVg45/nS6
         Vv6bKukvR188DkPd3AWFOQzIPBblUj1HOsLBzAkAGywe+OOeevU8nj5A/Kr3lpvhI540
         OtUW7xTm/UvOV2FMcwefOzwL4eF6d+XazjM2pvtovzScKOcg8SYKlXZZYsxA5QznKy/+
         P4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFt3KXydRGDElCo/yAtE1m1QHPeItHD/oP9IpXV+V/VI1c8cW6W6NxhTYan68zdXgzpCpNZjEb8lcxqUAD@lists.linux.dev
X-Gm-Message-State: AOJu0YyaJsnTHYYcAr8Ml9YRznRSEesFo47jd0fi18OJDoWlL72wgtl9
	6QB9i/fg/zQ98htFLdGvJkBwjL/ZBEptFb9ITMDkHyVLl98BPvKYazl9
X-Gm-Gg: AZuq6aIrP4y4sRKYRnpRIxlmzQE1veftgrgmcHxQwl+dmmJfrOCWHLlqG7qUk3NLdvy
	RoRm4nmeWNavox+MEeDDyEcpH6lJ9aoHWT4cCFljaw7u+eqMPeThaWWWV1r6LXmj/itpdgqfAFX
	WnLSyNpcJbSedCyJwJpEXbrL+VKBuVST8w3Q8DFAg1lYXfIFsEaPsvP7Lhf4nAwFdvkcMfkkkNO
	kimxNmrtQENkzI9gMqozFZpzOXx0VIem6zS5I+fSJN7bsaj9PHwTATFpyDIVNTSM0KWzfPTYeHI
	u2IzFLq5i6pR60CyeL49PhQC9kIoU49Izw3refLClkWSQhssSpeovWdVYmLsX88rClQYzt08Am3
	4RhUGuoar3gylVzsYRpZ09fqXyNY1ykm1erXWCcgtgt/JBIUDGZt6OexrkhFvcV3a2VqsbDjkqj
	8B2+GE1riRTx3CvGqI/WiJZImzkVuV+to6
X-Received: by 2002:a17:902:d48c:b0:2a0:e532:242e with SMTP id d9443c01a7336-2a8451f904bmr1758775ad.11.1769296569314;
        Sat, 24 Jan 2026 15:16:09 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm5604506b3a.45.2026.01.24.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:16:08 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v5 0/7] staging: rtl8723bs: cleanup and refactorcleanup and indentation refactoring
Date: Sat, 24 Jan 2026 15:15:50 -0800
Message-ID: <20260124231557.18189-1-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124104920.5721-1-tehsiu.huang@gmail.com>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors the function in rtw_mlme_ext.c to
improve readability and comply with Linux kernel coding standards.

Following feedback from Dan Carpenter, this version (v5) deconstructs
the previous changes into seven atomic patches. This separation ensures
that logical changes (such as flattening nested loops) are isolated
from purely stylistic cleanups (such as fixing indentation or NULL
checks), making the review process more straightforward and less
error-prone.

Each patch focuses on a single category of improvement:
1. Logic flattening: Use continue statements to reduce indentation.
2. Comment positioning: Adjust comments to align with new logic.
3. New lines cleanup: Removed unnecessary new lines
4. Line length compliance: Resolve 100-column limit warnings.
5. Operator spacing: Add missing spaces around logical operators.
6. Braces removal: Clean up unnecessary braces in single-line branches.
7. NULL check simplification: Use the "!ptr" convention for brevity.

---
Changes in v5:
- Split the series into 7 atomic patches for easier review.
- Renamed "guard clauses" to "continue statements" description per feedback.
- Separated logic changes, comment refactoring, and style cleanups.
- Fixed indentation issues (replaced spaces with tabs).
- Simplified NULL pointer checks to use the !ptr convention.

Changes in v4:
- Corrected the patch format by moving the changelog below the "---" line.
- Initial clean public submission of this series.


Michael Huang (7):
  staging: rtl8723bs: use continue statements to reduce indentation
  staging: rtl8723bs: refactor comments to fix the line length warning
    for exceeding 100 columns
  staging: rtl8723bs: remove unnecessary new lines
  staging: rtl8723bs: Fix the line length exceeding 100 columns warning
    in the code
  staging: rtl8723bs: add missing space around operators
  staging: rtl8723bs: remove unnecessary braces
  staging: rtl8723bs: use !ptr instead of ptr == NULL

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 129 ++++++++++--------
 1 file changed, 70 insertions(+), 59 deletions(-)

--
2.43.0

