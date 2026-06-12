Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B67392823;
	Fri, 12 Jun 2026 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260357; cv=none; b=rEim+8iPvEzOPkYnHP3SRdE8MGAO68Ag/wODoce8UK9MwIV3q3QAMgQa8hi53SpxHI+6Qdlg7z/Tf+QDRL50Sao5B9N9f8fMYIFbqVJ0sXPS+cBHdKctVy0LB+P/vapn2yrq37DTCQitrZEJu/V8ZFLSapy87GM2HOL10tqt/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260357; c=relaxed/simple;
	bh=LajSKXqmtUElE0abaIQ3GY2Ux9Jzqn5ID/7CrH/wcRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nA3920aVTSf4aPNXTSHLNGNiI5zm+vRkmTv59OlDI1MG1Z2VMUeUGOMSr3MZnZj6USro/qwZoybz3W5ZM+XQZU/2nXUqlAFqYZDootIYJGdP8MXxeMs2Lhc+Ox7SasAn8bTscNJ3sUF6HAnI5QLGmlHjKFwztaNj7aWHqpazgqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UZ+DUFRo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UZ+DUFRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC2C1F000E9;
	Fri, 12 Jun 2026 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781260355;
	bh=DllTiXMzKTcczGIE024Wmklpfvw3ggE38qKWycpgobo=;
	h=Date:From:To:Cc:Subject;
	b=UZ+DUFRolDv4G1piAbP/7mL5NiZQUxloOD78gBtAH2VAVrh2WSNbJUhMHJSRcvi1l
	 jEzprIdcm9+6p4ssDFM6vmqzG8NxhsajEZvalyVYrmoo//DVNGHfgKYggc1lljTzp/
	 3I/QrZ6ixUp9a2+2Cfl8K9f1cjmTUB2qAH/ndAVc=
Date: Fri, 12 Jun 2026 12:31:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 7.1-final
Message-ID: <aivgBoLrgsWEiytO@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.1-final

for you to fetch changes up to 88e994c57a79f62d5338231d8d37ee8dd98baffe:

  staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction (2026-05-21 12:43:22 +0200)

----------------------------------------------------------------
Staging driver fixes for 7.1-final

Here are two small bugfixes for a staging driver to fix a
much-reported issue.  The fixes are for the rtl8723bs driver and it's
something that many scanning tools keep tripping over in convoluted ways
(and seems to be able to be triggered by network traffic.)  These fixes
have been in linux-next for many weeks with no reported issues, sorry
for the delay in getting them to you.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Salman Alghamdi (2):
      staging: rtl8723bs: fix buffer over-read in rtw_update_protection
      staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length subtraction

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)
