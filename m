Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2503101A5
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140535; cv=none; b=KkFINi2qiI1Z06biDzEtCbMHq+yoILONUga39Kjw8F+/iGwl43DLmxSjbwASQHuu6byNwnWGUYrh9OZRs8ocica1rU6kcJ0zbw0lD2KQU2b4Fba+TYaHBykhCOXU3lbkoGbd6nGtZQgB78vnv7E9tsyaKnTs6ImMQ5pKJ3dmPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140535; c=relaxed/simple;
	bh=/9ukfBK/ztcryyvhhlEy0Hs5YVLUHjAunXJO/dZMFzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PpCzAdYCUQkgR6n1iQlWJjI7KO8gI/4gcMu7TXVHpsOf8etkuMm405xFymbyMV7hYmxJeUMtyuyaYJagAlztzFSok3U4VULzVTawjoQNHPqhsf4NfLCPsrYTO/TKOOm/tOf8EDzaDSwIJ+lXB96C0Fi8SKqlDxqCvJC8qI/y31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4RW5Nr+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4RW5Nr+"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf1cda2b17so27828515ad.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782140533; x=1782745333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0XkJklm8rL/krb5iwJ4dfjHil7bNhNhtMSb7+JWpPM=;
        b=h4RW5Nr+PBIcSTtrP2pI9pMVqfh6tuZoxRuQYVNRoWy3SGadfzImhjq0fEU38MMyH9
         YTxapHRlPopugjL8AotUmgkOBbESNZ8eLGbv1CV0p06g/RMKHh5wPFcXFmbgpKiBqk93
         kENDrhGgKsSbQcKohkGUB9zvI86xNym180M1OuzUZaYFfBVbxINkb8C/jOMbQm0gtiPu
         php1Oo5be+t2nzaoEAu3r1VgBtcphPEMlafjx0h2dAA+pfUYvx41KO1jIPya4mgeeD9A
         Q8BkwsJXzR9r8/0VeSCYqNUyEAdJwWj/0ugcXWP0cxZ/8lHShF4gJ4Mr3+Jv1dPr4cI4
         THYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140533; x=1782745333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0XkJklm8rL/krb5iwJ4dfjHil7bNhNhtMSb7+JWpPM=;
        b=Wy1IPrBmkKhyos4qs5jYZI58+gzEOg77DS0Y2AAxpeGVoeuDau+Nn/zyuC75p8IIhA
         G0ytKMVAh3DhmtQhrSj7v1knRaJvrl+N4Q7MIpfKSSFe0A/E+18+HGB6tZeW+WjmU+xV
         UzgxN8HtABZyHvzYP9Ifi8aGRNWbVGz97CpemA/YEuyoWlX+ftkDXGgQZh+66MUIUrD2
         2eNimczsCRYb+4rlJa9RIlg0lCaqZnjdUHExI2dd+Ucc2zB/M6UvxJxW4kOsruHfkXyu
         PmNV08j5Ta8odgsmdsgPuayY3wDHGQ5sNoVQgU1rWxv69OK6M0/dXnwmUgPty/PxeETv
         qGfA==
X-Forwarded-Encrypted: i=1; AHgh+RoKAcF6O57+pc6aGUR+OpB/ytDMSYWe7Q90GPl8Pmfazvrz+751Lca8ac1BwkJAEGThUuWNhO1NxgKTS8DZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxLoVSnZ6YAyXg930F7DSGn/GsHr8vQyQTGxFDwn0CJfdCmTkx8
	DVTyt0YBxJadOeKAgg6bj5teHyFwbz+5yhbkVXzJfzQEWAfGrvlCEh+A
X-Gm-Gg: AfdE7ckd1LZolhAM6gZrhqITrvOlqP0jxnTbL6JHmUwufrJEtDstiBHMLtAWc4Gt/0m
	iVrQl5S7PPNoC0y1dBmkqz0D/q6HJtcb9SRmd6EjjNYz5cadb+riu7bge5SkV8l7LcyXgo08e/Z
	vgXYjnDsdzVPXhUWvmmVTARIotytE78KcGIpz5tb7u+a7S4jJLO2UvyRuhAHHiZiGIh23Yd+KSP
	KMFDK9qT9JytQOXbgnI9WXqr+QA4IlW7a/UGpGpu6XH28mzrec157pozZoZdgJcg4khtlUhCKNN
	1f6lvmO1dn5pes27nsk+wxUMwpG9fiCESDqGiKqdBedu4iBGJjrkhcoJb0miBqELT4rDxibWUQm
	TzA6yzyAwSCSBrxCzFepOYj5fUOwLoersf6j1IekBPG9D5Gs/bz9P/Doe9uwzTrx3EwZqSmEVft
	gB6A1RfdRsWim0uVoCeILzT5S596xGEBuE1Qlc/RuBlW5QBYLR4yy9sfbnulrJocMYCgyWd3qJO
	c+ADqq3
X-Received: by 2002:a17:902:f689:b0:2ba:6601:8e3d with SMTP id d9443c01a7336-2c71952b30fmr125688045ad.9.1782140533022;
        Mon, 22 Jun 2026 08:02:13 -0700 (PDT)
Received: from localhost.localdomain ([115.99.236.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad78sm94228685ad.81.2026.06.22.08.02.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 08:02:12 -0700 (PDT)
From: Mani Bharadwaj <manibharadwajcr@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mani Bharadwaj <manibharadwajcr@gmail.com>
Subject: [PATCH] staging: atomisp: anr: move trailing statement to its own line
Date: Mon, 22 Jun 2026 20:32:06 +0530
Message-ID: <20260622150206.30964-1-manibharadwajcr@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the return statement in ia_css_anr_dump() to its own line
to fix the following checkpatch error:

  ERROR: trailing statements should be on next line

No functional change.

Signed-off-by: Mani Bharadwaj <manibharadwajcr@gmail.com>
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d56623..fd50a20ac 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -36,7 +36,8 @@ ia_css_anr_dump(
     const struct sh_css_isp_anr_params *anr,
     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.50.1 (Apple Git-155)

