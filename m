Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA562C9D;
	Wed,  2 Nov 2022 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667399874; bh=iazCrBNIt2pbE3fO7xl9vvDWT+4SJzjW3MIAsdkalcg=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=lVxZPZZsr1mP+r8kr8PyiAEopPoRwCN1j+ZDeK2RX+l7KQuibNZLhqaHT5eQwmZUY
	 doOB2WGdQMrSniqj+3RKrBAeMaMXIpVeTh9dtUpdbelaUqq2Sk2YayvRAPUFH2+jel
	 jhqDm4O+i2PLLfhkAYOGLICdYIzYh43PnQSH6mes=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Wed,  2 Nov 2022 15:37:54 +0100 (CET)
X-EA-Auth: 5C6XJzcJ9/ioESg8drmn/gcV5RLU0BDHEyZHdaoCZoAQszZZk24Gjkd0BpsZQQvqGPiB6mvEWPJkT95zYkRD3jUFeCH8N6TU
Date: Wed, 2 Nov 2022 20:07:52 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] staging: rtl8192u: unused code cleanup
Message-ID: <cover.1667398621.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary or unused code.

Changes in v3:
   Patch-1:
      1. Already accepted and applied to the stating-testing tree. Hence not
         included in this patch set now.
   Patch-2:
      1. The patch caused staging tree build to fail due to EXPORT_SYMBOL
         conflict. Fixed the issue caused due to deletion of 2 macros.
         Correction and re-submission asked by gregkh@linuxfoundation.org

Changes in v2:
   Patch-1:
      1. Revise patch log to explain impact of the patch
         Suggested by gregkh@linuxfoundation.org
   Patch-2:
      1. Review other similar macro defines and clean those up as well.
         Suggested by gregkh@linuxfoundation.org
      2. Revise patch log to explain impact of the patch
         Suggested by julia.lawall@inria.fr


Deepak R Varma (1):
  staging: rtl8192u: remove redundant macro definitions

 .../staging/rtl8192u/ieee80211/ieee80211.h    | 61 -------------------
 1 file changed, 61 deletions(-)

--
2.30.2



