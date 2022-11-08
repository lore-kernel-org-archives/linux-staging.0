Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBB2192;
	Tue,  8 Nov 2022 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667925596; bh=njNtCpmF4V8hs28xEWiTBSsa3wFAqwnA0lBNyqQxPjc=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=fHP7ypeQBSqxY6EAjCm0TRUKPMsGSN+KkEC6lfF/J6z+wSSXUHyt2KTyT+Bo3T1Jy
	 QFt5kH6kz0WeM5FUTW2cdPtGxd4rUhtnh080E3XaR/NPlIguRkc6MJExUugOLIm/ry
	 UEcM9TNiQXpY/CEhwCXMzT35zYyglbF8MBU1sVoo=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Tue,  8 Nov 2022 17:39:56 +0100 (CET)
X-EA-Auth: acAh3PdiSeqFTTRE3GWkdFRCS4w3qRGpxA1LJ3coWhictfhs+A3HJr1ieTivieZykZyJJDmiPKeH9eJ+TGQK5/+u86DF/XqS
Date: Tue, 8 Nov 2022 22:09:50 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] staging: rtl8192u: unused code cleanup
Message-ID: <cover.1667925039.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary or unused code.

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



