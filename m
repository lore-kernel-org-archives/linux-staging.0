Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF29537A490
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049879; cv=none; b=XF54TfHtMMNobunJgGFS9Sw7QLDwX3q5tJll3Do9dbXqQM4W92dGFntt1XN3DRyUecvdLiRaLzKEM+zpNuapiFJKNXvuyzl40uTkHBxdtxoOpO7Gbmpj8BUU7G8WoGojggv7RnSgvN4O24N341+PzKFp9rkvUIQE5R7ZrdM4Pto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049879; c=relaxed/simple;
	bh=/NjYQLUlAQqRHjopFjH8R6wTEBaPvdHffgxnR2Awpdg=;
	h=To:Date:Subject:Message-Id:From:Cc:Mime-Version; b=D9rt3SPz1SqCEGGwwnX2LG4It3cLk2hFYOJjoKPWL1TFiW0YOkP0uYFSUAtxiBx1js10puNVw6vdsthObvwGUYH5gQOw1oskDAATuKZkwtWCjUzdVMKdp3SHoDZCB5Q3na0bA+OUJa6nN1EAJUH/Bo72QBc6MEhMv7Yl2x1uEEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=nRxfxQRv; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="nRxfxQRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=QRHf1dUs5DHSc4cF4HIYieYENyGomrtSGfANHV362tI=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=nRxfxQRvwHvMaHnH5iWOmkP0Q+8UYrwDSLQn9OFbZre5FeR5erOAz7GK8uZHXbq8AO9sJwAxyyBO
        SNNdbsL8EyRRwTH8mxeJ5CsZYX1vt8Pjtih3N2TVOt7dKoArd8bKY5yA2HY6w2oitTqmwS8uN29R
        e6UIu5tpTLRjKpH5ruLDro29ides3YOaGhrw+X3ZzcdfmkdaPPgn7hlsWryVeFKrwbSYPbwLB31N
        OxehL2HxvtJqWfeOU8Ga3Kb7P1LflR8TCAjEJr7HJ9UkSqKDRz1oVnV2MYNoigvxTSugrbai5jQt
        Qij/8WmnhelgNzeIOXzjq4UVr90QeX5Dyt/UZg==
X-CSA-Complaints: csa-complaints@eco.de
To: <sudipm.mukherjee@gmail.com>,<teddy.wang@siliconmotion.com>,<gregkh@linuxfoundation.org>
Date: Mon,  9 Mar 2026 09:49:57 +0000
Subject: [PATCH] staging: sm750fb: constify g_fbmode array
X-sib-id: dS7Rc8x5SmNodXnzInJ3m-xT1xz7oFDLCf-S7Efo-0cf5PdhoNumk_LGCnzR6qN7-7S-qWcpjx71PRYiTNfeqQ87CYBCBA9HHjJwph_pDym6mAkm41mZEZ1oqkSJC2Pg4oWXiMKi4xagEeHBNQWE6eFH_K-Q3iESPOTqqb4q3lWYaDFjVFtlhVuPako
Message-Id: <9e566c42-8ec3-4d06-91be-0489de4e91c0@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: "dipesh chaudhary" <me@dipeshchaudhary.in>
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTA5NDk1Ny4yNzg0MjktMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2Bfmd6LmQuc2VuZGVyLXNpYi5jb20%3D
Origin-messageId: <20260309094957.278429-1-me@dipeshchaudhary.in>
Feedback-ID: 77.32.148.26:10551297_-1:10551297:Sendinblue
Cc: <linux-fbdev@vger.kernel.org>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "dipesh chaudhary" <me@dipeshchaudhary.in>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0


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



