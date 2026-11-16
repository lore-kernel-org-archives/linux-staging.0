Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848912;
	b=O2MceefbzfTC0+lwze4jNPR5WaNw58KTpN4/l0/gpiAP0HGADxeglBW0WgJwFpkGbraY
	 xgiopLEuxd3Gckp/ZR310NJP6/iwTJpf2sLjYyZDMsCbPVg+r/Jp36Wv22N5mGM1MuPHk
	 Q2dJLTpLITHucTVE0spRyZeWBQP3zzs3+puVamm6FwqfobOcTFp/MMYG2R2J2ihbkghRK
	 2ruehXNYdQ1SsZTDMzczM7uQ64ERw8JJl2uMZtjTUOKZpYnjy5QcP7jkh+kAHZuZCmACt
	 6RTFHd+55/aS5DsAyvFa+o15WfAbH7yWJm9vUoFdrKrtbxHMBjcNz6sk81b/hhAeLlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
	b=V3g/0DJUwGRh4tYIb+uiCY5gZQvjS3txnbR6PiB2LtfOA7RRSwfXIoSHDaGA/gjpapP0
	 P2uAZ1obNd4VLEJPynF3UWn4I9m8gp1Cqr6N/jtlYfIcQUKodEu5DelOA7iDP79oTcJn+
	 mToeiVB1j8RAuyAElq5m68yVa84tF2d6Y/jeJ3fXMT60v4r7sFq7SMMcny+HSbwHZe/eD
	 fXDeMl5DRQGHeHsltb1JhGajAuzPZvcyGBGKof5cc7hdDoeQ6hQHgJgtdOGp2wzo/NNp8
	 xonqTYP//6a+gL9gJ30VwkXcE9HI00ZNG/IvXdMV70PUhVsh2YNJGFU77/rg3aEEz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BssNoBu8;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7FD606A32C
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BssNoBu8
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2893531bso2698749a12.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848911; x=1795453711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
        b=BssNoBu8+OXVYeLF9QvvTnCVFYMQUR9ou4+y9I9gb38ZriaBCTfASrGGkMXuCxVxmm
         LxSnAPhN0ZrdQM7in4w+abeX90U5/xM4NZRVxXid+glZVK6pRdVbzaoP9DoPtBT3CJ6A
         3WB+CwcpecsWrT5ukR6s0Aby6SOOp9LLuNk9Jdv8ihFDbTKpwkZNlHzDw48gPVlHk21/
         2rOWXcvZZZdsKQ5IrttEn71+1I9b67qTYxIcXIkdAoqsR1mhXEZeFIHDDThJuGCmUwrz
         zQPLlQUI5F/W3IM+Kd9jYJPTUR0h0iOHJ5iEedVPlDEY/ctAjdMULduMHhCNpeYySwuA
         NIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848911; x=1795453711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D29rmxrDoTADwO/LZ3yE5rm5+YgifUScXIfxafA5s2g=;
        b=HPDqVxj3JOChl4A7iVQMCIp01wI82ls6XKD12y/5rEAHADiwrHVTonnINV/ygaxRsR
         2tSB2aUNGpRNSdH2lPLaYiFjxrDufZYPaxxdSHTRGqohzn/Dzp/th4d+KhYXLz2exqUa
         h3NYKcqesqsWh2+SxFi+LcQECb7MMn9BP2vp1PjAv8asgYsxHHyzNuxjqa+PYkHT0uOj
         OII6KXKnYVRSg1T5rkehnwpxkgT6BCW7Is9k3ESd+woXhGnNkKhRBnPE93JTW28MXL+a
         m5Mwoo53goEl4kWIrsBe8FjRpzT8T/UdBfSjowNCT4UDEsQwSmSmP5KMhJMBSGOIGDjJ
         LjGQ==
X-Forwarded-Encrypted: i=1; AL+hErF5bWohmFKx98aHrB3H32BNWPjojZG+OvwyFeYuzADtedaOiKs+psDsSBiGp+byxlooyJlT7CBrI5BbKqWn@lists.linux.dev
X-Gm-Message-State: APuU4Z/FKIJK20PNPGL2UoJugvAALgmlHy58/XgpZgKv98jYQptqHKIt
	bvJEyi1kbFa8NF6LNnzxmRfkivNFH/2K5dp/CSLriLpgS6wL1NP+seUE
X-Gm-Gg: AZFdTZfwP8gpboQcfcMKoJCllN+6dRwjEONvc+T3XJH79IufhvB1AVZhxAmMn5mUUUu
	Z3AAON+CZS79YjUD3LnfUmxYRCZkyvXNgdNjgLin6qSYhvRp1XmkJcn/0XIFP7+jxFe/eHvDY6k
	8qYP/ArvVQ9tse8bbsE+bvL7DmbwXQy6Yl8AKiTP1UxSef+EytYKoI/gPLuJ4azCZj8PTOztlMr
	O9p0MGZYoXZ0ECEYQaAOoEAYPJ1dmqNm39mKiPuvxUil9/arLvwwi0+DTnKmnZUka+016WPCaY3
	cPySc5C9J1gi1mHK+omvMJxlvZq4r0iFLy3pPahZ5LRSISkvBrX7xsyFvlSrKySZ/48lDHBbZEI
	1ML/SWUZyq8oOm9JcT9b8/JMsPuaBTNSKCqLEfHEcZM2uQkTrTh/BIPylafsDqpd4UYQxTAUtZv
	5gX5SPsZ0iYeWabdQLEJOg2WF0ekkVEd7LO7ts31nkNCQNe5o6WwwYHVmuGsdGIt/EoHeBXZDet
	SVAVVsKLL2B+VaEqvxrvM/Twtrofb6Eq6L9ByCni52trER+P/Gm2TQ2g5cWnwoz+sXHxqpZ9Ckf
	h6At7CFug798OosUejfWLXUZVbqDgTZFUA/ORur3+qlMicFJQjcNCm/SSlri8nQICJTJbVg9Bw=
	=
X-Received: by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr10390370a91.44.1794848911208;
        Mon, 16 Nov 2026 09:08:31 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:30 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 0/3] media: atomisp: remove unused functions
Date: Mon, 16 Nov 2026 17:08:10 +0000
Message-ID: <cover.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These three functions have no callers anywhere in the tree. Remove
each unused function along with its declaration and the now-stale
leading comment that described it.

Found via a tree-wide search for functions whose name appears only in
their definition and prototype, and compile-tested under allmodconfig.

Changes since v1:
- Also remove the now-stale leading comments that described each removed
  function; v1 deleted the functions but left those comments dangling
  above unrelated code. (Dan Carpenter, Andy Shevchenko)

v1: https://lore.kernel.org/all/20261116114250.6587-1-chaulagainavishek14@gmail.com/

Avishek Chaulagain (3):
  media: atomisp: Remove unused any_virq_signal()
  media: atomisp: Remove unused get_sp_code_addr()
  media: atomisp: Remove unused hmm_flush()

 drivers/staging/media/atomisp/include/hmm/hmm.h           | 1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 6 ------
 drivers/staging/media/atomisp/pci/hmm/hmm.c               | 6 ------
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h  | 3 ---
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c | 5 -----
 6 files changed, 29 deletions(-)

-- 
2.43.0

