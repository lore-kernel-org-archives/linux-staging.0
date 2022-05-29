Received: from sender2-op-o12.zoho.com.cn (sender2-op-o12.zoho.com.cn [163.53.93.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0F2907
	for <linux-staging@lists.linux.dev>; Sun, 29 May 2022 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653838737;
	s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
	h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=b9EOAZEtMeMOw4CE+ljgRiq8Y/E5wl6YtfwQ/Y/g9fY=;
	b=K9iFG7haZUnGl1ACKH9GvvKesKECfbzX0cWBpwodvG6BRLJaHls0JImr3+HAEmHm
	+uXvCiCjRePe+nObZGZ1d8VfQOOPYWwOdhdmUaZpfa4neNxZWqzjfP1RRtS6NR27ONk
	ReifQ7gUfj5xi9TRzz/Qulfxi6GMfkwK0JwzVfaI=
Received: from localhost.localdomain (81.71.33.115 [81.71.33.115]) by mx.zoho.com.cn
	with SMTPS id 1653838735065952.2650944013579; Sun, 29 May 2022 23:38:55 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chengguang Xu <cgxu519@mykernel.net>
Message-ID: <20220529153456.4183738-2-cgxu519@mykernel.net>
Subject: [PATCH 1/6] netlink: fix missing destruction of rhash table in error case
Date: Sun, 29 May 2022 23:34:51 +0800
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220529153456.4183738-1-cgxu519@mykernel.net>
References: <20220529153456.4183738-1-cgxu519@mykernel.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8

Fix missing destruction(when '(--i) =3D=3D 0') for error case in
netlink_proto_init().

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 net/netlink/af_netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 0cd91f813a3b..bd0b090a378b 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -2887,7 +2887,7 @@ static int __init netlink_proto_init(void)
 =09for (i =3D 0; i < MAX_LINKS; i++) {
 =09=09if (rhashtable_init(&nl_table[i].hash,
 =09=09=09=09    &netlink_rhashtable_params) < 0) {
-=09=09=09while (--i > 0)
+=09=09=09while (--i >=3D 0)
 =09=09=09=09rhashtable_destroy(&nl_table[i].hash);
 =09=09=09kfree(nl_table);
 =09=09=09goto panic;
--=20
2.27.0


