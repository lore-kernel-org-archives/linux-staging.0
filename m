Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BB200132
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896165; cv=none; b=li3MAr/xWQIfitvUyHe3HSLMiekCNhKNFeECkR7qMxHzE+M2cLNg3nraoa4BHL14AwMWf6NyY0+w/umo7RykCSSORdG40lxvPgBSuOgtZ9NzwR81muyyhrCWbCPdkFeXhQkRRSVhnGvd9rBU4CPPA3PE/ZDjsGUedssxgzpqQuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896165; c=relaxed/simple;
	bh=Yg147T4WYxla65KOp+vRXkCjn0RCox5NBYHIURElZIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQo2a0tUE1Od1fBWYyy79r6IR8KiIMSL+o+gvHbdS/Y1v75anOwh6SaG4EB4O+o/TBrHVqzrwFRvG74WOdbwD8Q7qiWqEzZtrSKA7B9AaaNR0tS0wpYIWuz3obH4E8qwwaoYlej7WO73VdrlbFnMu7mAv1EHGymC5u3rj/7nHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJEgBYPj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJEgBYPj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af910372ab3so851332766b.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754896162; x=1755500962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQJF1tsZ7Z0OP2onFvcErsSZGdBuVRlFFPersqZoAb0=;
        b=mJEgBYPjAifBPa8pZUmlkeVW1V/14k4S1WrBJjddKkkkRRp+4p+rWzRJsVEkAorcgg
         g+ZXRB8TNDab/veIXz9/zknOvye09LVVfrabb0FyA9UtZSdywmkq7DHruLrnrcw3lUMe
         CYiQbVPoQMy9xPg+PUVwsQF3LGrsXYriGgEMsQ+y7dRHbq74mgO0e2jGhKORJqA2zJCv
         2a6L+7JOPbfmhmI/9tMGj+NDxTUD3y9MehPnfobjUWxGLAbkb07055fWEIdL0x3fIFBL
         rwOUDBMCAK9JjXQ2XPQhPsT2bFVn1j+9zJPfWX02FIY2JuH4ZjLzdUIB1xnmMEvQ3SsR
         jqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754896162; x=1755500962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQJF1tsZ7Z0OP2onFvcErsSZGdBuVRlFFPersqZoAb0=;
        b=p4f0qgbLVFrQyMwH61pr0yinxd++qkDS0KC1dgC8SSaDjtYkyNL7wKFNjpp2oUHmuJ
         w5JMMvHupX5c1dVD1hTHYIKYjSrfOGtiLMub5XqTNvy2Dhcrav+qX7vqX5X5nS6f2uSc
         55s/ohgZmW4uLApBJtQDzp7/CnaZ8tfTq/NXrgXRDtJ34hfFmLSJ697lNBi/r3LkuxJS
         kPjeSnCQRxSSc/EpqXErjn1y5mXJO/WySNEaXvbRTZQmeggwgtRar87PZmvsYpxMr7NM
         HUsTFWqoK4v7FmjuLWuwJZIFrM+QvfOy4zD+qge38gblNENcRqKxGFzPeQ0LokMBPyJ2
         j/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEV5Wr9IvPpT/lchnlKbhPRvjtjk2nul2bMrwApxlw4f3yNQBBXZh+7AxYgJ7AX2Jjz540Z2MeMSA2s8A4@lists.linux.dev
X-Gm-Message-State: AOJu0YxSXHpdYB9neBBG5g9kmjLAPigsQe5lOszVxf585YEeUd4wnPEw
	MYnV8/g1nLwQzX7ajIDwpbbS0rpNmahpQt2YQtOvrXT8wUDCd9lb6U34
X-Gm-Gg: ASbGnctzKVxentmmQY9Ky02BqbEIVNmFbSNHllKxo8guL5DmBgGg/0A5AGcTzjZ5iGe
	DQ4B9ImKPnOtth4PvPkKfjdRbI/OU23AwpOJHMEoxD0KX1TExxj8yEUa1Il8AZl8vHqHuCM3dcX
	i533rQRUdSWg27PuxmjH7SEDfIHMxHW6PrtsARdb7K4bE0zOssDuxp35MJi5IrevTENQFhgbj6Z
	9aAGPnOHTzORvWUl3zyrLlkDCkmS9lBZl0rPTx/uHAZUkaQkSlB0LYtN7loWZBd2H3rC6kTJcKw
	VnwzIQpky2DsiESFabpnNoTGpE1TwRsA04MhJRJ3jLPl529bD6DcFZZlfEwcfmL0xSsCUzvXZ4v
	vo7AjizQ+9kfO/3RpC1XPOES2T8AFy9wKn9Q+FMvWmiw79WpLzMyXQww6qvRAJOgcg3dt
X-Google-Smtp-Source: AGHT+IFgPCNs5OUVvllUX1WzbEdayauDKN3fF1huY8E1N3hDKN3pD/U3iFt7tSORJIFy1nYIvHZ2cg==
X-Received: by 2002:a17:907:3da8:b0:af9:7025:7d5a with SMTP id a640c23a62f3a-af9c6fd8b44mr1118031066b.18.1754896162142;
        Mon, 11 Aug 2025 00:09:22 -0700 (PDT)
Received: from tumbleweed (ip5f5ab8dc.dynamic.kabel-deutschland.de. [95.90.184.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a14a0sm1979188766b.33.2025.08.11.00.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:09:21 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: rtw_security cleanups
Date: Mon, 11 Aug 2025 09:09:04 +0200
Message-ID: <20250811070906.27232-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains some cleanups to the file rtw_security.c.
The patches have been compile-tested only due to lack of hardware.

Michael Straube (2):
  staging: rtl8723bs: use crypto_xor_cpy
  staging: rtl8723bs: remove unnecessary forward declarations

 drivers/staging/rtl8723bs/core/rtw_security.c | 76 +++++--------------
 1 file changed, 17 insertions(+), 59 deletions(-)

-- 
2.50.1

