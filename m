Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614501;
	b=oWMAwTof3h4GZonx91GdHu6DIaLsdue5qiL3TGZcNKkNcM/kvHl5ZDHruvfGYTBlJwtE
	 pg2DjEC7Fjao9DP6fXvo+rIQHdNdKoS8GO9GX3EiF+qEgBZhkJQpGjH/xJbpv6I9JAACD
	 MLxXYE+6jBzSEVcOGJXma8hTgIGlMaXrvsZLeeBcCFJ0pVKS6iGXIhTFFS/ymXm6ZK/vY
	 4WCk+MQg08GztHwjfNCKjCeHyol4cVsnDEJM1qWgMtZeGc2U+IaBZfTpVkXTKjfK+Uw/3
	 I8F7TCjh4UqE4p8O/xeuQRB3dg3sZX9V0JIb8oez0SVqSCPpLf1oUIkgXUgZjAGo0uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zRD0mPqiIs7KB0/9JW36eAF9YH1/o2iif3vtRCsEuiI=;
	b=gS2UExdgUV3LlOwHiVUzEP8Y6kNlftGj9PM1ak5Rh2jdiA6YvPOCxmdWjiYuMxkjhlGo
	 i0QqTwrQYOqcWzCxKBas85nD15dW1FVVe0TA0fakUNM3dGE2XDS/l1BD46vq9KniRb3Pf
	 tT/D1mpBPeZBGyyhgaIv+5YuXhw4IzniOJqOnQjgvCuoBPIBFz99hcMTqhbWl8RMGvUtu
	 rVUKumE5b2aeVMS6HupDWhJYd8d3/vABnf9g03yrea/2iRHZ97DDeqJMHFXs4UBjKWUPm
	 N2aEMnUOQ6Vz9FGTzJvDS+fk+soAQVAk+gShbXWZJzg0C7+HstzwTZ51Vap44EnmttQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcTp14nb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D48606A327
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 10:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D48606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcTp14nb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21151285e9.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 02:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614500; x=1794219300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRD0mPqiIs7KB0/9JW36eAF9YH1/o2iif3vtRCsEuiI=;
        b=dcTp14nbPKx7Y4FJe2JzQYhyn6mQ03HNZDJbx4wjU2LYd0HizzV8Iy0oYJLEE+9Apy
         I7CiNuh9+GWR+5BtY2DqarFbxbXdD442rvbQ8sXO/RuBbjFVgHPt4n2qyecBNjA9g9Sl
         gXgGWxmco5WEdy7HRc5XoZ6oUe7krEGXfkJ2amB2VK3X2qArlzekqtY9TSJWwVP+gm+8
         8VJnxwrZusXoVt09ksf27OIiaBOKKGDcFU5vUkZK7jr4MduUmBmlBS5SPcB81X+ooW/P
         sNMEuHG80xTIySsnEHVCrWng5Uft8bLus6Td1xN9j0A7TYtA1Hg5afd0mDQce5q/5pEC
         ASlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614500; x=1794219300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRD0mPqiIs7KB0/9JW36eAF9YH1/o2iif3vtRCsEuiI=;
        b=a2ExEuARQ1FHRfru7ne3R58yxS6Pq+kCXJ7k7aEWmimV4F9nV4jhMypiOs+RgSMAod
         E6y0nhXWg+ANCotxqL418NW0JEyrA6MaxZHyPxcAOgwkjSVtjaF/eezjM5HFFgvU1vR+
         ZZKXTmteLa5cKCGNwdo4mTppIZGFxgQGyuH0SrmqS6BGvz7rF8cVAVFTuVtTIRc5MuVy
         jQhEMGYVFuY+IDu8cv4KzDzGSPusT5ec8WuPXIxJhjFNQPUKeI3MEQK6zQtEDggdjYFT
         Q62LEmuLDy/wrYgs6eVqNIZMuAa948riIHO4NaRDnmrvYkYn60m/5wAV7pSyVbbpY8uF
         ZyxA==
X-Forwarded-Encrypted: i=1; AKwUvBxeylLedKIlQe+za5PsulrzylwRRxbXW6k73e4HA3w0tbQByZ6nt5Fl6IF5M5dgqvf/BSEYH0h6rwf6nutV@lists.linux.dev
X-Gm-Message-State: AFq9FYIMMBAh7FpCwTHPkGTPGlugupdcu+Pbam2oPmF6NzTT7EYIcCco
	0FjLZ9O/xDkBWenM0o9ZqYKeMEOtRz+EcV3WET3gtfqmTP/ubWvm0B0V
X-Gm-Gg: AYBFou05070iyS0KTXXD4+REwzDIzxtahpd2lRetvPpwgRNS5whcqIlP7sL4spIu3/a
	QvkEKXS7szmou7sZaoKiRwHj/HCpdfhP1ebj2PMZWjjpM+Hcbs22oy7jQKPQyqISZNz5ehUnUNe
	SR0Zd39Ex3/LZUIFhbvVdw9eI4aePiaUke07r1WY0wZp8feDlCt94KDzEpqPchFsOvJt8gMQ1+2
	Tit6LdcBRYd4/cE/lhJTZw8pS8dvGdsx7yVmXa/pmb2kR/TUvVG7n4ARUU8VW9vMaqR6s4Gl/D1
	a/th165jYun7ZszcsqjZft+FBHqz+DNFEWd58hQWyzKQDyfKQH+1PQZCmo0KjjKKdf329BlBInf
	iUTLaK/sZ5YEHbXl5DLn9sAjiqd3pf05Z9B5jncTLLSdWQc9zWnIsUtpzivdMz8XNMfnkD+1Y09
	gMIR5v/TbYrgx3BCzjL2su2unvniDgmYMmwElB7MzuhASNqVNkCTLjKt7mlZiu4+VcCmGX7MkFC
	4iAlRlmmcaVzACRpOOplovuMYc87JvUQ0xYjbfLwgm3K3OgqRu7bF5H8cnceP/yPib0rRcI6fbC
	Roinzf3NJMewVXuZKzgzqYgLNQPllsrtx3mGpkWMa3VT8lOf0Gmvhcc7Ck2SX3E6BKDQgDk4pa5
	jpkskdLdvy5JD8OX5uwKN85P1NoaOJWkIHiJWwP8APBBTc0KO9Q9SdJNz3WIJRUrrFQ==
X-Received: by 2002:a05:600c:4e08:b0:4a1:ce33:1536 with SMTP id 5b1f17b1804b1-4ac1719112emr211409145e9.9.1793614499570;
        Mon, 02 Nov 2026 02:14:59 -0800 (PST)
Received: from maria-VMware-Virtual-Platform ([154.80.101.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm263888645e9.5.2026.11.02.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:14:59 -0800 (PST)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH v2] staging: most: dim2: fix non-kernel-doc comment in errors.h
Date: Mon,  2 Nov 2026 15:02:03 +0500
Message-ID: <20261102101433.4618-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The comment above enum dim_errors_t starts with "/**" but it is not in
kernel-doc format, which scripts/kernel-doc -none reports as a warning.
Use a regular comment instead.

Found using scripts/kernel-doc -none

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
Changes in v2:
	- Use a single line comment, as suggested by Julia Lawall.
	- Converting it to kernel-doc was tried, but it produced
	  warnings for ever enum value and its inline comments, so a regular 
	  comment is used. 


 drivers/staging/most/dim2/errors.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/errors.h b/drivers/staging/most/dim2/errors.h
index d707daaac3b6..966b0c731921 100644
--- a/drivers/staging/most/dim2/errors.h
+++ b/drivers/staging/most/dim2/errors.h
@@ -9,9 +9,7 @@
 #ifndef _MOST_DIM_ERRORS_H
 #define _MOST_DIM_ERRORS_H
 
-/**
- * MOST DIM errors.
- */
+/* MOST DIM errors. */
 enum dim_errors_t {
 	/** Not an error */
 	DIM_NO_ERROR = 0,
-- 
2.53.0

