Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9D137C;
	Mon, 17 Oct 2022 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666014631; bh=MzgpgvOPXYYJ9uSTLDb04aRoEwgOCBfg49mTGRCTv8I=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=Pt1dXwphxmDDCZUJDL11IORUQydSiKczFZMAmmwDYJK5ZG3H57MWTF1fidnCOyacH
	 Qk2GM0ehYBcdBe6fwUEbIVQf4inuuEeaA9tIPVxmaMftDyYhmi/IUta/aulitvA8+/
	 hXPOZ+/k8ser+cYeZ9YblRNveHTZB934/r3ujnrM=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Mon, 17 Oct 2022 15:50:31 +0200 (CEST)
X-EA-Auth: HE7Tpv6JQEWvZeHv9+YdRxBEHahqvDhatAHw+8AH9EVhBZQho4m/Ar1QBYKSPJRb36xFdr31nAHmMFKHNLCYGxJ6+4CCscH8
Date: Mon, 17 Oct 2022 18:50:57 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: [PATCH 0/4] staging: r8188eu: trivial code cleanup patches
Message-ID: <cover.1666011479.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Address different kinds of checkpatch complains for the staging/r8188eu module.
The patches are required to be applied in sequence.


Deepak R Varma (4):
  staging: r8188eu: use Linux kernel variable naming convention
  staging: r8188eu: reformat long computation lines
  staging: r8188eu: remove {} for single statement blocks
  staging: r8188eu: use htons macro instead of __constant_htons

 drivers/staging/r8188eu/core/rtw_br_ext.c | 125 +++++++++++-----------
 1 file changed, 65 insertions(+), 60 deletions(-)

--
2.30.2



