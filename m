Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CEB176FB1
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768138270; cv=none; b=tPBTa/OA8M0L+/ZKo7kIm9RseD4iu61MaBvjQQZkfKRvSW+9pKLSUKG1SFoFKKi2X9C+PyHKoa6EdplTnBlm0Mx5yEv/egWNpzq8D60r1mAW7+AasRge7siusn5sn5Mx7R1ii8eUt2Y6EXPsv+RZ35EBxgt7dyf55hN+cNNtkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768138270; c=relaxed/simple;
	bh=sgq+O08oyC6IP2aPndHYj0/yjoKM3F+XU1voj7aTOD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdFhSQFV/SxHGyH6IP74iwdhAAlYBekLwNz2OnzjakLg2nuPLMA0/MUmWoUzwaZt86iDhPA/Kz6UO+fQGo9HwXDHSAZQ1vxWAY1ZO/XBJVgM6YSYcQrT6whlIsZQQfV4MMTAiKQrhKeAA5w3hFa5OZ0hQ8hbtjg4oX4NHPh9fBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhcwvmZ7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhcwvmZ7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432755545fcso3219000f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 05:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768138267; x=1768743067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95RiXCjFheb8REoFGVHb8rqMKq+/sow/IzRMOPDqfZs=;
        b=IhcwvmZ7o8MrfGhj+tD0qFUQfsemorRJ42nmIwdteAnGQJ9yKkujPYLTnUeD8NFNR1
         Q5cUrKnuPaVrftjiiimdtNKC30v9Fu5F2ilWDj3SCdjkbnl9/DYOMurpnUTi2GEiwoFu
         iQDDA0B/MPXnpS4lYK7zb4vGoLtLacDsjcsAlXSp38RW0EkkzO9qllBW7iD92mB8TfFw
         RQNEbAlfJC8llS7nM4MfNqNspiqiWxTG2gQMZPH6p+06SMvYzLQ8vD5/DdQGZr4sloaB
         w2poXWEbrZijxrd92ByNwH6LGbpElk7blSJvJJhRpmd9Qkc2mDTa9BgkZzxRzpR+QqE3
         j8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768138267; x=1768743067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95RiXCjFheb8REoFGVHb8rqMKq+/sow/IzRMOPDqfZs=;
        b=xK18FSGEMZERUNgWMMapaxscRzo1GxU5i8V11UvuCD1q8v3ThxfikfHuRF9sWongL5
         ololPP5a14z/4ztHh9vjRAMUKf1U61R8XiwJ857p35Wnm8dCZ9L3iisDRzUgZ3uVml9I
         1tWxLkEO3M/zHlvyDZ/JMonWh12wwNWwr7kkd0zctST39BlNafQMZ/5emu44d/CX5I5e
         Os5gN8ncuTAXhsFpHZkiIFapPO9plizOgOgedgXX8C6yW5CM8+Z2znYPibII8ecBhLDl
         nN2nmfzDm8i0h//M0Z6kJcv/sixAPof8bMWhmuVo/hBDhoBEvjFZcPwuUMSzpZrNMKDo
         8rkg==
X-Gm-Message-State: AOJu0YzjCAz0IwCfcRroTrkavgnliKd5iwxfsy8SmWjtKNArNIjxlyzc
	tE0H/CzBxLpAZgK9IsDRG5BpUWmm35HNEjuJ5lAUMGSJYx99RRqvbGVX
X-Gm-Gg: AY/fxX460bO3psws28wfckZbMntNM+I8YimQmM/3cxQ+ptQLVSLIkKasMp0IMRqIuMV
	nylbjXhT3XOISMQdKanX8GuxUSyJT/tcr13Jm4UZKulNrAm/2ssS3P7lnJaHSLESMQKsTfokcay
	aV4TH0bsPduUhTrtWiZ4ejoiwJ6ygBsOn4tFGME8xwVJ+iFchqL1DYJ7nXfdBAscgdxgo4c6jX2
	1dNCitOpKA0QCqtYCLkweSlSNP0pw4z9l+JSebRS08nvL/tWBtsyyrDvZICTEadTYb3rOJnls0K
	B/a5nJ7sgHE7AMdNeSKn0i+qb0Vy9zC8Ya5d1cYO+mpXZpgFaiwvaVAfzxF/WT833E8tG01JmGI
	O946MuUq8M2qLyRl+SQ6SdxI9sRWNkY2FBoV0qb7qplMniMecal85NNMH5tKy8plUag0GD/sB6a
	3C9ZQQfUMa3fN+Y9XkV0s+POuxWi4LeEPUyVjjoW9XDeIeaLd9eoGbtyA5Hj2BOQg=
X-Google-Smtp-Source: AGHT+IGDak9gm3ZAyVH08rfcY1JmeYbuov/DVAUhtdQ5anPgVW80jdJ74PQNEiZVocDsBXYbPoQIJg==
X-Received: by 2002:a05:6000:400c:b0:430:f6bc:2f82 with SMTP id ffacd0b85a97d-432c374f180mr17379019f8f.30.1768138267004;
        Sun, 11 Jan 2026 05:31:07 -0800 (PST)
Received: from fedora (host-82-54-122-237.retail.telecomitalia.it. [82.54.122.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa78sm33379635f8f.6.2026.01.11.05.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 05:31:06 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH v2 0/1] staging: rtl8723bs: style cleanups in rtw_mlme.c
Date: Sun, 11 Jan 2026 15:29:16 +0100
Message-ID: <20260111142917.166565-1-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This second version of the series drops the patch for sm750fb as it
introduced a build regression (pointed out by Greg K-H). This version
focuses only on verified style cleanups for rtl8723bs.

Changes in v2:
- Dropped patch: "staging: sm750fb: fix static const char array warning"
- Verified build for rtl8723bs/core/rtw_mlme.o

Lorenzo Simonelli (1):
  staging: rtl8723bs: style cleanups in rtw_mlme.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.52.0
