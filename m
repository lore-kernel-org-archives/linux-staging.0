Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738452AEE9
	for <linux-staging@lists.linux.dev>; Wed,  5 Feb 2025 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738720225; cv=none; b=SWkcJttTs2rVtY/UBGglpwCaRKrtGzxub1QMzaj+Szkou3grlUuFCjlUzUKXTpn4gUtNOpaMniOdqDWROwJyCUhGdyV/ns9d8KSRC2PfH7G+XJxGs3Jmkow9zABBPh3GDb4N80koz9iou7ueH/i1ORAdp6umHMAu0yNA3oAkVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738720225; c=relaxed/simple;
	bh=K9hxSsEjSuskwWFMkKzx4jKm8OUSEZdzQCDUXELwr04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACYziARu6pPNoc7eB3uA1IL/bjSZ2ycUycpp7ZDw8TrXNcovZYdsKcHd99pCGaHZcH/RTXNZobbXYx96Uhvjjvy7QAb56EwC015HLZSe/fyyGhU9PEk0/+5tIhNIkeN88DTpNEo3P0YQaSzdQPEhffUEu6x6TKXC1JoHDH5Qxwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foeoI7up; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foeoI7up"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f44353649aso8359175a91.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Feb 2025 17:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738720224; x=1739325024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I1OcDg/OtmqKUQjN5TPuHo6tEG6KgsPyO8kgM3y+rLw=;
        b=foeoI7upx6TLg3KbJrBN3/7GQVQNH2F8ULSf8dApW+R6BjyilWb0L++JbuRavOupSY
         r0JHkJtuG0t912t6raiwex6Zhgk3f+sMYpadnu8GbX4J7INlhnWzlBeJI2yoXgoEgpp7
         xKGjlxxPehlJpb9HL8+b6dQnLpIgmwk0Nk/zgzGOg86/nWKDtNkEhrtjB3SuNN/FYkHT
         7MFB6PrC1tspj6bu4nP5vawheUWJoNyJOfqaqy/I3EPklnOnY0xBUk6U6pR63yRf2s0D
         +qBX6jkvhYpUubjTlJNigvheHDy11QG8TCIOfBwAVqYRYksKfIAAJQjFrzbnCGCTlEPI
         5S+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738720224; x=1739325024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1OcDg/OtmqKUQjN5TPuHo6tEG6KgsPyO8kgM3y+rLw=;
        b=AJNnjDG01+8wth4DwIyBXmxrrBfOQ8sR2vGxLR/zinvCGMzAKkHNYhTCmki0CsyJZ8
         iiYmCP0JHAff1QJ1JnNtiN6ZsK2Rhug9WO3qRiTXDGrWz6xBSpV9M+GSF9us/Gj67Abu
         yKZdby7lpuykfBPQ7MOk6OqvRnByvef7GfFOvRu6xWWy/5fEkXqwKvCiNrqX4OdsRy/6
         tOYu0p7YR4YD3tdjAaVzAnazSntw/LD8gXhVq0l91o8pQciCY6cihzHZgBzD+VxGeeIl
         /tcmlJ32qCJq+PHTsRGeskr7CtJhchFyeGhT4r7xghAQsZFWjEJznoUgsZ209cPpmFRt
         r7kQ==
X-Gm-Message-State: AOJu0YzT8/b6kxIWXWzNhs0vX85Hs5dmm245jOu4vLLHFnd8TRvc2SZp
	f2IbX3D6BIsYjM5Vq0xYmZLouMIDa6LXor1tzcuXyXu6opmu28Wu
X-Gm-Gg: ASbGnctUL2PANTHs5U8t/v/5IwUduMz4BiJDD6RYNDS1sNbubNQ9JM6/QaXlot1/+XR
	BUUXYlAxReSO4pWA/HbQwzWmmrCXZaGYsTmhq7F3NkcGp6znimZvzxSRb8mVsPCpqR/Y9JxtLRu
	eujOr2YHAM4XOaVrr6ZskTMg1FU8lBlR87dNR29PX/qvQp9Gcc8n7LD03oNjULNKkFt0Kg/Fw+W
	J9RWmwVzX2FPvYCCq/HMPNKbTuhH01oMQCmK8UVwwKBIWQs0+M2Q0361T05NcARbO4G7XCOnBlX
	RVewlbSddyr/t5CgcAVVngs=
X-Google-Smtp-Source: AGHT+IFCAGleu6WkioicbkUSBZwe556ET0Z4I48nSwszR+JcvZnWXVP0Eiky+UvJtetkrpbG3LwuUQ==
X-Received: by 2002:a05:6a00:28cc:b0:725:f1b1:cbc5 with SMTP id d2e1a72fcca58-730350f96demr2106073b3a.3.1738720223589;
        Tue, 04 Feb 2025 17:50:23 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([146.70.174.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631c02esm11263939b3a.31.2025.02.04.17.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:50:23 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/4] Code style cleanup
Date: Tue,  4 Feb 2025 17:50:15 -0800
Message-ID: <cover.1738720049.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch checks and warnings were cleaned up.

Ian To (4):
  staging: rtl8723bs: remove unnecessary parentheses
  staging: rtl8723bs: break up long lines
  staging: rtl8723bs: fix spacing issues
  staging: rtl8723bs: fixed comment styling

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 475 +++++++++++-----------
 1 file changed, 244 insertions(+), 231 deletions(-)

-- 
2.45.3

