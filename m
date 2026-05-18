Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B153CAE7D
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102772; cv=none; b=BFlts6Wa3R3ZAxFe4khzSX4QNahLS3bhmZeLRWVSkSoJriR0QUtJ7gO7AyzXtmgCwHA5C0uGUYeC+jo+Drm1CE5YP1tsGUoraWu6G1Bu4BrrxKThXXGDeTP8AymzzCqIOxI5xFG6hOP6KcSS++70BrePVm6kuf6bhBwITtvAOXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102772; c=relaxed/simple;
	bh=eEj3lUFhhVlr8v+QzoNC+O6qevxoxQBnmLLLKrmqzC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l52BJmrzFdWNYPYeqlJFmSb8a9giKzeE5e//k1IErcwSb/wMjWbuGIGVBlUZIC+tH+vyk8fwNGmo7N0chSDaE7LA4TPwCyC9HhkozySYrAnPJPVwCgUnEfZkIk+a6DHFSyMh6K3PDAvxd9MxB+5mGbMpNvjsPE0Pn5Ixh2cMOHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=ElR1cWUM; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="ElR1cWUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779102728; x=1779707528; i=artur.ugnivenko@gmx.de;
	bh=wFNuzXKw7y2Rnx2+QdMshCDsfjJg8WMPkUNriKtXB08=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ElR1cWUM9tg8uKSxbCXtDWBHHQGXaDIDPyNWLOULp+kdO25SdIIJGBKb1A3HG5dk
	 G4mchCzu2NAeV6IRHLyf2Wfp0HFrvnq0/SFIXUmyHzarXjReYmF9SMDSB9Pn0Wme3
	 lu5Ponc1WA7YlS2rcrwulZ4D2xSgO/CgKO6eW/2Y8Pv2JLrKEiFPsVCbDarjsJQWo
	 jn8FjLZ3qAggAdBCFhNuSgviKKy8Htq9KDRqQ6K+n2n4ddt8lN2mFHmHWg2CTTuIC
	 E4BNqzQKmNz1zrrXuC+VRngwrF6OA+i0AZJHKubMkwjRHlPb86gAjEf3ijGT6G4Ff
	 rx2KhcYEV1V6C3xegA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpav-1x5OK70nSZ-00dk6Z; Mon, 18
 May 2026 13:12:08 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 0/4] staging: rtl8723bs: fix several style issues in hal/sdio_halinit.c
Date: Mon, 18 May 2026 13:12:03 +0200
Message-ID: <20260518111207.23143-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <agqlgeaakrF1wNIu@stanley.mountain>
References: <agqlgeaakrF1wNIu@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:spnTqo9EWJB3YmOU/ayBTCWlBwrkiGQFczlruuZpq/W8NRnkyQz
 Fa2P+j8gRfGo1KErAa69bYMM64lym9wSwUPb7aNphqiNuFQr7NK/Trbev+Nv9iVNsKFVUkD
 7N46kxElfVpnuLnI+u0NPnYaDvv3sJXOYNxbTGn5ydlN9quYO+zuFQWDktz0uWfh01Eh4NA
 pX+lMSIkgBgvQjIQhUYAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t7Vua9Gilic=;fGadljjzGZTjKAOeC6osv48ZtoE
 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
 NhjAmpNrfQygh7w==

Fix the following checkpatch warnings in hal/sdio_halinit.c:
- lines longer than 100 chars
- inconsistent brackets around else statements
- excessive empty lines
- lines ending in parentheses

Changes in v3: Split the patch into multiple patches.

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

