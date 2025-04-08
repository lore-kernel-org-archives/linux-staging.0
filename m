Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E83314A60C;
	Tue,  8 Apr 2025 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126961; cv=none; b=dtbN+2zRbetCtpg8v+Pjthgkj6PWzix6oaMuF2GSaRjW6cabwAm2b1EUqu2p+m8MOJvXx2W7lB3BRLG2jFOqdNWvEYc/YSPCs2MD41pwrjlEGF/BKGkGTmLBAGpmlVHWQi6AOxTrOKLfh7QbedYJmkw2hT9ADtdKHyJI+2mZhuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126961; c=relaxed/simple;
	bh=v4G89NW+J7KcVBj/0BwQdW8oYNVC8jECShg4GvbLmJk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OKHWhNB28ElAVKv4ibgqjJZekfeaSZBTlKw3CflWCZGt6fbA/0oOF6rkeQXlUgUcgk1g1Zt8FuKnsKUxgWABfH0wx9IgmfjxjIvvEDs6dtYuTbaDGBIN5Zp36MOZfVDQu+6rtWrKea/OW5PaXQRt/9Jlot1n762hPonQQki8jJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITvHyRlE; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITvHyRlE"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c56321b22cso534267885a.1;
        Tue, 08 Apr 2025 08:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126959; x=1744731759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=au2hVGhc6RCG2a+LY1ynx4zQowEJeA8CTuCAqDV5tTM=;
        b=ITvHyRlEkbzGXiZ0iP7BrYK6hCgEc0yaZiGx9mkkammGlMr/1g7m1Lo0gimHYziiNq
         +9NgoCyBq+DjJII8VII2cmsOtXM8bjfGEs+bMQOXeNT1KctnLETk7/J6ETkeoahOgAkr
         4sjEIxlG0hmplEIt6sXglfIuLwRtrWNLH1FIkUNadrW8Acs3A0rGZSyNq0dDCEdEQ3Hw
         nJV744C1lMCm++cTv9oXl9oGrJn60WhdL3dVG+G/I3XFz4bdRqa7aX6/ItRYQpFJH57v
         NqHl25NGcABRuJ5O8bGqwGuqkOYjGNICOSlCH/jvs0Ihpzg8LOhTj7ij67ed8lV/LPQp
         Cu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126959; x=1744731759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au2hVGhc6RCG2a+LY1ynx4zQowEJeA8CTuCAqDV5tTM=;
        b=ERXCYYxoJxCbxUYL2UKNlwy1gADFHNCdD9RjrUjrLV12zDhVvmlMxqPrtE2xzBo2ds
         nssv1PPygwAmGwPzTVXh1G+mDKkHEipKgIAFreVOamdPgFxrT/jzqSt25IqiTGVM5YhH
         s1zcq5SYrmYbxkNnUpas3P9moFIjAP8rxK3HM1/0gzS6CXIO/KKGudRB1IhdAf8iA7y/
         Gy9XWy5tHGMJ5XvWql6U5sux4xUjo7jWZtQ6JfsbBxxjKyP3a5cJ1/PEVGwZhCiFRDcn
         cGgQzgMPAW6vF3tYKx+NW7xLTplqgq6+7zLaetza9JBoENuJqKsCYtqs2S3JqpGhjCtT
         Wi8g==
X-Forwarded-Encrypted: i=1; AJvYcCWOLjNGvNynVotbN9bTbB9nQ3Bx+TZG0xNCxgJJfCguM+WlA4vbNYMLNnqKguvUand3p3nEnbZNX3RWXknh@lists.linux.dev
X-Gm-Message-State: AOJu0YyZoP2PZtTtMbI73NkBV38Jpt2DuMzHkrO/NtNtzPUP1J1UaDMQ
	gLrvEOFzyO/LOnW+T17Lv7DO99PlDZ9M8Lg68wuDMWmvN58tCxs6
X-Gm-Gg: ASbGnctzcvNTI6LSUuIW70YSO9bFCKG6uJj+UlIh3uer9V/qRPaCUskwz8sOrNDjFJV
	MjN8oOKVR73Pupoqfu0hk2gLAg7DWzIBlYpKSqt5bUveyjOAN4CVFflpSGyDiC4j4NJY1tfTuKd
	1tx6oBEtL9S7PZxlyZZ2oEXmwRs7skwiJASZIwraCKRxzGvx88tIlntJHp/vXrBYfPa4pUCmezR
	l3F1mZB5eOcHSUrUjjFe/GlHtbcq0NkzG3Fj26YImDT71w6NbPWM0co+MEVArTmTV1DZZnBAtHr
	b2N7QbB9JjMUiIN4jLO2Cwww3Nm8ChAPvEV3JByvaMRTRYA=
X-Google-Smtp-Source: AGHT+IEfPShIHBwOhW/JJVAWr1k7BuDIr1u0Vc6XzTyDNngh2KPE4R491ZGuszkLejP+zPxe7mrabA==
X-Received: by 2002:a05:620a:2481:b0:7c5:ae70:b081 with SMTP id af79cd13be357-7c7940ba295mr522007985a.20.1744126958886;
        Tue, 08 Apr 2025 08:42:38 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea82d61sm774717285a.97.2025.04.08.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:38 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v8 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Tue,  8 Apr 2025 15:41:55 +0000
Message-Id: <cover.1744126058.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset adds spaces around binary operators, breaks long lines to enhance readability
and provides clarity on sequence number wrapping by using a modulo operation % 4096u, in
place of the bitwise AND(&) operation & 0xfff.
The patches are required to be applied in sequence.

Changes in v7:
* PATCH 1:
	- Added blank line to enhance readability
* PATCH 2:
	- changed `power of 2` to `power-of-2` in commit message.
Changes in v6:
	- Modified cover letter BLURB to reference newly added line breaks.
* PATCH 1:
	- Added line breaks to long lines to improve readability.
	- Changed commit message to include the information about the broken
	  lines added to the patch.
	- Changed subject line title to also include the newly added line breaks.
* PATCH 2:
	- Changed instances of `& 0xfff` to `% 4096u` which were now in the broken lines
	  after the broken lines have been done in PATCH 1.
Changes in v5:
	- Converted the patch with the subject "Use % 4096 instead of & 0xfff"
	  patch to a patchset.
	- Added a patch to add spaces around binary operator.
Changes in v4:
	- Corrected patch to use '%' instead of '&'.
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Add spaces and line breaks to improve readability
  staging: rtl8723bs: Use % 4096 instead of & 0xfff

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.34.1

