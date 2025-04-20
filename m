Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6121E3790;
	Sun, 20 Apr 2025 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745171663; cv=none; b=rFNczG3fRKSl1aW7Mv8iQRoYbW+DkNQWgcoWvKdL0il25el/CNTYDRhDxSRNc3/eGDtx/l2WWexuha7u/Ww93BuTndy7vhKsUM4wqE1FStGGpAts+ROxT2UsWoS7CFvM3Z0+RSwmF+s0u1t6sGtXv8/Ue9l/Qj5NP3jHjNLiPS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745171663; c=relaxed/simple;
	bh=RqVt2WFmO3wJYDzEsI6ciJWqvB67TcVke0eEZbzkVX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lkZXWhi37GQ6RtF92qgDxaoEqsFkHe+seTKQKBFIGhcel51vHxH6N84dbiHToUiUtIvUHWeK6HVl1V7Ol2hX4KL8PF67/n2PWzTQihJM4cBHjyYhQyxcDiD/cDddKMIYedybmSSpIsZhIfxxk/ASnx31MOk0LCGZRT3ed464k9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBfmFakm; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBfmFakm"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso35631306d6.3;
        Sun, 20 Apr 2025 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745171661; x=1745776461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAfeP15i3YW+W8/KE037qPO6i/TTvbryO3NCuADreMA=;
        b=eBfmFakmiVSSZhvhpNM/MVIAZU0/FdVbGRKxcMFo6IRWX2T7OQl7Ib8A9uiQRRGlML
         a1bmwdOHIz5JnloSlwbMAe6hwEy5AxXTTJ+FIW6aeR6/+HX8KTV+5lUITHeIWkGlgaMf
         tmvQBiUoItDeCiCkRQkF9SkOf+xzVe5wNqmcWzD8iYMEXyROdzVk9jlJ3kq9nbW3mnKx
         7f9YATK4J5NYT4ovsbWKmMV+aWa2RYX5hNGREO56JTKMIKMuc+zX0nATl92vHLO1QAoL
         +jgzMg85OsRCdLJqyxSG1q6sYt3wslEUrb7f/efQICCxls1DKxc6oaT3XE/dbH5tN1R+
         BtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745171661; x=1745776461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAfeP15i3YW+W8/KE037qPO6i/TTvbryO3NCuADreMA=;
        b=WXuEnVOui0sX1T38daImTEfFwgPtkfveOxjkqo1ZEg//73NMwq5l2cS8ViFuWCOH3g
         akMMQjqj7sj1kJPailaEHIGSdkWdpBXB4LQdpTyBaResCLkWW7+enRMftzHINQA5Id/a
         wI5kYa4E1AH+3zaMosSRhLlyiI553dx/AQLrxsiwzit0D1WUuke6HLE3BX96TPtqNJAN
         KUYVwJfLJDf06PmBpBAtNyEaH3LzvHaBGsdFo/4C6oQ7OVZVyv9OW9uGqX55wD9YOvCb
         MYJ7opHGdzTb0MF8mL77Zbe4yWRhYflD0w29364FgyfXWke/jZNH74rC84MZ1Q9aNH/8
         EFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7c0nHy6M0rInGrkY92D0D/QoH0duhCxWR/pL8o4SU4JL2NUgSqbWCY6Ml+NWRihSCu9aKSAdqI9Zz0dQJiA==@lists.linux.dev, AJvYcCWGQ4I4aF7pZEXVUpiUbJrqOxXO/GbqJyIJ3d17Z1/izITZaBcHeGcXvBzv0qUhNm0TmemhuzW86XaYUkNO8zlsP9aTYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBt0Q6EnkJAIX28HPIj+mm8QKSCt+wWLWwRiBfWgq6Jzjy+hwA
	GJFDQb1Vb021NaSCzBk1HYfGbMAanQvgVB4c1AUZvrf9d87xHpvu
X-Gm-Gg: ASbGncuMFTBl3fSb97XpPVB7wwViCNyqHRgY3PX20b713FpZ+2SkPSbU3TDbD6ZUMlh
	oJJzXRST05HA9eO9Otr9b86dkWwCeLD/+Cez3JLXktfJQr4FGfLdhKFgAoLwZDN6Nu2rnVKP/Z/
	/6YlG5OtmAKUwXqor6ot2X+hv/+ePeJ8Zg3HDoYolW+OOSU0MEsgc/Tr9M53k67VcOe+GfHnnz9
	ruyUiJiWpVpWSCWmRnRXGUHNdgOgWsoSivvSvf8Gb44a211BtMk7FyBSOuAWBhU5goOueCwHkrj
	MTbS9jUDmtHBERU4+OJxj1vm5EYOneOCiGqItRdBRFSwxqUHslsZvNg=
X-Google-Smtp-Source: AGHT+IF9XjLuqEIcAOVLiN4J9h7liEeZZq2HnnH1SmZ37PEj0/DzlZuvwjCtzQhWQSD4ZTleVGUVmA==
X-Received: by 2002:a05:6214:e6d:b0:6e8:ee68:b4a1 with SMTP id 6a1803df08f44-6f2c450ce0bmr208025546d6.8.1745171661192;
        Sun, 20 Apr 2025 10:54:21 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0c1bcsm34801286d6.26.2025.04.20.10.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 10:54:20 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/3] Fix and refactor output disable logic
Date: Sun, 20 Apr 2025 13:54:16 -0400
Message-ID: <20250420175419.889544-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 includes the initial fix.

Patch 2 refactors the code to use the out_altvoltage_powerdown ABI.

Patch 3 adds small improvements by minimizing the size of types and
doing a redundancy check.

Not sure whether to include a read function for powerdown as well since
all the other attributes only had write permissions. I can also do this
for the other attributes to help modernize the driver.

Changes in v3:
	- Include version log in cover letter.
Changes in v2:
	- Refactor and make small improvements ontop of the initial fix.

Gabriel Shahrouzi (3):
  iio: frequency: Use SLEEP bit instead of RESET to disable output
  staging: iio: ad9832: Refactor powerdown control
  staging: iio: ad9832: Add minor improvements to ad9832_write_powerdown

 drivers/staging/iio/frequency/ad9832.c | 50 ++++++++++++++++++--------
 1 file changed, 36 insertions(+), 14 deletions(-)

-- 
2.43.0

