Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D52C53A3;
	Wed, 19 Oct 2022 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666209205; bh=nNXwKU1Ppl1AKa70b/f+2U0MS7Cyq2/czmAaiBlx53o=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=VVfRx/mpKP1CVQhc7zc1zeGGXpPsrtRH20uXAQL0NNQKpy5/+KhtgMWIgs1KS24jn
	 zbn7D3rKdRddQxVoGlX2oYvFg63sre+ed1FVeMz+g7AFbfgd9MFEpB7ujDlHiYAGes
	 z8mnCWWT9RznfHWdlN9bQHvlguEUHS6+4nsm3MV8=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Wed, 19 Oct 2022 21:53:25 +0200 (CEST)
X-EA-Auth: l8mDwtAV0BDO3bjb0LZpCiCJNtFyTDFWWrTwGQ3xJ0RWyYBlAO1M0Oltyqbdcf+h9dpnO5itJBkEnn536veef+u5CJ/GItUT
Date: Thu, 20 Oct 2022 01:23:20 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: [PATCH v4 0/2] staging: most: dim2: remove unnecessary function call
 and variable usage
Message-ID: <cover.1666208065.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Patch set simplifies service_done_flag function by eliminating call to
dim_get_channel_state. Also corrects the misleading dim_ch_state_t variable
type name.

Changes in v4:
   1. Patch set versioning missed earlier. Now added. [feedback from gregkh@linuxfoundation.org]
   2. Patch 1/2 : None.
   3. Patch 2/2 : Correct patch subject and log. [feedback from julia.lawall@inria.fr]

Change in v3:
   1. Patch set introduced since another patch from same area added.


Deepak R Varma (2):
  staging: most: dim2: read done_buffers count locally from HDM channel
  staging: most: dim2: correct misleading struct type name

 drivers/staging/most/dim2/dim2.c | 5 ++---
 drivers/staging/most/dim2/hal.c  | 4 ++--
 drivers/staging/most/dim2/hal.h  | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

--
2.30.2



