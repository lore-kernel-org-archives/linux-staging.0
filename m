Received: from sender2-op-o12.zoho.com.cn (sender2-op-o12.zoho.com.cn [163.53.93.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0BF2905
	for <linux-staging@lists.linux.dev>; Sun, 29 May 2022 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653838744;
	s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
	h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=xGbv7HlqU9NUiVmKFFfWHWJ7GjiXkmgNU5UawXCQxn8=;
	b=CEiWwOtlT6bd2aVw4bG73jCv97mRPVBdqfemmSl/LrQoOQJuysu1DOyLp9C6hlcb
	l2D8QE9ga+kYz/ATTtLgF0EOURGdgn332FlVJoPf6/C9LyQkbp8oe5lGo+4xeIauouw
	7C7pRqm4BnKd9PBU8/vgPBg4yEo7o44a99YUBhJg=
Received: from localhost.localdomain (81.71.33.115 [81.71.33.115]) by mx.zoho.com.cn
	with SMTPS id 1653838743051746.6363796456236; Sun, 29 May 2022 23:39:03 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chengguang Xu <cgxu519@mykernel.net>
Message-ID: <20220529153456.4183738-7-cgxu519@mykernel.net>
Subject: [PATCH 6/6] media: platform: fix missing/incorrect resource cleanup in error case
Date: Sun, 29 May 2022 23:34:56 +0800
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

In error case of s5p_mfc_power_on() we should call
clk_disable_unprepare() for the
clocks(from pm->clocks[0] to pm->clocks[i-1]).

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c b/drivers/=
media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
index 72a901e99450..187849841a28 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_pm.c
@@ -88,7 +88,6 @@ int s5p_mfc_power_on(void)
 =09=09if (ret < 0) {
 =09=09=09mfc_err("clock prepare failed for clock: %s\n",
 =09=09=09=09pm->clk_names[i]);
-=09=09=09i++;
 =09=09=09goto err;
 =09=09}
 =09}
@@ -98,7 +97,7 @@ int s5p_mfc_power_on(void)
=20
 =09return 0;
 err:
-=09while (--i > 0)
+=09while (--i >=3D 0)
 =09=09clk_disable_unprepare(pm->clocks[i]);
 =09pm_runtime_put(pm->device);
 =09return ret;
--=20
2.27.0


