Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB0723D4
	for <linux-staging@lists.linux.dev>; Thu, 22 Sep 2022 08:08:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=momi.ca; s=key1;
	t=1663833592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XbvKAdtcmW4XCdEMoBcO9b7szK/Fh0wTG+QKWKgbeXI=;
	b=iVLD2H6lYDqJ6qfRGev8DClt+tffgmekn5XH177loNzsYDdQQ92O841yeV8Idx0BwYZvTj
	vpOViyvyeBV/GM2UzoLIJ+wAx1aJT2jJT9dfF7TI8z7tZfKIr56sHIU2/L0EkLNIt+0AWv
	gYxhOqHLiYm0NHUmfw/GGVSiCYqy0t1WmSmGKimcG7MT+54Z9sEmfmcoKTv/34M6rmSfuN
	8EJyz/MkOXAZ3Gwo53eM8lU6TVIDrslwZ13/2Dgd4CXdB7iJ6drmV9RtaNIYkOhs5Kcb29
	vhy/oMcJb/SGQCXiHLuX/TGkmlRQ6zH9RFJa8a9LNkRpWF90fgGoVrl5536odg==
From: Anjandev Momi <anjan@momi.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Anjandev Momi <anjan@momi.ca>
Subject: [PATCH 0/4 v2] Staging: rtl8192e: fix coding style issues
Date: Thu, 22 Sep 2022 03:59:19 -0400
Message-Id: <20220922075922.20523-1-anjan@momi.ca>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: momi.ca

This patch series fixes various checkpatch.pl issues: removes unnecessary
parentheses, removes multiple blank lines, aligns multiple line function calls
to open paranthesis, and adds a blank line after function declaration.

Anjandev Momi (4):
  Staging: rtl8192e: remove unnecessary parentheses
  Staging: rtl8192e: remove multiple blank lines
  Staging: rtl8192e: make alignment match open parenthesis
  Staging: rtl8192e: add blank line after function declaration

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.36.2

