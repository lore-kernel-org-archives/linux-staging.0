Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18941CB38
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523395; cv=none; b=g4CyaoZuDgvfeHt/7FJEGQjnf+TEdw0+KvJ3pYcpSd/VeWW+3v7glIFE9F7xgWoCMvhhUjypTmAPYO/Ag9HVQNyoF8Lczzw/0vxDOXd8fvl/7NRNhNfhHLcyXft+uTHSFc4aXXTNo0Q6xIeKQD0YLpDSz6Yc0vvkb+uLamk8Iy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523395; c=relaxed/simple;
	bh=grLSsWwLAWwyfZ8Zj7/oS0arJkTNs2P/iEJaWCaXWVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OcbIq2fOONoDPoKn4QRuddQ4RDqhlgEsIBVv1bxi6l2uCCYQ2zEkZcnYBpVTxYP0OVKT21VMxpaA6QLZ4PVoTfVIcwID5t4WdnO7vYJySgXE+sTTQ7NLG53ctd9+rFtsLiZpDqyoODArv97fJim6gUr54hR1SNA0dxSTMVtLoi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=FITXST+B; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="FITXST+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n5
	ilyQ+zriBpCyj1DhwkU8eOYCbfwSC2AzqA21ZQE7E=; b=FITXST+BZ8iwk/gkGF
	b6+/xIbmQ1lYnayuGu0I9ZIAGorR6qA0CemebNzK5WC8wP1lXPDZjOeSGu/WpP/F
	ci6AoN4/KLcYTYw1/7RQcdLRPnxw7Gr5yN4zKw0dL1EaIXOyNFZCN8IbFNl04w3v
	8Mpx+XMYnbGi7naCCBQA9aorI=
Received: from jax-virtual-machine.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDnz2MqaE5qmk9uCg--.53577S2;
	Wed, 08 Jul 2026 23:09:36 +0800 (CST)
From: Jinke Wu <coolbeaner@126.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	coolbeaner@126.com
Subject: [PATCH v3 0/5] staging: rtl8723bs: clean up coding style in rtw_mlme_ext
Date: Wed,  8 Jul 2026 23:09:23 +0800
Message-Id: <20260708150928.74065-1-coolbeaner@126.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PykvCgDnz2MqaE5qmk9uCg--.53577S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1xtr47GF4fur4rAFWfGrg_yoW8Xrykpa
	yrGanIyw48tF1fua92yrs7Jr4Fyw1xCayDGr17twnYqFy5ZFySqryIkrWY9asxXrZ3JF1j
	vFs5K3Z5W3WUCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziYFAZUUUUU=
X-CM-SenderInfo: hfrrzuphdqv2a6rslhhfrp/xtbBlhBUW2pOaDCZQwAA3v

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

Changes in v3:
- Rebase the patch series onto the latest staging-testing branch to resolve
  the merge issue. No code changes.

Changes in v2:
- Split the omnibus v1 patch into 5 dedicated, standalone patches.

Changes in v1:
- Initial submission containing multiple coding style cleanups in
  one patch.

Jinke Wu (5):
  staging: rtl8723bs: fix operator spacing in rtw_mlme_ext
  staging: rtl8723bs: fix line length and alignment in rtw_mlme_ext
  staging: rtl8723bs: split nested assignment in OnAssocRsp
  staging: rtl8723bs: remove unnecessary parentheses in issue_asocrsp
  staging: rtl8723bs: simplify boolean comparison in send_beacon

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 225 ++++++++++--------
 1 file changed, 125 insertions(+), 100 deletions(-)

-- 
2.34.1

