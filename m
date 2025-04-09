Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CAB1990CD
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180751; cv=none; b=ltbWjHIMB+MthYNMy/7V9NFrNVAnnKTJXW+WYNuwqf/U8gW03sTbiQ6J9kr9J9pQo7DHLq2QQLdgAyFb62/Z+uJvMaixo+0Fr+pOlwUS2jWKkwgJUokI56RV2VoJVbQd4Gi02uj9U5CoAtKXxABZMvZrflP6ZLZEqQKNfi+1hf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180751; c=relaxed/simple;
	bh=85+fq/SHz+kksCPTk+dS0iaspsSTyWX1d22ri6BCfJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbWHZNWEdXQ6WzsGCBFqDwtEYRp2B3hitUta1/j1VJEKeiAlCl+KDtV+p6WYz6ILAKzABqFyXXHmWOtNVX/2Q+QOKjxlWE4JQLCiYVX/3U1kn65laa3FjcLmQM9FNYPpBEruNHH75oegE7TmpojYPoSpy/E0ED2vspfnErJt40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=El2KyV4t; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="El2KyV4t"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7398d65476eso322931b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 23:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180748; x=1744785548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=REThLuvOX2aW+MFvPUaKntweYlnj+QZ7XWuk4zsUfTk=;
        b=El2KyV4tD+ray/awdTAHI5ZvdzDauzlPognCK66mEAKkC3AfOUmz1kDX4jWyhIIgKo
         zloGo3qbmznkp4PdybTTWG37/9j6UjsxnqLD/uDMmYbiMdSSTeD1MaGHasYBzWJk2cWJ
         qbSxZhsUn8IqJCQBZ+hqx6TOUXZzWY+lvd89sppYB0GkMQxusOFd6HJuxCBpHLNrTt4A
         /SuwhJ60dJ6CQKh+YrjnzI1QrDUZjS9oGbHXnxAjdXAEDg13HfxOUVMu2UFRdeKy3WgO
         Z4WVt0eixsy/39x86zP5oFTQoTmbOmRwQ/DjR/gBVGQ1KFX98XE3zpomX5FAOZZr8ltJ
         qWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180748; x=1744785548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REThLuvOX2aW+MFvPUaKntweYlnj+QZ7XWuk4zsUfTk=;
        b=icyiumvTyleuwhn1YJxjpz13AO7lZH8ME0Wys7K5Z9tRum/9kosmt35vvCoQ0B+yuZ
         y7hPbS/mcoeZ1JPD73isb1iaSsKfLtfBZZnTbJPf8eIx8wUPPYZfoojvM2DYxT8XOPgr
         PoPvZLHw1kdXdO959IdNf11+Q5KYRM0Ey9Jhn7Duqu+HfZ5BQ0mzOMtNjEE4DujjvXdQ
         QpntvcupH9407dyM1ux3uwVDst1idW+rJx6oD4NPA9LT91HFY8nEdESuiIpB6eBa/wPF
         EoiLIGvGlY5jfWzyKFnw7kXgFYPOOQIrgG77L7kiwFb7LnbuxLgtj7QNDdNP8NiJrSD4
         3odQ==
X-Gm-Message-State: AOJu0YzDIV9W3LlXjR5PZQpR1G1Um4RGQjSmRVW2QeNS0Ez/TL10MtkY
	O//5TFfhzKB+AlVRglM/Cvw3WM16xW9wIVIgxy1v08q1Fui2fhnieaKNgQZ2Pw==
X-Gm-Gg: ASbGnctKGvnLv/Bz8YTkoHwi1MZkxTrYrS8Nw3Bos5PXx3q+dgQyR1QBMDrAkRkmyuH
	SooBm5WuAOgQjzSb3+GSLqTZbAInzlti77YWqfOUCHJoxxHVnGlWqlbZAcC/9dFyqnimtM58yZ0
	jZAo56xMQfTEguOWHqMcCi7oEK8lIYLwHIzhdCpiAS64ETJHCQViNEcooHnR+mMBrSE1hqy1bKJ
	uGJwVSsyMiiZLAsvpDg5iJUt++gwDWprgVd/BbTujLHgjN1aA7GOR5NpxK4lGTftDQq3nLd8CVa
	8Zo/a/ehS97H4JiVdcLmnOLkgQP49IOltGFmY8KiODUxNOFqfEz+DrykhSDMhSUzwiePUxNMDXS
	rh5maznnXystRKK7Y
X-Google-Smtp-Source: AGHT+IHHu3D4Kehb5gNefB05hxiE19K926bGtF+XixFaVskCxYxHws2z42CfzD0HsSgVvUbFihELbg==
X-Received: by 2002:a05:6a00:949c:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-73b9d3d3187mr10389791b3a.8.1744180747832;
        Tue, 08 Apr 2025 23:39:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d68baasm505745b3a.73.2025.04.08.23.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 0/6] staging: gpib: Removing undefined CamelCase functions
Date: Wed,  9 Apr 2025 06:38:58 +0000
Message-ID: <20250409063904.342292-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch reported Camelcase routines in gpib_proto.h. These routines did not
adhere to Linux coding style and also were not defined. This patch series
removes these functions.

* Patch 1 - Patch 6: Removing undefined functions

	Reported by checkpatch.pl as CamelCase where function is never
	defined.

Michael Rubin (6):
  staging: gpib: Removing function osInit
  staging: gpib: Removing function osReset
  staging: gpib: Removing function osSendEOI
  staging: gpib: Removing function ibAPWait
  staging: gpib: Removing function ibaPrsp
  staging: gpib: Removing function ibAPE

 drivers/staging/gpib/include/gpib_proto.h | 7 -------
 1 file changed, 7 deletions(-)

-- 
2.43.0

