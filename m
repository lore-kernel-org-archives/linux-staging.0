Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3401833ED;
	Mon, 31 Oct 2022 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667238914; bh=W1cVkV3qn3Pg2/HJ80BRN4V9ycnBObxFgx7ZbvxxI20=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=YQm5J/smB2pHkI+WIASMCbAve6zPtBqFpZuF5iHwIjZbcP0eKvCT8FgEhF1WElD4/
	 u4BMDLQPCYUG0SANBHnsubZ5NTBRtT8T8SzqpkYKDEvQXTNGsinWGGu2efnN8CeCki
	 /PElmdDoR3aAdu4MHdtDptTUkB7WdRqJaOTDrYMo=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via [213.182.55.206]
	Mon, 31 Oct 2022 18:55:14 +0100 (CET)
X-EA-Auth: p3LF/zqOYKvJZGpBzZ/5JwgezmRpgKmoLiBSzVGEiUono7kTpDRrdYrQ0kPJ3AOSTCkNrWe0eDdRM/X98akJkz02DL61eXrX
Date: Mon, 31 Oct 2022 23:25:14 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: rtl8192u: unused code cleanup
Message-ID: <cover.1667237959.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary or unused code.

Changes in v2:
   Patch1:
      1. Revise patch log to explain impact of the patch
         Suggested by gregkh@linuxfoundation.org
   Patch2:
      1. Review other similar macro defines and clean those up as well.
         Suggested by gregkh@linuxfoundation.org
      2. Revise patch log to explain impact of the patch
         Suggested by julia.lawall@inria.fr

Deepak R Varma (2):
  staging: rtl8192u: remove unnecessary function implementation
  staging: rtl8192u: remove redundant macro definition

 .../staging/rtl8192u/ieee80211/ieee80211.h    | 67 -------------------
 .../rtl8192u/ieee80211/ieee80211_crypt_tkip.c |  6 --
 .../rtl8192u/ieee80211/ieee80211_module.c     |  3 -
 3 files changed, 76 deletions(-)

--
2.30.2



