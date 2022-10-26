Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F7A28;
	Wed, 26 Oct 2022 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666780518; bh=CkgEmYMxD29PBWn79CaVb5kHVMygiKiP3es92Nhi7G4=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=IUMJ9OPXIxcVfEhq0wlj3/GG/3fLt5rQglxV/+hYIjDRNyLSykbeagy6SoueDJFJR
	 q8vq9OBDerG2nIB00mZhmhsXrKSyvEfrauxwRE9zEvSVqOyFMSOKydEXiLL6V9HJSv
	 QK/TdFovR3WgQNP79nqoCAfYRqGvkoJT2kVJ3yeU=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Wed, 26 Oct 2022 12:35:18 +0200 (CEST)
X-EA-Auth: mHdDbY5qqCmgEzKCFIMRuZDAPpX5m4qL514Kcl9/eEshuHcNJYNG/6XRE55NbdQbMTUezGV/ge/YfFB8u8Bc2rkvBGvwUTxp
Date: Wed, 26 Oct 2022 08:56:41 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8192u: unused code cleanup
Message-ID: <cover.1666754500.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove code that is unnecessary or unused.

Deepak R Varma (2):
  staging: rtl8192u: remove unnecessary function implementation
  staging: rtl8192u: remove unused macro definition

 drivers/staging/rtl8192u/ieee80211/ieee80211.h            | 5 -----
 drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c | 6 ------
 drivers/staging/rtl8192u/ieee80211/ieee80211_module.c     | 3 ---
 3 files changed, 14 deletions(-)

--
2.30.2



