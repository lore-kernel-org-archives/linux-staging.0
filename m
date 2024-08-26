Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA53513CA8A
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661146; cv=none; b=VsZgQ+f6OdWXATpUNPSZ/oI5U39/5aiXqOYg9BDqPDdPLJtLGxuVSffIY8+R8tlv2PGhNQGtaKc3Xx9c9ugUW07La794lxXYS/CaHv30sq5XPHOoPqRfrN9S0z/eTcgeb8t/cIKXx0UUuDhZJc5qLEi56e9ZDvtJLYlsiuHNGX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661146; c=relaxed/simple;
	bh=dSHIOaVWrYUhDBXQBxtrLeES3GiBwBmKuyN2baorDgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VTYHzValk96f3MztqTQ75T0gKrzfj1ky0EirGe69pYg+4M1t+3i/SwJU+UJHk9HswOtlX1XmbBzEfSxuMcWp32pFubb2ELtROuLtd7QlNI5eawWRRBBggh9+CBQtOTdxbKyOWlPgGJMuuSZQeRDpeF8b+6rOmbGdZqhS7gDD2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkIMWw53; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkIMWw53"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso395754966b.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724661143; x=1725265943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgvhKChH58fdViCS840EYZM8/m6pFZNLigDxHPU66NY=;
        b=GkIMWw53B6LwYWNbrRDyN/d0J1b2rYHCN4YRRhAxlEYulQJIMn+FJE/42Wt0zvCP3i
         eDqme3pqJZ5PK3prFKx9MNEC9yyV17TAqkxGpLqod18wZdZP7/iM/HC6iCrWag4zZDy0
         mEiZGl32D5DgUF/ASN+18NYPC5knSJmUlgy76wZg58ZI89123ZxJkLDFyquqvNX+crqM
         CNnX2XpUw05GAALxbetN5+dOOxjOUF80yl95b2lB1s14xyBW2emkpd8UHNhuZHqcIACA
         vxY8mxhZBj0MCkjmXwI4hB9KWb7WUcvxUwFyrEl5N/VyOMWcq1XtL/JficJmvUVMvXOr
         HQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661143; x=1725265943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgvhKChH58fdViCS840EYZM8/m6pFZNLigDxHPU66NY=;
        b=iJV9IDexxDy95hpFo74TkU8RaNz16mpt8yTnPtCvQviQyevfi6arhmi2VHq7Tro7hp
         A5Xfb07LqPOIAzX0/Sis7OacUM2NANL1vCBWGGaZMTquUXnt7fBBUO2TZ9cYtiiD8y5Y
         Tp7JabkQCXe88I9CMJ2eDzYannUJkJvVi7YCkmBE/BrFyafqoPLKQefC9iEuRgUVl2YH
         9aG9IBgzu4idKLanslt0IMiHgBPYvi1hAh7/OLu8MFdLbHBpSWoW+zHwtmzXALIb8hJh
         oy5VqhC/i0ekoTF6SAUMN8PdJvd+jejdCXN6XjXrs57Bo8LFsdynfgeGXcCJgwLYuJ/r
         zU7w==
X-Forwarded-Encrypted: i=1; AJvYcCW3Xhh0wuhwx34qZNKLJkm7ICsp1l/uqY31pgbMZnXINrmGc7f9WzouAkKJkssMV0GfJ3XQWUrnZR6aqO+C@lists.linux.dev
X-Gm-Message-State: AOJu0YxNEDgLD4U0ADTMXTqlMRV/e+oLx98l4Ahr4INTDBl8j1Kbu2Xg
	9KM7Pk3XEHBBr0aq73sfa+og8BGJijAe3mYBFv8JCS2zr8xOo466
X-Google-Smtp-Source: AGHT+IFu05B8AxWKItCL0B+EGMRJkjoMGa+7VFx0YbUzfGBpKWH9H6W0eL/1pJ+F1LF1mFwUgPYz9g==
X-Received: by 2002:a17:906:eec6:b0:a72:8762:1f5d with SMTP id a640c23a62f3a-a86a54aa602mr692578866b.55.1724661142308;
        Mon, 26 Aug 2024 01:32:22 -0700 (PDT)
Received: from ubuntu-focal ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2b0758sm633289066b.84.2024.08.26.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:32:21 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: greybus: Enclose multi-statement Macro in a do-while loop
Date: Mon, 26 Aug 2024 08:32:12 +0000
Message-Id: <20240826083213.23499-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the gb_loopback_stats_attrs() macro to use a do-while(0) loop.
This ensures that it is treated as a single statement, preventing
potential issues when used in conditional or loop constructs.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..0f3e4c43e2de 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)

 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field);
+	} while (0)

 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
--
2.25.1

