Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAFDBA3A
	for <linux-staging@lists.linux.dev>; Fri,  7 Jul 2023 13:55:04 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 4094818640EF;
	Fri,  7 Jul 2023 16:47:28 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Rlu8Olt3ypUm; Fri,  7 Jul 2023 16:47:28 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id E7C5A1864A12;
	Fri,  7 Jul 2023 16:47:27 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CVYtIonFtxSs; Fri,  7 Jul 2023 16:47:27 +0300 (MSK)
Received: from rbta-msk-lt-106062.astralinux.ru (unknown [10.177.20.23])
	by mail.astralinux.ru (Postfix) with ESMTPSA id B75FD18640EF;
	Fri,  7 Jul 2023 16:47:26 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Rob Springer <rspringer@google.com>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Todd Poynor <toddpoynor@google.com>,
	Ben Chan <benchan@chromium.org>,
	Richard Yeh <rcy@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	John Joseph <jnjoseph@google.com>,
	Simon Que <sque@chromium.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] gasket: make interrupt_data NULL after free
Date: Fri,  7 Jul 2023 16:47:12 +0300
Message-Id: <20230707134712.7019-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Gasket common interrupt module was deleted in version 5.13,=20
but there is possible double free in versions 4.19-5.12.

gasket_dev->interrupt_data should be NULL when
gasket_interrupt_init returns error. For example,
it is necessary in gasket_enable_device to avoid
double free.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex dri=
ver")
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/staging/gasket/gasket_interrupt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/gasket/gasket_interrupt.c b/drivers/staging/=
gasket/gasket_interrupt.c
index 864342acfd86..24fa5df0628b 100644
--- a/drivers/staging/gasket/gasket_interrupt.c
+++ b/drivers/staging/gasket/gasket_interrupt.c
@@ -337,6 +337,7 @@ int gasket_interrupt_init(struct gasket_dev *gasket_d=
ev)
 			sizeof(*interrupt_data->eventfd_ctxs), GFP_KERNEL);
 	if (!interrupt_data->eventfd_ctxs) {
 		kfree(interrupt_data);
+		gasket_dev->interrupt_data =3D NULL;
 		return -ENOMEM;
 	}
=20
@@ -346,6 +347,7 @@ int gasket_interrupt_init(struct gasket_dev *gasket_d=
ev)
 	if (!interrupt_data->interrupt_counts) {
 		kfree(interrupt_data->eventfd_ctxs);
 		kfree(interrupt_data);
+		gasket_dev->interrupt_data =3D NULL;
 		return -ENOMEM;
 	}
=20
--=20
2.30.2

