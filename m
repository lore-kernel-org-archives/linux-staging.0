Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64A7B
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 00:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BA3C4347C;
	Thu, 13 Oct 2022 00:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620374;
	bh=G2R9/l5BO/r5ZqdRrupaWMbdii/2LaxF2caxyV6816g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cheTZHCHbQhR2QUfNUTqQNfqiXkNJi1R9MTJ7uOlvQ2QsGbIdtTaqSFEDKZ4ryezh
	 SQDRt2n0Z+/8XUBzwXc6oeHdce5SNfES8+EKuCgHdxB9Zylq7ASJcpe/LYt+vyl6lg
	 HEGiiR5ZOx7GDVuSRtyOJ9zciC3S95b3B/ECbVhvprtdoJOLriCpD0NasuyKW08dZB
	 FxzPHfd4UQkBqjWmBD0aYerFDYkA98//uEyiMIaWXJh/NA6Tjo1rWeZo19zo541mXN
	 Kg/KaRdoRuHmA/ZS49qHIbyNNH4ivilyL5E96WN0qEjTCiePh2Jl6gV5rZhTO0oGzE
	 Lx1CkMiBVa6tQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	forest@alittletooquiet.net,
	tomm.merciai@gmail.com,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.19 18/63] staging: vt6655: fix potential memory leak
Date: Wed, 12 Oct 2022 20:17:52 -0400
Message-Id: <20221013001842.1893243-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001842.1893243-1-sashal@kernel.org>
References: <20221013001842.1893243-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Nam Cao <namcaov@gmail.com>

[ Upstream commit c8ff91535880d41b49699b3829fb6151942de29e ]

In function device_init_td0_ring, memory is allocated for member
td_info of priv->apTD0Rings[i], with i increasing from 0. In case of
allocation failure, the memory is freed in reversed order, with i
decreasing to 0. However, the case i=0 is left out and thus memory is
leaked.

Modify the memory freeing loop to include the case i=0.

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Signed-off-by: Nam Cao <namcaov@gmail.com>
Link: https://lore.kernel.org/r/20220909141338.19343-1-namcaov@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index afaf331fe125..3006eeb87ec6 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -675,7 +675,7 @@ static int device_init_td0_ring(struct vnt_private *priv)
 	return 0;
 
 err_free_desc:
-	while (--i) {
+	while (i--) {
 		desc = &priv->apTD0Rings[i];
 		kfree(desc->td_info);
 	}
-- 
2.35.1

