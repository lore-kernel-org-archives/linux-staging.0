Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CC716088F
	for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 20:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734811301; cv=none; b=akpiuYIb35JQzIbqybC8VVViDEk0plZIR8cKIat3oEn+zj1g/nt4TJOQAOUJ8u1mT8i+SSuFLPTG5cKZUAs0D1lY74PQ7kROYJ/uJViXZfOJ24PcQ5DwVY8oC3p+Al017B672ZGvQgHxquvdEA1qRk0JRo2QVY5ix1ggNYq5QAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734811301; c=relaxed/simple;
	bh=iX3rVwpSvUKGMNQ7aVr+zcCxbkzQ2PayJy/waGkruyM=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=DpYvhTVxaWizX1BV2KQd00jojyAxLabw5Y3YQNbv8aEaFpl3BFYcuksgR2TkuVlh4jwzldl5wI/feBwSWg9wMHnQPNRJjn40YUwtIxCagRxZKyIAJRpDEehCGES/KIfLbtKRZHx6KUtAVlFKy7HMnn5e80FDggvvvjdEBSFWoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ariccio.me; spf=pass smtp.mailfrom=ariccio.me; dkim=pass (2048-bit key) header.d=ariccio.me header.i=@ariccio.me header.b=I7Nq0VNx; arc=none smtp.client-ip=79.135.106.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ariccio.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ariccio.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ariccio.me header.i=@ariccio.me header.b="I7Nq0VNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariccio.me;
	s=protonmail3; t=1734811289; x=1735070489;
	bh=f8Uj/HKKc//S6ob7ZcG7QfaHgk7fkjDu2QuF3swEJG8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=I7Nq0VNxOakKqKheQVAyuIxvwd4xClAQy5YqL8aP9hucT3ZeZndZFGr0zkzD9SA4p
	 I4r8xjxXhwq4TY4JXX6FcexrYpE299zINuRpowPdXT103gHGbJcLBo9QNms5HN8IHW
	 cJqoOTHilS0TMsx4STsdEhBaAuuVVfc08Ra0w6EuN961ruk0+PTU6hjzWHCTpMidL9
	 qgSnqbgttd67vrUD6E2ZEbKAXZB20FSaHLbO2Xtixyykl59nYUZncflKvEqdqRBsS5
	 xCs/WBrUh4DV3QAIqNrlJrmpTUlgLhu4ct527KblenFneVkZ/ZnLACrOD49KH/z6PD
	 bzKIUt+t7opAQ==
Date: Sat, 21 Dec 2024 20:01:23 +0000
To: Dave Penkler <dpenkler@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Antonio Riccio <linux@ariccio.me>
Subject: [PATCH] staging: gpib: Rename variable ValidAll
Message-ID: <Z2cekOavt5rTukZY@stream-circuit>
Feedback-ID: 117734652:user:proton
X-Pm-Message-ID: c15cea155234fc8a29e5027d3f54bd31ba3c8924
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Avoid CamelCase: <ValidALL>
+       int status =3D ValidALL;

Signed-off-by: Antonio Riccio <linux@ariccio.me>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 drivers/staging/gpib/cb7210/cb7210.c                 | 2 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c           | 2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c             | 2 +-
 drivers/staging/gpib/gpio/gpib_bitbang.c             | 2 +-
 drivers/staging/gpib/ines/ines_gpib.c                | 2 +-
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c   | 2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c            | 2 +-
 drivers/staging/gpib/tms9914/tms9914.c               | 2 +-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 2 +-
 drivers/staging/gpib/uapi/gpib_user.h                | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers=
/staging/gpib/agilent_82357a/agilent_82357a.c
index bf05fb4a736b..9f13cff3181a 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -999,7 +999,7 @@ static int agilent_82357a_line_status(const gpib_board_=
t *board)
 =09struct usb_device *usb_dev =3D interface_to_usbdev(a_priv->bus_interfac=
e);
 =09struct agilent_82357a_register_pairlet bus_status;
 =09int retval;
-=09int status =3D ValidALL;
+=09int status =3D VALIDALL;
=20
 =09bus_status.address =3D BSR;
 =09retval =3D agilent_82357a_read_registers(a_priv, &bus_status, 1, 0);
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb=
7210/cb7210.c
index 63df7f3eb3f3..a72381ce996e 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -377,7 +377,7 @@ int cb7210_accel_write(gpib_board_t *board, uint8_t *bu=
ffer, size_t length, int
=20
 int cb7210_line_status(const gpib_board_t *board)
 {
-=09int status =3D ValidALL;
+=09int status =3D VALIDALL;
 =09int bsr_bits;
 =09struct cb7210_priv *cb_priv;
 =09struct nec7210_priv *nec_priv;
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/g=
pib/eastwood/fluke_gpib.c
index 3f938ab0c84d..6113dbb55d29 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -191,7 +191,7 @@ static void fluke_return_to_local(gpib_board_t *board)
=20
 static int fluke_line_status(const gpib_board_t *board)
 {
-=09int status =3D ValidALL;
+=09int status =3D VALIDALL;
 =09int bsr_bits;
 =09struct fluke_priv *e_priv;
 =09struct nec7210_priv *nec_priv;
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpi=
b/fmh_gpib/fmh_gpib.c
index 62791db1c34a..07dd3882bf5f 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -223,7 +223,7 @@ static void fmh_gpib_return_to_local(gpib_board_t *boar=
d)
=20
 static int fmh_gpib_line_status(const gpib_board_t *board)
 {
-=09int status =3D ValidALL;
+=09int status =3D VALIDALL;
 =09int bsr_bits;
 =09struct fmh_priv *e_priv;
 =09struct nec7210_priv *nec_priv;
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpi=
b/gpio/gpib_bitbang.c
index a2d562cbd65b..3b7a3b7995f6 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1035,7 +1035,7 @@ static void bb_return_to_local(gpib_board_t *board)
=20
 static int bb_line_status(const gpib_board_t *board)
 {
-=09int line_status =3D ValidALL;
+=09int line_status =3D VALIDALL;
=20
 //=09  dbg_printk(1,"\n");
=20
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/i=
nes/ines_gpib.c
index 9d8387c3bf01..b1a8957eecb9 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -23,7 +23,7 @@ MODULE_DESCRIPTION("GPIB driver for Ines iGPIB 72010");
=20
 int ines_line_status(const gpib_board_t *board)
 {
-=09int status =3D ValidALL;
+=09int status =3D VALIDALL;
 =09int bcm_bits;
 =09struct ines_priv *ines_priv;
 =09struct nec7210_priv *nec_priv;
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/s=
taging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 1a8eb3bfb61c..d0692fdae9b2 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -702,7 +702,7 @@ static void usb_gpib_interface_clear(gpib_board_t *boar=
d, int assert)
 static int usb_gpib_line_status(const gpib_board_t *board)
 {
 =09int buffer;
-=09int line_status =3D ValidALL;   /* all lines will be read */
+=09int line_status =3D VALIDALL;   /* all lines will be read */
 =09struct list_head *p, *q;
 =09WQT *item;
 =09unsigned long flags;
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gp=
ib/ni_usb/ni_usb_gpib.c
index 70b8b305e13b..60c756fe744c 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -1483,7 +1483,7 @@ static int ni_usb_line_status(const gpib_board_t *boa=
rd)
 =09int bytes_written =3D 0, bytes_read =3D 0;
 =09int i =3D 0;
 =09unsigned int bsr_bits;
-=09int line_status =3D ValidALL;
+=09int line_status =3D VALIDALL;
 =09// NI windows driver reads 0xd(HSSEL), 0xc (ARD0), 0x1f (BSR)
=20
 =09out_data =3D kmalloc(out_data_length, GFP_KERNEL);
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/=
tms9914/tms9914.c
index 152b243b845b..f7bda53823dd 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -390,7 +390,7 @@ static unsigned int update_status_nolock(gpib_board_t *=
board, struct tms9914_pri
 int tms9914_line_status(const gpib_board_t *board, struct tms9914_priv *pr=
iv)
 {
 =09int bsr_bits;
-=09int status =3D ValidALL;
+=09int status =3D VALIDALL;
=20
 =09bsr_bits =3D read_byte(priv, BSR);
=20
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/=
gpib/tnt4882/tnt4882_gpib.c
index e49a952fa0d8..f36c31c1ca28 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -194,7 +194,7 @@ MODULE_DESCRIPTION("GPIB driver for National Instrument=
s boards using tnt4882 or
=20
 int tnt4882_line_status(const gpib_board_t *board)
 {
-=09int status =3D ValidALL;
+=09int status =3D VALIDALL;
 =09int bcsr_bits;
 =09struct tnt4882_priv *tnt_priv;
=20
diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/u=
api/gpib_user.h
index 0896a55a758f..34392e076163 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -114,7 +114,7 @@ enum bus_control_line {
 =09ValidSRQ =3D 0x20,
 =09ValidATN =3D 0x40,
 =09ValidEOI =3D 0x80,
-=09ValidALL =3D 0xff,
+=09VALIDALL =3D 0xff,
 =09BusDAV =3D 0x0100,=09=09/* DAV=09line status bit */
 =09BusNDAC =3D 0x0200,=09=09/* NDAC line status bit */
 =09BusNRFD =3D 0x0400,=09=09/* NRFD line status bit */
--=20
2.43.0


