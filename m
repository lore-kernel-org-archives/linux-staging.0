Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A714C3793A4
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810171; cv=none; b=Si0CPer6lti0pgsrxSs8l2dfUOkcrWf8+VlTXEarDfdu/cltTrbHgsAjGC0IUW+AuMDfPi8mvrWuzn56QfsGAqhxKoAGrrmkixkZscMKvXin1YLKMnifpkAYlJ5tSa+Pf6pciCl9UZZsDRei/wSDpykSOgbXYXhXsf0SxqS+pWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810171; c=relaxed/simple;
	bh=LAaNo5RL+flgMVL1YHSP0zlU4TE9e7ImpSJmnKfKBr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsjHuxib4S03AIUNrUx/o70npna7p3srUIjJxGPc2b1CGgXShRuGz8xtzCPBxkz+1F55On6QrDnXHqlVT36e2c8HHESMPJGdjhcLNwLTrtZGJStF2hpZRcR2SSittkQZcHs8LA28rpvIq/DmHHyzC4aCWZSCIq7vVX6wWeo0paQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvVYmebh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvVYmebh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b9144790dso2010428f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810166; x=1775414966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6PDT/N7LbYtJJDcDJelx2xg8NXIfygevP3dIW+DnC4=;
        b=KvVYmebhreTT4K+wyGuJAjrHl81Fc98ebL/ZaJUpDN1vLlg6L4knu2mKlOhKtZrjm1
         ngYyGfK5FedYCTw1QcS31mzHhpciQ8h3tn78STCd7twHW17VgTUvNYwBjobC+3jgCLP/
         OD+KAXSL9F4zOryuMjH63aFQf/luJiiEKOanNvIUPwtukfmLhVzjl5xl1wh9P1gJI3Qt
         BLS3UAohcTkG8C42zhTTrx8Rfv/I98GOcD5+NyJmJRuwIFMtfhIuf81cDtB/g6YOJMY3
         5wzG/V0rcajDaZ38JmQVwVyECejsIcHT95fAhpK3+nhvy+Y4MjakGHBqmnFWsVL5l4y7
         hlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810166; x=1775414966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6PDT/N7LbYtJJDcDJelx2xg8NXIfygevP3dIW+DnC4=;
        b=g+rRTOSguHorbxzVhqnwfzqBc8r5SvRx9+IFVOkpoCcTTLN9uBQan1XLHtmWFR2mhC
         sumwcSBCKhQWw3hlUl9+wjaN+nHTFIWf8g6/aDfMb/mKct7M013LgJTQlBeX/hrXzOE8
         vEr0tcFQcYJ+MD18FOCOyJ5Iyn47q9yDdIZ7XkMQGcTWP0TWpFUXPapLtA3wWKuxrB+L
         OxGe6B+osfmSPxHk2Oz+itp3BXe6aRi5Q0U6cB3YEy5G+qzuPvd3bXnuYemZ4Gm880aL
         rVrKIGE5AM+RbjSoq9CPlavQr5yskHKtRQit4uSFBbeC1DG2avox+j6Em5oHGZ3IKin0
         ukUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Uhv3njI0eFFxrc/O2smtZQQofoisfzKU/gRhwXGSeJFN8N+iUlIEeEHr/41AZKdgwbWaQgn4y3TygpBJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzGussEeGkDz4Uu6O6OI4Re+QM6fdBOoTdDl7rvDg6CDCuruPrm
	uDCs1qXEu1kDMTx+gXKiqWjB0aHaM1W8EaOwBIgs7nrf+u54HaRCaiOQ
X-Gm-Gg: ATEYQzwgEaEzhqNEUzvdHq+f6vqy7ZZD5jCw+1eUieJbdNAKEedAPu2THb8IocPgPcn
	sKw+7z77Muk7xsqJeZ2Tr56Cwv3Nl/6zgPetRYmW174mTm8CT5zqIkYAxkYrAY0r19noFMG9zoe
	Ss8rxQYqAWove1ukVGnEFh4BOC2PxJ/2x0gQQMZqMTUL8b61GwqBGF263DIxN+D1/RpHlwyKub6
	Aa2aElKdUm2Qlh1QpWrL4jGs1U8dUshcVvQyU86JwMOwpS9Xfdx5CkTomG0O8JOhVpMoiniyGTn
	2nQyVjOiNTAxTvtBXl/x3PJ4cdUZ5qUXfYZbxMBPVkVqUopZwNQ2zMFYj4ikUnFDZZXexolVnht
	W2zl5a3XgdBuaTXxuaUgbOvRGdYkzcnUjcX4fBUs0o/FyLnit5oF8fHTx0A8/tPpjGozbFlwRJC
	up+q4vcMHSxYkHcBtBu8mZ+iVSKfXBBc0U0fks5IDKKuil8IjDlEk=
X-Received: by 2002:a05:6000:40de:b0:43c:fd7e:72ed with SMTP id ffacd0b85a97d-43cfd7e7429mr3345917f8f.43.1774810165539;
        Sun, 29 Mar 2026 11:49:25 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:25 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 4/4] staging: media: atomisp: remove redundant blank lines
Date: Sun, 29 Mar 2026 21:48:10 +0300
Message-ID: <20260329184810.455285-5-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
References: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines to improve code readability
and follow kernel style guidelines.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index c65a5be8445a..d417230faff2 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -218,7 +218,6 @@ typedef enum {
 #define	N_ACQUISITION_UNIT_ID		1
 #define	N_CTRL_UNIT_ID			1
 
-
 enum ia_css_isp_memories {
 	IA_CSS_ISP_PMEM0 = 0,
 	IA_CSS_ISP_DMEM0,
@@ -248,7 +247,6 @@ typedef enum {
 	N_ISYS_IRQ_ID
 } isys_irq_ID_t;
 
-
 /*
  * Input-buffer Controller.
  */
-- 
2.43.0

