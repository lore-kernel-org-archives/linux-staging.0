Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B18124E4A8
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128619; cv=none; b=jbG4Voi0XQCwTWZIdsWwlHfWhXhJrERdU35cmcmlqDWkdP3efiDVvmNTBvCXb66Vf659WH2MJock2781a2RETgdj0pHYVUjQO/xZBpTRTmrIjm/S91/yC+h7B5YzFtHWyHPo98bPIAEIB+7mKEnG0Mumydo7wSVZPGx7B+xQlL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128619; c=relaxed/simple;
	bh=9/bFU8Or9MIPvPe/HjO+mDZvzYEwKhcuIx6caKlsxGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ODPXGG3GNDH0M9rri6dpjknwzcqxb5F4MqKPTIaejnyg4tykqc9xABtzDiuUQlEHjW8mPoAuVfDDfmZuv72To893obcdRB5lF4LYNGV7q5fR+2QK/AjP6/z32ZA+R4nMd6lZMcLQADzZn+TENd7ENUvEPPCUgON+eE6WQGNjxK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfF0jKFT; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfF0jKFT"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-854cfde0ca2so572224885a.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128617; x=1759733417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYq5mD20gIgYqOzTdX1OPc1yjCmK6OIcJvyWHLb0NrY=;
        b=IfF0jKFTJnOGTW8j1eTDyINf8jNkQB4dibF5F8+oNX3aaSS73xxNpSFAK5CzRYGRmk
         7IUxrYaogUztwZz+cDe49h2yW7Y5e9pr1ndSARSf3UZhBGo4/zGUF3vVVzFqyHR70Zt9
         SA7w2Dobe3t+6oV92ZuJ83KgJn9/txpu+ydynh6vNJvbEL1EN6Qie8cO97BmtCCEiXIb
         tQAMxsOjV0rjaWLasQ/6eE9ORcMGon3IB+vUMqxqSWr/X0ra4io6Ml118PmjmgHLOJXk
         uecOToFIY1VXrayBIyoQbd9JAZpCeSxjmUBeDnbAQ0v/zZSxvmsv/o//DnOJxlzAy1ak
         ghbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128617; x=1759733417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYq5mD20gIgYqOzTdX1OPc1yjCmK6OIcJvyWHLb0NrY=;
        b=SGQkaLWzolN1kDHxpNSZ6Sb+LMV75CI08QLnfHS0kcgkenhDqZMBYBHMeFcHyGsHO7
         1LrYBuT38ct8EgFZQZkcuDRFr/qd5le8VXLXvKpw5oc6e4ASSpskQk8m+18gzyXZukcO
         K8nVeNUARLRnJVRb2ec1Kmsf4hGtHrY5GJNkHWrghda54lA1C+5pzh1qP04CW3MWHzvP
         mhaG9hJJxGEMI2Hy8epQDXAB2EBg13c4gPr14ffno9uPj0qp8GyEffw+1oLr6Gs2IjHx
         K5pdZiZ69X0JMPPvU14U3+qZtEY9mj1KEMT9c6oUt0xjefEAhF/9oQOZ5u5Kb1t2NSk3
         OipQ==
X-Gm-Message-State: AOJu0Yw5vCToN08PkCDDKm/i7lP7Gf4KM3XgWbr7yUa/D/hSgI0wrdO0
	oGm6KSuU22Kso3Wrj2dmuX31/qMfEX6MeA0uWi7rv1nIZJiNl/tZdDmR
X-Gm-Gg: ASbGncsc8T4XaBZpQEnJPPZXHTP7a39HKfJ7Oy7Xx9RAjaT0Ec+GcXKjr6O7UQXK7hJ
	d8XGY3RGxqo7dSTqPH+ri/lr1A7ameJhdkjlfmNtxBk55RlIWaPIusNi4R7f7I9OZsDEs26scM2
	xgzKzGVKALPrTYOH29Y9aR6TXldNVvf9FYKjOnA1tEK/0JZ0qGAqXkXj03URCjXe8RF42pXbd3Q
	0cdf7HeSDxQYdQq8UvKj5XbiHqq6oBJ19sfoxY6SjlMVtZXKieIsnvuiMazgQFPzNQMW4Eil6Ut
	BOq2u4eo5nqUrcCSzcFYjvF1z9Jo5SFeA20m9eS7cEUf+v4eLP5DP1lin1rcIVXQ2ONwEogRrxW
	l3Uk84k1blKQBjcdc4We6ujCgHqjFNDNQlJkesV725a+jTvGMUHcIe1z9RHYVqQ==
X-Google-Smtp-Source: AGHT+IEmjI+X10xcSGINliKtCzItrc2T9H3twnC5pclEPJThf1OcdekBoBk5YsszkVNNagtTTDd9iA==
X-Received: by 2002:a05:620a:7118:b0:85f:82c1:c8b1 with SMTP id af79cd13be357-85f82c1cb96mr1601940485a.46.1759128617052;
        Sun, 28 Sep 2025 23:50:17 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:16 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 00/15] rtl8723bs: cleanup and style improvements for better readability
Date: Mon, 29 Sep 2025 06:49:45 +0000
Message-Id: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series includes 15 commits that clean up and improve
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

Link to v2:
  https://lore.kernel.org/all/20250904021448.216461-1-vivek.balachandhar@gmail.com/

Vivek BalachandharTN (15):
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

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 415 +++++++++++++---------
 1 file changed, 250 insertions(+), 165 deletions(-)

-- 
2.39.5

