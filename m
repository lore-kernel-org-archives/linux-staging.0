Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E97645
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 16:55:04 +0000 (UTC)
Date: Sun, 17 Apr 2022 16:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail2; t=1650214497;
	bh=K75n7tetrOKRlGjQ46y3bGIhPuBevmYSEPZotZ2T/p4=;
	h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID;
	b=lnuzA17Id2zUl0X6uo1SjV1Eag15LzOjLg62DFkbD5xanjk7IEFQsmmiD/sBqbQ8q
	 cKASQyVQbanTZ3J/j7dNc5Y7C15IWs7kf2BgrxfroUu+JOESP9UVby6rAzOo1Lu7yJ
	 vMuAofoapAlhCc9YLOdgYcfB3NgUtZ+nKtj9GZQdN3LMWIN/mWwTpR3OsYwV05fmjG
	 vwFGWK9onY5Cq/+LzKC/u5E+0PQCOAyQCpnwOnRGLXLcuznvogrTU3QXJTutO8ckkc
	 bUgekMduH369URQemqgCw+X6RHkp5LnOUM+POFrgUZ4LO4P5wviZvNWnMSyNcFoOmk
	 q+3GnpPT9cVsQ==
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, eng.alaamohamedsoliman.am@gmail.com, gregkh@linuxfoundation.org, florian.c.schilhabel@googlemail.com, Larry.Finger@lwfinger.net
From: Solomon Tan <solomonbstoner@protonmail.ch>
Reply-To: Solomon Tan <solomonbstoner@protonmail.ch>
Subject: [PATCH] staging: rtl8712: Remove unnecessary int typecast
Message-ID: <YlxGTMBsLqdOIrpC@ArchDesktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch gets rid of the following error from checkpatch.pl:
WARNING: Unnecessary typecast of c90 int constant.

Signed-off-by: Solomon Tan <solomonbstoner@protonmail.ch>
---
 drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/stagin=
g/rtl8712/rtl871x_ioctl_linux.c
index f1e352b7f83e..36f6904d25ab 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
@@ -659,8 +659,8 @@ static int r8711_wx_set_freq(struct net_device *dev,

 /* If setting by frequency, convert to a channel */
 =09if ((fwrq->e =3D=3D 1) &&
-=09  (fwrq->m >=3D (int) 2.412e8) &&
-=09  (fwrq->m <=3D (int) 2.487e8)) {
+=09  (fwrq->m >=3D 241200000) &&
+=09  (fwrq->m <=3D 248700000)) {
 =09=09int f =3D fwrq->m / 100000;
 =09=09int c =3D 0;

--
2.35.3


