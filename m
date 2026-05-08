Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BF532E743
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 22:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778279252; cv=none; b=fI/tpR5AdAzi3EqIuiuncTZJuAj+pX6sz6P/Fl0AGhKwvvryQ23fSroy8a81RmkkSdLXJ4C0saFhMU0kve7VGjvYHbYtf4OHZ0/VHi6oIEyIhpiDAqSYDXqkwFZupvga+qoGFfdHC7AQOOaCU9M32p7k1HpgSGrKWgcnSJuY0UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778279252; c=relaxed/simple;
	bh=TlxT4SQ+jhvEeUSKmnFps6CGepiSOHV1EysHfMUVJcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nhl8PP7YmHteQ8HARSISnhaDgi7CrYr/1njQZMU21TlBKGY146Dgbt2lyrUdVr4n1xFz/AbA6wLmeJjikUrJSwCsHW96vP0KDUCElrguLmS7k9FZ61I/9C+Donbz/FBo3TgeGAhjVQuekFEjTbupyxl6vACAM22Oczw8TkfL8/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=czoCr2jU; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="czoCr2jU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C18F484FCA;
	Sat,  9 May 2026 01:27:28 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778279249; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=4ZnDbFFu+FvMhqsWW2jow55EzXzf52hbUfBzZzdi4hU=;
	b=czoCr2jUA6pi3jFKTNzk8vyWOhjBGaG3WaquTDYR0sd70JBSpntevnx+InCA/xwPHYo7bf
	qtlOb2MNxf0hHPlxgL3wXPQxbUmvFRYbfhoFOPeh49eymoJwblGIiMcSO3m8I8oh71U2iL
	PryoaI/QtG6o2d4McHx/MyvyTbtLgw+E/FOXlzOQ8ECeuHFTgMP1GjMAL539Cxt0aEh97L
	PXNP9atNYlCx0EADyVWQ90eLmyReS72h1k8Onk58vQ95AUKKwWrrvurD4s9ykCOIzCssf+
	XTbUzqJF3qwa9cARW9QNC+E3R/gg5Bk3GtU4IuOQm/F4Lij63Vo9WiM7TZHbAtZ7TVn3qU
	Z7kbcsxpGQu8HdqSld9l2zw2nA1taY+DDKQXYHubqQ2n+0auHBKbrH3nWWcviB08/De0QB
	AeKyHZVNvvJdQk1ZerlUwCBBl2IVB39S3ndRf0ERG/a2Km0Eb2ZghsRXBpuv68xRHENnxU
	qtVxB3dnfr+d/l45wnq8Tfs8XQaA9PGaZ2ZOFzBXVBF7qnJl+TAHCrkDvyk8m0e7ca++8B
	MzrAZgF+nQ1OqGLUW3ngRXEiRrz7OFoZ6CPzAPu5JiHmTX1OURunq/UZUvp/sKyuHCiGXR
	J76jdel4/kmGNRpuX+nMrZMAQye62qEE+041uuBhSEUQ0YRWsZJ0s=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/7] staging: rtl8723bs: rtw_mlme: line length cleanup
Date: Sat,  9 May 2026 01:26:56 +0300
Message-ID: <20260508222725.24075-1-me@cipherat.com>
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

The buffer over-read fix previously included in this series has been
split out and sent separately as a standalone patch at Greg's request.

Changes since v6:
- Split fix patch into a separate series per Greg KH's review

Salman Alghamdi (7):
  staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length
    subtraction
  staging: rtl8723bs: rtw_mlme: wrap lines exceeding 100 columns
  staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
  staging: rtl8723bs: rtw_mlme: extract local variables for long
    expressions
  staging: rtl8723bs: rtw_mlme: remove dead commented-out code
  staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
  staging: rtl8723bs: rtw_mlme: add blank line for readability

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 272 ++++++++++++++--------
 1 file changed, 178 insertions(+), 94 deletions(-)

-- 
2.54.0

