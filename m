Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6C72F25;
	Fri,  4 Nov 2022 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667586868; bh=dqPxmpk2lRrqTMyE4Y1XgiMtSrvGZVXTYRp/XNXZUG0=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=oG/RqRCV3KKtN4i75U9DPhfdwOoR0qlsaUH9scAXWwHQ7bWi5bvvX/inOaYlBqxwy
	 l6R38LzMkwat/KpwQY8WnwTVnO2mJh1dRM6iIyBskpih8jrSk3JTFaVPgmnkq37fGN
	 84mrU/XwXGzyb94mNyKrQnYAGPWbUTw9nvf3BcJg=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Fri,  4 Nov 2022 19:34:28 +0100 (CET)
X-EA-Auth: 2wA6SyJoq1nkGP94UxiPhis28hdVp2Hp23h1JfhbWQPAQ6lMNIJEx5oJzJnZI6IdwKXzQmpmhhBQfrUy2VPYHb3ku+BqvG5Q
Date: Sat, 5 Nov 2022 00:04:21 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8723bs: struct iqk_matrix_regs_setting
 cleanup
Message-ID: <cover.1667586648.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The patch set proposes code cleanup and simplification changes for struct
iqk_matrix_regs_setting member variables. Resultant code is simpler and easier
to maintain.


Deepak R Varma (2):
  staging: rtl8723bs: Simplify underutilized 2D array to 1D array
  staging: rtl8723bs: Remove unused member variable

 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 18 +++++++++---------
 drivers/staging/rtl8723bs/hal/odm.h            |  3 +--
 2 files changed, 10 insertions(+), 11 deletions(-)

--
2.34.1



