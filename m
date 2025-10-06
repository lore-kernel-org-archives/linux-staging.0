Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129931F7098
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759743663; cv=none; b=oVQqwHcRnemxN/NekCrLvPTkJpiwGowGdHHhKDgYcjX+aC5Q0jhjrzZI6Oh+nH+NtuRxCxj1GRigIO7p5nhV3SVOb3BgY8BYM2P1At6jmEt4L/jGOCEnwSuS+9GC7UruQ9Gx3HnEOjreUimFePPes9HA8aMJBRs+HkcKDWu38D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759743663; c=relaxed/simple;
	bh=Z2qL2G+4Pt/JBQNoW9f3BZJBj8XLBewwJbcA7Rq3T+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDbn7s4JkP9bJqyB0/4pLt9/eljzlIGcfkmQVVO76FYsSbe9eQeTJ3BReqyXOjjznSjWwU3ZmlnmEe3XaRaDsfKlylBQf3G8yJVqgPym1xp/YuDwUV/L2hdH6E9sxKnbwNL5+lY5lxqWCma/gLhWxABbQi0vV+dAHFvuFmJez1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGp97+If; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGp97+If"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so4254121b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759743661; x=1760348461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAUwicTxdfaUf8jTb+YjaOImEhUo4muFZmK2662yA8M=;
        b=IGp97+Ifz2+snoL8Y12AfM677lLudeOCEGl9cdpoJLuP/WAYYO7wF629JOtjQuAmw6
         XuU30rM4xW1uwEInXBv7jA99vSXRuquJeIzNdwwy6iOt0gtxXK8nRs1N/g8/xpknSfzJ
         Y37I/0HXP+VRXZqwHXH5vLlNgr+0BW7R15leMiRWhHcBp/DNbAi56SGH2nh6Fk7skSpp
         W4ChuXWNriJsEHKnnh6yLZkY8tRWOBHoWllRQrhCxJWEtcDUx4Jn7mZ4lruHomgd540z
         Twt/uRl+5k9SHSmYjTWdjggMHvgwcd8H31ant65Vz0cBNVoe/qjdeM8cwzW7L/fgLji0
         GNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759743661; x=1760348461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAUwicTxdfaUf8jTb+YjaOImEhUo4muFZmK2662yA8M=;
        b=sy+m6vBjPPnGhsDaLXLVqcs8XsCfGj23uFk2UaejhgFcDohjw1XLL7zPtS+PP8Hw9Q
         Bx5l/BqGCw4BKinvUmmY+xvKpFwaat7hcOb1MPJIrhI2TXpY4BSAr9fdVPY+0WN2ETn8
         kcYuFGIKrhZWZNurNIoP/aapDqR7V5MPvEeNstVMOjx5VGfLHiO3Rn1IuYccHJv3W97K
         RRQA3WgBc48R+eCpnuhTOA2ohCT4opzfGZZVCZyhJuBhOpz+fk1P+38YDBQYQaXDyl5I
         0GY8lSRocUKP8fXVlESIchOa3wMatFFAWGF2p62/4uQwGcaeof9w7V/DUV4IJuchh0bH
         rqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXklbSblVZWGD7hz98zWdxm4MibrN5gUSmly4g+cz9wEwevO35v9GQcmqC+ZTbbaSDt7ZszJaCwOdGc0Abg@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxs146ddwGzKnQRDF4D1TKoKmQ6PT7uUtre1+PCQL3hngz5C2J
	e+sEQxpge4KGMvJPn54P4UTpjupTcXKaQj0mew250Fw1n8BGq2EatWbw
X-Gm-Gg: ASbGncuXOSzRBoDAYy8v8wggOqmULKsAcNueYNOXejljlSiAXbyDs+yB8c1LqWyBJV/
	EGFC9YVAZutUA/CIj+6oYNUCSGlD4lXVZHGdAxWbOy5zq5xycZ1lWSLByjvKNGC4O0fI4gh+6Od
	E3QoFILzs+JdnjqSFO1Vpdw60CHskKqPktNysw9N3BbC1WL0C1hub+zPVbX65V4K5K+7quidX4S
	TElXdnQiSalymKuyPKDHSySZPPIW+WD4QM0KQHxTHTHVoQieo2moXVF0BBebrw0n13gmcs3aVyh
	ZhEjPoRxOpf+EQYJEBAQWgfypNktpnaQ70FJ8JM3t1LmjQKRLkOHs9VbKD6qSKX8qdMA8FsThma
	nF0XfKLOuDBzt6ER7rWyV2n3AuvqT2+tnpdobYDYUoMExfaMO
X-Google-Smtp-Source: AGHT+IEsX7CrV0iVNGjA8nFm/M9lXva7xfdJR4uVQ4bFTbEaIpEB6yg/z+Eg6Y82ptLaz0Aib51+2A==
X-Received: by 2002:a05:6a20:939e:b0:2d9:c2:5ce4 with SMTP id adf61e73a8af0-32b61dee96dmr15699402637.7.1759743661363;
        Mon, 06 Oct 2025 02:41:01 -0700 (PDT)
Received: from ASUS ([119.63.139.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b609be239c5sm11325778a12.19.2025.10.06.02.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:41:00 -0700 (PDT)
From: Taimoor Zaeem <taimoorzaeem@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Taimoor Zaeem <taimoorzaeem@gmail.com>
Subject: [PATCH 0/2] Remove ad9832.h and ad9834.h header files in drivers/staging/iio/frequency
Date: Mon,  6 Oct 2025 14:40:23 +0500
Message-ID: <20251006094025.259440-1-taimoorzaeem@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series removes ad9832.h and ad9834.h header files.

PATCH 1/2: staging: iio: ad9834: remove empty ad9834.h file
PATCH 2/2: staging: iio: ad9832: move struct ad9832_platform_data to ad9832.c

Signed-off-by: Taimoor Zaeem <taimoorzaeem@gmail.com>

 drivers/staging/iio/frequency/ad9832.c | 21 ++++++++++++++--
 drivers/staging/iio/frequency/ad9832.h | 33 --------------------------
 drivers/staging/iio/frequency/ad9834.c |  3 +--
 drivers/staging/iio/frequency/ad9834.h | 10 --------
 4 files changed, 20 insertions(+), 47 deletions(-)
 delete mode 100644 drivers/staging/iio/frequency/ad9832.h
 delete mode 100644 drivers/staging/iio/frequency/ad9834.h

-- 
2.51.0

