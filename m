Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E1A70
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 11:50:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.10.2.182])
	by mail.ispras.ru (Postfix) with ESMTPS id 8083940755E0;
	Fri, 21 May 2021 11:43:40 +0000 (UTC)
From: Evgeny Novikov <novikov@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Evgeny Novikov <novikov@ispras.ru>,
	Johan Hovold <johan@kernel.org>,
	Nikolay Kyx <knv418@gmail.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Lee Gibson <leegib@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ldv-project@linuxtesting.org
Subject: [PATCH] staging: fwserial: Fix potential NULL pointer dereferences
Date: Fri, 21 May 2021 14:43:39 +0300
Message-Id: <20210521114339.8469-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If fwtty_install() will be invoked with such tty->index that will be
not less than MAX_TOTAL_PORTS then fwtty_port_get() will return NULL and
fwtty_install() will either assign it to tty->driver_data or dereference
in fwtty_port_put() (if tty_standard_install() will fail). The similar
situation is with fwloop_install(). The patch fixes both cases.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/staging/fwserial/fwserial.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
index 1ee6382cafc4..d0810896511e 100644
--- a/drivers/staging/fwserial/fwserial.c
+++ b/drivers/staging/fwserial/fwserial.c
@@ -1069,6 +1069,9 @@ static int fwtty_install(struct tty_driver *driver, struct tty_struct *tty)
 	struct fwtty_port *port = fwtty_port_get(tty->index);
 	int err;
 
+	if (!port)
+		return -ENODEV;
+
 	err = tty_standard_install(driver, tty);
 	if (!err)
 		tty->driver_data = port;
@@ -1082,6 +1085,9 @@ static int fwloop_install(struct tty_driver *driver, struct tty_struct *tty)
 	struct fwtty_port *port = fwtty_port_get(table_idx(tty->index));
 	int err;
 
+	if (!port)
+		return -ENODEV;
+
 	err = tty_standard_install(driver, tty);
 	if (!err)
 		tty->driver_data = port;
-- 
2.26.2

