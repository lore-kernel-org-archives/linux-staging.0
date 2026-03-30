Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5927E07E
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889714; cv=none; b=hpACCQM5PVVDrnbkZZdcfqGqeah6RXLda29hIWAnlWNQOB12AcB3OYpBLF9j606/R8fOM5Tw728CGJsXbBvLvUcsiQHRj9ltk1ogBD4DtA779HRUH9be4tW2nM9VRd8ZEMKoE8C0KXhEt2wwp34r67YB+EhGV0T2B8f6WwpKMWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889714; c=relaxed/simple;
	bh=sCfzEzswqtGDJ2WlDXv6d+kxZP4B4Ga4mhC08Ap0SLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egkC5ncJXRxKZdnk3q0gLNGg93zFjeTYZzWYFr0cyNq5frJiIvzyc4nLldzTs6Z/yL9FZWihZHgBwVMiJEOwTlPJ5r4y98x5EP3ACRXLrauP1bYTFV3JjlVb8PQ6W8hP7LjFJT8WW/ft5Sc1KHkljvyjSYiQqfA3aCPZkiODdZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek78Ra/g; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek78Ra/g"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6501c4857b2so2975302d50.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889712; x=1775494512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1piw4laP2bfrBdKNf36rMPtgLRIXyplthcZ4+q6fJng=;
        b=Ek78Ra/gicGuAtEUYmyJkPG+IynkRCJqWv4wJgbngDpNs6NldW8ixxTlLsizG/Qt/T
         4YUyRrv309ZJ0EJihvGc8ez0IRArh7GIUYoECvT8g0rDqfMOAsIo27FNDHXhCW4AXjDX
         wGjwRk196QPmHwtRhFqEOYJIF/q7YWH/mffNV+UljaNrmQGn+2jMNpSHTQ1buqBsqmZx
         qB7i4pJgbHgk0CVWcn1Zuc9TmJhoB9VbhvVdANa/FM5UhvmY2BQPhw1ObgPO5KjfbXPQ
         rn2ORGChSQR9fdc+SRqpWZmVSDa15dRZJdANqYVAPVKYChVsyo1njhNyQJLfFs4fq2+k
         Oygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889712; x=1775494512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1piw4laP2bfrBdKNf36rMPtgLRIXyplthcZ4+q6fJng=;
        b=fcSh8zaaLYd+RFxLwWFzDQ6sCSrKVx5A2O+De3r4MZjKpT5xqbx7FMALdiUJ2lhSTV
         wDtqDTveZrfLfn1yvpkzoEGhafZXgW/Eh/rt1KIBo1OGzoY83295HmH3TbVW+CyoaUqL
         pzYRmvsB4618Wx02YdRpyKnOrMAxUXoliHO6YyGEwpq5jgcqNzvMzrcdTVIPx59maAgR
         InYzGmgpOAsYEcWtNjt+Obi3AstwroHe1OIeJ7/0YkuB5pYOEbaQcIkUNlKIvn110aPU
         P/BINbQC6y2ILaWRTmOwHSk+hwpAjhKxP9r5aLWeIaaZ8Rg05m5e8d+YGWuE5kfwMY+u
         Uslg==
X-Forwarded-Encrypted: i=1; AJvYcCW+1ru8MxxczWro6pAEpwX8njuBblVQnkCMM9JXamHErmfH7bGW3byyZS4PF95TgJfXAhbsvitTBoaur1UA@lists.linux.dev
X-Gm-Message-State: AOJu0YwhsQcf6FKpDv6VUYU8L5DhP0LwT2v2Wit2zo8dJjbGwTzN3/BI
	L3XQjDi1iq+D3fLn0V1rtfvi9niKAhwBMMmVp+Zf0A90eIfbQfy7J8T9
X-Gm-Gg: ATEYQzwK3+Wj8Q0z4iBeLisbfd+VU5YwhzyXxebOHejaQ4m9dJNO7MMEsf+eslItLWB
	45Lq+xBrIBv+D9Ed3guhj2OrebxiBzqLYNZHpeskIia52zpKRekUyOIoAqMwC/EhJWVslaorqtO
	6HV2YXHtSwFk0w/OU6HDha0GfebAsNL15clBiZYMQc9WW6m9gJfmekxjgKZBf4Pj0lHtatylf+M
	sY/CzgLAvdzzh4uML4Le+HAF+GCKp+xN3FLVhQHd/ZTXDBhI5oWMNTPNkxWNu0njrOYH3lHfXwV
	NeJc25ApdQSt6woT/Lnlqk39Q8vprobGoSnXB+agTh/8blAIem4/j9EWqhGKG6+P7woeU75zKDh
	iwMUtOnhcZwjBJtXbgAJpdS9PpZI1z6034tQBguPWMlBv5cncpkxi81h+M5+FzZztsTPiX52v0c
	PfWIOzVIMmLk1VGR5TBupnIBCzIcvGvwcwYl7UVdQsu7UcsCjP2BJ3rxk6t6V0j84/dAjzbHs2+
	JsCR9M3tUR81S9hwCzEYfKr
X-Received: by 2002:a05:690c:c189:b0:79a:daf7:c4fb with SMTP id 00721157ae682-79bde0f93admr121753267b3.50.1774889712427;
        Mon, 30 Mar 2026 09:55:12 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a09583f32asm1639527b3.24.2026.03.30.09.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:55:12 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: Cleanup rtw_ap.c
Date: Mon, 30 Mar 2026 11:55:08 -0500
Message-ID: <20260330165510.33134-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes all commented out code in rtw_ap.c and renames the
last snakecase instance found in it too (I just RB a patch removing the
second from last).

With my GSoC project I plan on beginning with removing the obvious fixes
like removing commented out code and checkpatch.pl warnings and then
tactle more difficult tasks.

Ethan Tidmore (2):
  staging: rtl8723bs: Remove dead code
  staging: rtl8723bs: Rename pHT_info_ie to ht_info_ie

 drivers/staging/rtl8723bs/core/rtw_ap.c | 89 +++----------------------
 1 file changed, 10 insertions(+), 79 deletions(-)

-- 
2.53.0

