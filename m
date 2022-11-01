Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB757E
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 11:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B262C433D7;
	Tue,  1 Nov 2022 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302228;
	bh=1+Gtk/lM3WWJOYb0UT2QDICBrYedhOEGI6VJvrirL4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pRRWm956jbQ0SmXrIl9M+9wWIptHnhfgN0F2UdFWnydWP+3MGdmpUsUq0mMy7l+Ph
	 IirGMmUln9wEdrjAtsaJHkhqnb/JXekpfwwJldiDvg6NmqBJ/CCK8WTCmr1z1fxm4P
	 Z57FrBi1+zJaVn+b+1bov89eQZlzmmP4ZuugOTa5gcJl3ibmf7rEqwmtKH07t+kP1H
	 oOMuq7FlJiUgPG13hGwCNOHkEgi3sHLDePgBvb7I7JKwVtOkgJ6g/bwi9BOmKwdsAI
	 2Fu+548KBtPXfhfrm7hMqCFjuBRrVmRQqmTcC2gBsqM1JZDTVFpG7C9AIiENqRSZO9
	 ewxLdKP6RkHZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hangyu Hua <hbh25y@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 06/14] media: meson: vdec: fix possible refcount leak in vdec_probe()
Date: Tue,  1 Nov 2022 07:30:02 -0400
Message-Id: <20221101113012.800271-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101113012.800271-1-sashal@kernel.org>
References: <20221101113012.800271-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Hangyu Hua <hbh25y@gmail.com>

[ Upstream commit 7718999356234d9cc6a11b4641bb773928f1390f ]

v4l2_device_unregister need to be called to put the refcount got by
v4l2_device_register when vdec_probe fails or vdec_remove is called.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5ccb3846c879..7a818ca15b37 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1109,6 +1109,7 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+	v4l2_device_unregister(&core->v4l2_dev);
 	return ret;
 }
 
@@ -1117,6 +1118,7 @@ static int vdec_remove(struct platform_device *pdev)
 	struct amvdec_core *core = platform_get_drvdata(pdev);
 
 	video_unregister_device(core->vdev_dec);
+	v4l2_device_unregister(&core->v4l2_dev);
 
 	return 0;
 }
-- 
2.35.1

