Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A181F80B1
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729020545; cv=none; b=KbIHdwNhRluYHNlXin3FpEKOH8wHreoof6X8N9/KAEgyFD1XA+lYvOOxqcRQbwZOwho44B0N5pGXaP0aIixjplvNd2XRTORYr8E63J1q4287lSuqquYHutRbd/+vOwmrz/93yPtz1NiC6+NlmYvfQdDlicqvE8ADrA9VfdJwcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729020545; c=relaxed/simple;
	bh=UDwbN14lXv8mGkON7zgfR4ItaWTMOK69P2z9GBAdnJ8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hdyLN4oVNQ0OOAxzUw+nONpwAJPVLuGWhQN8qgHqu9iDFsYAV1hbuEMbJsLn8hzH+cnCVVFK9m0F3KUPq8kJ0zNwXb4VEGcpN3Ibs9YfBIepfkeBdztXcwgfg/7ulpr+QHiB2vs4TVR20QWi5qnw4tUAY8cJNP5JLYr4nWtgWLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=soBISPLj; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="soBISPLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1729020541; x=1729279741;
	bh=UDwbN14lXv8mGkON7zgfR4ItaWTMOK69P2z9GBAdnJ8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=soBISPLjZAFSN7LlP8Nqg4yqHzYwwGiDVTO+W3zSvz/eEnRSnvZqv1u78/iCIyxhP
	 0/7ve7da3lbcaqfbi6bFaL6vrYsG09NL6UpIXzaKT5oo76sbI8VxLMker9pl3Y1W+B
	 YG7QZzDX6EFG+HNYh4Ng7CEmtQy0wjC/A44FObE8H13ezzOUddYF+9Z1VNKyn38+ke
	 Ou8RnlW/tjpoeNgtL+BCeMPrQKwIC2Bet91CZX9Z3yZHYQijxdLMKTzjWW87A4dkWt
	 FvTBMUPTVSmhSS/mOLyhgd8SkA4KC1W4yfzSGzz3RIR8bxLx2Q6pHziIC4e57IGPJ/
	 AAKaJje/Nrh8Q==
Date: Tue, 15 Oct 2024 19:28:57 +0000
To: dpenkler@gmail.com, gregkh@linuxfoundation.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2] staging: gpib: Add TODO file
Message-ID: <20241015192838.16740-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: edd8d4f55263c6df713c6a07988d769c98a1e3d0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a TODO file stub for the gpib driver.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>
---
v2: Remove maintainers from TODO, as they can be found in MAINTAINERS file
 drivers/staging/gpib/TODO | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 drivers/staging/gpib/TODO

diff --git a/drivers/staging/gpib/TODO b/drivers/staging/gpib/TODO
new file mode 100644
index 000000000000..850dc1102e54
--- /dev/null
+++ b/drivers/staging/gpib/TODO
@@ -0,0 +1,2 @@
+TODO:
+- checkpatch.pl fixes
--=20
2.34.1


