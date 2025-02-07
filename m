Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7237E238D5F
	for <linux-staging@lists.linux.dev>; Fri,  7 Feb 2025 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940718; cv=none; b=spCzTHnsRR2HVRWGbSXFZNmCJ3X/NvjwEV+a1Grz8hjYdOKwLaSPXWmiAXvtd6TwlF/XB/HAsB/3YG67R51A8w3i7dcjJJj9WyBaiIIAtinNGzuXnyVfLqOPVSUU1L9jyhksHzRKRe5SmY/lhZr7ZucSPn/hxUg53KO+6qJvRvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940718; c=relaxed/simple;
	bh=JM75lUan+PgZjJreOeRDnaaV1XjVImBU+5Ipcn4UJkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFZVMnWQ/gZJb+zdN8crzqHCkQjhRLsCChlTW5jKq2ikgICpljqJltzn0dfqe1jnOBZxX6vD5GFk1vm5WnJT96ppNeNvUebHP5hpwuboqJtBOtp+iulahXYI9ejGrrIEud/Hqn1KkoX5uamekozu8eCX5IvZIS3Ss20SVpIQtmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATK32ovv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATK32ovv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f5015bce7so1856215ad.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Feb 2025 07:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940716; x=1739545516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rZqqE3JGOQwe0uxvTrE9UiOzWIpwjT46qv4gIG869E=;
        b=ATK32ovvL87aJYZNQ+Dt6b8PS/PQI2aFQsxhRY13T7t2fF0djrI2xl9GGA+C0xhj97
         Ses9t5v8O7cF5z8r9M950QulIi4gQy2P31KpO4pWB0H8JyYdVytelHkwVl2t1MXx6AFx
         ocw1vKUQGgVtP1n7DQId+IIf4hVleR3/k6lqqbKGRRM7fewDlAo7YDy3J8h/I2u2WPwZ
         /pPMesPoyk/IVrRc5s9D4OOiP2E2KzwEolX8SgNwJfd5m1NFNGMI45eRKlYcn1kj5lTO
         GExZ7yP7qFJ0DHHJtVScdXpxtsZQz6Mf6eutT6i8w/bvdt0rpGlu/SKnDTN9jKxMw5ok
         yB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940716; x=1739545516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rZqqE3JGOQwe0uxvTrE9UiOzWIpwjT46qv4gIG869E=;
        b=wsGYuF2cYHjxnjNkatUAwwG1NvyNQhfNr8w3EeGW8dIZ2Xt34oEhvncPZTtlsQBbKC
         Gs7FSM/Za3nq/DwwqDahozwUV1wVraDRoZ7v6+nAgpjYsoemui0kVLY5UtyDVwcnUGSZ
         GkYhrvTwPcwoRoY7RhU8GUgyp7Ty4C80Yh+swo8/ksZrp/V/elgm8dzwqPzhUT6nbbuM
         zHe2rSTNuyMVv/TZ4A/F/8WeFnDVATI69Hx4g7NeTJaqm/r69nFiPlOPnvFeWnPosXDU
         D4frebgxSdZuPYJGEYbkCjpJtFwtCmy2gZYyTX9h41tkdPgufV3xXN2eMN6kDh199XrY
         C9pA==
X-Gm-Message-State: AOJu0Yxlvb94fe43f6jRJ9DNOPPHM/Dl172n9YdhqZxXlbjdKEYXHCGW
	l+IpKm/k5EoSZGkEcWbN9svPpLcmEwSFobe8in+xbWl9wuV//8GINjyy0PCh
X-Gm-Gg: ASbGncsahvPtYDMlRjs70JdPQyIDn1XkcDQfxEl9AUM6i7MuaO4/S/34yqUIjFgX7GY
	shVpJYiHUpvjoBi9Cr3y9SOanuED8eUQZEqbUylgsne6e9jOzADJwayJslvXoAZFIqehCguWxRi
	KLyU1nLhvuxFnelfojh+ePItJzydyhV25LrJ/1Vp8C9NmNAXoTQWrIsa5FadN3L8BkY8SPnDgrk
	Yl9W5kU1g5JrvpDB8hiWGmx/Ujnl/2kMDOH7ExgOo2+ySb9zZz8pqLBjRg7Qt/m/NbuGTQc9aKN
	O0p0iAw+r5XNZ5qdPcaR0eKDe1bp
X-Google-Smtp-Source: AGHT+IGAOd3eG64EQ/+fz78StGhKZCLqlyg80K+huyKXP022AXPhWTWGkNChoIscgZ2sJe4N/sY6CA==
X-Received: by 2002:a17:903:32c7:b0:215:b75f:a1d8 with SMTP id d9443c01a7336-21f4e1b1236mr20050945ad.2.1738940716290;
        Fri, 07 Feb 2025 07:05:16 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:05:15 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 1/5] staging: gpib: cb7210: remove unused variable
Date: Fri,  7 Feb 2025 12:04:05 -0300
Message-ID: <20250207150427.153982-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207150427.153982-1-gascoar@gmail.com>
References: <20250207150427.153982-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused variable 'nec_priv' in function 'cb7210_line_status'.

This change removes the following warning found compiling with W=1:

warning: variable ‘nec_priv’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 381c508f62eb..5c2b2c382df3 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -383,10 +383,8 @@ static int cb7210_line_status(const gpib_board_t *board)
 	int status = ValidALL;
 	int bsr_bits;
 	struct cb7210_priv *cb_priv;
-	struct nec7210_priv *nec_priv;
 
 	cb_priv = board->private_data;
-	nec_priv = &cb_priv->nec7210_priv;
 
 	bsr_bits = cb7210_paged_read_byte(cb_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
-- 
2.47.2

