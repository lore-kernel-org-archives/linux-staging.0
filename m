Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45230225788
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 22:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768171750; cv=none; b=W7KZNUk5zSL6KUKPpI3Xhv9jXYCf43G/urNEKN6UVnZCfQIiJ9FB9ThGhUhYJ0xWXv6Ibgq5d8AbRyvcxNDj9qsMgzkCt9CjoSCv9Zgs1bmHGi9dGhsQ2KdsakS8o90NJ5Y0wtD7YgiE+CZXrOzNlOLMjNZ6PnrzgBGx5Dmy2VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768171750; c=relaxed/simple;
	bh=Tfgap6dMZUCe5Hn2zRCgloslrAZ8vmYo96dunI/qEdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E91bLsKvVEbeP7gw8/Y6ezHNin5m3zX4eEBLwyK4kUvEBK/dYo1dbOPe9kEtYE9T0Gyh6u47N5dOIFr7We2cFl/uZJaFVr89QrHLtmNR++3mWVVyvDoCoTTneO7EIngdjwYsZCFPw/s4QJi7tOff4w7X87RJVUTUDZFfjKeeR5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHnyYPuk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHnyYPuk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so53899085e9.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 14:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768171745; x=1768776545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAHZt4Dup1UEKXXufrzDbgBNhbqpw0IfAaI3RCyOPlg=;
        b=iHnyYPukZakyC9jsVJU6WMnAy2Y95RwpjCqiEvQSZIAq7oo5IYNNbxJcabwfrKLdF0
         6LSIaGSdGea80NYQ9AJfdtC3UvcnYyJK4N0daEJuuGdZykKrJBvnzzvTaGKqUBFZn22q
         v5RUhhd0sRNaHGsAo4yQ97+bT+ixUA2vDs/b7XxIUEHIt1+TxsxdNQGCCXylnDTYTj1p
         VX/T9DX5wAE5YvlW03jhUwknLDtPAARbqZNvL03RNWsuZS/aHxTJEyk3hnJJLTJv1+P5
         Ce48ihu7qzGfWtgleU+SbjCu/c1sqOgOMao8dEx/VGr6NiD7yQxK6+jFiItFalDMivBL
         a7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768171745; x=1768776545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAHZt4Dup1UEKXXufrzDbgBNhbqpw0IfAaI3RCyOPlg=;
        b=nrAEB48+mZPNIo9KzyG+4VNKGPYZiYeBMVyaOGyq4N2Sji3HQcr5uiwrK97ewT4JVL
         QWQq0+W/3RvG2TBaghmyxdzDXdnbwAZqNi5A8xg/m6bdtpU/s4TGxIHXQ6rX7g9mfhvJ
         m+bekcjokTUiboKkIaMFiuU+Gd1T/ahxywn+YEvFxfKDm6VzeFr7V4p+V6zwiv+RjfYL
         HcXfgDTZjr6qSlZ7ruXwfDAEx2/zjA/1WtPeaNfTH5e86RmrWhbkLm3SeJIoFi67nIaw
         Y6gykLpLcely4g536xjQPND8G3WWPLoytSt9Lj2gwF9z0tJNU0mNWzGvGcA/pryUwR8C
         bDTg==
X-Gm-Message-State: AOJu0YzWMtzN3sS3xop88T8YBKvIlI0QF3Ioce3W02h2sDCID4L3DLqu
	OaW3iKzG66AwhzBOhMED3jCcZLzwKawfPb1smY5y2jQYsCTuz2746bD2
X-Gm-Gg: AY/fxX6WlvLbXfMACAQ5bLA9ZBC+7BhnZbAixXNrrx+FG6o3GmkIt8oXapUjz7neg+/
	V4mOm0A4hASM10xUVMNAyPPouI21d+hEYXU+KYLTOEIb+0tj+4B6nsDNQY0MvRKeYqAm9+5x6Wb
	RtyHJR4BoTiDzBWblakpfJ027H2FKpusxusnyIKA13zCBGKZGREXB6Grod+Vh52gFvuw8+DpepV
	z5IpdxqTVsvoivG3w7bLy8pX7OFcBLCVI2QZD1BIigaxim0Sm94PKNLZewcLzYV7p8oX/56ss4k
	Aq2QEtTplE61ozCSPqjr98XNsR19EI9T7DjlebxmFQPjCo7pXFlPAU2eOMmYTTEVt6QzLS329WS
	jx+v7zJJfAZunADBGMkbq6cYNNA40XrQ5svmzCtYw4v7Z7TpNBScUStYjIdhGCI4Yi3nDHumINY
	BD5nIg/AFUEeI6q2aDbWHdr7IhkY2DBt4cAKEKBDax9bqNQ45YZYlsz66BlYxUUyI=
X-Google-Smtp-Source: AGHT+IFxmnERgr32jcvEpJ7UZPtOJGRNaQMxwZDxYvBjKevRu7AyuRGqzny+3Dy923AkY3qUO2iOpw==
X-Received: by 2002:a05:600c:1d19:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-47d84b3989bmr150745685e9.32.1768171745396;
        Sun, 11 Jan 2026 14:49:05 -0800 (PST)
Received: from fedora (host-82-54-122-237.retail.telecomitalia.it. [82.54.122.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6953fasm316075625e9.5.2026.01.11.14.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 14:49:05 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH v2 0/1] staging: rtl8723bs: style cleanups in rtw_mlme.c
Date: Mon, 12 Jan 2026 00:43:41 +0100
Message-ID: <20260111234342.290733-1-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains style cleanups for the rtl8723bs driver.
The changes focus on removing unnecessary comparisons and 
trailing whitespaces in rtw_mlme.c.

Signed-off-by: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>

---
v2:
- Dropped the patch for sm750fb due to build regression.
- Consolidated remaining style cleanups into a single patch.
- Verified build with make M=drivers/staging/rtl8723bs/

Lorenzo Simonelli (1):
  staging: rtl8723bs: style cleanups in rtw_mlme.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.52.0
