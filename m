Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397EA43848D
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444518; cv=none; b=SeDEqaxb4smR+r8+qgfkJ/VdENzR8pZQCsuZ64JnuF0RnNrCVOgtUM3NHFlNzqhsyyc21PeMduu+YEhHeXBuhpj0LwGK3u8Kh7dph7y+W6KBwcYNtGp+T1jkRsDSweGI1oTXErUBn1uxsCr0vFCPh720BsSQg9ES9cRjodxWtIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444518; c=relaxed/simple;
	bh=Gn7l+3DA/5g6bpnoQabLeXJfsmyjkls8YWGw+XYy35k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FEOZSLcjYcE3tHruIeqkcRTVrGew6tBdODADUZ3QKMvC0L8PL2s4KXMjK4lVsGfPCB5+3GUc9w9BR4A1swCfPG5DdM0097CD9C/sAKpwNZgsJN2VQi/eaajcJ8ajrKT+/2baoiMhzqay07CQZRrnwhe+w1XMr7yRulZH+T27wFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=d6iMN0YB; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="d6iMN0YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=G9
	baJvMDPKx06ypJiH+GSj5zHafG38PLzKBWjhMgIjQ=; b=d6iMN0YBMF3mew4+BL
	4AMUOZ32HcPZpVazcbLjq5v6WqK9FyEpeiYCayRmdtfVMvPIVuUwCNDEe+eqIGKE
	DH9rkufkaeo/iFkPz86vlWJhRM6m9GF26r3BxVNESCUR/2qNm6hZ6QDTCOI+k/vh
	j0qkljBSbU+d/RasK5lbuqvW0=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz8cMNE1qRiRvCw--.53372S2;
	Wed, 08 Jul 2026 01:14:58 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v2 0/5] staging: rtl8723bs: clean up coding style in rtw_mlme_ext
Date: Wed,  8 Jul 2026 01:14:45 +0800
Message-Id: <20260707171450.70997-1-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz8cMNE1qRiRvCw--.53372S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jr1fKFWfZw15ZrW7tF18Zrb_yoW8JF1fpa
	yrG3Wayw48tF1a93s2yrsrJr4Fyw4xCayDGr1xtw1rKFy5ZFyfXr92kryYv343XrZ3J3Wj
	vFZ5K3Z5W3WjkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zirgAsUUUUU=
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBqhL+BmpNNBLvzAAA3i

This patch series splits the original v1 patch into a 5-part series
to properly isolate different types of coding style cleanups, as
requested during the v1 review.

To keep each patch strictly focused on a single logical change:
1. Patch 1 fixes the operator spacing warnings.
2. Patch 2 resolves the line length and alignment issues that were
   consequently introduced or exposed by the spacing fixes in Patch 1.
3. Patches 3, 4, and 5 clean up other style issues (nested assignments,
   parentheses, boolean checks) within the same affected code blocks.

By structuring the series this way, each patch achieves 100% historical
purity without interfering with unrelated parts of the file.

Changes in v2:
- Split the omnibus v1 patch into 5 dedicated, standalone patches.

Jinke Wu (5):
  staging: rtl8723bs: fix operator spacing in rtw_mlme_ext
  staging: rtl8723bs: fix line length and alignment in rtw_mlme_ext
  staging: rtl8723bs: split nested assignment in OnAssocRsp
  staging: rtl8723bs: remove unnecessary parentheses in issue_asocrsp
  staging: rtl8723bs: simplify boolean comparison in send_beacon

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 227 ++++++++++--------
 1 file changed, 126 insertions(+), 101 deletions(-)

-- 
2.34.1

