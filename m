Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF66D38735A
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054637; cv=none; b=bnBdvom5XH8zdDzQPJ3UQ4oNyML456m4cP0GLwxv5kALlxR7WuxXuuR7nYhiu4HXshhsprLg8Vbz4IDZA8enIDObh7w9MJRdPPIieUZo6TeQsV0VSLjT3qLZeIyXYmcO4/CE1zRG+ag9n5RZXNlDovHr9FDsStxat+05nwG3nQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054637; c=relaxed/simple;
	bh=E34ok9rsQ1iyZNF8/pjziTiFznexgL8xTijGUS/jd6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItgD3oqsd6RGkOmQnjeTztUnf/roj6DlUD7OvW823BsZ0osOdtQMwUTwCbFpMzV2TA56+BC704QRg6AV7UMCrHaOG/WSlMczacHJHOmUV6oYcggBs7iNkIa890lnFWsHpnBqHRewHm0dwCO6YqrrfZjlze1MhZndKPnJNWwXXxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tr7cWykJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tr7cWykJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3044541f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054634; x=1770659434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx3IZMFtvoxLMIh/gYYF8XJ+LG7aTs2Ot1GvjmzfVJE=;
        b=Tr7cWykJ1SwyGbISZEdNe83iItfxDEd0LtKgQL+GrGqUyZwPg1ftKjKQlHHA9TYjBy
         jFuMqB85jKNAB7YzcruxWA98/wFNgMmhodO+Z9MbyxzL4HWvHzPxoJdIGM8ccWqwIwZ6
         2vfK3lyPgF8+YLcF8xJCxyDaUPdcFOthGDxJT0pJDZJnTKooGjAZW8GDab6+s4ftsJfO
         3Ty8l0CwK9R0W1D1kpEn1GQyl+b0nIzmr57ok0LMetmRp1kM4Tx7hjtRXAzUHEydYzK1
         dhNwsFubMIRORnZFwBKazhgik2XYQ/I2I6DXEwK1V4niknhZhA+nVfI7QRzFhQIgnqS2
         rjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054634; x=1770659434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mx3IZMFtvoxLMIh/gYYF8XJ+LG7aTs2Ot1GvjmzfVJE=;
        b=BU0lOO/FAeGNEXUCSzfZZ9r+J4vTczskeVaZV8tf+nrPrOOgXuknuTCl/dzJMu9EC3
         CVuMk5WmceFSd0vkOEhBP8DtI6SiRn0a/oYBq/oEH0GwytQx0OD51hhVCUi6xdZnuyuB
         48Cb8DV+LOVEEX6ZgI2gon6w9t3lV0hwAKXkEAshZ1n5KIVh5pJZrc8bBBsaNYp3ln/b
         zzHhhsdwLQJ5vHDp95yXIeZLdCewXDuAc0uMTwf+YUQcZeLy2H+74QXOocbeDqCIJLpC
         SqwMBNdBWCu3y6KrreyjTtbvW9hyXlCqlOCO7/UQD1yfGKzRbvLnQsk6A88MQjyfAJrE
         Y1+w==
X-Forwarded-Encrypted: i=1; AJvYcCWP5S/tUbOeHpcybr1rM2pPLUNQJSOiVDSBzKyX/gSVa8d8ru9q22SL4RzQAYZsXOWTBGmn8cUxVT2GNI7J@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp12tC6Mj5vkAlYT5vO0XkSREUF0oU/ukjTXVUinIPt060t/ZK
	3An1r3T71uQN9NM9bmHYUoT7mwb8AnRL3qLm0HryGyiTLAyaLz1k3Adt
X-Gm-Gg: AZuq6aIyI+VSKH87yHL2r8D8ECz1YZoZKJo03ELEZroo5Q7pmMaNmeYzSuUesN5xEZq
	JuHeezSOA0+BksT+9AL6WjYEbz500m04qdwF+HkWB1/dV/qm9hrBxYer4ZzL5LeHWoarAUMtmg9
	n5jxGeDFWjYPjzztyxBYEwrPx3CpMXV/gKljKEdb/foQthZGYWzhBbvlqUUHP0AM4LQ8kp1fv12
	BDgEEItwadwWyfdCb/bI/mv+DR/MNBDImM5kQTY0J5dThCuASNAKNYpzf2xLbroOpAtKSa5rP0e
	r5hakO73qCdyfTOlOcOmimcuy5JcPGQAnCfpEOamCKVq9awTD6w5lGl4BSJ5QNx84KsZpS0aEQQ
	OL6gwZrQKCr79qD2P7ieCESrPxVlbY+DL+fOI4Kgt39pzGUZukY0JQLn3nXmpFvAn1xYIrRQjEa
	Ix49RFZahAIj1fsgKmyNM31f7eBDSCaCL71Nay4w==
X-Received: by 2002:a05:6000:4282:b0:435:907f:e439 with SMTP id ffacd0b85a97d-435f3a7e41bmr18275928f8f.18.1770054633944;
        Mon, 02 Feb 2026 09:50:33 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:33 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 0/4] Cleanup media:ipu3 driver
Date: Mon,  2 Feb 2026 19:50:29 +0200
Message-ID: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2026020258-very-numbly-b36b@gregkh>
References: <2026020258-very-numbly-b36b@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch has now been separated into four smaller ones, each one fixing a specific type of checkpatch.pl issue.

Bogdan Sandu (4):
  media: ipu3: fix alignment
  media: ipu3: use tabs
  media: ipu3: avoid ending lines with paranthesis
  media: ipu3: use BIT()

 drivers/staging/media/ipu3/ipu3-css.c  | 39 ++++++++++++--------------
 drivers/staging/media/ipu3/ipu3-mmu.c  |  2 +-
 drivers/staging/media/ipu3/ipu3-mmu.h  |  4 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c | 11 ++++----
 drivers/staging/media/ipu3/ipu3.c      |  7 ++---
 5 files changed, 30 insertions(+), 33 deletions(-)

-- 
2.51.0

