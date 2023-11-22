Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F68618632
	for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibw7XII2"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7b35873201bso10473439f.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Nov 2023 01:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700646123; x=1701250923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TSVuHRUoWzjdRXUhlp3V8hbN4FBeW4gTj/Ub1P0syU=;
        b=Ibw7XII2rznBhMOC+aO+oo+X6ZQX57aiQhr14ISDhqfkWKxrOpyqCGDmbQEz1AoKGq
         mEozMdwTxfRNb9ABmWS8cuyqxamhvDgowvDJlBL8sSEl/NWEDHDZeN5kZ3MUXRf7Gr05
         5+9/tDisOMyLZUEUElyZPT3UXxlJC7Gk8b0h2z/E2mNEycjEBuX2O+InlSelN9eEu6Sr
         9RnpUyXg6aUG3XTA4UBxdJgI3LwTGPxIcNkFSlW2//YMoI80oG82qvupPlvaVQy6on+i
         YdshEasdkZLaUX3QusS+OkupVXie0kCqKF5oLmmYRlCsK5Kk4dy3uaC7Nz5KwQixyIHm
         a6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646123; x=1701250923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TSVuHRUoWzjdRXUhlp3V8hbN4FBeW4gTj/Ub1P0syU=;
        b=stq09GCnZPtRY5ZCff4xbFHVbzrWGQVYTWA7ZH9qNoS4VgHZ3YrFB1erQ6je/PgWzN
         zNQVxjA7WorTlvzP1YBTae588+ZEwi/ntUGtgjDmWz9YHcAbcdKdaerO1RHmYCmXGYZh
         l4+GZbjB0Swu8UsKXHZfaLo8OKatfwswEttesrsad3hP+ErLlg8nd1/8WZN9EKSZkcvZ
         9dSS/Z094EX6FSPp4xNgJSo7JfPWnIarHyXY7Lod9yuHGTy5NFvvrd8HCiMEf3On+z+q
         9ItaxuwX0+K7TEUfpOw5s+j/CjxmhY2OZvtMa8uXuQr1TWhZzcpINay3zbjhEV3UiMgb
         2QYw==
X-Gm-Message-State: AOJu0YxsOGsRgn4U/iJEJK8TNf9oaPj9Aiit3If0cfESI7yoG8g+7caw
	06iJEhynThxLcjYnOV+89YU=
X-Google-Smtp-Source: AGHT+IHUJ6C7ZhFk0PAdOH0FdpHDlKK8MnJuZg0xki+Wbbl3rjLNasi3Y1JHC37QlISKcXKhtcwNsA==
X-Received: by 2002:a05:6e02:1a2d:b0:35a:f02f:8df3 with SMTP id g13-20020a056e021a2d00b0035af02f8df3mr1908868ile.21.1700646122924;
        Wed, 22 Nov 2023 01:42:02 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id e11-20020a056a001a8b00b006cb955dc54csm5299950pfv.58.2023.11.22.01.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 01:42:02 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 97A8010210556; Wed, 22 Nov 2023 16:42:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Bruno Moreira-Guedes <codeagain@codeagain.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: Move Manohar Vanga to CREDITS
Date: Wed, 22 Nov 2023 16:41:56 +0700
Message-ID: <20231122094156.30642-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122094156.30642-1-bagasdotme@gmail.com>
References: <20231122094156.30642-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247; i=bagasdotme@gmail.com; h=from:subject; bh=3NK9tFw+8nXcmJg2+lJAfw1zj337GJBvGpQPkzucrrU=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDKmxpx8nOr5JnMsVPC+7oeXi3pyUZxpTFj7YdIOzcel6u 1zVjzl8HaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjI3iBGhs2K4ZL53OlVDFt9 uGKV+Wx2sqzP5FyxrHdj2jqDx58FWhkZWpcpm88p8FGYu4M5K7DdsCdk0upsPyN9dqe4szcLKv9 yAwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

His last email on LKML was from early January 2014 [1] and he has not
reviewed patches since he changed his address to personal gmail
one.

Move him to CREDITS.

[1]: https://lore.kernel.org/all/CAEktxaFL=3cmU4vZS2akiAR2vG-3d+9HwTZvBvf5JXuThHoOKg@mail.gmail.com/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index f33a33fd237170..c337a91aed5836 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4127,6 +4127,10 @@ D: Minix V2 file-system
 D: Misc fixes
 S: The Netherlands
 
+N: Manohar Vanga
+E: manohar.vanga@gmail.com
+D: VME staging drivers maintainer
+
 N: Lars Wirzenius
 E: liw@iki.fi
 D: Linux System Administrator's Guide, author, former maintainer
diff --git a/MAINTAINERS b/MAINTAINERS
index a02aa52fabe14b..179ec6a1d1c8b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23235,7 +23235,6 @@ F:	mm/vmalloc.c
 
 VME SUBSYSTEM
 M:	Martyn Welch <martyn.welch@collabora.com>
-M:	Manohar Vanga <manohar.vanga@gmail.com>
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 L:	linux-kernel@vger.kernel.org
 S:	Odd fixes
-- 
An old man doll... just what I always wanted! - Clara

