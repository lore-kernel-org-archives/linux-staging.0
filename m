Received: from smtprelay.hostedemail.com (smtprelay0221.hostedemail.com [216.40.44.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E73FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 07:42:16 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave03.hostedemail.com (Postfix) with ESMTP id E2205180D0F96
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 18:43:17 +0000 (UTC)
Received: from omf02.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id B1AA818043DA1;
	Thu, 26 Aug 2021 18:43:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id 9E4991D42F9;
	Thu, 26 Aug 2021 18:43:09 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-scsi@vger.kernel.org,
	storagedev@microchip.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/5] vsprintf and uses: Add upper case output to %*ph extension
Date: Thu, 26 Aug 2021 11:43:00 -0700
Message-Id: <cover.1630003183.git.joe@perches.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=4.85
X-Stat-Signature: 5qo1ggz7qwszc1wst9d448dq13egb5nf
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 9E4991D42F9
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18tDOuVkOskG6mYbV8tAOcLCqBs2xKzHBg=
X-HE-Tag: 1630003389-741109

Several sysfs uses that could use %*ph are upper case hex output.
Add a flag to the short hex formatting routine in vsprintf to support them.
Add documentation too.

Joe Perches (5):
  vsprintf/Documentation: Add X to %*ph extension to output upper case hex
  scsi: aacraid: Use vsprintf %phNX extension
  scsi: hpsa: Use vsprintf %phNX extension
  scsi: smartpqi: Use vsprintf %phNX extension
  staging: r8188eu: Use vsprintf extension %phCX to format a copy_to_user string

 Documentation/core-api/printk-formats.rst    |  6 +++
 drivers/scsi/aacraid/linit.c                 |  7 +---
 drivers/scsi/hpsa.c                          |  8 +---
 drivers/scsi/smartpqi/smartpqi_init.c        |  8 +---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  9 ++---
 lib/vsprintf.c                               | 42 ++++++++++++--------
 6 files changed, 37 insertions(+), 43 deletions(-)

-- 
2.30.0

