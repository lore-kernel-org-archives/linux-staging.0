Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B95027281D
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918812; cv=none; b=RR6LsMTk8PzJ6fmEoQsT7aFPyXTOt2xb+oNYnma+hs20xkyWaI2AMGuN3tBazNKKm8M/rx4cMDMzuedG3lSzw3YsvGTu4CIACeVy7+ueqQpigPRyyHhH9qJ6vzJMyUkh70GHu+kNS2BdziGdwii734f2bNt57k0q5KSebLFnyMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918812; c=relaxed/simple;
	bh=Sae0b53RDZivkY3LeLMbIAc0T7BB4OuamCGwTSjl1W8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BIxFT4pA/j7R7tqlzfYKiwsc0ZgoQbY9Tm7PU0MGLzR/GL8dVKXuysvKhazrAN+FabbE9xZvS1df1MJmfFut8M3UKFFMVJRlDz9jWeqwjDrtdKSf9JCJcvbnSmNKJs4/B0I1Gshotl/AkdeSuM2jkJLNFysDeE9DfkLFAmfkbg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oClOBmaK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oClOBmaK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so21012615ad.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775918809; x=1776523609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4BX+9CjC8V+lo6sc2a3UGFLrfgqmtBafb7VDPp+26s=;
        b=oClOBmaKgp8gPOvfkTzfLa+pQS7+0PEeTJn1ps9AojLs5kf2ZgI7PS7RySDz4BIIUw
         R4BEOtxtGTE2SAiCEzJJej+jPjmFxBLm9Um0TcJduSTf/V5K4Z1dmZZL8TpZyHsQ9byG
         pzKW9UVuQrcIClCrV6y5Ru59oytUtv9cd7J0Yes1xjRBLS3bQCLigtmylFx1wBl1Gw4+
         bkdXQmC1UAqGqVB35kKbzUpalXrT/9UG56bjLpu7pNSnZf0R57s53m+5s/G9BOlV51Tk
         2nsW4zT1a+KVFng7w80nMtIvImi/92ZJ1uO5ygcfkEFcsg4x7Pa096sTe3WDRREwdfEG
         Drtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775918809; x=1776523609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4BX+9CjC8V+lo6sc2a3UGFLrfgqmtBafb7VDPp+26s=;
        b=TAXP6vyrHJfq9fLjW/O+AaoKsbqg1yRZKVfwcaEIZKjKgVw0ecpjy17ugXLgj1VFT9
         NqpqRQheyLodt6bXwR1DWEpJpj2nEdCzNZC+KMlNhH7W+RiMrwYVYaKGjb0NCA3aW+Ta
         IPWSZloGvSNX8Hyyb09w+kjovnVeURFJP527h0jZQrpudClS/X5d4fu8CbCrSUAhaVcw
         INlren3d9zJzMhCYVTfP0V8wEz3bSMkSJSN9NHoqdkbBgQZpyB6HZZucX5ce4jhCw/0c
         xxMpD/nfuIHBXDS+oR646H1RKvjIlyki5p2E9ngz6e8JF2LFL4iLeS5yAeMFDScGczMf
         aeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNjFKTW+KEWuGpAscbSfHmCofIJw/4lx5W0Bfd9EE/fHYuUPeqkLDCDdUl+YwksrZvqOhcwru5ur7QJ2pt@lists.linux.dev
X-Gm-Message-State: AOJu0YxubJL3lQ7gup+r4Zp6ELOAGnsa2mLM1JfNEWmluEyCOiQiw+/k
	lqFHsVe7icfXrmw9c3tlPpIHogKP4LV+aINJO1LHaFsl4vuI1GKH361B
X-Gm-Gg: AeBDiesb93HzW6m8m6c7hpRvsQi5nMknBh9wVgTW0lWcctLXQs+xz5aSuIYRlmWm4BY
	ixFQglLq01ukGSyjrvL3HQWlzM/jklfS5aPC7oUTSKPDlwGZ36gnlqO5zjPc7GJxenQbclKLmpP
	BArajZTaYjOvgWX0/ZSTV2je1R+A9p0NrduuIIrpPKG+G2Q8aQ8gx/Ca7+gOo8X49wErUrjAzNg
	e7UUuExjj95oQkC2hVz7wilippWnj5Z02fLKOeK0jb7QWWWWVebyUXhqK1XG2DtFmBzDSsZ2Jht
	GThQjfnNkhe6VxdlbXoHzvWbiG+ejnOU6RHhLFi7RtF2QyvbvC+ze9Zbk5BKHMZAZbypwLgOPyH
	0iaYSFvn6sKLHIaveeKpIlsrxVn0XIKK555KyCGmRwm5+S7oYOG8QiiLjurLY6W6ZcQgMrsp8FF
	GNs1v+AeokxAyfomu8vuzd9q9ongQ0UHd0dRc3YvBOooQQSs/IdqJiRbvb6zLk3TTwYtqXy9O5T
	C0eqSr4Z8KDYHGOPt8C75A=
X-Received: by 2002:a17:903:704:b0:2b2:ae0c:ad0d with SMTP id d9443c01a7336-2b2d591b960mr51851085ad.5.1775918809394;
        Sat, 11 Apr 2026 07:46:49 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.113.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb742sm63314235ad.27.2026.04.11.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:46:48 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH v2] staging: nvec: Fix block comment formatting
Date: Sat, 11 Apr 2026 20:01:12 +0530
Message-ID: <20260411144326.3366-2-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place the closing */ of block comments on a separate line
to follow the coding style.

No functional changes.

changes in v2:
-Fixed trailing whitespaces issues.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..4799510d2d12 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range.
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

