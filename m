Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51A314B978
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790282; cv=none; b=C3s2oYS8vY4VgPpaWooKR/hGTYlaMgaMnhYOM69suMdh3gvPqMnZZ6hRPwSdzGP4q9XqugwuDLhZw0z76ZRgpM3mLefW/eJwUlccuMu24fsaK/sWryt9AujyLAGgKXRgM0pxerRiNWkanWyOwBiAizUH4ZlS+YPWtqN5SX5m4pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790282; c=relaxed/simple;
	bh=avGcyUF4moSstecPBUHUlVU4X6Gn9wgfwbWgPoyt0Zo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ofNDsxL7NV8xoR5TtmWb+S1u14MyjnI6yL/q4bCH8KqrkOpjfttWwDuvPtY2umLaijdnZUIobKHuy+vrd0NFOjyTW97fKDobqoc8TzseYjKO9X47VcCcT1ZoodhFwjdUEteLSk4BV96Ui6xUxAmQ5mwR5SvNzKUEiXQvDbsCIlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBk6RUde; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBk6RUde"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso2782819a12.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 03:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725790280; x=1726395080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=biYfC5HUlpa0qqeVAFPV4kB9CvhBlwCgTvPQrrf8Rs0=;
        b=hBk6RUded2bWw88cIsqKv4Hw6xdczr8SsAQD2L2780Z5UCWnuGGsQ5oE9hsVt3cDE6
         P694Vs0Bt1G+eb+6Gati4iNuOhKQiDIFZuchTx8XlqOaYYN+I1tjsVqn9hS8b97qblx0
         Vg3hWCBHEQY4cw3OiNKitfYuvwhlk5JnXD9MMw2Ob0/u+f0I+rngLB6ZLZT2GdOSWvGe
         NgF1cJ2qirukCThQEV8QNmJAldeFPZvW8DRf+HjxLEhknScdG9p/oHpU0xrCpkDB71Ul
         nLrdOrZOXrI3E5PKrhP3X10Jfe/G34eiPhxDXvw0Dbf7KRiTtH1IK68DUY/El2OkDu8I
         qUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725790280; x=1726395080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biYfC5HUlpa0qqeVAFPV4kB9CvhBlwCgTvPQrrf8Rs0=;
        b=vOzathPPp7jOWRlBdMJfkXLHG0grky3Mg9VcRdOQTkp3mMWclzNYLXnkSpfcB2GMav
         ilMFFJAw7zwgCpa0Z0g/erICxuXR4DddZwbjf3r+TSw2Z6Kp+7ZAvvVP35uvzwSQwfB2
         6OFJuQe6oC/qiHx/NJShDtwGLUS2Q5potSy3cpgKANhYYg30DNYpRhUMmrHsuoxUxgOf
         7djVi6sil9fKQmVPhMara6e815dPYlQoBqQ42bZCo3mvB5TffZmwSe+8BZmQZC3w/OGN
         kCvki0+CO72geZmslYqlVZTkThb8VIdHMkPl/cmo4r8Rf18Qfct5a4up+6BTTuPR0nRh
         FF3A==
X-Gm-Message-State: AOJu0YyZv8QndFQ6SXHZdwyAPMxNKuxGpKqu52M6Mu0f6vnz4jTjsz0J
	G64zfDLItdsfoVUsGEvKrRSJxvNykfAjbm0BhEu7H4+XCvqzBLDPzI6RagBw0Fw=
X-Google-Smtp-Source: AGHT+IFC0W//oMWfh8aTsrMzXObPPAsI2g8sKwq1wCoYvHc5wJmv6zLbt2HKdL6Gb4kbk2GC/oQy+w==
X-Received: by 2002:a17:90b:4c88:b0:2c8:f3b4:421 with SMTP id 98e67ed59e1d1-2dad4de18f6mr10139212a91.4.1725790279885;
        Sun, 08 Sep 2024 03:11:19 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc0782dfsm4589379a91.34.2024.09.08.03.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 03:11:19 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 0/6] staging: rtl8723bs: Fix various coding style issues
Date: Sun,  8 Sep 2024 15:41:04 +0530
Message-Id: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes various coding style issues in the
rtl8723bs/include/rtw_security.h

Patches :
  Patch 1/6: fix use of tab wherever possible
  Patch 2/6: fix position of opening braces
  Patch 3/6: fix space before tabs
  Patch 4/6: fix comment with a trailing */ on a separate line
  Patch 5/6: fix switch and case to be at same indent
  Patch 6/6: fix no space before tab and statement start on tabstop

All these patches address minor coding style issues in the file.

 .../staging/rtl8723bs/include/rtw_security.h  | 95 +++++++++----------
 1 file changed, 47 insertions(+), 48 deletions(-)

-- 
2.39.2

