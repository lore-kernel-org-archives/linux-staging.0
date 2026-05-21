Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6633AB47E
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362637; cv=none; b=JcFcyDarI8VOHHKipQ6aVTooo2poRlifiEibU3y7htdo1vvqHLN6kycaQabyj9q57kNHSv79SpTZAV7valJwCuykjmdvORNJK6t2SlFo9qX0KvF2U+mjRXJVjbdb9zAt+OSnrdpEEg3OKggvMTXqeUMI4I7iI3+LjZb3WexiibQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362637; c=relaxed/simple;
	bh=6hXCJcIDodPD8QR+tlQylJsNPFhgh73Wkn3tASX+lvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+M8zgdHlmV9ZdRKEEQHVQyzXhEMLQt7tNfpLAyU6EBKtonYbXv03jCSIpBhDmo91hMbQNpReGjqgu+ijthGAqEpHEYWY5rygkjPNPx5hZTptGwk/zq23iNMe7EmC9fwd63EwZtnWpa8yvKkxMYMOuY3HaqHErzJWtXP37AELhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=Ws9LSEgc; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="Ws9LSEgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779362627; x=1779967427; i=artur.ugnivenko@gmx.de;
	bh=PWNMEk07sXqpvw9DCGvD4Lalu6qEdYPFVQ+Q7KL90pA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ws9LSEgc0MJXNCiFBT9gPSIsvD9mS5FAPA3mclUHLmfWXHjOuzv4G/xITTPeRXfy
	 lSf0uUedX1XqOZJRtQ9CrXFh9J/3qUFS2B5tI+yVru3FzjYP+u7vn1ol1aygUpEqn
	 2RRTjBZ6QvtU+5P6xIWRpnCY4BRSE63fVQv6BNFRhqJwu5jwO0MG4tZDUZTY+N3s4
	 8RMgJyEuBaYfO+nI4+adlGVJBcfSCHAN4Pjncihl4Hnbyb6wTwkD/Tr9a30kDO5Fg
	 V1oUGoY3bNlTKa/96EJM4oWQNXjWtJeLWLfP/vY8rmOUbim1gPBoFrj6gKsXaouWp
	 Son3u8Z/FZ5nXfWg3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3mt-1wnpcn07sx-00KuQo; Thu, 21
 May 2026 13:23:46 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ahmet@sezginduran.net,
	error27@gmail.com
Subject: [PATCH v5 0/4] staging: rtl8723bs: fix several style issues in hal/sdio_halinit.c
Date: Thu, 21 May 2026 13:23:41 +0200
Message-ID: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gKMOEMD0HNm4XRDnFLziGmpUKRsIrPutuykNA9PgWSg3zJudQKI
 nsSzglipuT9KoUL+MGIQs//Hbj0Y8UXk+b1Mh2wSK3hxBN7qcn2MenMh3lCPyyARA2kD8ia
 H4GVeD3wHCLRtiKQ7qPfyRKKnWP+5MbnvUrWPoXc11/BEiRguijLMtb+1FvHsPy8LYf6SxB
 BwnQLc6bx/Chfvt1o4AIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g0SyX7Gn5gE=;5pvWl4vEdyW2HZYXNoPwvz1lfwx
 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

Fix the following checkpatch warnings in hal/sdio_halinit.c:
- lines longer than 100 chars
- inconsistent brackets around else statements
- excessive empty lines
- lines ending in parentheses

Changes in v5: Add entire changelog to cover letter.
Changes in v4: Fixed the long line checkpatch warning in patch 2.
Changes in v3: Split the patch into multiple patches.
Changes in v2: Make the patch apply to gregkh/staging-testing.

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

