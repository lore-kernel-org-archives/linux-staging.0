Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9123209
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667757254; bh=+YpV4K0Qx3G5hgqrE/gyL8EiAycq1OSpWbGx90RSfOA=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=bfmHtdUlwLH9/fDOoioVlkBc/FBsq0wWlvK9nbaiYpmPzuK49UNkUN3vq2AUCJNcx
	 XrOObHF8eMv/PoX+zQ/lbeEPbRq0Repb6F8ZbGbcqxB9obTmA0FOUzGJzWL+K9XIJz
	 +ZZTtMM9iOEpMa7j/rfJ1BFuvy7EV+Qxva4t4SFo=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sun,  6 Nov 2022 18:54:14 +0100 (CET)
X-EA-Auth: H9GvGZlEnTujI3iKV7ccXlyHipKEAXZxpWcUvtv1TdY8Rknx9nI+/dv+53zizp0lisVP3vi/Rv5ABwcy3cqvQtFwwd1akCyg
Date: Sun, 6 Nov 2022 23:24:01 +0530
From: Deepak R Varma <drv@mailo.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: r8188eu: casting simplified
Message-ID: <cover.1667755987.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Patch set proposes variable casting simplifications. Change improves code
readability and appears more maintainable.

Changes in v2:
   1. Patch set introduced.
      Changes associated with pointer casting and variable casting are
      split into separate patches. Hence the patch set.
      Suggested by gregkh@linuxfoundation.org


Deepak R Varma (2):
  staging: r8188eu: simplify complex pointer casting
  staging: r8188eu: remove unnecessary casting

 drivers/staging/r8188eu/core/rtw_br_ext.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

--
2.34.1



