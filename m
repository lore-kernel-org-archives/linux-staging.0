Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBFC175A6B
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 18:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775931680; cv=none; b=HP9i8JXuJeAJ/lb0WqlCOMremEFLZ4bCsLHMqkqT8HHI7KNyu9WIenZqlVeu1IdntR7HNGtFWZYLX27GEEnhssMNTPosqkmhqMbDXNSAuzqLUc38g4OgbGaK9unQvd4cmOWRPtzQCe6abRBbFMlwWvC+Zhnlb27bxk4jgks7fLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775931680; c=relaxed/simple;
	bh=A1iRjkm1KKZKizaqwpsevV1a/zeklVKSBq1nLSDjKJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cqMn9eZT4K2D+AJuSMmSiS4KhPG9acZ9rWQftyvMDeMini9uqKFCfgy3Vg346o+O6KV5QgBgCq+MRxlATuww8jStOJ5mEKuWUvb/0TlfmrpqK1fFsO+zpWRYsyKmMTlFe0Z1Iw+kNZjoyjOfQSKHQ54Y72jHyV89vwBOiFoJi08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao76kvPa; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao76kvPa"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1273349c56bso4134658c88.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 11:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775931678; x=1776536478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqrPr1FaYRhKQEWInixscQtNUjWWsyNu8DLckOP7xwk=;
        b=ao76kvPabSGvr6xXjadMl2GGS3jdCzvgaJWxKcleEf5El0XriwzMtBxoOR7gVL5tvo
         iAw49LtOTw4kDp0QaQvGc+A43gYurcbjERKDRr/nzRBUG2tfKA/W16NwL5QHJZfZfY8r
         Ydlk/y4zLgUJkyx1XpTujLbY/2FRseyScMUwLwRqgoGaZUz8pb+S714jhaetR0gaAAeX
         RhTBrVYMLODVUScrQSPUJ+oZEkIh9dICeuYFYmjEwOr3qImmB0z2ixeUzdEx/8dEh/mC
         QsCCaNwIKg6AYDvb3i+HpW2vQYsokvZMIqyVtLAuJRZPwUJm+7L9LjKjHVhQa2bXna55
         LUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775931678; x=1776536478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqrPr1FaYRhKQEWInixscQtNUjWWsyNu8DLckOP7xwk=;
        b=EHLeWZkd+fgEO5u8z/k3/OfifAVbPXvgbXIomwJ9v7LaNkcTSy2Dx+8+U5BlSPACXP
         uCWnBZRzKTBhONqdtuq9n/FVm7yRFn37sIAg/gUMDCA2pv3l04GGfJ78KS/RdzNyyIcz
         XDAKaJ6AOigyeLBxKpNOsvDfqJbTGX1xLU8bMdrgIqGxB3K2LR+2tq1wapez7jZbD8T5
         fn3itZGMFsZo3V2rxBz8b7HXZ2Q+JvHOloOTKe66QawhCfGWyraiNqMHVduArpfZh+YM
         zSKmhP+PwAoFwSsqlCm0Z6aIKb+9Je5w1hsBwKSRs+fFwWRvNjpOORa9b+nEjXc9yMuY
         vQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCX74i2nxKxZvxOflYiQvfzYhVQ44cg9F9AbLiHwrFiEpG++WYnE6Pse82ljC0sOd8BPWYa7h5gNIm9yoIio@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5h4q3E0qkR7JFur2/NUiZO0JvuijVTe4sRf0kqNEVaLdzwxlJ
	wXmBaMBzYghBJhK7ba6D5rdQfD3LtwXI9gQ2rgUZhIcqzb0Fnmb6pQBB
X-Gm-Gg: AeBDiesFmt0VrrANBMCcT+k0hsn7ZiQFyo70JE5/3WgHRyeDYaJmnt/w8P3Q9xa+tGp
	oWiZkHZvfItdwR9OtBfRx0lMcQDZqPX15cdUHSXoybgYIytzfCudfkaPE6pJaDxHmYCr02HWe2h
	J/bqxumV9WxEf1x5U6jXT0n5IzBKEiFmhEE9x963C6KHdn316pekGdWhDR+wzeOPOJUSIk9dXkf
	l7XbVDoneLYYHDhGmh5+rSzFk3kD+diiqMahdXmQ/z8iRlp8PiukC1dijL/jYtjy4dNcEPCbjN/
	ETtW5YB/CLwgsfKqZ4s2lm8eEhsquwjHgsJ8EBE3FO8h/5GUS5HHzW3sLU61DJGq1hB+ADkomoT
	Cjz5TS7d+uFCNT9J24Ll4Z+/GsS2GKqheoUrJKNP8lPw/lJD/qacGcMDafdPcUjNXqzsEZP1pHh
	GA7cj/1XSUU2vJKyQgS0BVQ/ou+zgjWcptS2F7rtQ91RZGFQeIa20Jdjk=
X-Received: by 2002:a05:7022:fd01:b0:12c:8b9:7200 with SMTP id a92af1059eb24-12c34eeca8amr4974556c88.17.1775931678009;
        Sat, 11 Apr 2026 11:21:18 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562ac344csm9455531eec.25.2026.04.11.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:21:17 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] greybus: audio: extract topology size retrieval into a helper
Date: Sat, 11 Apr 2026 18:20:55 +0000
Message-Id: <20260411182055.24413-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The topology retrieval code currently mixes the size query with
allocation and data fetch in a single function.

Extract the size query into a helper to make the control flow clearer.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..d95f8b7d4ce2 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,21 +8,33 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
+static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+					 u16 *size)
+{
+	struct gb_audio_get_topology_size_response size_resp;
+	int ret;
+
+	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
+				NULL, 0, &size_resp, sizeof(size_resp));
+	if (ret)
+		return ret;
+
+	*size = le16_to_cpu(size_resp.size);
+	return 0;
+}
+
 /* TODO: Split into separate calls */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology)
 {
-	struct gb_audio_get_topology_size_response size_resp;
 	struct gb_audio_topology *topo;
 	u16 size;
 	int ret;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+	ret = gb_audio_gb_get_topology_size(connection, &size);
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
 	if (size < sizeof(*topo))
 		return -ENODATA;
 
-- 
2.34.1

