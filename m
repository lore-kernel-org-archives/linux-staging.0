Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5743815C3;
	Sat,  9 May 2026 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778312926; cv=none; b=dN06/8uzjRe53HKNsAjxMtve1BltzjxPe2nYxum8se9uqXv5s4TKTDzjpMQtBqYcLlrbVXH9Fu4TYkD+CvTy3q0uY51wQZ5mnISvd1HMty1pRdVeFBFmjnAhk9EdFTYZAR/wR4eLA1BbEGsL4uSwv1OJyUgF5pg1YJp8eQNwkXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778312926; c=relaxed/simple;
	bh=/RJ5PU89ibeQ2oa4wzTjcmBfKDqd0R7t/P+Bd6K9ovk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KmYO5ycT8gVHbtbIcMriixb/4yWkz5QgYSFQ3WRgowQY3n4LyHsTwaU8aHvF/z5iGebALt/EbNVW0RwHlfub55c/Y7YsDuvifEiwbEnXX0PMNRdyuRVUJHdQUhZqoWEcbU7zy2XGaVPjIhVbtgpGnG81cQFsxZy+1A0jMEyQYXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aGZug+e6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aGZug+e6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061E5C2BCF4;
	Sat,  9 May 2026 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778312925;
	bh=/RJ5PU89ibeQ2oa4wzTjcmBfKDqd0R7t/P+Bd6K9ovk=;
	h=Date:From:To:Cc:Subject:From;
	b=aGZug+e6Nuiemw6KPOH55GvvdHq0mikpnuPwmFqyFpbRd+9ZoWeSFEAsJaqi00gXN
	 YBRq0mzH27t16OoxnjMlUNOl8mrUm0AtlOnmWkLB+SnrbhmYomvkpyViSmXrIGpwU1
	 4bk2QYrDkQzqTrLunDNEvnRGcryebnjx6NxGJDSc=
Date: Sat, 9 May 2026 09:48:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 7.1-rc3
Message-ID: <af7msSLX8D_YkuA4@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.1-rc3

for you to fetch changes up to bc851db06045a40c18233dd76ef0562d7f8bb6db:

  staging: rtl8723bs: os_dep: avoid NULL pointer dereference in rtw_cbuf_alloc (2026-05-04 11:36:47 +0200)

----------------------------------------------------------------
Staging driver fixes for 7.1-rc3

Here are two small staging driver fixes for 7.1-rc3.  They are:
  - vme_user root device leak fix
  - NULL dereference bugfix in the rtl8723bs driver

Both of these have been in linux-next all this week with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Johan Hovold (1):
      staging: vme_user: fix root device leak on init failure

Shyam Sunder Reddy Padira (1):
      staging: rtl8723bs: os_dep: avoid NULL pointer dereference in rtw_cbuf_alloc

 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 drivers/staging/vme_user/vme_fake.c              | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)
