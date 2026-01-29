Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D425FA10
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702676; cv=none; b=tr0z9ECaLlBWae3+uqCYnue8S6C+NHe2UWA2iWH8GTlbkNxrhzSbhXk+lhIm7sfFDmWVPwHtT//GuRfbOCg7u4mSbzqKXtHKSaXw5lh3sakI3MwTi5LZwvbCh1WCiwMVvHt/qDkNtXuMd6SKxg6wQzV0YB8l/kfk8WJ5SvCEdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702676; c=relaxed/simple;
	bh=ngI/6xFkuUOEEaVhVcnCQfVOP5SfnHMvlu8Rltd6S/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ddN668m9PiNzv+06XMNZ/Bid2LYJpC97h0c+8T63AZiWMvtX7qA8ZstE/95i1wulcVIQ7HhQXnYkWjsSG530BWpD7fO4kkYYP9TKv3HHPfO3iD8SlUo1rg7VbEiXGwvSVEiiWJfBJ5s8R1zsky+xRcSaJdOF+cf2DsG2JtwTS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frR1H8A3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frR1H8A3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so13220125e9.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702674; x=1770307474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BLsV2x4VuUVKoBNwnHtlf5NjUSJXLBnGrgc6REPBxA=;
        b=frR1H8A3p1sNQ6kUoCaq5eMkjsdnu9uBGhUg1KTFcci8Er/+xA72OWluSoezWLim6m
         yl61DDWId4o0JMN4xm1mbcvhpaariNsOx6NSaXayc8tyA/MbPWdxKaqDpukWj0zSdtCE
         9C8CAe45Zy2qOpr5iFsIa/Ss1yc15EUdx8LxMpFaouEb/v9jDDVsgUD343M2cMRMBj2b
         OG4B/WGvAbgQw3SgxGm/e9N9sXFo+F+2b0EU6Xrhj5o5Q0OcWQFwDDL0kHlnw3RTI7Gj
         72rX6OUiwMNsgNE0af2TDJJYD/kkd6DSkmc1RYaNIQQ5w1GxJfJgBnocaBZkvWHkTmQI
         QDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702674; x=1770307474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BLsV2x4VuUVKoBNwnHtlf5NjUSJXLBnGrgc6REPBxA=;
        b=tyFCnK305gz2hYLnxK2wr64DmWXT1ZrUaKUfSpH7pqW96Ozss+D+q5P+voMuTdWVL+
         KLxdVzvmrIgIORg3r1KzTVRnkgSI/9U7U8CJFMJSYqaSo0IZtCKkiFMZplwO5r1msMZ5
         hB/gUL/vq4qXQkvoEntpLlXMq9NuL39q9wwsfeCZ17/zE8OdH4TI9XOnqt0NM9wfsVQ0
         btZP/HfU0ucDkpYipiDECBrRJ6YMG1raihphHa2d/j1kmKKZzzi2QFvs+1Xr1IIUlSCj
         TKLYqf0N/xdRgIxUaujpLd/iegO1FfXGOxrXv3DT1Wx5Sa0EthxYLUKtnN7oiHtDmELj
         6K6w==
X-Gm-Message-State: AOJu0YyfWgxO8VoQ1m/gTTJePrc98khrFsPcrixFxYdpP4/cplekXnyU
	Ccs2nXtX97MyPgrrmPh8Aiz6Q6X9E6cQmG+qLyyPXKdlLRvvSxo+UNxq
X-Gm-Gg: AZuq6aLpGjzsv13gBky+Q1seqcfc/KBXqFY26EULtydMuGKHl+l13/p4EnPfcVcNzEZ
	2xvA33DDdWo4mOTr7HjGiKXpDeGDNjCckM72BN1idjQw9Y19ha4Rw5XR1qKSAHiGi/j1safoNO0
	20RFEsSlIUxVI3dlrZ6Q2um1FkRFnP9kE2Qwk+wrdORa547eijIy/cXekjCxOZRRCV2l1mVAncR
	MkSuuhIBepWQlz2Y4djHWrUT57KhgavRC348GsjaKmtQh2X7Jnu5fB1Mk86iLFvuDiDqKZ0ok0q
	rpw3o6xgXCx89LWBLsfrLQgua+woki6JhI63z5fzYdMFFHR7VihVFGehvgiWeuOmASYfzi40MDf
	KZjj8rxOb4P3o+gkv+NOn+ufE/uQH44sinzBSbEx6Niy7FvVL3l6W5H/vk1sb5ylprZaZ4QNK0H
	5NX+y6oVvagAC8Gm4HAq8u99bqbt5Z1j8u1Bh/NrY=
X-Received: by 2002:a05:600c:a08c:b0:480:1c53:208b with SMTP id 5b1f17b1804b1-48069c9bbb9mr105967065e9.36.1769702673396;
        Thu, 29 Jan 2026 08:04:33 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm135883175e9.11.2026.01.29.08.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:04:33 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH v3 0/5] staging: rtl8723bs: fix line length and style issues
Date: Thu, 29 Jan 2026 21:04:21 +0500
Message-ID: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes additional white space after "/*", as well as
resending the previous commits.

Changes in v3:
  - Patches 1-3 remain unchanged from v2 and constitute the following:
     - Fix open parenthesis alignment.
     - Fix multiple blank line check.
     - Fix missing blank line after declaration.
  - Patch 4 fixes the additional space after "/*" and before BoardType
    which was addressed by Greg KH.
  - Patch 5 sanitizes the modified files of irregular white space
    alignment within a line comment.

Changes in v2:
  - staging: rtl8723bs: fix open parenthesis alignment
  - staging: rtl8723bs: fix multiple blank line check
  - staging: rtl8723bs: fix missing blank line after declaration
  - staging: rtl8723bs: fix line length check

Changes in v1:
  v1 comprised of fixes for multiple checkpatch.pl warning/checks.

Mahad Ibrahim (5):
  staging: rtl8723bs: fix open parenthesis alignment
  staging: rtl8723bs: fix multiple blank line check
  staging: rtl8723bs: fix missing blank line after declaration
  staging: rtl8723bs: fix line length check
  staging: rtl8723bs: standardize comment style in HAL

 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 59 +++++++++----------
 .../staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 46 ++++++++-------
 2 files changed, 52 insertions(+), 53 deletions(-)

-- 
2.47.3

