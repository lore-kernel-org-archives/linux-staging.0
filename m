Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B83200;
	Tue, 18 Oct 2022 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666111725; bh=0nkY6iUtCYAqr1+5gKwwRvENJAxhVYsXIvjIOOFBhVU=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=kwuhANf7FnY70QxDpT7pgRhOkl5H3a9Nu0yPkQ6Yr3rtl28JoYIUWil71vtFLQaXp
	 KkjgRh6JpfcyW6Qrg/fNfTzBdJBBjeVFzi7tcpik2tv69vvyNHUkNHukwDCLbXDkTj
	 3LTpa9yRxPrL/ucsc/bvNPm4nP2MVOKYB2UHuvhM=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Tue, 18 Oct 2022 18:48:45 +0200 (CEST)
X-EA-Auth: nf9Iwl0dHb4P2mE+fmoOko6/96gLJHnKjXcqx7+EGwcVhzbC6ksZe2aqvPZnykZdaIAwb69JYnx6n9ldyhTqKW861jmn/pb5
Date: Tue, 18 Oct 2022 22:18:40 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: most: dim2: remove unnecessary function call
 and variable usage
Message-ID: <cover.1666105876.git.drv@mailo.com>
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
name.


Deepak R Varma (2):
  staging: most: dim2: read done_buffers count locally from HDM channel
  staging: most: dim2: correct misleading variable name

 drivers/staging/most/dim2/dim2.c | 5 ++---
 drivers/staging/most/dim2/hal.c  | 4 ++--
 drivers/staging/most/dim2/hal.h  | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

--
2.30.2



