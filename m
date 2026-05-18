Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E97405850
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107161; cv=none; b=dfk2y1/f66XnFYjfS4bs/MxWecTLvg5qtCmEhDl+NTzBR1hyVdjjr5/nFKk1NEZZmqEP6FkxHaaBhEf3eRV7FAboOr46iP8jz4psdJ0ou5J25jhzsUjlDG3jc9VYL9s6mI3IlTPU0i01JeMFVZUDn6EpRH89HKUNSMqt4aUYQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107161; c=relaxed/simple;
	bh=tLopODhXHpWSkrSZbvp45B+DBc2usJdv99pXL6HyW8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSzKBCDNm0ZaAYjQtqgcztduxBkgChsYzjX0GtU+x3ltoAp85+Qdwp7mgFho3QXiEDrrdk3pxNNuP4Izg5l5paa9dcrXO7Xdg0VvqBn1VswR1cKuuvU6m63EqIcV2HsT5xGnnKVwgWnyIIFQci9UMzXH1BVpwn/RrVToWVklNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=pqGpOkQK; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="pqGpOkQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779107144; x=1779711944; i=artur.ugnivenko@gmx.de;
	bh=t7d+gcYWnTHveWo149FfV250pFa4t/u1e3f+DWYx5gU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pqGpOkQKTHJr8p6Zs6xauWT2GML4q8Enes5kxrAQCaKMatQmFrExe8iV/++02+sY
	 /y/Pg+uDbyENSzCa/qG3Obax4b970/OfXTG7vM64qy/zd4mERN6zginFFAuZW240E
	 DTkbzBhEekiPgs522HxuH4l1i0aHy6y2gOk8oVXFiZAzqlK8LdsOBu8xko2h43cTJ
	 6xr3c3ST3TEr1Y813yTpHZWaOcxNyWxxRSN3DbNlAsDzeNiqBF7vVaEAHs48eMPQq
	 W0K86RdoJew3rBgiasHakmMTEjDcwMrMhW3JadOp9mzx3n5IhYjO/9GlUCleM3+zE
	 G0ybss5h6wKOsPEnKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mjj8D-1x46cm3Dhb-00eqDT; Mon, 18
 May 2026 14:25:43 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 0/4] staging: rtl8723bs: fix several style issues in hal/sdio_halinit.c
Date: Mon, 18 May 2026 14:25:39 +0200
Message-ID: <20260518122543.15266-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <agr09UHduXJKU_bB@stanley.mountain>
References: <agr09UHduXJKU_bB@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S+TvykJ8ICDoewtnE/JnfZ9nHMtWWP/ydc4G3VqRms6exCzuP01
 81O90EixCGVFonzFLMl0/CzZt/xW0pXYNlw41Ha5r2s43Zvw93gpSGOAA8FtbliukgO55WD
 RiL3uupnLLE5O7JFXO86oZTWj9SfCYD916OysSb3qgWduxlORlq4gxhTYKiEzZlCdne7Oc7
 5fCUr6+YiptI8M1ChZj6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f//k/DOlYp4=;rmgTHEAueqErqFSnCJvPirfRhsP
 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
 t2KtIjgwht2MEm7QWUO7Kft01KJPZ/3efFd8=

Fix the following checkpatch warnings in hal/sdio_halinit.c:
- lines longer than 100 chars
- inconsistent brackets around else statements
- excessive empty lines
- lines ending in parentheses

Changes in v4: Fixed the long line checkpatch warning in patch 2.

Artur Ugnivenko (4):
  staging: rtl8723bs: shorten long lines in hal/sdio_halinit.c
  staging: rtl8723bs: fix inconsistent braces in hal/sdio_halinit.c
  staging: rtl8723bs: remove excessive whitespace in hal/sdio_halinit.c
  staging: rtl8723bs: fix lines ending in parentheses in
    hal/sdio_halinit.c

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 124 +++++++++++--------
 1 file changed, 71 insertions(+), 53 deletions(-)

=2D-=20
2.54.0

