Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC4B2E1EE0
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371281; cv=none; b=FWFr+n62r39+6I2UNYXGRI6kUrHLhviezpp6X30cP8VeDFud5AlnEgubNcN0fP76eFTYt1oxKWd/zRyFBRgSiURFI8pNJ2demgk4WxdVdC+mmSvkoF8VmGO66PJx0FJIOPRVpTRoDxq5m6NSiCCcusFxPQ6seuspDYEA1t2wbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371281; c=relaxed/simple;
	bh=/YM+50ksBAdbFJbqJwNZ/D13K9PRyfX2BgcyZwpF++Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iktt/1ErxIdS/+I5EQipD9IcTFZzTmUSgoD+BWho4+Woh6vZLAuRa2w89pUdAYqGBYlStwX7EGGIO0vVM9W/BzmywxpBXVHVCzsZdkXMMhiNKafsvThm23o2w6lcekJIjpuZZNNb2f2qEB36XVH28/Xy4Qj8QetsD2/lVJj+sQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=G+LPE7pT; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="G+LPE7pT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779371277; x=1779976077; i=artur.ugnivenko@gmx.de;
	bh=K+NXbMk7dfFGBoSOynLgscgfyuWgPNxihMFQ3V8fIsU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G+LPE7pTob+ZuzUBp+wmBl8OU/d+TAIfJDnS0YAb4lbct3wcMSQcco+Tbd0xbV2f
	 cg9yH88ZPCjC5jJzlB1QfqDd47tYZbdZ+XKZjCNukYgO8ii41Zrw4v83kHBlMeRfL
	 uD8uQspcmLLdiNL8a8v6xOublHiZTjNYFO3wRg0tg806NxsRkhvgdfIZBaBEbmgxg
	 bN541fgabjc6q0UOQttuPuDJ8xTbRDlmt8mMUi32Tgk4e7cM8t3gVzgSIutGzWes9
	 tMrIa+fvUeoCIier1XMmhMM9nNUTq9iK3i4MlFzVQCp3GDLF6OP88lff5ZMyK313N
	 1VHcNFoNCDSJo6jJmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MStCe-1wmhVr1CgQ-00MLOh; Thu, 21
 May 2026 15:47:57 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com
Subject: [PATCH v6 0/4] staging: rtl8723bs: fix several style issues in hal/sdio_halinit.c
Date: Thu, 21 May 2026 15:47:52 +0200
Message-ID: <20260521134756.24546-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4iI9uKtBtPsWCgEI5gz6Out2oiqzP7QVFoaBOjBoTM1hpgC2KsD
 8WqMQX4vQVzrAo3egusJfwKpsEpkDsqQCDyB4soytlwEhXZsoZqiJ59Db4KCnskmNOpsB9a
 hIMOghXowkbFuQNpekY13jem3sO0f1XGiE5eHaxkoyazzhggcWP1byfM2IyJiKteEWxjyge
 HOhboSZWX/LBD4F5US1QA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wu9pW/r2uvQ=;hK0lOrUHuWdcZnFG8R24jqehAW8
 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
 k2kd5A==

Fix the following checkpatch warnings in hal/sdio_halinit.c:
- lines longer than 100 chars
- inconsistent brackets around else statements
- excessive empty lines
- lines ending in parentheses

Changes in v6: Make the patch series apply to gregkh/staging-testing.
Changes in v5: Added the entire changelog to the cover letter.
Changes in v4: Fixed the long line checkpatch warning in patch 2.
Changes in v3: Split the patch into multiple patches.
Changes in v2: Make the patch apply to gregkh/staging-testing.

Artur Ugnivenko (4):
  staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
  staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
  staging: rtl8723bs: remove excessive whitespace in hal/sdio_halinit.c
  staging: rtl8723bs: fix lines ending in parentheses in
    hal/sdio_halinit.c

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 123 +++++++++++--------
 1 file changed, 71 insertions(+), 52 deletions(-)

=2D-=20
2.54.0

