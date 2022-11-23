Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6944423B7
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 13:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 9F6BD18643A3;
	Wed, 23 Nov 2022 16:24:41 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id WO4GhI7u6oeA; Wed, 23 Nov 2022 16:24:41 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 55512186439D;
	Wed, 23 Nov 2022 16:24:41 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rDVj4VrMS6RK; Wed, 23 Nov 2022 16:24:41 +0300 (MSK)
Received: from astra.astralinux.ru (unknown [10.177.20.52])
	by mail.astralinux.ru (Postfix) with ESMTPSA id EF3451863DD4;
	Wed, 23 Nov 2022 16:24:40 +0300 (MSK)
From: Ekaterina Esina <eesina@astralinux.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ekaterina Esina <eesina@astralinux.ru>,
	Won Kang <wkang77@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] gdm7240: Add check for NULL for callback in r
Date: Wed, 23 Nov 2022 16:23:45 +0300
Message-Id: <20221123132345.7071-1-eesina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Before dereferencing r->callback check it for NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.
Fixes: 61e121047645 ("staging: gdm7240: adding LTE USB driver")
Signed-off-by: Ekaterina Esina <eesina@astralinux.ru>
---
 drivers/staging/gdm724x/gdm_usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gdm724x/gdm_usb.c b/drivers/staging/gdm724x/=
gdm_usb.c
index 54bdb64f52e8..7cf89f4c95c4 100644
--- a/drivers/staging/gdm724x/gdm_usb.c
+++ b/drivers/staging/gdm724x/gdm_usb.c
@@ -409,10 +409,12 @@ static void do_rx(struct work_struct *work)
 		switch (cmd_evt) {
 		case LTE_GET_INFORMATION_RESULT:
 			if (set_mac_address(hci->data, r->cb_data) =3D=3D 0) {
-				r->callback(r->cb_data,
+				if (r->callback) {
+					r->callback(r->cb_data,
 					    r->buf,
 					    r->urb->actual_length,
 					    KERNEL_THREAD);
+				}
 			}
 			break;
=20
--=20
2.30.2

