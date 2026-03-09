Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A33939BB
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053322; cv=none; b=KKXl3pqFZCaR8HaAcnr9VY33+pLts6uafj5NZlEbJlAG/yOcbfYNWGCh/OyLH+j82iL83NFDjFJY7ojFKyotfzRrs2n/63w2VYNPyyXsNb0XM374vg7a/dB0g4uCR4CMSAup8CgT6gFmnzSF6V5QjtCl/IPWfKRNZpIz/M0Bo3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053322; c=relaxed/simple;
	bh=/NjYQLUlAQqRHjopFjH8R6wTEBaPvdHffgxnR2Awpdg=;
	h=Subject:Message-Id:From:To:Date:Mime-Version:References:
	 In-Reply-To:Cc; b=Bm7apKvPm0FlRB2owqLmTG/J8hN+z3F1s1aj5eRru/Gb6xdB5Bzm8CnKOdumr35Px4kR36rEA/ZJRzuIXBzoDrALR9D9HtqkaEfnHh5AzOMPyYAIdHMOovSbk4buYDGXECHzW9c3kJJg8mdOEcFw02ygGGNCZ9NvmnFQArBntUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=KyE4uwxC; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="KyE4uwxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=QRHf1dUs5DHSc4cF4HIYieYENyGomrtSGfANHV362tI=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=KyE4uwxCPvK2qJF3sD15Pccz2JTNVwZNzp7h6HzUHeqvBccc5GWxJ4JtB4XuAiMkes0d9UIoNYt0
        nJVHbeUyiF5dqK8XTTIM+82EMCwBtctNi3xKot2JUtJs/DzzIQt8pSg+DSXLG5J8mShDJN0IU86P
        sp3eCt1lSzvXZgIr0eV58grngLo6kX7F/YSoTYPrSuXw8x021z8BZawwBHxuMs045052wn5F4s8T
        E3bUhYnWlsOXq+mcAR15GpUvxQq7JUnnqMvEGvB8FnRzrD/PUliUNE7G78+12vWnsEDdhChta68q
        ppca09kQ8jM5PH70mCKljRXA4Dba68l35FXJgQ==
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTEwNDgyNC4yOTQzMzItMi1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2Bfmd6LmQuc2VuZGVyLXNpYi5jb20%3D
Subject: [PATCH] staging: sm750fb: constify g_fbmode array
X-sib-id: P09YF-X6y9sXWh9QVeMeFij8Toy94HhvU8GrYvqIZ6jK-NKpmVOEuPGnTfr5JgE4fn_9ehA4HKtZoemHb9WjuWcewP3utbF8iGeaK_eVsxModi-HM5T5FpdmfqQJ1TIcgZTw0HwYN519CzMXECJm_-VFzP3bm0ORan4Rc1Aqcxj2etEAJKlp8SqZn0A
Message-Id: <9994ee7d-a2ae-4a4f-bc56-faff2f57dab0@smtp-relay.sendinblue.com>
Origin-messageId: <20260309104824.294332-2-me@dipeshchaudhary.in>
From: "dipesh chaudhary" <me@dipeshchaudhary.in>
To: <gregkh@linuxfoundation.org>
Date: Mon,  9 Mar 2026 10:48:24 +0000
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.26:10551297_-1:10551297:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260309104824.294332-1-me@dipeshchaudhary.in>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260309104824.294332-1-me@dipeshchaudhary.in>
Cc: <trohan2000@gmail.com>, <s9430939@naver.com>, <dan.carpenter@linaro.org>, <ethantidmore06@gmail.com>, <davidzalman.101@gmail.com>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "dipesh chaudhary" <me@dipeshchaudhary.in>


Fix checkpatch warning for static const char array. Make the array of point=
ers read-only to improve memory safety.

Signed-off-by: dipesh chaudhary <me@dipeshchaudhary.in>
---
 Makefile                        | 6 +++---
 drivers/staging/sm750fb/sm750.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index df471d4212cc..e944c6e71e81 100644
--- a/Makefile
+++ b/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-VERSION =3D 6
-PATCHLEVEL =3D 19
+VERSION =3D 7
+PATCHLEVEL =3D 0
 SUBLEVEL =3D 0
-EXTRAVERSION =3D
+EXTRAVERSION =3D -rc1
 NAME =3D Baby Opossum Posse
=20
 # *DOCUMENTATION*
diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm75=
0.c
index dec1f6b88a7d..08d4979c6755 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor =3D 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] =3D {NULL, NULL};
+static const char * const g_fbmode[] =3D {NULL, NULL};
 static const char *g_def_fbmode =3D "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
--=20
2.47.3



