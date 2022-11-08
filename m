Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451072101;
	Tue,  8 Nov 2022 18:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667930940; bh=iuvGxOIDRO88JDlGc//G/Az/Iuh80f0UrN5ARntwZtY=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=eGBlkMYmjjCDBdJMPGroEsjnvcLogx/kIRvxUPGy46qjY5L1GLquiluCRhJEAIWM5
	 aGhbodlBGHuU5YEPgMQNmtxjFqu+7akBtaOye9roQLZFCG4SP/3neHkSboKSo/sjVd
	 VL/sXFF1gm9VvWzdY7+znjUp2QKjJFOS5Q0aNA5Y=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Tue,  8 Nov 2022 19:09:00 +0100 (CET)
X-EA-Auth: ZVnd9t000U5esX0AyLUXYyF3GVeNm/AQyiWaa86pSGgUzIhdUJ6HbxPdb//g39KFFpFDK7Jiju99M/eQMtXIlps9z0gOdQe5
Date: Tue, 8 Nov 2022 23:38:55 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/1]  staging: rtl8192u: unused code cleanup
Message-ID: <cover.1667930291.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary or unused code.


Changes in v5:
   1. Earlier patch send did not work as expected. The emails did not thread
      well. Hence resending as v5.

Changes in v4:
   1. Resubmit patch set with the remaining only patch. Update patch subject,
      version and patch sequence number to avoid confusion.
      Suggested by gregkh@linuxfoundation.org.

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
2.34.1



