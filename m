Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8770
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 20:40:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 390CA610A8;
	Thu, 12 Aug 2021 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628800841;
	bh=pOWEY6Ktdp1G7W+1ThMMk8U6CvERPSJjoDwDwD8AddM=;
	h=From:To:Cc:Subject:Date:From;
	b=alr8zDCrwIhpMD5GkS3UlyRFebHIL2K6RWJhHlD82FT046cufN7ZgBt3ommH/6Ay+
	 aWRFAt92K4shVGFNLY7/r/UqGCX+tn1CkhUeFq3VBvtNoq/bPgz8gI9y0jXn8cPC2s
	 GS/HHvVqHHeDNrsfUBeEWnrOodJiNJkLUsmsq4SpphGdXkk3O0oLPgP9G6bjlYdxLC
	 ukPsfe7NXVu72ZEtzxVN5TNeDjTNlqndYKUEfFc6Iownc/UyPNoWlNCm7cHrWBalH1
	 qj66G6niAXBjufoZKjtvluaI42egcir8reTklUU2dKmaKifVbTetEFviwuIoSleMK7
	 1jh34mL53G6uA==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] staging: r8188eu: Fix -Wuninitialized instances from clang
Date: Thu, 12 Aug 2021 13:40:24 -0700
Message-Id: <20210812204027.338872-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Commit 987219ad34a6 ("staging: r8188eu: remove lines from Makefile that
silence build warnings") exposed some instances of -Wuninitialized in
this driver. This series cleans them up. This passes my build tests with
GCC and clang against x86_64 allmodconfig.

Cheers,
Nathan

Nathan Chancellor (3):
  staging: r8188eu: Remove unused static inline functions in rtw_recv.h
  staging: r8188eu: Remove uninitialized use of ether_type in portctrl()
  staging: r8188eu: Reorganize error handling in rtw_drv_init()

 drivers/staging/r8188eu/core/rtw_recv.c    |  4 --
 drivers/staging/r8188eu/include/rtw_recv.h | 46 ----------------------
 drivers/staging/r8188eu/os_dep/usb_intf.c  | 20 +++++-----
 3 files changed, 10 insertions(+), 60 deletions(-)


base-commit: 626520f4ba27d92c8caaf2d1f70c4bca4ea3f9de
-- 
2.33.0.rc2

