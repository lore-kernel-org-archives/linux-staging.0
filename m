Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB571
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1619028667; bh=hVkpXoXRCDud9d2iZ8Uq+3hghCBpN8gxuMa+wmvkmLA=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=e5QxZ0kcjjZDi6RfRtIUHu9sCCxGzmTYEQJs+Nmg9t6yOd4Mz8ib89BcDUFStRM23
	 obXDA6c4U5cqurTgPzcQkO5FH84Bxh5vIDmuBmzBSY/0MX77ejAlLrLc2sLjDZzXTM
	 bILHnvbdH9rWk9AFRmvugDolPazkNQEDmQX+B4+o=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed, 21 Apr 2021 20:11:06 +0200 (CEST)
X-EA-Auth: wDOq6wE8frt/6XN8hMR2yKNCQfOQUFSagrfS1gx2zrw5P1NVrFbjxUNsQlwQH8T+ZZy6FBRJcmidiZFnq5cltOav2prmbBLM
Date: Wed, 21 Apr 2021 23:41:01 +0530
From: Deepak R Varma <drv@mailo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, mh12gx2825@gmail.com, drv@mailo.com
Subject: [PATCH v3 0/6] staging: media: atomisp: code cleanup fixes 
Message-ID: <cover.1619022192.git.drv@mailo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20210421181101.IpugQHHef_bbVkNZlr5WippCvqSJqNFI2NhIVki3P1U@z>

This patch set addresses different kinds of checkpatch WARNING and
CHECK complaints.

Note: The patches should be applied in the ascending order.

Changes since v2:
   Generic change:
   1. Correct patch versioning in patch subject

   Patch Specific change:
   1. patch 1/6 : none
   2. patch 2/6 : none
   3. patch 3/6 : none
   4. patch 4/6 :
        a. Tag Fabio Auito for the patch suggestion

   5. patch 5/6 : none
   6. patch 6/6:
        a. Tag Fabio Auito for the patch suggestion

Changes since v1:
   Generic change:
   1. The patch set is being resent from an email account that matches with
      the patch signed-of-by tag. Issue highlighted by Hans Verkuil.

   Patch specific changes:
   1. patch 1/6 : none
   2. patch 2/6 : none
   3. patch 3/6 : none
   4. patch 4/6 : implement following changes suggested by Fabio Aiuto
        a. Corrected commenting style
        b. Similar style implemented for other comment blocks in
           the same files.
   5. patch 5/6 : none
   6. patch 6/6: implement following changes suggested by Fabio Aiuto
        a. use dev_info instead of pr_info
        b. update patch log message accordingly


Deepak R Varma (6):
  staging: media: atomisp: improve function argument alignment
  staging: media: atomisp: balance braces around if...else block
  staging: media: atomisp: use __func__ over function names
  staging: media: atomisp: reformat code comment blocks
  staging: media: atomisp: fix CamelCase variable naming
  staging: media: atomisp: replace raw printk() by dev_info()

 .../media/atomisp/i2c/atomisp-gc0310.c        |  14 +--
 .../media/atomisp/i2c/atomisp-gc2235.c        |  29 ++---
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    |   6 +-
 .../media/atomisp/i2c/atomisp-lm3554.c        |   2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 106 ++++++++++--------
 .../media/atomisp/i2c/atomisp-ov2680.c        |  43 ++++---
 .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
 7 files changed, 116 insertions(+), 94 deletions(-)

-- 
2.25.1



