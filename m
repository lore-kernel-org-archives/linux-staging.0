Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35974318ED0
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579081; cv=none; b=EJsR7I4aa6mmc92+bXjNnEuSFhbYGj1beEYqAsgq6pXrGmg2pPR3NX6AWmMeGR3m1eRAPSGqgLUvKMVF97A/abpmaMeFNUhX0PudYDtkj32yyEXeLI7we7lc1tc0TCDS5YVNqeLiKV9ji3qDu7GBQYIcoOsyEzRiBkjsTV/dRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579081; c=relaxed/simple;
	bh=CtmDeVDRJB76E21vYZ89M+ub0R7Lf/cXnlEvo67aW8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FItwoW48NaCOMHYNyFc5S5Bjcs9/8KBVR22aZebMQUG5kSVueCOGBbQ5UgALXY7VgIGHBzIkE/2R35NpaJGOmK6kpnJftQdV2ahuW99T/Q2emDnuxs/YXyA5wpomlZJU5fKLxpehOnW08f3rVcUw+SprDj6Swx6nDePrKHPdqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0ixxq8C; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0ixxq8C"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0a95200e8so14683415ad.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768579079; x=1769183879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEhR7m4+g+Sf55x2vIEZxQaxbiF6dU676YKxc0B9S2g=;
        b=O0ixxq8CPR8JlZJ3C3zT/+sjE7WWYojNDpMg5vT69hjp1uWCZ2UHz3xDcts2abSSDJ
         2yXb+EXYJkJZcTLOVf3SvYPWPAZE1dKOSHdHpkCZYXMgKIxrn3mkKdi0PhXhJ7VVwaAz
         zZu0TjcNRGDnJMcPZYS8iuLNkS3DbE7sQwYVkxIsrjW6IbNEA4d77X5j6W5FS7WW8ogy
         0NY/G1aWU0+H6GzHxJ3/4wrq+DyYWgoaB69YmDnsNc40AUzGODN5mcsT9nedIePZoPlE
         Kcxbl+MecaE0/QCkTPW7ikqJVqpq3WuAC4ik0m0bU0e6P8Rge7f7YBM2+7WoLjJx/9rU
         1u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768579079; x=1769183879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEhR7m4+g+Sf55x2vIEZxQaxbiF6dU676YKxc0B9S2g=;
        b=wzxUl0NDnJQIIUhOKnHq4gEPVUGcNKne9VqhQtG0FWGdzUxxPqwR6UWpNUhQscISWw
         CCB+Tw+b9rlhrfj0ls5/8ZZ6ZzmxcJIjM+OwptGG6tE6190Ibd3Qp2Z56zJjHSaYFGlW
         2DV/W5GoDtpJGWAKKUsYZRh2gsNI2N0EH6PV4DeqIaGjCGNkMzw4gTCAcYa6QC40nWwK
         ghIigNnBd2SmVsgPNa4rna7woPIm5lVvXJOBRX8lBHukCW95iIsT/90HxGl2a3XjvP4f
         +gNO8+BygPs7z4gkIrs2nvmdqHM8EJB6LopaWDza6TBwWj4mU3lIGHBW41MBPfoy+e3u
         AtSQ==
X-Gm-Message-State: AOJu0YxVB61nlNUyzRB9/JbIAodRHqqefTRA5mlFcL/OfvNZ59e622Q4
	TxxtOLbBNK4NNlkfsqkDNmQlsYL5yc2jlmTPd1DxqyCKpGULpQOU4erH
X-Gm-Gg: AY/fxX7GkFeebVI/W7G9moTQt3JTaQYkS+KG9v2+6n6B2oLbzv2XCfjFVNVynlc1G69
	awv8+BHjvUMsJH/m+jDsxxowXXjJW7+uer1yc5IcRgAcODXM4s//BmmycVppJzwUdZACtWnOzZ+
	hPF9UhCzeyOBUhqKFT51wLey3SaHGOiH8yh+BMaXe+3h9QZV5BPOqPHJWbO4UqC68SA6+08IQ2s
	HCd6+OelbIipWOoeYCYHFMgVheF7hTvAfhMIY0cTmZJnIGU+J8tHzidsmV7oF7oN1lAAlO2aAg+
	4QIZTo9QlvIeYbPqRYpvtYDSmxKzNWooYAplJle3Suro9tDir777ZUUcSd9P//Lww+mips+/dd6
	GAWRdAgcvK82s0FYfZqQ+WZEPQ4Oo+jru8MPWeO1X0nl0z+QWR216/4bSdrShRJrE6NAdFkGSWf
	KLLI6SfmUJFwYGvdGyWkVHS2ejNzkMcQ==
X-Received: by 2002:a17:902:ced2:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a7175be8c7mr32423205ad.40.1768579079497;
        Fri, 16 Jan 2026 07:57:59 -0800 (PST)
Received: from debian.ari ([152.58.178.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eee4fsm24738885ad.42.2026.01.16.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:57:59 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v3 0/2] staging: rtl8723bs: fix remaining coding style issues
Date: Fri, 16 Jan 2026 21:27:48 +0530
Message-Id: <20260116155750.3173-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the remaining coding style issues in rtw_cmd.c.
Patch 2/3 from the original series (blank lines) has already been applied.

Changes in v3:
- Fixed malformed subject lines (split title and description) in both patches
  as requested by Greg KH.

Changes in v2:
- Fixed double spaces around '+' operator.
- Rebased alignment fixes on top of spacing fixes.

Archit Anant (2):
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: fix alignment to match open parenthesis

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 46 ++++++++++++------------
 1 file changed, 23 insertions(+), 23 deletions(-)

-- 
2.39.5

