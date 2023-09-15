Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C7E101C6;
	Fri, 15 Sep 2023 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CY24/
	IMTGSKHaAaQ0QLN5OMMOE+Jf5xAvkok9QROw60=; b=IZiM7RFLF8MgGALmCSxP2
	am2EDpRYwYrln2uVfgW5s4tLhp4AxqhuO3AWPvpDjQ8toRyBJpkR0tLHYv/T0hq2
	5jRbWXQwsXh6DFKIJ+Wls1b+IWLRcGqQn9kWyWAPTbz8VrJucTKqhppLiV9E3Em5
	oXjy0rEhI71b5jb4U7KiN8=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wDnaCG4QgRliT58CA--.42312S4;
	Fri, 15 Sep 2023 19:40:51 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Ma Ke <make_ruc2021@163.com>
Subject: [PATCH] media: cedrus: fix use after free bug in cedrus_remove due to race condition
Date: Fri, 15 Sep 2023 19:40:38 +0800
Message-Id: <20230915114038.3407953-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnaCG4QgRliT58CA--.42312S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1UGry8Gw4kGrW7ZF1DWrg_yoWkKrbEkF
	yvyw1I9r1UCrykZasrKF45ArWFvr4xZFWkJw4YqFZxAayUAFZ5JrWqyrs3J34ag3yxKF9x
	ArWvqr45Gw47XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKGQ6JUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbiyAbrC1p7Lw5+dwAAsn

In cedrus_probe, dev->watchdog_work is bound with cedrus_watchdog. Then
cedrus_device_run may be called to start the work.

If we close the file or remove the module which will call cedrus_release and
cedrus_remove to make cleanup, there may be an unfinished work. The possible
sequence is as follows, which will cause a typical UAF bug.

The same thing will happen in cedrus_release, and use ctx after freeing it.

Fix it by canceling the work before cleanup in cedrus_release.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 8e248d4a0aec..0a2cb615d717 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -404,6 +404,8 @@ static int cedrus_release(struct file *file)
 	struct cedrus_ctx *ctx = container_of(file->private_data,
 					      struct cedrus_ctx, fh);
 
+	cancel_delayed_work_sync(&ctx->dev->watchdog_work);
+
 	mutex_lock(&dev->dev_mutex);
 
 	v4l2_fh_del(&ctx->fh);
-- 
2.37.2

