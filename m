Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1333420298C
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425827; cv=none; b=sFxVokiDcMnTtuVwNeL9dNW+7PMcSWvjtuYhGxl3pxKII8ZkmXubnGB7XFLsJ3LKoUvVtaRazmuEERXd6nLP2iPWaWRcCrQUfjtET/UbD7qEvk3qFfdy/rt9A6WimS7IeWWqAND73rWjHHZGDW/o6O8jDKCRS1L+rsn+sh55fNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425827; c=relaxed/simple;
	bh=x77oe2biKEfFvbXW7uH+81l8m9eVb5yiLxZ4AFDD4Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=CF7clSaocTDA5QFTTq3tHEYd+9ZZ1WPKbPDLLujMMoABhYxh/f/i0zk329TgsExda2xO+UNmsRdp3W17pMW1YjcRAtg4Mgp+I/axUJ2ou8/czfaH6aqtkHEa7v9Xi4pO+V9kkU3WuCb65fWSLqpWKWg58TENHE1sUWXghdA3wbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHWqZ1HQ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHWqZ1HQ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-856222505eeso159701585a.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425823; x=1760030623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zv8ZzeTp9smeQ7eHz1EIDl2Qbijx7uNellK7A4jjeo0=;
        b=bHWqZ1HQh52v6D4ys7+P1Q7yiyhSycOaI0CQHAAB9aXJaiUDkemkstWQtqmBEYNcsb
         mRyBzceAAuzSySUbZNiTutLIA9qYxF7s5PfRC7FtVDi4ib+C6/Ra+ryt+KAn29i/XJMm
         LiCJ5BDsvSPjmz0e93A/aAqEnDLi2tlt3+JJ9+jEVhzj+9JRCzpy2Q8Cagl28Px7s+5E
         1DODtsCRDIHwDqp0o2LVYTwuiP5M7mnUgvi29raAs7Bdgs7HWKEq7B42crPoiwfb4TmQ
         TtRlZ9mEh6YmeBuQH1v171j7tMuGzPIFH7qkRVJfLnkEU40BamGh+JSWId7CHB939Hbc
         F2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425823; x=1760030623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zv8ZzeTp9smeQ7eHz1EIDl2Qbijx7uNellK7A4jjeo0=;
        b=WpcPzdKlt9nCBVpXAIMrHNSL+wHSoQjG9kXsD4HkT4WBSk+f17BPTfVeEMtsHckLMl
         hnl60m4fDnBugr3uEcUOn6BUri6oaf3qaUO16oeXGJURH2CJ8mkhlR23BuCdkYhelQvB
         b5kJLuzcQOsd9x066L2DeRXVAddlEiK++6TDwcnM2v4fGTJtT85doF5465Rk/EoK6fn6
         de3w3XZIaH0AX9fonxAgS9X7pPM2/TSKvAaqT9otdvblb/MNlDjrU8kQfkxtmGPixo9v
         TKa4AFcl/QX40CvspG5TzJ++w3wv6jfK4lvdSyUxqpkEkbHrqgnAEJ5JGDlujNSwdz8f
         b7ZQ==
X-Gm-Message-State: AOJu0YxdOk0bPVXbP8D9nI0QO0YHzLx97F/YpunmnQUgEdOUDvWJjnv8
	QWUPEUeaLzi5RfxeW+38MIWI535Td4n0IpCQHAmxAYU8ym8OA4CnQGQq
X-Gm-Gg: ASbGnctXOOFJZSrrONFMfATiJRj/MaoJP2xO9o0QlVrv8JRNSgggCCd7XLd7ky9t0Bp
	yEmGKl00O8gfHoEWZMaelZBWZmbFpv9n7forp25+F/LYIoOTWgC5udNHlQsOwq3lAHmB6jjl46B
	8BfxjHCAVI6P8u/6LWOBpE4HOK38RNR3BRr215E95U38xEjKm3M1+CGd1LKGrscyHkJZdTXoeXd
	f6aRK5HP/O/gw+GlH1tSqbtf6BOrcrB7MzoOGv0RHB0giZM+9pA221UBGaMw8MFpP1ryXQ451fW
	8DD/pwR+UzcPSRxg+TOT2KqwZ2ABGwZ0cXMTXif5rHa7mx0qwYDO6QkctE0ShUIhLRfQ/LW04Mn
	PIBBZFJb0N+YmOpPfKZVAxB+aN1JvqCi9KyaXgCGQLErfou86aQW86Sn5GqwtckReI3l8unLkU4
	U=
X-Google-Smtp-Source: AGHT+IHzNsQcFPuCSBLjY1AJhdI+hSKrTYaEx1F7y7XFfxSnOzuNHB3JdsSlVBSXSTx9sb4wBIYFXA==
X-Received: by 2002:a05:620a:3182:b0:866:a24e:2eba with SMTP id af79cd13be357-87a3a252e77mr32861285a.46.1759425822050;
        Thu, 02 Oct 2025 10:23:42 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:23:41 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 00/16] staging: rtl8723bs: rtw_mlme.c mechanical cleanups 
Date: Thu,  2 Oct 2025 17:22:48 +0000
Message-Id: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series includes 16 commits that clean up and improve
the style and formatting of the rtl8723bs driver in the staging tree.
The changes address spacing issues, indentation, comment formatting,
blank lines, and minor code clarity improvements.

No functional changes are introduced. All commits adhere to the Linux kernel
coding style guidelines to enhance code readability and maintainability.

The patches have been tested and are ready for review.

Changes in v2:
- Resent series as one properly threaded batch
- No content changes

Changes in v3:
- Rebased onto latest origin/staging-testing.
- Dropped the “remove unnecessary braces for single statement blocks” patch,
  which created empty-if (comment-only) blocks; feedback noted this was wrong.

Changes in v4:
- 04/15: add the missing space after '*' in a block comment (per review).
- 16/16: new patch to remove pre-existing trailing whitespace error in
  IsInPreAuthKeyList() comment lines.

Link to v3:
https://lore.kernel.org/all/20250929065000.1010848-1-vivek.balachandhar@gmail.com/

Vivek BalachandharTN (16):
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: remove unnecessary space after type cast
  staging: rtl8723bs: fix overlong lines to conform with kernel coding
    style
  staging: rtl8723bs: align asterisk in block comment to fix formatting
  staging: rtl8723bs: fix logical continuation style by moving to
    previous line
  staging: rtl8723bs: fix indentation to align with open parenthesis
  staging: rtl8723bs: adding asterisks in multi-line block comments
  staging: rtl8723bs: remove space before semicolon
  staging: rtl8723bs: fix excessive indentation in nested if statement
  staging: rtl8723bs: fix unbalanced braces around conditional blocks
  staging: rtl8723bs: remove unnecessary parentheses in conditional
  staging: rtl8723bs: add braces to all arms of conditional statement
  staging: rtl8723bs: fix line ending with '('
  staging: rtl8723bs: place constant on right side of comparison
  staging: rtl8723bs: merge nested if conditions for clarity and tab
    problems
  staging: rtl8723bs: remove trailing whitespace in rtw_mlme.c comments

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 417 +++++++++++++---------
 1 file changed, 251 insertions(+), 166 deletions(-)

-- 
2.39.5

