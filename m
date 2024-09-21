Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A556170A2A
	for <linux-staging@lists.linux.dev>; Sat, 21 Sep 2024 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726921343; cv=none; b=bJF9RQ0xthObDKkTy8CpRu3N78hX93JXAbtLGdOMyRVXxkj5IaJZ9o3rHkJ1t8PA08nAOaAkmmgDjSdltNsy77DbFjblF0c0J9yJ1/TbvnJ8oLHUCITvckDyWqwG0Ch5qrfV+ep5/zR0qsUZ7j0EBKqjQpCItzKTJXaUrnkYONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726921343; c=relaxed/simple;
	bh=WkE3WreczIX3qH7szuXAya1kAV3XoNNuveC6Kyzudrs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kkZ4+36r0mRkPmRZByu0wbxwFTlmaIyyzkp082tcFE+LJYOEhC+BXntNnWJT9Bn3CIVcKhQ6ZxkQ2k+sZ2RoQo4AjkfRZzD9nzoxEVuybPsqphYAH4y2UQsYtDZ/sZeXURmjrtIqsn/CtTGcncWGPYH0czetrZmphiHIIgWnexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gS8ZfWfu; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gS8ZfWfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1726921334; x=1727180534;
	bh=o7MV92b3ecL/Jouz3J2rKeCPpUk0Vxx2D/ooD5Joo98=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gS8ZfWfu55ppDcwL/KjWhPGmVg8rDNTajO7rbUXvItrmrJIuY9I+hdwYpjIfJxc61
	 zIuxuWCXTlFeMspZoJaYCQlUC+f7aC7D+h7KnfsGoS18X5dkGxRDYkT/saCQm/QdBJ
	 VGbOjyb7LEcl7cx7XB5RVsd8fs0vsE8DhmTJs06BJNXqyTBbrGjzkurxx7E4T3UcIg
	 ZCWbOxXYny2ywWcj0gierXQAWU/nS7apAgFvNOTKhCrHixOEjbziUixLvoP9bYRd7h
	 wVKUu4HfctRbsh+hhLHqUb8eCH+7b4Gl2ZailAOiUDAMtlBHFlWCbLZkaiSipvhyQo
	 CcbLiBtK0/rKA==
Date: Sat, 21 Sep 2024 12:22:12 +0000
To: gregkh@linuxfoundation.org, tdavies@darkphysics.net, philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH 0/2] staging: rtl8192e: Use MSR_LINK_* macros
Message-ID: <20240921122113.30009-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: d2c48c0feae40aeb04b025795369dc9999612023
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

There were two seemingly not used macros defined in r8192E_hw.h:
MSR_LINK_ADHOC and MSR_LINK_MASTER.

There is one function explicitly updating MSR (Media Status Register):
_rtl92e_update_msr - only MSR_LINK_MASK and MSR_LINK_MANAGED are used
there. However, in rtl92e_set_reg, inside HW_VAR_MEDIA_STATUS section,
MSR is also updated - covering more than MSR_LINK_MANAGED case.

This series makes use of appropriate MSR_LINK_* macros in rtl92e_set_reg
and removes duplicated MSR_* macros. While at it, fix camel case variable
in rtl92e_set_reg function.

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>

Dominik Karol Pi=C4=85tkowski (2):
  staging: rtl8192e: Use MSR_LINK_* macros
  staging: rtl8192e: r8192E_dev.c: Rename btMsr variable

 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h  |  6 +-----
 2 files changed, 8 insertions(+), 12 deletions(-)

--=20
2.34.1


