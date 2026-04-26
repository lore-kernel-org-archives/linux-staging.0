Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A332AD37
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 22:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777244295; cv=none; b=MhwKf9iwDj4Upg28YmRL8mA8TtC41BM2hp/ZOE14DY00rHAg3PTfzKt0Ga+M3fGuuJssAoMZJnkViUVO0EpIqKQH2D/ZCPtpPX7b3Kr3/ji6fdNNx678fr0iSUaFUIlFmvVfCJHYDDZB/XRxcLB4DRkXz61KBQrkTuka+g3vA8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777244295; c=relaxed/simple;
	bh=56qukY9RhHSZlPw/A4R5vRtXIrGkpDvIh+sSYVNAbVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNuDdYZyDYfw23anCtkVoCbpQ6TVKvq6RoaX6FSWhmaJ8dAfjEq3SXnKYehzwFpDRfgNE9CCpaBEauYfv9haLqWJP7Z6pHg0hRVzdewIVnun+rmFN0PLj0qaREcr5HsQWtzkqAcvHdcYh0QRuxyfgdok85BkxxSc0p3zKClPlEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=YvKaEB99; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="YvKaEB99"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12FEA84F20;
	Mon, 27 Apr 2026 01:58:10 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777244292; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=aWfVM7QjkyVkfKKJbLiRAjiNUefZD+FtqPK2Uwh3bqY=;
	b=YvKaEB99GMfpDsTop0UhbCNT5fCDmccGWetWFEIgYYf5QCbTqL3r+gp8QaiCx2E4qTAJd2
	vxTda1ysBHaXUwqAO46WIo8Vmgq43du2x99hzBHfExlPZKxCDMo2oTdorDuaTXJqMO0Y4f
	l0prMPNYtwGXzA6lSFlmTvvl2NPqki5Rgnx/yUQHGUgvOiNyBGBVvzXY0UJGMWE4cPamwI
	WYlBYyd3LhVnyfocuoqoCIF6DgqpYcGcKU5wL0d8jvdedQY6To66EOluRKG1GZoQo+2rdy
	0BjLIBgW8uKFnoN51LLKOxgiNH9axCraUpcCpqs0TpDCIPGLKxZ1uPDHhi4SDkTeCacxa2
	t8UbI3SIxrfSPIGZh2IImtUaBwL+c/cHa2rUEdsGgF1RKUQLnA9tr0S4PxxLgE6y9Z35on
	68WtP06dj4wygxEf8sL+EETTczq9213Cm7gHF2eSFJKznp+/vVdvCdf6t8YRAummeZmngy
	Q1nZp+W8MuEOjqsNdBcXlxKxjq4M1/bxkFpCONpzq797v8dqR9KrCmntmBlOZSfABTAvby
	d2Dz+ck9FHpYv5n29lTeMQ5fomIBwMbty49rKbv5LqLzdDNvcAlD/6N0xsvCWtV++3ulIr
	dlR/0+of4n+InHfQ34CHOJXYwHCiHwOdwTZioCgvyoymzbzYUk7DQ=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] staging: rtl8723bs: rtw_mlme: fix long lines and related issues
Date: Mon, 27 Apr 2026 01:54:57 +0300
Message-ID: <20260426225552.87114-1-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This series addresses review feedback on v2 of the rtw_mlme.c
line length cleanup patch.

Patch 1 fixes a pre-existing buffer over-read bug in
rtw_update_protection() identified during review.

Patches 2-5 address the line length cleanup, dead code removal,
line consolidation, and readability improvements as separate
atomic changes.

Salman Alghamdi (5):
  staging: rtl8723bs: fix buffer over-read in rtw_update_protection
  staging: rtl8723bs: rtw_mlme: fix lines exceeding 100 columns
  staging: rtl8723bs: rtw_mlme: remove dead commented-out code
  staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
  staging: rtl8723bs: rtw_mlme: add blank line for readability

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 286 +++++++++++++++-------
 1 file changed, 197 insertions(+), 89 deletions(-)

-- 
2.54.0

