Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25133557B
	for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030753; cv=none; b=CnW7DpDsflVsV930xVjMmtNgZQdMHXOemD1FQh5X/bF8xdF2GLXB1q3QttWjadBWDmUjIKRwEFbZMA/eOYd5nShvGzL6Z+c80j4tMdAOyvITm82cxV9u0Y1ctwZj7VS4mgUjR2jZ2BKlc1ErLrngcH+jlorZ6vU2Di9GGePUG38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030753; c=relaxed/simple;
	bh=IOMKATf4WlRptW6Eh2eCnd2gEghdfx2vgXIU4gGtjTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZs2zgVnqt8KxaIXgIF0keJgDBCmQN02sEoPq6x93Fiw1jU0i7iWRNjxOQtqIbnBuIzRsTFglavx5pXkaNISifcgYWfsLb5uDUz5M0kZz+pDM1y2k7C50f/o8ClUVtWU73vkgRRcXR9SvqCevToglyMAnCZpPPNCo/gDjExqALE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nm+VpUF9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm+VpUF9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711810948aso4477415e9.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Nov 2025 02:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763030750; x=1763635550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFSFlISYEwJhzl0uBpsUYIAL1eAWoNbR9f/0OF3g05Y=;
        b=Nm+VpUF90rJTiSNaT35iLoDrTr/741S7ZaN+BIGYZD5Z6NlpQWvmM4sSkgQL8wIjTs
         Vw5WRB02dI4iqS4RqmTT7PSnmGBLx8jMx4WpdxC3wcO5zlCigXG/pqwlk6yJq6ceC1T4
         Pp1vY1cjeVvZQeXMo/lBj8q8v56NB6rQ0raT28qOLbYR0OCOBp8JWrTmpEhP0dJdk+OZ
         eNItS+U5mhp4xiQ89o5637497in6zzt3qgZC3aPvt7Afo8mnCGZk0i0obHZ85fm4z1V3
         +CUtxnmJI9qlpST4uTeJE7SGBvmdQ6cfFzEVuWvyInTrdweex6p80Rj0yErg+rdDtXZA
         wJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030750; x=1763635550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PFSFlISYEwJhzl0uBpsUYIAL1eAWoNbR9f/0OF3g05Y=;
        b=t7zpu1F3lk9NwlvJgBqxtJzUsr3UTZ4Biw6Rjh6y+ARL5WNMbWyrnjC8860c24rRkI
         3KSFyJb/9+IY8ovuFZgMzIn1do+dfXAcxqlrY/tpB0KMVa7dwFZY77nkt/JuZnY2a59/
         qs7oTZefDpqbthS+ye5dqhBoA+nlV0O0hy4kKoNT0IMSBdzRXZW2PHSbyNuB8Ck8ryej
         p3tJyVnCMtZiYm7kKudUHxcH/RqfKz/CJ8AIBlyQD8FTF+X+q5jd+lglFMPR9JWM5JXJ
         m9e+5yjsXLoSnZgz4PShND3ZtB2J2jQSP4Lk9PkDe10pcYrweIDPGutns45n9ZOHceF0
         DCAA==
X-Forwarded-Encrypted: i=1; AJvYcCXa1s7A77D77lEnFnLZKR7LPBs1SBJoSYdN7WTmGf9u4EZpjR0oo9JWGu//2AFhPSzp+Kurv+LIul1GzaTq@lists.linux.dev
X-Gm-Message-State: AOJu0YwV63R3OGALyfah+9McrxVvLCwZzla5NFwS2tpWTaWkd045TNbB
	NEeQQJmsYb77V+iJqL2qXOq8Hn3dUPSlgHHkAeTw/bFXtnbttZK3TtgQcqrpGA==
X-Gm-Gg: ASbGncuVeoVJL6JMSOELWPp33RzZFAj6I1PW9Yo+8P2WyYFGGf6j2bB0cbuAPRFU41e
	zWLSlh7N+JJM4Ix3PW8W2VeQwQ/OEIxYUFa+CaznTkaek+WfHXq7AIlCY1cmTA6ddoDiT849oCX
	K9pCLjst+t4J1h2RzEF5rGWX/fhJoiYRizkRcEgTOvddbv8rHqLtWXwMiPigpRzfJv8xgTU4b67
	YtaZPPtNR+SmQOhp51DHUmdggI8S0JUmq33OSN/qmfbCDfE2PQdFw6t/AQc16r7mM24n/vvIr28
	5/Gd+BxbOfqqkhjQh/VKyOeTmDK1K88qh9BCupwNoa4mbKowKuq4TZcxyjYbbnBkOi9aZviLwXw
	w+yTXkQPokkvYGygvH7GoOWmqq5WxRtqBge7k3Gjt3O+iKFZ391LVZCMp1UDzBh0mCoi6EoZGAQ
	CQEbOUU3OAoH1r+VBO
X-Google-Smtp-Source: AGHT+IH1hxADsd8hbGacs6bAnl+ge+jB1/i4MRdWamXcaDZJxRiCUsmo8EYYhOzNpB0X6spl994QaQ==
X-Received: by 2002:a05:600c:a06:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-477870b3d70mr59496805e9.31.1763030750005;
        Thu, 13 Nov 2025 02:45:50 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm1444975e9.5.2025.11.13.02.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:45:49 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V3 3/6] staging: gpib: Change file path for uapi headers
Date: Thu, 13 Nov 2025 11:45:40 +0100
Message-ID: <20251113104543.5875-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113104543.5875-1-dpenkler@gmail.com>
References: <20251113104543.5875-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the gpib destaging process the gpib/uapi header files will be
moved to the standard kernel uapi directory include/uapi/linux

Change the include file path in the code for these files accordingly.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/include/gpibP.h      | 4 ++--
 drivers/staging/gpib/include/gpib_types.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 1b27f37e0ba0..e3938ada3e0d 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -12,8 +12,8 @@
 #include "gpib_types.h"
 #include "gpib_proto.h"
 #include "gpib_cmd.h"
-#include "gpib.h"
-#include "gpib_ioctl.h"
+#include <linux/gpib.h>
+#include <linux/gpib_ioctl.h>
 
 #include <linux/fs.h>
 #include <linux/interrupt.h>
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 998abb379749..5a0978ae27e7 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-#include "gpib.h"
+#include <linux/gpib.h>
 #include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
-- 
2.51.2

