Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F61C84BB
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704578; cv=none; b=AT+9GjUyaMjd4/r5PbFzDoWsx9iM1iQeMSjBGRFMUF5uODd8o9mm7BG4ugMEjrvcA9eKV7SPET6G+70N8bK3TmIm+/rNdyGfrv5gBQ9QoKji8/0QhuLXox0QdYdSK9hp8deduRnXYTpuldhjzYsTAyd5vSe6Mme6iCh1Za0mQA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704578; c=relaxed/simple;
	bh=KLzDsps73AKaDGts0Xn5hnm2VcIUv42dwg2PZ7ZJmMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCzLZnSVr57COBYTt/7gmV4b8yIm2TZgh+udodDAWCETfexgcUOwZee2seO86HkediwlW6nOsIwu4M+jceO/pXY1iJibKbd0IO1ZKF/eRe6ISXgz0zQiqtxx446Qhg5nXUOWPqsGwtQaKkc5p31u76AA9WxSh/HBD5YprI93ui4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=wiIXOXad; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="wiIXOXad"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40AD684FEE;
	Wed, 13 May 2026 23:36:15 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778704575; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Ede003G9+nWNSaBj344e6jJXTOWLBY9ZFfjzHDApbbU=;
	b=wiIXOXadzJHGTtCM3lrdetc/q1XwNfWVew3lHIfa7CFGG6S6UgKIybC/3jmcEvHecd57Go
	1Xv42nmQLGWatN267EC1NRrt2adOGUX44zSmERnwubPkkUV1DW0EXdD7KFjeHDqJ1aYJmw
	kA+vollcf0gu17FUGcijfefwojkw4KHHTPti6jaYiU1hyVnx1e+E573fot0EovmygBEdPW
	anWKg93Gmg6YxInK7XTEm3SSXXJchZ1hwkXkqKyrA7WKNEk3ePXIYhFe4fvSjTR2cpL+lj
	cEyPUkQC0CHWcp0Rm3L5QaWUumJN7QX/DvBPGcbqme08p2FNTtpTgppBZlHtMaueuklEG+
	YTYqHfOQBWGlUqFimjj5ZR9qGkwmWRe7+84l6ylAag6qurMfJmT5WDIuzBY17bHXKALzbE
	x5OVsjrTJPMdg1ZV0p4UcWDV3CdMfmrUme9ftF7umGiWUZFDWvqhy1DK9xn0xNXp6fmJkC
	TIEsoQNqUBqBbsTbeMn9TrkdM7lslER/dNWUF1v65Btu1SDepCt8SPFzB5YcnlS8eIERGf
	4QeLsaqwKiBiC5rNeiQ733VMyAQElkibdbjNT3ui7JaLZdgLWjgsLYf5rEoaJYKyIz/Ian
	Bd3EloNSFN1ZJbB6O6cTD7KkT93ITLnQcenQ8oDFa67VZz1pj1WL8=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/6] staging: rtl8723bs: rtw_mlme: line length cleanup
Date: Wed, 13 May 2026 23:34:58 +0300
Message-ID: <20260513203611.31872-1-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This series cleans up lines exceeding 100 columns in rtw_mlme.c,
along with minor readability improvements.

The two bug fix patches previously included in this series have been
split out and sent separately as standalone patches at Greg's request.

Changes since v7:
- Split bounds check fix into a separate standalone patch per Greg KH's
  review

Changes since v6:
- Split fix patch into a separate series per Greg KH's review

Changes since v5:
- Fix variable declaration ordering that broke compilation due to
  dependency on uninitialized pointer (per Luka Gejak)

Changes since v4:
- Add separate patch for rtw_sitesurvey_cmd condition simplification
  (per Dan Carpenter)
- Fix variable declaration ordering to reverse Christmas tree
- Remove roam_failed intermediate variable

Changes since v3:
- Split the line length patch into two: one for simple wrapping
  and one for variable extraction (per Dan Carpenter)
- Add a separate patch for ie_length bounds checks which were
  flagged as behavior changes
- Use umin() instead of min_t() for unsigned value capping
- Fix empty else block left after dead code removal

Changes since v2:
- fixes a pre-existing buffer over-read bug in rtw_update_protection()
  identified during review.
- address the line length cleanup, dead code removal, line consolidation,
  and readability improvements as separate atomic changes.

Salman Alghamdi (6):
  staging: rtl8723bs: rtw_mlme: wrap lines exceeding 100 columns
  staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
  staging: rtl8723bs: rtw_mlme: extract local variables for long
    expressions
  staging: rtl8723bs: rtw_mlme: remove dead commented-out code
  staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
  staging: rtl8723bs: rtw_mlme: add blank line for readability

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 260 ++++++++++++++--------
 1 file changed, 169 insertions(+), 91 deletions(-)

-- 
2.54.0

