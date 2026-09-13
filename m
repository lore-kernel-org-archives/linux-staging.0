Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8693750BC
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789286671; cv=none; b=EEus8fBlGHhUYrXACV2FY2u65tKPFMZ9KqH54Z+rBaammM/e2YH/6EqYkHvpGmbYC3l2ShsDdWc48FF0r5kYc7Su48ws/hMtCQLbZQ+ubZC7M4POxJTKfJNRpWRH3VBbQMwBExtUeJllTGh6ljiWLirn88zw023PpQJinWPHslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789286671; c=relaxed/simple;
	bh=juTmC3CFhfPPkaIWjFcKlVbWx5pBfvrZZD7LXlAITdo=;
	h=To:Date:Subject:Cc:Message-Id:From:Mime-Version; b=ing6WGZO8U66VhIQFReYoNdvOmtSb/h93o/t/KpfHCIvieIs/DoGD5ftevAs7WlERnK1ZspQ/9WQBj5BUdLyYpscjApHteiadRwkgmfzjl9Qb5kRwlwYgEwqLDJzChfgNGqeXHzAoJR3aB344wc9vpZLfkv08nc5KQ0J/x3SMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=EB8m0eVR; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="EB8m0eVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo2; bh=q4IUphqETpmEIg6OGGAcnnMQBzMLeTFlCH+drdANwwg=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=EB8m0eVRykkiVUVWZsXdFsfGG5Vsg+ckEQoQ8eEvDPIkCCGA1zZB7ubt8N05KUNvqOQDlAs2sXE4
        WiaiDkTo9a5AMJ1pxApyRE5kjxbOPF6qe8zIDBIaS1+9RCSKpTC5Wj7KUBrDn3UbQjABdatvftB/
        4sIAHpLBQo2RYUw6ub/nAZrlWsmVY8PjRR+vkuihGqYS9UZXNlg/v2MwDsvvZpWZ9h4ndi4vSpQD
        pfkbT9wLExM96gXcsltv7GBhInCwLF6pZMt8bxCghn+F1i5cN9quKnpqAQiL/iyX4wczx//Xu4TZ
        SvnCYnT+OkPjzvmF75Xk0vvAJYrP4rd3zBP5fg==
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.26:10551297_-1:10551297:Sendinblue
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Date: Sun, 13 Sep 2026 08:03:05 +0000
Subject: [PATCH] staging: rtl8723bs: remove unused EF2Byte and EF4Byte definitions
Cc: <linux-staging@lists.linux.dev>,  <linux-kernel@vger.kernel.org>,  "Dipesh Chaudhary" <me@dipeshchaudhary.in>
Message-Id: <20260913080305.10982-1-me@dipeshchaudhary.in>
Origin-messageId: <20260913080305.10982-1-me@dipeshchaudhary.in>
From: "Dipesh Chaudhary" <me@dipeshchaudhary.in>
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDkxMzA4MDMwNS4xMDk4Mi0xLW1lQGRpcGVzaGNoYXVkaGFyeS5pbj5%2BZ3ouZC5zZW5kZXItc2liLmNvbQ%3D%3D
X-sib-id: qQ6W8CiJib9tx984zV-Cz3H2Ecu9QIpP_IctCQ2UKde1G-oXUl6YBWpjAigxIpk7bd4UBCq7u-h3kZkIRWShz82pJuba9MZlUhWGEwj7aK3c-_PJd5W7FIS66cVaSRKs-8maWVYOu-A7NlLBWJkCWAQSkIO3xFb90Y06JAPHNJgifyc8xQ9mq3K9gXs
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.5


The EF2Byte and EF4Byte macros are defined as le16_to_cpu and
le32_to_cpu respectively in basic_types.h, but are never referenced
anywhere in this driver or the rest of the kernel tree. Remove these
unused definitions to clean up dead code as noted in the driver's
TODO file.

Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/stag=
ing/rtl8723bs/include/basic_types.h
index aaa1e60f4..b4dde1fb4 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -29,8 +29,6 @@
 /*  Byte Swapping routine. */
 /*  */
 #define EF1Byte	(u8)
-#define EF2Byte		le16_to_cpu
-#define EF4Byte	le32_to_cpu
=20
 /* Convert little data endian to host ordering */
 #define EF1BYTE(_val)		\
--=20
2.39.5



